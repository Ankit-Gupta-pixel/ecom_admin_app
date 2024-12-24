import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/order_model.dart';


class OrderProvider with ChangeNotifier {
  final List<OrdersModelAdvanced> orders = [];
  List<OrdersModelAdvanced> get getOrders => orders;

  Future<List<OrdersModelAdvanced>> fetchOrders() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    var uid = user!.uid;
    try {
      await FirebaseFirestore.instance
          .collection("ordersAdvanced")
          .where('userId', isEqualTo: uid)
          .orderBy("orderDate", descending: false)
          .get()
          .then((orderSnapshot) {
        orders.clear();
        for (var element in orderSnapshot.docs) {
          var data = element.data();
          orders.insert(
            0,
            OrdersModelAdvanced(
              orderId: data['orderId'],
              productId: data['productId'],
              userId: data['userId'],
              price: data['price'].toString(),
              productTitle: data['productTitle'].toString(),
              quantity: data['quantity'].toString(),
              imageUrl: data['imageUrl'],
              userName: data['userName'],
              orderDate: data['orderDate'],
            ),
          );
        }
      });
      return orders;
    } catch (e) {
      rethrow;
    }
  }
}
