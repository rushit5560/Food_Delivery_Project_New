class OrderModel{
  String itemImg;
  String itemName;
  int itemQty;
  String dateAndTime;
  String orderId;
  String payMethod;
  String orderStatus;
  String itemAmount;

  OrderModel({
      required this.itemImg,
      required this.itemName,
      required this.itemQty,
      required this.dateAndTime,
      required this.orderId,
      required this.payMethod,
      required this.orderStatus,
      required this.itemAmount});
}