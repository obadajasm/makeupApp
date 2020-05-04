import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/consts.dart';
import 'package:makeup_app/model/prodcut.dart';
import 'package:makeup_app/provider/product_provider.dart';
import 'package:makeup_app/screen/product_screen.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  static const ROUTE_NAME = 'ProductListScreen';

  @override
  Widget build(BuildContext context) {
    ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    List<Product> myProducts = provider.productResponse;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
          itemCount: myProducts.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                provider.selectedProductIndex = index;
                Navigator.of(context).pushNamed(ProductScreen.ROUTE_NAME);
              },
              child: Container(
                height: deviceHeight * 0.5,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      width: 200,
                      height: 200,
                      imageUrl: 'http:${myProducts[index].api_featured_image}',
                      placeholder: (_, __) {
                        return provider.type == ''
                            ? Container(
                                width: 200,
                                height: 200,
                                child: Center(
                                    child: Text(provider.brand,
                                        style: kTextStyleMed)))
                            : Image(
                                width: 200,
                                height: 200,
                                color: kMainColor,
                                image: AssetImage(
                                    'assets/images/${provider.type}.png'),
                              );
                      },
                      errorWidget: (_, __, ____) {
                        return Icon(Icons.error);
                      },
                    ),
                    SizedBox(height: 11),
                    AutoSizeText(
                      myProducts[index].name,
                      maxLines: 1,
                      style: kTextStyleMed.copyWith(color: kMainColor),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
