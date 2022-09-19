import 'package:finesse/core/base/base_state.dart';
import 'package:finesse/src/features/wishlist/model/wishlist_product_model.dart';

class AddWishlistSuccessState extends SuccessState {
  const AddWishlistSuccessState();
}

class WishlistSuccessState extends SuccessState {
  final WishlistModel? wishlistModel;

  const WishlistSuccessState(this.wishlistModel);
}

class DeleteWishlistSuccessState extends SuccessState {
  const DeleteWishlistSuccessState();
}
