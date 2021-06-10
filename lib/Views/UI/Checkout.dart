import 'package:flutter/material.dart';
import 'package:petstore/Models/User.dart';
import 'package:provider/provider.dart';

import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Services/CartList.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final CustomHover text = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);

  final CustomHover text2 = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);

  final CustomHover text3 = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);

  final CustomHover text4 = CustomHover(
      onOutColor: MyColor.FONTCOLOR,
      underlineOnHover: true,
      baseColor: MyColor.FONTCOLOR,
      onHoverColor: MyColor.FONTCOLOR);
  bool payByPayPal = false;
  bool payByMoMo = false;

  @override
  Widget build(BuildContext context) {
    String defaultName = Provider.of<User>(context, listen: true).name;
    String defaultPhone = Provider.of<User>(context, listen: true).phone;
    String note = Provider.of<User>(context, listen: true).note;
    String address = Provider.of<User>(context, listen: true).address;

    int total = Provider.of<CartList>(context, listen: true).getTotal();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: RawScrollbar(
          thumbColor: Color(0xFF9D9D9D),
          radius: Radius.circular(4),
          thickness: 8,
          isAlwaysShown: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 60,
                  child: Column(
                    children: [
                      Flexible(
                        flex: 1,
                        child: HomepageHeader(),
                        fit: FlexFit.tight,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: HomeLinkNavigation(
                          text: text,
                          text2: text2,
                          text3: text3,
                          text4: text4,
                          setState: setState,
                        ),
                        flex: 1,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 2,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            color: Color(0xFFF4F4F4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Scrollbar(
                                      isAlwaysShown: false,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: ListCartItem())),
                                  flex: 7,
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('Tên khách hàng'),
                                        TextField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                              hintText: defaultName,
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 3)),
                                        ),
                                        Text('Số điện thoại'),
                                        TextField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                              hintText: defaultPhone,
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 3)),
                                        ),
                                        Text('Địa chỉ nhận hàng'),
                                        TextField(
                                          enabled: false,
                                          decoration: InputDecoration(
                                              hintText: address,
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 3)),
                                        ),
                                        Text('Ghi chú'),
                                        Container(
                                          child: TextField(
                                            enabled: false,
                                            maxLines: 10,
                                            decoration: InputDecoration(
                                              hintText: note,
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 12,
                                                      vertical: 12),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Tổng tiền'),
                                            Consumer<CartList>(
                                                builder:
                                                    (context, value, child) =>
                                                        Text(
                                                          '${value.getTotal()}đ',
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 24,
                                                          ),
                                                        ))
                                          ],
                                        ),
                                      ],
                                    )),
                                  ),
                                  flex: 3,
                                )
                              ],
                            ),
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chọn phương thức thanh toán',
                        style: TextStyle(fontSize: 32),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: payByPayPal,
                              shape: CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  payByPayPal = !payByPayPal;
                                  if (payByMoMo) {
                                    payByMoMo = !payByMoMo;
                                  }
                                });
                              }),
                          Image.asset('assets/images/paypal.png'),
                          Text('Thanh toán qua paypal')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: payByMoMo,
                              shape: CircleBorder(),
                              onChanged: (value) {
                                setState(() {
                                  payByMoMo = !payByMoMo;
                                  if (payByPayPal) {
                                    payByPayPal = !payByPayPal;
                                  }
                                });
                              }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Image.asset('assets/images/momo.png'),
                          ),
                          Text('Thanh toán qua Momo'),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size.fromWidth(240)),
                              backgroundColor:
                                  MaterialStateProperty.all(MyColor.FONTCOLOR)),
                          onPressed: total == 0
                              ? null
                              : () {
                                  // Navigator.pushNamed(
                                  //     context, '/checkout');
                                },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.payment),
                                VerticalDivider(
                                  width: 10,
                                ),
                                Text(
                                  'Mua hàng',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListCartItem extends StatefulWidget {
  const ListCartItem({
    Key? key,
  }) : super(key: key);

  @override
  _ListCartItemState createState() => _ListCartItemState();
}

class _ListCartItemState extends State<ListCartItem> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartList>(
        builder: (context, cart, child) => AnimatedList(
            key: _listKey,
            initialItemCount: cart.products.length,
            itemBuilder: (context, i, animation) => CartItem(
                update: cart.updateQuantity,
                listKey: _listKey,
                index: i,
                image: cart.products[i].image,
                name: cart.products[i].name,
                quantity: cart.products[i].quantity,
                price: cart.products[i].price,
                increase: cart.increaseQuantity,
                decrease: cart.decreaseQuantity,
                remove: cart.removeItem,
                animation: animation)));
  }
}

class CartItem extends StatelessWidget {
  CartItem(
      {Key? key,
      required this.listKey,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.increase,
      required this.decrease,
      required this.remove,
      required this.index,
      required this.animation,
      required this.update})
      : super(key: key);
  final GlobalKey<AnimatedListState> listKey;
  final String image;
  final String name;
  final int quantity;
  final int price;
  final Function increase;
  final Function decrease;
  final Function update;
  final Function remove;
  final int index;
  final Animation<double> animation;
  final TextEditingController itemQuantity = TextEditingController();
  final FocusNode quantityNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    itemQuantity.text = '$quantity';
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: GestureDetector(
        onTap: () {
          quantityNode.unfocus();
        },
        child: Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide())),
          margin: EdgeInsets.all(7),
          height: 200,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    width: 180,
                    height: 180,
                  ),
                ),
                flex: 2,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '$priceđ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                flex: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
