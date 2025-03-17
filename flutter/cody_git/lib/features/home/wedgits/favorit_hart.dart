import 'package:flutter/material.dart';


class FavoretHart extends StatefulWidget {
  String imageName='assets/img/love-1489-svgrepo-com.png';
  FavoretHart({
    super.key,
  });

  @override
  State<FavoretHart> createState() => _FavoretHartState();
}

class _FavoretHartState extends State<FavoretHart> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end,children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(onTap: () {
          setState(() {
            widget.imageName ='assets/img/love-1488-svgrepo-com.png';
          });
        },
          child: Image(
            image: AssetImage(
              widget.imageName,
            ),
            width: 20,
          ),
        ),
      ),
    ],);
  }
}