import 'package:flutter/material.dart';

class BntQuantity extends StatefulWidget {
  final Color bgColor;
  final double height;

  BntQuantity({Key key, this.bgColor, this.height = 30}) : super(key: key);

  @override
  _BntQuantityState createState() => _BntQuantityState();
}

class _BntQuantityState extends State<BntQuantity> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        children: [
          _iconButton(Icons.remove, () {
            if (quantity == 0) {
              return;
            }
            setState(() {
              quantity--;
            });
          }),
          Text(
            '$quantity',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
            ),
          ),
          _iconButton(Icons.add, () {
            setState(() {
              quantity++;
            });
          })
        ],
      ),
    );
  }

  Widget _iconButton(IconData ic, Function cb) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: cb,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: widget.height * 0.26),
        child: Icon(
          ic,
          color: Colors.white,
          size: 18.0,
        ),
      ),
    );
  }
}
