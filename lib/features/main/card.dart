import 'package:flutter/material.dart';

import 'package:caffe/theme/fonts.dart';
import 'package:caffe/models/models.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 32, right: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(1, 2)),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 136,
                width: 136,
                child: Image.network(product.image),
              ),
            ),
            Text(
              product.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: FontSize.standart),
            ),
            Text(product.type),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('${product.weight}g'),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('${product.price}uah'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 36,
                width: 134,
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: const Text('TO CART'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
