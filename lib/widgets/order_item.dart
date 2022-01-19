import 'dart:math';
import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, this.order}) : super(key: key);

  final ord.OrderItem? order;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order!.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order!.dateTime!)),
            trailing: IconButton(onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            } ,icon: Icon( _expanded ? Icons.expand_less : Icons.expand_more )),
          ),
          if (_expanded) Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.order!.products!.length * 20.0 + 100, 180),
              child: ListView(
                children: widget.order!.products!.map((product) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(product.title!, style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${product.quantity}x \$${product.price}', style: const TextStyle( fontSize: 18, color: Colors.grey ),)
                  ],
                )).toList()
              ),
          )
        ],
      ),
    );
  }
}
