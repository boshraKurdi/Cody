import 'package:flutter/material.dart';


class CusttomAppAssetImage extends StatelessWidget {
  final String image;
  final double width;
  const CusttomAppAssetImage({
    super.key,
    required this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        image,
      ),
      width: width,
    );
  }
}


class CusttomAppNetWorkImage extends StatelessWidget {
  final String image;
  final double width;
  const CusttomAppNetWorkImage({
    super.key,
    required this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
        image,
      ),
      width: width,
    );
  }
}
