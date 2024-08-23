

/*
import 'package:flutter/material.dart';
import 'package:robot_control/constfile.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(

        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: kPrimaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.menu,
              size: 20,
              color: Colors.black,),


          ),
        ),


    );
  }
}

 */








import 'package:flutter/material.dart';
import 'package:robot_assistance/constfile.dart';
import 'package:robot_assistance/details/analyse.dart';
import 'package:robot_assistance/details/details.dart';
import 'package:robot_assistance/details/seniorinfo.dart';
import 'package:robot_assistance/screens/searchbox.dart';
import 'package:robot_assistance/screens/title.dart';




class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(


        elevation: 0,
        //brightness: Brightness.light,
        backgroundColor: kPrimaryColor,

        actions: <Widget>[
          IconButton(onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuPage()));

          },
            icon: Icon(Icons.menu),

            color: Colors.black,),

        ],



      ),
      body: Body(),

/*
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
        },
        backgroundColor: kPrimaryColor,

        child: Icon(Icons.add_location),
      ),
     */
      /* bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -10),
              blurRadius: 35,
              color: Colors.red.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(onPressed: (){
              //Navigator.push(context, MaterialPageRoute(builder: (context)=> AddProduct()));
            },
                icon: Icon(Icons.add_circle_outline,color: Colors.white)),
            IconButton(onPressed: (){
             // context.read<AuthenticationService>().signOut();
             // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));


            },
                icon: Icon(Icons.login,color: Colors.white)),
            IconButton(onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));


            },
                icon: Icon(Icons.account_circle_outlined,color: Colors.white,)),
          ],
        ),
      ),
      */


    );
  }
}



class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(

      child: Column(

        children: <Widget>[
          SearchBox(size: size),
          Titledk( title: "Get started ",),

          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                  children: <Widget>[


                    Tab(

                      //icon: Icon(Icons.menu),
                      image: "assets/senior.png",
                      title: "senior info",

                      //press: () {

                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail()));
                      //},
                      press: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> senior()));
                      },
                    ),
                    Tab(
                      // icon: Icon(Icons.menu),
                      image: "assets/note.png",
                      title: "rendez-vous",

                      press: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail()));

                      },
                    ),

                    Tab(
                      //icon: Icon(Icons.menu),
                      image: "assets/analyse.png",
                      title: "analyse",

                      press: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> analyse()));


                      },
                    ),
/*
                    Tab(
                      //icon: Icon(Icons.menu),
                      image: "",
                      title: "",

                      press: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailSim()));

                      },
                    ),


 */


                  ]    )),
          Titledk(title: "More informations"),

          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child :Row (
                  children: <Widget>[
                    Information(image: "assets/battery/80.png",press: (){},
                    ),
                    Information(image: "",press: (){},
                    ),
                  ]
              )


          ), ], ),

    );


  }
}





class Information extends StatelessWidget {


  const Information ({
    Key? key, required this.image, required this.press,
    // required this.size
  }) : super(key: key) ;
  //final Size size;
  final String image;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      GestureDetector(

        onTap: press,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            top: 20 / 2,
            bottom: 20 / 2,
          ),
          width: size.width * 0.4,
          height: 165,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image))
          ),
        ),
      );
  }}






class Tab extends StatelessWidget {
  const Tab({
    Key? key,
    required this.image,
    required this.title,
    // required this.icon,

    //  required this.DateSortie,
    required this.press,

  }) : super(key: key);
  // final String   title ;
//  final  icon ;
  final String image, title ;
// final int DateSortie;
  final void Function () press;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Container(

        margin: EdgeInsets.only(
          left: 20,
          top: 20 / 2,
          bottom: 20 * 2.5,

        ),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            Image.asset(image),
            GestureDetector(
              onTap: press,
              child: Container(
                padding: EdgeInsets.all(20),
                //padding: EdgeInsets.all(20 / 2),
                decoration: BoxDecoration(
                  /*
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image)),

                   */


                  color: Colors.white,
                  /*
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),

                   */
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 10,
                      color: kPrimaryLightColor,

                    ),
                  ],

                ),
                child: Row(
                  children: <Widget>[
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme
                              .of(context)
                              .textTheme
                              .button,

                        ),


                      ],

                    ),
                    ),
                    Spacer(),
                    Text(
                      ' ',
                      style: Theme
                          .of(context)
                          .textTheme
                          .button!
                          .copyWith(color: kPrimaryColor),

                    )
                  ],
                ),


              ),
            )
          ],
        ),
      );
  }

}







