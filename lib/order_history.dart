import 'package:flutter/material.dart';

import 'resources/prev_orders_list.dart';
import 'utils/order_card.dart';
import 'utils/prev_order.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  PrevOrderList prevOrders=PrevOrderList();
  List<Order> myOrders=[];

  @override
  Widget build(BuildContext context) {
    myOrders=prevOrders.getPrevOrdersList();
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey[200],
              body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                          leading: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.grey[900],
                              size: 25,
                            ),
                            onPressed: () {},
                          ),
                          title: Text(
                              'My Orders',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.home,
                              color: Colors.grey[900],
                              size: 25,
                            ),
                            onPressed: () {},
                          )
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: myOrders.length,
                            itemBuilder: (BuildContext context,int index){
                              return OrderCard(index,myOrders);
                            }
                        )
                    )
                  ]
              ),
            )
        )
    );
  }
}