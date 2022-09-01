import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/home/models/slider_model.dart';

class SliderSuccessState extends SuccessState {
  final HomeSliderModel? homeSliderModel;

  const SliderSuccessState(this.homeSliderModel);
}
