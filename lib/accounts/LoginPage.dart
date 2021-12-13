
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poshrob/Resources/AppColors.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _topBackground(),
              _bottomBackground()
            ],
          ),
          _loginComponents()
        ],
      ),
    );
  }

  Widget _loginComponents() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0,left: 20),
            child: Image(image: AssetImage('images/app_logo.png')),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 35),
            child: Text('Login',style: TextStyle(color: Colors.black,fontSize: 32,fontWeight: FontWeight.bold),),
          ),

          Center(

            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 35, right: 35, top: 16),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff222222)),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff8E8E8E), width: .5)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff8E8E8E), width: .5)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff8E8E8E), width: .5)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff8E8E8E), width: .5)),
                        labelText: "Enter Email address",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            color: Color(0xff222222)),
                        hintStyle: TextStyle(
                            fontSize: 20,
                            color: Color(0xff222222))),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.always,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 35, right: 35, top: 18),
                  child: TextFormField(
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff222222)),
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff8E8E8E), width: .5)),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff8E8E8E), width: .5)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff8E8E8E), width: .5)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff8E8E8E), width: .5)),
                          // hintText: "Password",
                          labelText: "Enter your password",
                          labelStyle: TextStyle(
                              fontSize: 20,
                              color: Color(0xff222222)),
                          hintStyle: TextStyle(
                              fontSize: 20,
                              color: Color(0xff222222))),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      obscuringCharacter: '*'
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }


  Widget _topBackground(){
    return Container(
      constraints: BoxConstraints.expand(
        width: 700,
        height: 180,
        // height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Color(AppColors.commonOrange),
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(-0.2),
    );
  }

  Widget _bottomBackground(){
    return Container(
      constraints: BoxConstraints.expand(
        width: 700,
        height: 180,
        // height: Theme.of(context).textTheme.headline4!.fontSize! * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Color(AppColors.commonOrange),
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(0.5),
    );
  }
}