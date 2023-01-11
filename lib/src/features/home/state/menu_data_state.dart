import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/home/models/menu_data_model.dart';

class MenuDataSuccessState extends SuccessState {
  final List<MenuDataModel>? menuList;

  const MenuDataSuccessState(this.menuList);
}
