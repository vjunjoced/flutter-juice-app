import 'package:flutter/material.dart';
import 'package:juice_pp/src/constants.dart';
import 'package:juice_pp/src/utils/color_utils.dart';
import 'package:juice_pp/src/widgets/btn_quantity_widget.dart';

import '../tweak.dart';

class ItemDataMenu {
  String title;
  String ic;

  ItemDataMenu({this.title, this.ic});
}

class ItemDataJuice {
  String name;
  String ic;
  String description;
  double price;
  String bgStringColor;
  Color bgColor;
  int uid;

  ItemDataJuice(
      {this.name,
      this.ic,
      this.description,
      this.price,
      this.bgStringColor,
      this.uid}) {
    this.bgColor = HexColor(bgStringColor);
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final List<ItemDataMenu> menus = [
    ItemDataMenu(
      ic: 'https://image.flaticon.com/icons/png/512/184/184517.png',
      title: 'Avocado',
    ),
    ItemDataMenu(
      ic: 'https://cdn3.iconfinder.com/data/icons/fruit-and-vegetable-39/32/flat_icon_fruit_08-512.png',
      title: 'Mango',
    ),
    ItemDataMenu(
      ic: 'https://cdn4.iconfinder.com/data/icons/food-icon-set-2/595/food-03-512.png',
      title: 'Apple',
    ),
    ItemDataMenu(
      ic: 'https://cdn4.iconfinder.com/data/icons/slot-machines/512/Grapes-512.png',
      title: 'Grapess',
    ),
    ItemDataMenu(
      ic: 'https://cdn4.iconfinder.com/data/icons/slot-machines/512/Bananas-512.png',
      title: 'Banana',
    ),
    ItemDataMenu(
      ic: 'https://cdn4.iconfinder.com/data/icons/slot-machines/512/Strawberry-512.png',
      title: 'Strawberry',
    ),
    ItemDataMenu(
      ic: 'https://cdn4.iconfinder.com/data/icons/slot-machines/512/Lemon-512.png',
      title: 'Lemon',
    ),
    ItemDataMenu(
      ic: 'https://cdn4.iconfinder.com/data/icons/slot-machines/512/Watermelon-512.png',
      title: 'Watermelon',
    )
  ];

  final List<ItemDataJuice> products = [
    ItemDataJuice(
      name: 'Apple Juice',
      ic: 'https://i.imgur.com/XBUWTWw.png',
      description:
          'Almost every designer awaitos their turn and chance work own big food.',
      price: 12.65,
      bgStringColor: '#f48c94',
      uid: 1,
    ),
    ItemDataJuice(
      name: 'Pineable Juice',
      ic: 'https://i.imgur.com/e8xyxXA.png',
      description:
          'The whole idea of juicing is good if you are trying to diet and use it in limited.',
      price: 13.99,
      bgStringColor: '#f8cbe3',
      uid: 2,
    ),
    ItemDataJuice(
      name: 'Grapes Juice',
      ic: 'https://i.imgur.com/cPMj07n.png',
      description:
          'Juice drinks only once a week use the emulsified drinks because in emulsific.',
      price: 11.27,
      bgStringColor: '#efd0ef',
      uid: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      backgroundColor: Colors.white,
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        _header(),
        Expanded(
          child: _listJuice(),
        ),
      ],
    );
  }

  // header search and menu
  Widget _header() {
    return Container(
      width: double.infinity,
      height: 225,
      padding: EdgeInsets.only(
        top: 48.0,
        left: 28.0,
        right: 28.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
        ),
      ),
      child: Column(
        children: [_headerSearch(), SizedBox(height: 36.0), _headerMenu()],
      ),
    );
  }

  Widget _headerSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.mainColor,
              ),
              contentPadding: EdgeInsets.only(left: 26.0, right: 26.0),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: AppColors.mainColor, fontSize: 13.0),
              hintText: "Search Juice Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(250, 209, 216, 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 26.0,
          ),
        )
      ],
    );
  }

  Widget _headerMenu() {
    final List<Widget> list = [];

    for (var i = 0; i < menus.length; i++) {
      list.add(_itemMenu(menus[i]));
    }

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: list,
        ),
      ),
    );
  }

  Widget _itemMenu(ItemDataMenu dataMenu) {
    return Container(
      width: 70.0,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38.0,
            height: 38.0,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image(image: NetworkImage(dataMenu.ic)),
          ),
          SizedBox(height: 10.0),
          Text(
            dataMenu.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white,
                fontSize: 11.0,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.4),
          )
        ],
      ),
    );
  }

  // list juice
  Widget _listJuice() {
    return ListView.builder(
      itemCount: products.length,
      padding: EdgeInsets.only(top: 50.0, bottom: 0.0),
      itemBuilder: (BuildContext context, int index) {
        return _itemJuice(products[index], index, context);
      },
    );
  }

  Widget _itemJuice(ItemDataJuice product, int index, context) {
    final borderRadius = index != 0
        ? BorderRadius.circular(0.0)
        : BorderRadius.only(topLeft: Radius.circular(30.0));

    final lastItem = (index == products.length - 1)
        ? Container(
            width: 180.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: HexColor('#fdf3f4'),
            ),
          )
        : Container();

    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 220.0,
            padding: EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  product.description,
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      '${product.price}',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    BntQuantity(bgColor: product.bgColor)
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: [
              Container(
                width: 180.0,
                decoration: BoxDecoration(
                  color: HexColor('#fdf3f4'),
                  borderRadius: borderRadius,
                ),
                height: 170.0,
                padding: EdgeInsets.only(
                  left: 22.0,
                  right: 22.0,
                  top: 20.0,
                  bottom: 6.0,
                ),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('detail', arguments: product);
                  },
                  child: Container(
                    child: Hero(
                      tag: product.uid,
                      createRectTween: (begin, end) {
                        return CustomRectTween(a: begin, b: end);
                      },
                      child: Image(
                        image: NetworkImage(product.ic),
                      ),
                    ),
                  ),
                ),
              ),
              lastItem
            ],
          ),
        ],
      ),
    );
  }
}
