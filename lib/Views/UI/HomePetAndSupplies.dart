import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Views/UI/ProductItem.dart';

class HomePetAndSupplies extends StatelessWidget {
  const HomePetAndSupplies({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
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
                          imageLink: 'assets/images/rat.png',
                          description:
                              'Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu',
                          itemId: 1,
                          itemName: 'Hamster robo',
                          buttonText: 'Mua Hàng',
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
                    for (var i = 0; i < 4; i++)
                      Flexible(
                        child: ProductItem(
                          imageLink: 'assets/images/rat.png',
                          description:
                              'Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Nam condimentum tempus diam, ultricies sollicitudin erat facilisis eget. Vestibulum rhoncus dui vel eros laoreet consectetur. Vivamus eget elementum ligula, vitae pharetra quam. Nullam at ligula sed metu',
                          itemId: 1,
                          itemName: 'Hamster robo',
                          buttonText: 'Mua Hàng',
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
      ),
    );
  }
}
