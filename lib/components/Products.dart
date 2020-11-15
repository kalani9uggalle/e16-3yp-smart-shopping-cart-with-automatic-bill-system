import 'package:cart_app/pages/product_details.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // ignore: non_constant_identifier_names
  var product_list = [
    {
      "name": "happy cow cheese",
      "picture": "images/happy_cow.jpg",
      "category": "Diary products",
      "old price": "330",
      "price": "330",
      "about":
          "Happy Cow cheese triangles are especially soft and creamy.Produced from the finest ingredients, their taste can vary from mild to spicy.Flavours: Natural, Cream, Light, Paprika and Ham."
    },
    {
      "name": "Munchee super cream cracker 500g ",
      "picture": "images/cream.jpeg",
      "category": "groceries",
      "old price": "220",
      "price": "200",
      "about":
          "The iconic vitamin enriched Super Cream Cracker is light and flaky, baked to contain air pockets on its surfaces for the perfect crisp to make it Super."
    },
    {
      "name": "Elephant house wonder bar ",
      "picture": "images/wonder.jpg",
      "category": "Icecream",
      "old price": "55",
      "price": "50",
      "about":
          "The Elephant House Wonder Bar range comes in your favourite Chocolate, Vanilla or Berry flavours. Made with rich, creamy ice cream coated with a thick layer of decadent chocolate that adds a sensuous crunch to every bite."
    },
    {
      "name": "Marina rice flour 1kg ",
      "picture": "images/rice.jpg",
      "category": "groceries",
      "old price": "220",
      "price": "180",
      "about": "Marina rice flour 1kg is the best"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return Single_product(
            product_name: product_list[index]['name'],
            product_picture: product_list[index]['picture'],
            product_category: product_list[index]['category'],
            product_oldprice: product_list[index]['old price'],
            product_price: product_list[index]['price'],
            product_about: product_list[index]['about'],
          );
        });
  }
}

class Single_product extends StatelessWidget {
  final product_name;
  final product_picture;
  final product_category;
  final product_oldprice;
  final product_price;
  final product_about;

  const Single_product({
    this.product_name,
    this.product_picture,
    this.product_category,
    this.product_oldprice,
    this.product_price,
    this.product_about,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product_name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                //passing values to product details
                builder: (context) => new ProductDetais(
                      productdetais_name: product_name,
                      productdetais_picture: product_picture,
                      productdetais_category: product_category,
                      productdetais_oldprice: product_oldprice,
                      productdetais_newprice: product_price,
                      productdetais_about: product_about,
                    ))),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      product_name,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    title: Text(
                      "Rs.$product_price",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Rs.$product_oldprice",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ),
                child: Image.asset(
                  product_picture,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
