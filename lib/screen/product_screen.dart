import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:makeup_app/consts.dart';
import 'package:makeup_app/model/prodcut.dart';
import 'package:makeup_app/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  static const ROUTE_NAME = 'ProductScreen';

  @override
  Widget build(BuildContext context) {
    int hex = 0;
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    ProductProvider provider =
        Provider.of<ProductProvider>(context, listen: false);
    Product myProduct = provider.productResponse[provider.selectedProductIndex];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: deviceWidth,
                height: deviceHeight * 0.35,
                child: CachedNetworkImage(
                  imageUrl: 'http:${myProduct.api_featured_image}',
                  placeholder: (_, __) {
                    return provider.type == ''
                        ? Text(
                            provider.brand,
                            style: kTextStyleMed,
                          )
                        : Image(
                            width: 200,
                            height: 200,
                            color: kMainColor,
                            image: AssetImage(
                                'assets/images/${provider.type}.png'),
                          );
                  },
                  width: 400,
                  height: 400,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: deviceHeight * 0.04,
                width: deviceWidth * 0.5,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myProduct.productColors.length,
                    itemBuilder: (ctx, index) {
                      String color = myProduct.productColors[index].hexValue
                          .replaceAll('#', '0xff');
                      try {
                        hex = int.parse(color);
                      } catch (e) {
                        print("a" + hex.toString());
                      }
                      print("s" + hex.toString());

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 30,
                          height: 70,
                          decoration: BoxDecoration(
                            color: hex == 0 ? Colors.white : Color(hex),
                            borderRadius: BorderRadius.circular(999),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: deviceWidth,
                height: deviceHeight * 0.6,
                decoration: BoxDecoration(
                  color: ksubColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: deviceHeight * 0.06),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: AutoSizeText(
                            myProduct.name,
                            maxLines: 1,
                            style: kTextStyleMed,
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              myProduct.brand,
                              style: kTextStyleMed,
                            ),
                            Text(
                              myProduct.productType,
                              style: kTextStyleMedWhite,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                        ),
                        Container(
                            width: deviceWidth,
                            padding: EdgeInsets.only(left: 11),
                            child: Text(
                              myProduct.description.isEmpty
                                  ? ""
                                  : "about Product : ",
                              style: kTextStyleMedWhite,
                            )),
                        SizedBox(
                          height: deviceHeight * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            myProduct.description,
                            style: kTextStyleMed,
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.05,
                        ),
                        myProduct.tag_list.length == 0
                            ? SizedBox()
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.list),
                                      Text(
                                        "Tags :",
                                        style: kTextStyleMed,
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (ctx, index) {
                                        return Center(
                                          child: Text(
                                            myProduct.tag_list[index] + "\n",
                                            style: kTextStyleMed,
                                          ),
                                        );
                                      },
                                      itemCount: myProduct.tag_list.length),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
