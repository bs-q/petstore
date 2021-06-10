import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petstore/Models/User.dart';
import 'package:provider/provider.dart';

import 'package:petstore/Constant/MyColor.dart';
import 'package:petstore/Services/CartList.dart';
import 'package:petstore/Views/UI/HomeLinkNavigation.dart';
import 'package:petstore/Views/UI/HomepageHeader.dart';
import 'package:petstore/Views/Utils/CustomHover.dart';

class EditCartPage extends StatefulWidget {
  @override
  _EditCartPageState createState() => _EditCartPageState();
}

class _EditCartPageState extends State<EditCartPage> {
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController customerName = TextEditingController();
  TextEditingController customerPhone = TextEditingController();
  TextEditingController customerAddress = TextEditingController();
  TextEditingController customerNote = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String defaultName = Provider.of<User>(context, listen: true).name;
    String defaultPhone = Provider.of<User>(context, listen: true).phone;
    int total = Provider.of<CartList>(context, listen: true).getTotal();
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Tên khách hàng'),
                                    TextFormField(
                                      controller: customerName,
                                      decoration: InputDecoration(
                                          hintText: defaultName,
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 3)),
                                    ),
                                    Text('Số điện thoại'),
                                    TextFormField(
                                      controller: customerPhone,
                                      decoration: InputDecoration(
                                          hintText: defaultPhone,
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 3)),
                                    ),
                                    Text('Địa chỉ nhận hàng'),
                                    TextFormField(
                                      controller: customerAddress,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your address';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 3)),
                                    ),
                                    Text('Ghi chú'),
                                    Container(
                                      child: TextFormField(
                                        controller: customerNote,
                                        maxLines: 10,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 12),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Tổng tiền'),
                                        Consumer<CartList>(
                                            builder: (context, value, child) =>
                                                Text(
                                                  '${value.getTotal()}đ',
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                  ),
                                                ))
                                      ],
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  MyColor.FONTCOLOR)),
                                      onPressed: total == 0
                                          ? null
                                          : () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                Provider.of<User>(context,
                                                    listen: false)
                                                  ..updateAddress(
                                                      customerAddress.text)
                                                  ..updateNote(
                                                      customerNote.text);
                                                Navigator.of(context)
                                                    .pushNamed('/checkout');
                                              }
                                            },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.shopping_bag_outlined),
                                            VerticalDivider(
                                              width: 10,
                                            ),
                                            Text(
                                              'Đặt hàng',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    textStyle: const TextStyle(fontSize: 13),
                                  ),
                                  onPressed: () {
                                    remove(index);
                                    listKey.currentState!.removeItem(
                                        index,
                                        (context, animation) => CartItem(
                                            listKey: listKey,
                                            image: image,
                                            name: name,
                                            quantity: quantity,
                                            update: update,
                                            price: price,
                                            increase: increase,
                                            decrease: decrease,
                                            remove: remove,
                                            index: index,
                                            animation: animation),
                                        duration:
                                            const Duration(milliseconds: 250));
                                  },
                                  child: const Text(
                                    'Xóa',
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    alignment: Alignment.centerLeft,
                                    textStyle: const TextStyle(fontSize: 13),
                                  ),
                                  onPressed: () {},
                                  child: const Text('Để dành mua sau'),
                                ),
                              ],
                            )
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
                      Expanded(
                        child: Material(
                          color: Colors.white,
                          child: FittedBox(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      iconSize: 13,
                                      splashRadius: 13,
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        decrease(index);
                                      }),
                                  Container(
                                    width: 30,
                                    child: Focus(
                                      focusNode: quantityNode,
                                      onFocusChange: (value) {
                                        if (value) {
                                        } else {
                                          update(index,
                                              int.parse(itemQuantity.text));
                                        }
                                      },
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                        controller: itemQuantity,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      iconSize: 13,
                                      icon: Icon(Icons.add),
                                      splashRadius: 13,
                                      onPressed: () {
                                        increase(index);
                                      }),
                                ],
                              ),
                            ),
                          ),
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
