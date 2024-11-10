import 'dart:html';
import 'dart:convert';
import 'dart:async';

void main() {
  fetchProducts();
}

Future<void> fetchProducts() async {
  final url = 'http://localhost:8000/api/products';
  final response = await HttpRequest.getString(url);
  final List<dynamic> products = jsonDecode(response);

  final productsContainer = querySelector('#products-container')!;
  products.forEach((product) {
    final div = DivElement()
      ..className = 'product'
      ..text = '${product['name']} - \$${product['price']}';
    productsContainer.children.add(div);
  });
}
