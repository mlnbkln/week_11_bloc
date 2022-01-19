import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_11_bloc/product_list.dart';
import 'cart_BLoC/cart_cubit.dart';
import 'cart_BLoC/cart_state.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (_) => CartCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Shopping App'),
            actions: <Widget>[
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TextButton.icon(
                      style: TextButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                      },
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(''),
                      key: const Key('cart'),
                    ),
                  ),
                  BlocBuilder<CartCubit, CartState>(builder: (_, cartState) {
                    List<int> cartItem = cartState.cartItem;
                    return Positioned(
                      left: 30,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Text(
                          '${cartItem.length}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
          body: const ProductList(),
        ));
  }
}
