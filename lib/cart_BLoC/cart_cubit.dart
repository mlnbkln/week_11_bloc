import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const ProductAdded(cartItem: []));

  final List<int> _cartItems = [];
  List<int> get items => _cartItems;

  void add(int productIndex) {
    _cartItems.add(productIndex);
    emit (ProductAdded(cartItem: _cartItems));
  }

  void remove(int productIndex) {
    _cartItems.remove(productIndex);
    emit (ProductRemoved(cartItem: _cartItems));
  }
}