import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String productTitle;
  final String imageUrl;
  final String category;
  final int price;
  final double rating;
  final double userRating;
  final int review;
  final int sold;
  final String reviewer;
  final double discount;
  final String descProduct;
  final String userComment;
  final Seller seller;

  Product({
    required this.productTitle,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.rating,
    required this.userRating,
    required this.review,
    required this.sold,
    required this.reviewer,
    required this.discount,
    required this.descProduct,
    required this.userComment,
    required this.seller,
  });

  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    if (data == null) {
      throw StateError('Data is null!');
    }

    return Product(
      productTitle:
          data['productTitle'] is String ? data['productTitle'] as String : data['productTitle'].toString(),
      imageUrl: data['imageUrl'] is String ? data['imageUrl'] as String : data['imageUrl'].toString(),
      category: data['category'] is String ? data['category'] as String : data['category'].toString(),
      price: data['price'] is int ? data['price'] as int : int.tryParse(data['price'].toString()) ?? 0,
      rating: data['rating'] is double
          ? data['rating'] as double
          : double.tryParse(data['rating'].toString()) ?? 0.0,
      userRating: data['userRating'] is double
          ? data['userRating'] as double
          : double.tryParse(data['userRating'].toString()) ?? 0.0,
      review: data['review'] is int ? data['review'] as int : int.tryParse(data['review'].toString()) ?? 0,
      sold: data['sold'] is int ? data['sold'] as int : int.tryParse(data['sold'].toString()) ?? 0,
      reviewer: data['reviewer'] is String ? data['reviewer'] as String : data['reviewer'].toString(),
      discount: data['discount'] is double
          ? data['discount'] as double
          : double.tryParse(data['discount'].toString()) ?? 0.0,
      descProduct:
          data['descProduct'] is String ? data['descProduct'] as String : data['descProduct'].toString(),
      userComment:
          data['userComment'] is String ? data['userComment'] as String : data['userComment'].toString(),
      seller: data.containsKey('seller')
          ? Seller.fromFirestore(data['seller'] as Map<String, dynamic>)
          : Seller.empty(),
    );
  }
}

class Seller {
  final DateTime lastActive;
  final String sellerImg;
  final String sellerName;
  final String sellerLocation;

  Seller({
    required this.lastActive,
    required this.sellerImg,
    required this.sellerName,
    required this.sellerLocation,
  });

  factory Seller.fromFirestore(Map<String, dynamic> data) {
    return Seller(
      lastActive: (data['lastActive'] as Timestamp).toDate(),
      sellerImg: data['sellerImg'] is String ? data['sellerImg'] as String : data['sellerImg'].toString(),
      sellerName: data['sellerName'] is String ? data['sellerName'] as String : data['sellerName'].toString(),
      sellerLocation: data['sellerLocation'] is String
          ? data['sellerLocation'] as String
          : data['sellerLocation'].toString(),
    );
  }

  factory Seller.empty() {
    return Seller(
      lastActive: DateTime.now(),
      sellerImg: '',
      sellerName: '',
      sellerLocation: '',
    );
  }
}

class ProductShop {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection('ProductShop').get();
      List<Product> products = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?;
        print('Document Data: $data'); // Tambahkan logging
        if (data == null) {
          throw StateError('Document data is null!');
        }
        return Product.fromFirestore(doc);
      }).toList();
      return products;
    } catch (e) {
      print('Error fetching products: $e');
      rethrow;
    }
  }
}
