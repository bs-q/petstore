import 'dart:convert';

class BillDetail {
  int code;
  DateTime date;
  String product;
  int price;
  String status;
  BillDetail({
    required this.code,
    required this.date,
    required this.product,
    required this.price,
    required this.status,
  });
  


  BillDetail copyWith({
    int? code,
    DateTime? date,
    String? product,
    int? price,
    String? status,
  }) {
    return BillDetail(
      code: code ?? this.code,
      date: date ?? this.date,
      product: product ?? this.product,
      price: price ?? this.price,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'date': date.millisecondsSinceEpoch,
      'product': product,
      'price': price,
      'status': status,
    };
  }

  factory BillDetail.fromMap(Map<String, dynamic> map) {
    return BillDetail(
      code: map['code'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      product: map['product'],
      price: map['price'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BillDetail.fromJson(String source) => BillDetail.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BillDetail(code: $code, date: $date, product: $product, price: $price, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BillDetail &&
      other.code == code &&
      other.date == date &&
      other.product == product &&
      other.price == price &&
      other.status == status;
  }

  @override
  int get hashCode {
    return code.hashCode ^
      date.hashCode ^
      product.hashCode ^
      price.hashCode ^
      status.hashCode;
  }
}
