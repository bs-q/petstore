import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Services/ProductList.dart';
import 'package:petstore/Views/UI/ProductItem.dart';
import 'package:provider/provider.dart';

class HomePetAndSupplies extends StatelessWidget {
  const HomePetAndSupplies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Consumer<ProductList>(builder: (context, productList, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    child: Text(
                      'THỨC ĂN VÀ PHỤ KIỆN',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          color: Colors.white),
                    ),
                    padding: EdgeInsets.only(left: 40),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: MyColor.FONTCOLOR,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90))),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 0; i < 4; i++)
                          Flexible(
                            child: ProductItem(
                              imageLink: productList.products[i].image,
                              description: productList.products[i].description,
                              itemId: productList.products[i].id,
                              itemName: productList.products[i].name,
                              buttonText: 'Mua hàng',
                              path: '/product',
                            ),
                          ),
                      ],
                    ),
                  ),
                  flex: 7,
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var i = 4; i < 8; i++)
                          Flexible(
                            child: ProductItem(
                              imageLink: productList.products[i].image,
                              description: productList.products[i].description,
                              itemId: productList.products[i].id,
                              itemName: productList.products[i].name,
                              buttonText: 'Mua hàng',
                              path: '/product',
                            ),
                          ),
                      ],
                    ),
                  ),
                  flex: 7,
                )
              ],
            ),
          );
        }));
  }
}
