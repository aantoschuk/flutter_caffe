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
