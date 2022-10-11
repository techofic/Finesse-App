import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/auth/login/model/user_model.dart';

class LoginSuccessState extends SuccessState {
  final User? userModel;

  const LoginSuccessState(this.userModel);
}
