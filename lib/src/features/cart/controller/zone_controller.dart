import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/cart/model/city_model.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';
import 'package:finesse/src/features/cart/state/zone_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cart_controller.dart';

/// Providers
final zoneProvider = StateNotifierProvider<ZoneController, BaseState>(
  (ref) => ZoneController(ref: ref),
);
final cityProvider = StateNotifierProvider<CityController, BaseState>(
  (ref) => CityController(ref: ref),
);

/// Controllers
class ZoneController extends StateNotifier<BaseState> {
  final Ref? ref;

  ZoneController({this.ref}) : super(const InitialState());
  ZoneModel? zoneModel;
  int deliveryFee = 0;
  int roundingFee = 0;
  int subtotal = 0;
  int totalAmount = 0;

  Future allZone({id = ""}) async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(await Network.getRequest(API.allZone(id: id)));
      if (responseBody != null) {
        zoneModel = ZoneModel.fromJson(responseBody);
        state = ZoneSuccessState(zoneModel);
        totalDelivery();
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }

  void totalDelivery() {
    int delivery = 0;
    int rounding = 0;
    int countTotal = 0;
    int total = 0;
    for (int i = 0; i < zoneModel!.zones.length; i++) {
      delivery = zoneModel!.zones[i].delivery!;
      rounding = (delivery / 100).round();
    }

    countTotal = ref?.read(cartProvider.notifier).subtotal as int;
    total = countTotal + delivery - rounding;
    deliveryFee = delivery;
    roundingFee = rounding;
    totalAmount = total;
  }
}

class CityController extends StateNotifier<BaseState> {
  final Ref? ref;

  CityController({this.ref}) : super(const InitialState());
  CityModel? cityModel;

  Future allCity() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(await Network.getRequest(API.allCity));
      if (responseBody != null) {
        cityModel = CityModel.fromJson(responseBody);
        state = CitySuccessState(cityModel);
      } else {
        state = const ErrorState();
      }
    } catch (error, stackTrace) {
      print("error = $error");
      print("error = $stackTrace");
      state = const ErrorState();
    }
  }
}
