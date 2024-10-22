import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2022110006/models/product.dart';
import 'package:uts_2022110006/providers/cart_provider.dart';
import 'package:uts_2022110006/screens/cart_screen.dart';
import 'package:uts_2022110006/screens/login_screen.dart';
import 'package:uts_2022110006/screens/product_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      title: 'Burger',
      price: 35000,
      image: 'https://images.unsplash.com/photo-1516774266634-15661f692c19?q=80&w=1973&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Perpaduan sempurna antara daging sapi premium yang juicy dan bumbu khas, dipanggang hingga tingkat kematangan sempurna. Dilengkapi dengan irisan tomat segar, selada crispy, acar, dan saus mayo khusus yang memberikan sensasi gurih dan creamy. Semua bahan ini disatukan dalam roti lembut yang dipanggang sempurna.',
    ),
    Product(
      id: 2,
      title: 'Pizza',
      price: 70000,
      image: 'https://images.unsplash.com/photo-1620374643762-9c0e91a22b10?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Pizza klasik yang disukai semua orang. Dibuat dengan adonan yang dipanggang sempurna, menghasilkan tekstur renyah di luar namun lembut di dalam. Pizza ini dilapisi saus tomat khas Italia yang kaya rasa, ditaburi keju mozzarella yang meleleh dengan sempurna, dan topping irisan pepperoni premium yang gurih dan sedikit pedas.',
    ),
    Product(
      id: 3,
      title: 'Hot Dog',
      price: 25000,
      image: 'https://images.unsplash.com/photo-1515875976234-9d59c3ef288d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Hot dog yang menggugah selera dan cocok untuk segala suasana. Sosis premium yang juicy, dipanggang hingga sempurna, disajikan dalam roti bun lembut yang empuk. Dilengkapi dengan mustard dan saus tomat.',
    ),
    Product(
      id: 4,
      title: 'Fried Chicken',
      price: 23000,
      image: 'https://images.unsplash.com/photo-1569058242253-92a9c755a0ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Ayam goreng yang dibalut dengan tepung berbumbu istimewa. Setiap potong ayam digoreng hingga keemasan, menghasilkan kulit yang renyah dan daging yang juicy serta lembut di dalam. Dengan bumbu rahasia yang meresap hingga ke dalam, fried chicken ini memberikan perpaduan rasa gurih dan sedikit pedas di setiap gigitan.',
    ),
    Product(
      id: 5,
      title: 'Lemonade',
      price: 13000,
      image: 'https://images.unsplash.com/photo-1507281549113-040fcfef650e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Minuman yang memadukan kesegaran perasan lemon asli dengan manisnya gula alami dan sedikit es batu yang menambah kesegaran. Rasanya yang asam-manis dan menyegarkan membuat minuman ini sempurna untuk dinikmati di cuaca panas atau sebagai pendamping makanan favorit Anda. Lemonade ini tidak hanya enak, tetapi juga kaya akan vitamin C.',
    ),
    Product(
      id: 6,
      title: 'Cola',
      price: 15000,
      image: 'https://images.unsplash.com/photo-1711154319702-70f9e8c3a90f?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Minuman bersoda yang menawarkan kombinasi sempurna antara rasa manis dan segarnya gelembung karbonasi. Cocok dinikmati dalam segala suasana, baik sebagai pendamping makanan atau sebagai penyegar di hari-hari sibuk Anda.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).loadItems();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ProductSearchDelegate(products),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Our products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(),
                          settings: RouteSettings(arguments: products[index]),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                              child: Image.network(
                                products[index].image,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey,
                                    width: double.infinity,
                                    child: const Icon(Icons.image),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              products[index].title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey,
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartScreen(),
            ),
          );
        },
      ),
    );
  }
}

class ProductSearchDelegate extends SearchDelegate<Product?> {
  final List<Product> products;

  ProductSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> results = products
        .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: results.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductScreen(),
                settings: RouteSettings(arguments: results[index]),
              ),
            );
          },
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.network(
                      results[index].image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey,
                          width: double.infinity,
                          child: const Icon(Icons.image),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    results[index].title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestions = products
        .where((product) => product.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].title),
          onTap: () {
            query = suggestions[index].title;
            showResults(context);
          },
        );
      },
    );
  }
}