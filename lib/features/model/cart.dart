import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final user = FirebaseAuth.instance.currentUser;
final uid = user?.uid;

class CartItem {
  final String id;
  final String imageUrl;
  final String productTitle;
  final String note;
  final int price;
  final int quantity;

  CartItem({
    required this.id,
    required this.imageUrl,
    required this.productTitle,
    required this.note,
    required this.price,
    required this.quantity,
  });

  CartItem copy({String? id}) {
    return CartItem(
      id: id ?? this.id,
      imageUrl: imageUrl,
      productTitle: productTitle,
      note: note,
      price: price,
      quantity: quantity,
    );
  }
}

class CartProvider extends ChangeNotifier {
  final String userId;
  List<CartItem> _items = [];

  CartProvider(this.userId) {
    _loadItems();
  }

  List<CartItem> get items => _items;

  Future<void> _loadItems() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('ShopCart').doc(userId).collection('Items').get();
    _items = snapshot.docs
        .map((doc) => CartItem(
              id: doc.id,
              imageUrl: doc['imageUrl'],
              productTitle: doc['productTitle'],
              note: doc['note'],
              price: doc['price'],
              quantity: doc['quantity'],
            ))
        .toList();
    notifyListeners();
  }

  Future<void> addItem(CartItem item) async {
    final docRef = FirebaseFirestore.instance.collection('ShopCart').doc(userId).collection('Items').doc();
    final newItem = item.copy(id: docRef.id);
    await docRef.set({
      'id': newItem.id,
      'imageUrl': newItem.imageUrl,
      'productTitle': newItem.productTitle,
      'note': newItem.note,
      'price': newItem.price,
      'quantity': newItem.quantity,
    });
    _items.add(newItem);
    notifyListeners();
  }

  Future<void> removeItem(String id) async {
    await FirebaseFirestore.instance.collection('ShopCart').doc(userId).collection('Items').doc(id).delete();
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
