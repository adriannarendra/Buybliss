import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_ecommerce/components/item_popular.dart';
import 'package:ui_ecommerce/model/product_data.dart';
import 'package:ui_ecommerce/screens/details/detail_screen.dart';
import 'package:ui_ecommerce/screens/home/component/special_offer_card.dart';
import 'package:ui_ecommerce/sized_config.dart';
import 'package:ui_ecommerce/state_managements/favourite_provider.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPropScreenWidth(20)),
          child: const SectionTitle(
            title: 'Popular Products',
          ),
        ),
        SizedBox(
          height: getPropScreenHeight(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: getPropScreenWidth(250),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<FavouriteProvider>(
                builder: (context, products, child) => Row(
                    children:
                        List.generate(products.listProducts.length, (index) {
                  final Product product = products.listProducts[index];
                  return ItemPoularProduct(
                    product: product,
                    press: () {
                      Navigator.pushNamed(context, DetailScreen.routesName,
                          arguments: product);
                    },
                  );
                })),
              ),
            ),
          ),
        )
      ],
    );
  }
}
