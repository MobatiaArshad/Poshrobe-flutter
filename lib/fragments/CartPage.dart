
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poshrob/Resources/AppColors.dart';

class CartPage extends StatefulWidget{
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
              Expanded(child: _setCartData())
          ],
        ),
      ),
    );
  }
}

Widget _setCartData() {
  return Container(
    child: SizedBox(
      height: 700,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13.0,right: 13.0,top: 40.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text('Featured Products',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16)),
                ),
              ],
            ),
          ),

          Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0,right: 13.0),
                child: ListView.separated(
                  // make sure to add the following lines:
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: 20,
                    separatorBuilder: (context, index) =>Divider(height: 1, color: Colors.grey),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: _cartListItem(index),
                      );
                    }
                  // the rest of your list view code
                ),
              ) // ListView
          )

        ],
      ),
    ),

  );
}

Widget _cartListItem(int index){
  return Container(
      child: Container(
        height: 120,
        child: Row(
          children: [
            Image(
              image: AssetImage('images/feature_img.png'),
              width: 70,
              height: 100,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 35),
                  child: Text('Embroidered Pista Green Sherwani',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8.0),
                  child: Text('Rs 2,999',style: TextStyle(
                      color: Color(AppColors.commonOrange),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Icon(CupertinoIcons.delete_simple),
            )

          ],
        ),
      ),
  );
}
