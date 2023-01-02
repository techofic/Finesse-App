import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/core/network/api.dart';
import 'package:finesse/core/network/network_utils.dart';
import 'package:finesse/src/features/home/models/slider_model.dart';
import 'package:finesse/src/features/home/state/slider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Providers
final sliderProvider = StateNotifierProvider<SliderController, BaseState>(
  (ref) => SliderController(ref: ref),
);

/// Controllers
class SliderController extends StateNotifier<BaseState> {
  final Ref? ref;
  SliderController({this.ref}) : super(const InitialState());
  HomeSliderModel? homeSliderModel;

  Future fetchSliderDetails() async {
    state = const LoadingState();
    dynamic responseBody;
    try {
      responseBody = await Network.handleResponse(await Network.getRequest(API.slider));
      if (responseBody != null) {
        homeSliderModel = HomeSliderModel.fromJson(responseBody);
        state = SliderSuccessState(homeSliderModel);
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
