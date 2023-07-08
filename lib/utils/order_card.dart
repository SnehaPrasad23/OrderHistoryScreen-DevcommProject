import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  late int idx;
  late List order_list;
  OrderCard(int idx,List data){
    this.idx=idx;
    this.order_list=data;
  }
  @override
  State<OrderCard> createState() => _OrderCardState(idx,order_list);
}

class _OrderCardState extends State<OrderCard> {
  late int idx;
  late List order_list;
  _OrderCardState(int idx,List data){
    this.idx=idx;
    this.order_list=data;
  }
  bool collapsed=true;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
              children: [
                Text(
                    '${order_list[idx].date}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[900],
                    )
                ),
                Text(
                    'At ${order_list[idx].time}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    )
                ),
                collapsed? collapsed_order() : expanded_order() ,
                if(order_list[idx].items.length > 2)
                  collapsed?
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        collapsed=false;
                      });
                    },
                    child: Text(
                      'View more...',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                      setState(() {
                        collapsed=true;
                      });
                    },
                    child: Text(
                      'View less...',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                else
                  const SizedBox(height:0),
                SizedBox(height:2.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: TextStyle(color: Colors.black,fontSize: 15),
                              text: 'Total: ',
                              children: <InlineSpan>[
                                TextSpan(text: 'Rs. ${order_list[idx].amount}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                              ]
                          )
                      ),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.redAccent[100],
                        ),
                        child: Text(
                          'Order Again',
                        ),
                        onPressed: () {},
                      ),
                    ]
                )
              ]
          ),
        )
    );
  }
  Widget expanded_order() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: order_list[idx].items.length,
      itemBuilder: (BuildContext context,int i){
        return ListTile(
          minVerticalPadding: 0.0,
          title: Text(
            '${order_list[idx].items[i].count} x ${order_list[idx].items[i].name}',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('${order_list[idx].items[i].image}'),
          ),
        );
      },
    );
  }

  Widget collapsed_order() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context,int i){
        return ListTile(
          minVerticalPadding: 0.0,
          title: Text(
            '${order_list[idx].items[i].count} x ${order_list[idx].items[i].name}',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage('${order_list[idx].items[i].image}'),
          ),
        );
      },
    );
  }
}

