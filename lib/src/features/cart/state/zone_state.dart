import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/model/city_model.dart';
import 'package:finesse/src/features/cart/model/zone_model.dart';

class ZoneSuccessState extends SuccessState {
  final ZoneModel? zoneModel;

  const ZoneSuccessState(this.zoneModel);
}

class CitySuccessState extends SuccessState {
  final CityModel? cityModel;

  const CitySuccessState(this.cityModel);
}
