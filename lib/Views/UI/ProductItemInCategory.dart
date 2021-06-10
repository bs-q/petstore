import 'package:flutter/material.dart';
import 'package:petstore/Constant/MyColor.dart';

class ProductItemInCategory extends StatelessWidget {
  final String imageLink;
  final String description;
  final int itemId;
  final String itemName;
  final String buttonText;
  final String path;

  const ProductItemInCategory(
      {required this.imageLink,
      required this.description,
      required this.itemId,
      required this.itemName,
      required this.buttonText,
      required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(alignment: Alignment.center, child: Image.asset(imageLink)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              itemName,
              style: TextStyle(color: MyColor.ITEM_NAME_FONT_COLOR),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF6891EB)),
                ),
                onPressed: () => {Navigator.pushNamed(context, path)},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.black),
                  ),
                )),
          )
        ],
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    );
  }
}
