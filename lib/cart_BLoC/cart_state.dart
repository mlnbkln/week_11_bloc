
abstract class CartState {
  final List<int> cartItem;
  const CartState({required this.cartItem});

  List<Object> get props => [];
}

mixin CartLoadInProgress implements CartState {
}

class ProductAdded extends CartState {

  final List<int> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemoved extends CartState {

  final List<int> cartItem;

  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}