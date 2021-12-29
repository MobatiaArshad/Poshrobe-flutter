import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poshrob/Resources/AppColors.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var profileSubArray = [
    'Your Orders',
    'Help',
    'Contact Us',
    'About Us',
  ];

  var imageArray = [
    "images/orders_ico.png",
    "images/help_ico.png",
    "images/contact_ico.png",
    "images/about_us.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(AppColors.commonOrange),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: _cardView(),)
              ],
            ),
          )
        ],
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 150.0),
      //         child: _topPart(),
      //       ),
      //
      //       Padding(
      //         padding: const EdgeInsets.all(15.0),
      //         child: _subData(),
      //       )
      //
      //     ],
      //   ),
      // ),
    );
  }

  Widget _cardView(){
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 8,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: _topPart(),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: _subData(),
          )

        ],
      ),
    );
  }

  Widget _topPart() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              // onTap: () => onProfileClick(context), // choose image on click of profile
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/sample_pro_pic.jpeg"),
                        fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              child: Text('Logout',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _subData() {
    return Container(
      child: Flexible(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: profileSubArray.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: Colors.grey),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: _listItem(index),
                );
              })),
    );
  }

  Widget _listItem(int index) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      height: 50,
      child: Row(
        children: [

          Image.asset(imageArray[index],
          width: 20,
          height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(profileSubArray[index],
              style: TextStyle(
                  color: Color(AppColors.commonOrange),
                  fontWeight: FontWeight.bold
              ),),
          ),
        ],
      ),
    );
  }
}
