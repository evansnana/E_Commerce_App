import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../appbar.dart/all_product_appbar.dart';

class AllProductView extends StatelessWidget {
  const AllProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        );
    var outlineInputBorder =
        OutlineInputBorder(borderRadius: BorderRadius.circular(10));
    return Scaffold(
      appBar: ShopAppBar(context, titleStyle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Choose a brand",
                  style: titleStyle,
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        border: outlineInputBorder,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        focusedBorder: outlineInputBorder,
                        hintText: "Search for brand",
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        )),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Material(
                    color: const Color(0xff4FAFFA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: EdgeInsets.all(6.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                          backgroundImage: NetworkImage(brands[index]),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: titleStyle,
                    ),
                    const Text("13 items"),
                  ],
                ),
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(titleStyle: titleStyle);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ProductCard(titleStyle: titleStyle),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.titleStyle,
  }) : super(key: key);

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 236, 222, 222),
      ),
      height: 110,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: Colors.green,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "data:image/jpeg;base64,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"))),
              height: 120,
              width: 100,
              padding: EdgeInsets.all(10),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Nike",
                    style: titleStyle,
                  ),
                  const Text("Size:12"),
                  const Text("Color:red"),
                  Text(
                    '20 Dollars',
                    style: titleStyle,
                  )
                ]),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.favorite_border_outlined),
                Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: const Color(0xff4FAFFA),
                    child: const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

List brands = [
  "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/d85f7650861575.5e19f0261fd32.jpg",
  "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/575e67147758705.Y3JvcCw4MDgsNjMyLDAsMA.png",
  "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/4ee5ef148462129.Y3JvcCwxNTM0LDEyMDAsMzQsMA.jpeg",
  "https://mir-s3-cdn-cf.behance.net/projects/404/36674e129956899.Y3JvcCwyNDI0LDE4OTYsMCww.jpg",
  "https://images.pexels.com/photos/2417848/pexels-photo-2417848.jpeg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/430205/pexels-photo-430205.jpeg?auto=compress&cs=tinysrgb&w=600",
  "https://images.pexels.com/photos/9843280/pexels-photo-9843280.jpeg?auto=compress&cs=tinysrgb&w=600"
];
