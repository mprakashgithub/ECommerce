import 'package:flutter/material.dart';


class TopCategoryGrid extends StatelessWidget {
  final topCategoryList = [
    {'title': 'Food', 'image': 'assets/top_category/1.jpg'},
    {'title': 'Groceries and Vegies', 'image': 'assets/top_category/2.jpg'},
    {'title': 'Pharmacy', 'image':  'assets/top_category/top_category_8.jpg'},
    {'title': 'Fancy', 'image': 'assets/top_category/1.jpg'},
    {'title': 'Home Appliances', 'image': 'assets/top_category/2.jpg'},
    {'title': 'Dairy & Bakery', 'image': 'assets/top_category/1.jpg'},
    {'title': 'Paan Shop', 'image': 'assets/top_category/top_category_7.jpg'},
    {'title': 'Party & Events', 'image': 'assets/top_category/top_category_8.jpg'},
    {'title': 'Covid Elements', 'image': 'assets/top_category/top_category_9.jpg'
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    InkWell getStructuredGridCell(bestOffer) {
      final item = bestOffer;
      return InkWell(
        child: Image(
          image: AssetImage(item['image']),
          fit: BoxFit.fill,
        ),
        onTap: () {
          print(item['title']);
          // addCategoryTitle(item['title']);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => CategoryMain(categoryName:item['title'] )),
          // );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'TOP CATEGORIES',
            style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontSize: 15.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0.0),
              alignment: Alignment.center,
              width: width - 20.0,
              child: GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 2,
                childAspectRatio: ((width) / 500),
                children: List.generate(topCategoryList.length, (index) {
                  return getStructuredGridCell(topCategoryList[index]);
                }),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
