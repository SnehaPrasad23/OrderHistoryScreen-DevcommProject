import 'item.dart';

class Order{
  String date;
  String time;
  List<Item> items;
  double amount;

  Order(this.date,this.time,this.items,this.amount);
}