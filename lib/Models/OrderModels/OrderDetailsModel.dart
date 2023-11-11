class OrderDetailsModel {
  int? id;
  int? orderMasterId;
  String? productName;
  int? amount;
  int? price;
  int? quantity;

  OrderDetailsModel({
    this.id,
    this.orderMasterId,
    this.productName,
    this.amount,
    this.price,
    this.quantity,

  });

  factory OrderDetailsModel.fromMap(Map<dynamic, dynamic> map) {
    return OrderDetailsModel(
      id: map['id'],
      orderMasterId: map['order_master_id'],
      productName: map['productName'],
      amount: map['amount'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order_master_id':orderMasterId,
      'productName': productName,
      'amount': amount,
      'price': price,
      'quantity': quantity,
    };
  }
}