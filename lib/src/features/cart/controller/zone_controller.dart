import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/cart/model/city_model.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';
import 'package:finesse/src/features/cart/state/zone_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final zoneProvider = StateNotifierProvider<zoneController, BaseState>(
  (ref) => zoneController(ref: ref),
);
final cityProvider = StateNotifierProvider<cityController, BaseState>(
  (ref) => cityController(ref: ref),
);

/// Controllers
class zoneController extends StateNotifier<BaseState> {
  final Ref? ref;

  zoneController({this.ref}) : super(const InitialState());
  ZoneModel? zoneModel;

  Future allZone({id = ""}) async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody = await Network.handleResponse(
          await Network.getRequest(API.allZone(id: id)));
      if (responseBody != null) {
        zoneModel = ZoneModel.fromJson(responseBody);
        state = ZoneSuccessState(zoneModel);
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

class cityController extends StateNotifier<BaseState> {
  final Ref? ref;

  cityController({this.ref}) : super(const InitialState());
  CityModel? cityModel;

  Future allCity() async {
    state = const LoadingState();
    var responseBody;
    try {
      responseBody =
          await Network.handleResponse(await Network.getRequest(API.allCity));
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
