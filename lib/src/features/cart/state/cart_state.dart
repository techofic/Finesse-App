import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/cart/model/cart_model.dart';

class AddCartSuccessState extends SuccessState {
  const AddCartSuccessState();
}

class CartSuccessState extends SuccessState {
  final List<CartModel> cartList;

  const CartSuccessState(this.cartList);
}

class UpdateCartSuccessState extends SuccessState {
  const UpdateCartSuccessState();
}

class DeleteCartSuccessState extends SuccessState {
  const DeleteCartSuccessState();
}
