import 'package:catering_app/models/product.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:catering_app/providers/products.dart';

import 'package:catering_app/constants.dart';
import 'package:catering_app/screens/home/components/home_banner.dart';
import 'package:catering_app/screens/home/components/item_card.dart';
import 'package:catering_app/screens/product_list/product_list_screen.dart';
import 'package:catering_app/screens/product_detail/product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final popularItem = Provider.of<Products>(
      context,
      listen: false,
    ).findPopularItem();
    // final recomendedItem = Provider.of<Products>(context, listen: false,).findRecomendedItem();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBanner(screenSize: screenSize),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5,
                vertical: kDefaultPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Popular Items",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  buildContainer(context, popularItem),
                  Row(
                    children: [
                      buildExpandedMenu(
                        context,
                        'https://i.ibb.co/BCDXHSs/home-banner-1.jpg',
                        'FOODS',
                        () => Navigator.of(context)
                            .pushNamed(ProductListScreen.routeName),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      buildExpandedMenu(
                        context,
                        'https://cdn-b.william-reed.com/var/wrbm_gb_hospitality/storage/images/publications/hospitality/morningadvertiser.co.uk/article/2019/05/20/adult-soft-drinks-for-pubs/3080330-2-eng-GB/Adult-soft-drinks-for-pubs_wrbm_large.jpg',
                        'DRINKS',
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildExpandedMenu(BuildContext context, String imageUrl, String text,
      void Function() press) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        child: GestureDetector(
          onTap: press,
          child: Stack(
            children: [
              SizedBox(
                height: 200,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(kDefaultPadding / 2),
                        color: Colors.black54,
                      ),
                      padding: const EdgeInsets.all(kDefaultPadding / 2),
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(BuildContext context, List<Product> popularItem) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) => ItemCard(
          press: () => Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: popularItem[index].id),
          product: popularItem[index],
        ),
      ),
    );
  }
}
