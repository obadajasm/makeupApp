import 'package:flutter/material.dart';
import 'package:makeup_app/consts.dart';
import 'package:makeup_app/model/prodcut.dart';
import 'package:makeup_app/provider/product_provider.dart';
import 'package:makeup_app/screen/product_list_screen.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class CatWidget extends StatefulWidget {
  const CatWidget({
    Key key,
    @required this.deviceHeight,
    @required this.deviceWidth,
    @required this.text,
    this.isImage = true,
  }) : super(key: key);

  final double deviceHeight;
  final double deviceWidth;
  final String text;

  final bool isImage;

  @override
  _CatWidgetState createState() => _CatWidgetState();
}

class _CatWidgetState extends State<CatWidget> {
  @override
  Widget build(BuildContext context) {
    List<Product> myProducts = List();
    ProductProvider productProvider = Provider.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, bottom: 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.text,
              style: kTextStyleMedWhite,
            ),
          ),
        ),
        Container(
          height: widget.isImage
              ? widget.deviceHeight * 0.3
              : widget.deviceHeight * 0.23,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                widget.isImage ? Data.data.length : Data.dataBrandName.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () async {
                  productProvider.toogleIsLoading();
                  showDialog(
                      context: context,
                      child: SizedBox(
                          width: 111,
                          height: 111,
                          child: Center(
                              child: CircularProgressIndicator(
                            backgroundColor: kCatColor,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(kMainColor),
                          ))));
                  widget.isImage
                      ? await productProvider
                          .getProductByType(Data.dataCatName[index])
                      : await productProvider
                          .getProductByBrand(Data.dataBrandName[index]);
                  productProvider.toogleIsLoading();
                  Navigator.of(context).pop();
                  for (Map<String, dynamic> s
                      in productProvider.productResponse) {
                    myProducts.add(Product.fromJson(s));
                  }
                  productProvider.productResponse = myProducts;
                  Navigator.of(context).pushNamed(ProductListScreen.ROUTE_NAME);
                },
                child: Container(
                  width: widget.deviceWidth * 0.49,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10, left: 17.0, right: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          color: ksubColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(32),
                            //bottomLeft: Radius.circular(11),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.isImage
                                ? Image(
                                    image: Data.data[index],
                                    color: kCatColor,
                                    width: 111,
                                    height: 111,
                                  )
                                : SizedBox(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                widget.isImage
                                    ? Data.dataCatName[index]
                                    : Data.dataBrandName[index],
                                style: kTextStyleMed,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
