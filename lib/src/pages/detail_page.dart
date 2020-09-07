import 'package:flutter/material.dart';
import 'package:juice_pp/src/constants.dart';
import 'package:juice_pp/src/utils/color_utils.dart';
import 'package:juice_pp/src/widgets/btn_quantity_widget.dart';

import '../tweak.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemDataJuice product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: _body(context, product),
    );
  }

  Widget _body(BuildContext context, ItemDataJuice product) {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          _headerImg(product, context),
          SizedBox(height: 20.0),
          _title(product),
          SizedBox(height: 20.0),
          _price(product),
          SizedBox(height: 20.0),
          _description(product),
          SizedBox(height: 20.0),
          _buttonBtn(product),
        ],
      ),
    );
  }

  Widget _headerImg(ItemDataJuice product, BuildContext context) {
    return Stack(
      children: [
        _bgImg(product, context),
        Positioned(top: 30.0, child: _appBar(product, context)),
        Positioned(right: 28.0, bottom: 8.0, child: _headerButton(product)),
      ],
    );
  }

  Widget _bgImg(ItemDataJuice product, BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.46;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 22.0),
          decoration: BoxDecoration(
            color: product.bgColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
          height: height,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(190.0),
            child: Hero(
              tag: product.uid,
              createRectTween: (begin, end) {
                return CustomRectTween(a: begin, b: end);
              },
              child: Image(
                image: NetworkImage(product.ic),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }

  Widget _appBar(ItemDataJuice product, BuildContext context) {
    return Container(
      height: 34.0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 26.0, right: 26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 34.0,
              height: 34.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: product.bgColor,
              ),
            ),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30.0,
          )
        ],
      ),
    );
  }

  Widget _headerButton(ItemDataJuice product) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Icon(Icons.favorite, color: product.bgColor),
    );
  }

  Widget _title(ItemDataJuice product) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 28.0, right: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: TextStyle(
              fontSize: 44.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Lemonade Juice',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _price(ItemDataJuice product) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 28.0, right: 28.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          '${product.price}',
          style: TextStyle(
            fontSize: 36.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        BntQuantity(
          bgColor: product.bgColor,
          height: 40.0,
        )
      ]),
    );
  }

  Widget _description(ItemDataJuice product) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 28.0, right: 28.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'About Products',
          style: TextStyle(
            fontSize: 28.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          '${product.description} ${product.description} ${product.description}',
          style: TextStyle(
              fontSize: 13.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              height: 1.4),
        ),
      ]),
    );
  }

  Widget _buttonBtn(ItemDataJuice product) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: FlatButton(
        onPressed: () {},
        child: Text(
          'Add to Bag',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 18.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: product.bgColor,
      ),
    );
  }
}
