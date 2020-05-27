import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  

  @override
  Widget build(BuildContext context) {
    double totalCost = 0;
  currentUser.cart.forEach((Order order) { 
    totalCost += order.quantity*order.food.price;
  });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart (${currentUser.cart.length})',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: currentUser.cart.length+1,
        itemBuilder: (BuildContext context, int index) {
          if(index < currentUser.cart.length){
          Order order = currentUser.cart[index];
          return _buildCartItem(order);}
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('Estimated Delivery Time', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
                  Text('Time : 25 min', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
                ],),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('Total Cost:', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),),
                  Text('\$${totalCost.toStringAsFixed(2)}', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.green[700]),),
                ],),
              ),
              SizedBox(height: 90.0,)
              
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey,
            thickness: 1.0,
          );
        },
        
      ),
      bottomSheet: Container(
        height: 100.0,
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text('CHECKOUT',style: TextStyle(color: Colors.white, fontSize: 22.0),)
        ),
      ),
    );
  }

  Widget _buildCartItem(Order order) {
    return Container(
      height: 170.0,
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Container(
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order.food.name,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        order.restaurant.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border:
                                Border.all(width: 0.8, color: Colors.black54)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              '${order.quantity}',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Text(
            '\$${order.quantity * order.food.price}',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
