import 'package:flutter/material.dart';
import 'package:kubenmat/models/product_model.dart';
import 'package:kubenmat/providers/cart_provider.dart';
import 'package:kubenmat/providers/products_provider.dart';
import 'package:kubenmat/widgets/products/product_widget.dart';
import 'package:kubenmat/widgets/products/products_list_og.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsList> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('Favoritter'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.fastfood),
              label: Text('Mat'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.local_cafe),
              selectedIcon: Icon(Icons.book),
              label: Text('Drikker'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        Expanded(
          child: _selectedIndex == 0
              ? const Center(
                  child: Text(
                      'Du har ikke lagt til noen produkter til favoritter!'),
                )
              : productView(_selectedIndex - 1),
        )
      ],
    );
  }
}
