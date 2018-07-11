import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCart);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle(context)),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Shopping List'),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

// -----------  main() 与 MyApp()  -----------------
void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyApp(),
  ));
}

// class MyApp extends StatelessWidget {
//   //无状态组件不需要createState()
//   @override
//   // TODO: implement widget
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Shopping App',
//       home: new ShoppingList(
//         products: <Product>[
//           new Product(name: 'Eggs'),
//           new Product(name: 'Flour'),
//           new Product(name: 'Chocolate chips'),
//         ],
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  //无状态组件不需要createState()
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return new AppBar(
      leading: Icon(Icons.search),
      title: new Text('My Fancy Dress is very nice!!!!'),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.playlist_play),
          tooltip: 'Air it',
          onPressed: null,
        ),
        new IconButton(
          icon: new Icon(Icons.playlist_add),
          tooltip: 'Restitch it',
          onPressed: null,
        ),

        // new IconButton(
        //   icon: new Icon(Icons.playlist_add_check),
        //   tooltip: 'Repair it',
        //   onPressed: null,
        // ),
      ],
      flexibleSpace: Container(
        child: Text('hello'),
        color: Colors.white10,
      ),
    );
  }
}
