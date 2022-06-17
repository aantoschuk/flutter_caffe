import 'package:caffe/models/models.dart';

List<Product> filterProducts(List<Product> items, List<String> filters) {
  List<Product> filteredItems = [];
  for (var filter in filters) {
    for (var item in items) {
      if (item.type.toLowerCase() == filter) {
        filteredItems.add(item);
      }
    }
  }

  return filteredItems;
}

bool emailValidation(String email) => RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
    .hasMatch(email);
