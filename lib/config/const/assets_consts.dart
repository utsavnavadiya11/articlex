import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssetsName {
  AssetsName._privateConstructor();

  static final AssetsName _instance = AssetsName._privateConstructor();

  factory AssetsName() {
    return _instance;
  }

  // Icons
  static const String kNoDataFound =
      "https://img.freepik.com/free-vector/flat-design-no-data-illustration_23-2150527142.jpg?t=st=1746758268~exp=1746761868~hmac=a87d85f4868a92638730d6b2335031848ed82c27c2f531120dbad1a2f298664c&w=826";
}

class IconsName {
  IconsName._privateConstructor();

  static final IconsName _instance = IconsName._privateConstructor();

  factory IconsName() {
    return _instance;
  }

  static const IconData kFavoriteBorder = Icons.favorite_border;
  static const IconData kFavorite = Icons.favorite;
}
