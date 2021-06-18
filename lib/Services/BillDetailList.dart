import 'package:flutter/cupertino.dart';
import 'package:petstore/Models/BillDetail.dart';

class BillDetailList extends ChangeNotifier {
  List<BillDetail> billDetails;
  BillDetailList({required this.billDetails});
}
