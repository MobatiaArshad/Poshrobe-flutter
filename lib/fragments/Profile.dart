import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poshrob/Resources/AppColors.dart';
import 'package:poshrob/accounts/LoginPage.dart';

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
                Center(child: _cardView(),),
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
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child:  Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  primary: Color(AppColors.commonOrange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 3.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
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
          mainAxisAlignment: MainAxisAlignment.start,
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

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Jhon Doe',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
            )
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
