import 'dart:ffi';

class PharmacyData {
  final String name;
  final String imageUrl;
  final double rating;
  final double distance;
  final double deliveryCharge;

  PharmacyData({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.distance,
    required this.deliveryCharge,
  });
}

class DoctorData {
  final String name;
  final String imageUrl;
  final String specialty;
  final String hospital;
  final double rating;
  final int yearsOfExperience;

  DoctorData({
    required this.name,
    required this.imageUrl,
    required this.specialty,
    required this.hospital,
    required this.rating,
    required this.yearsOfExperience,
  });
}

class TestkitData {
  final String image;
  final String name;
  final String description;
  final int price;

  TestkitData({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });
}

class ProductData {
  final String name;
  final String imageAsset;
  final double price;
  final String promotion;

  ProductData({
    required this.name,
    required this.imageAsset,
    required this.price,
    required this.promotion,
  });
}

class Product {
  final String id;
  final String imageUrl;
  final String name;
  final double price;
  final double originalPrice;
  final int discount;
  final List<Pharmacy> nearbyPharmacies;

  Product({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.nearbyPharmacies,
  });
}



class Pharmacy {
  final String name;
  final String arrivalTime;
  final double price;
  final String deliveryInfo;

  Pharmacy({
    required this.name,
    required this.arrivalTime,
    required this.price,
    required this.deliveryInfo,
  });
}