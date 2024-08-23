import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:robot_assistance/authentication/loginpage.dart';
import 'package:robot_assistance/authentication/signuppage.dart';
import 'package:robot_assistance/constfile.dart';
import 'package:robot_assistance/welcome/background.dart';




class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Welcome",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.07),
            Image.asset("assets/rotech.png",
              height: size.height * 0.4,
            ),
            RoundedButton(text: "LOGIN",color: kPrimaryColor ,),
            RoundedButton1(text: "SIGN UP",color: kPrimaryLightColor, )


          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text ;
  //final Function press ;
  final Color color, textColor;
  const RoundedButton ({Key? key,
    required this.text,
    //  required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(29),

          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: (){ Navigator.push(context, MaterialPageRoute(builder:(context){return LoginPage();}));},

            child:Text(text,
              style: TextStyle(color: textColor),),
          )
      ),
    );

  }
}

class RoundedButton1 extends StatelessWidget {
  final String text ;
  // final Function press ;
  final Color color, textColor;
  const RoundedButton1 ({Key? key,
    required this.text,
    //  required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(29),

          child: FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            color: color,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
            },
            child:Text(text,
              style: TextStyle(color: textColor),),
          )
      ),
    );

  }
}





















/*
class Background extends StatelessWidget {
  final Widget child ;
  const Background({Key? key, required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/main_top.png",
              width: size.width * 0.3,
            ),

          ),
          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(" assets/main_bottom.png ",
                width: size.width * 0.2,)
          ),
          child,


        ],
      ),
    );
  }
}


 */