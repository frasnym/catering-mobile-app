import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/products.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/product_list/product_list_screen.dart';
import 'package:catering_app/screens/product_detail/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final popularItem = Provider.of<Products>(context).findPopularItem();

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          child: Column(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(
                      Rect.fromLTRB(0, 150, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/images/main_banner.jpg',
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPaddin * 1.5, vertical: kDefaultPaddin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Items",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.symmetric(
                          vertical: kDefaultPaddin / 2),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                              ProductDetailScreen.routeName,
                              arguments: popularItem[index].id),
                          child: Container(
                            padding: const EdgeInsets.all(kDefaultPaddin / 4),
                            decoration: BoxDecoration(
                              color: popularItem[index].color,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(
                                      1, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.all(kDefaultPaddin / 4),
                            width: 100,
                            child: Hero(
                              tag: '${popularItem[index].id}',
                              child: FadeInImage(
                                placeholder: const AssetImage(
                                    'assets/images/cutlery_placeholder.png'),
                                image:
                                    NetworkImage(popularItem[index].imageUrl),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Foods",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ProductListScreen.routeName),
                          child: Text("See More"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
