import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterclass/gridviewprac/productmap.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text("Product App"),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 50,
              color: Colors.green,
            ),
            GridView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: productmap.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 300,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          height: 170,
                          width: double.infinity,
                          productmap.elementAt(index)['images'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${productmap.elementAt(index)['title']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${productmap.elementAt(index)['price']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () => "",
                                  icon: const Icon(CupertinoIcons.heart),
                                ),
                                IconButton(
                                  onPressed: () => "",
                                  icon: const Icon(Icons.shopping_cart_rounded),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
