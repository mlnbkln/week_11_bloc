import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_BLoC/cart_cubit.dart';
import 'cart_BLoC/cart_state.dart';


class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  state is ProductAdded ? 'Added to cart' : 'Removed from cart'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        builder: (_, cartState) {
          List<int> cart = cartState.cartItem;
          return LayoutBuilder(builder: (context, constraints) {
        return GridView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => ProductTile(
            itemNo: index,
            cart: cart,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth > 700 ? 4 : 1,
            childAspectRatio: 5,
         ),
        );
      });
    });
  }
}

class ProductTile extends StatelessWidget {

  const ProductTile({Key? key, required this.itemNo, required this.cart}) : super(key: key);

  final int itemNo;
  final List<int> cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {},
      title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
         trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: cart.contains(itemNo)
              ? const Icon(Icons.shopping_cart)
              : const Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            !cart.contains(itemNo)
                ? BlocProvider.of<CartCubit>(context).add(itemNo)
                : BlocProvider.of<CartCubit>(context).remove(itemNo);
          },
        ),
      ),
    );
  }
}




