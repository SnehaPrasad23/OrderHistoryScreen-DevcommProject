import '../utils/item.dart';
import '../utils/prev_order.dart';

class PrevOrderList {
  List<Order> prevOrderList= [
    Order('24th Feb, Friday', '1pm',[
      Item(5,'Maggi','assets/maggi.jpg'),
      Item(2,'Tea','assets/tea.jpg'),
    ],200.0),
    Order('23rd Feb, Thursday','2pm', [
      Item(3,'Burger','assets/burger.jpg'),
      Item(2,'Coffee','assets/coffee.jpg'),
      Item(2,'Tea','assets/tea.jpg'),
    ],350.0),
    Order('23rd Feb, Thursday','10am', [
      Item(3,'Burger','assets/burger.jpg'),
      Item(5,'Maggi','assets/maggi.jpg'),
    ],250.0),
    Order('21st Feb, Tuesday','4pm', [
      Item(2,'Coffee','assets/coffee.jpg'),
      Item(1,'Maggi','assets/maggi.jpg'),
      Item(3,'Burger','assets/burger.jpg'),
      Item(2,'Tea','assets/tea.jpg'),
    ],200.0),
    Order('21st Feb, Tuesday', '10am' ,[
      Item(2,'Maggi','assets/maggi.jpg'),
      Item(3,'Burger','assets/burger.jpg'),
    ],200.0),
  ];
  List<Order> getPrevOrdersList() => prevOrderList;
}