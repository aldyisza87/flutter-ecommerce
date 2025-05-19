import 'package:flutter/material.dart';

class GlobalVariables {
  static const baseUrl = 'http://10.0.2.2:1337';
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Elektronik',
      'image': 'assets/images/elektronik.webp',
    },
    {
      'title': 'Handphone & Aksesoris',
      'image': 'assets/images/hp.webp',
    },
    {
      'title': 'Laptop & Aksesoris',
      'image': 'assets/images/laptop.webp',
    },
    {
      'title': 'Kamera',
      'image': 'assets/images/kamera.webp',
    },
    {
      'title': 'Pakaian Wanita',
      'image': 'assets/images/pakaian_wanita.webp',
    },
    {
      'title': 'Pakaian Pria',
      'image': 'assets/images/pakaian_pria.webp',
    },
  ];

  static const List<String> bannerImage = [
    'https://cf.shopee.co.id/file/id-11134258-7rbk4-m9k4hu0jkz77ef_xhdpi',
    'https://cf.shopee.co.id/file/id-11134258-7rbk5-m9jt8eue5riq38_xhdpi',
    // 'https://storage.googleapis.com/astro-site/home/new-user.webp',
    // 'https://storage.googleapis.com/astro-site/home/24jam.webp',
  ];
  static const backgroundColor = Colors.white;
  static const greyBackgroundCOlor = Color(0xffebecee);
  static const selectedNavBarColor = Color(0xffEE4D2D);
  static const unselectedNavBarColor = Colors.black87;
}
