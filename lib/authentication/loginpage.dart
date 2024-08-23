

import 'package:flutter/material.dart';
import 'package:robot_assistance/authentication/signuppage.dart';
import 'package:robot_assistance/constfile.dart';

import '../screens/homepage.dart';

/*
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

 */






class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //final _key = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()) );
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
      body : isLoading?  Center(
        child: Container(
          height: size.height / 20,
          width: size.height / 20,
          child: CircularProgressIndicator(),
        ),
      ) : Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Login",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
                    Text("Login to your account",
                      style: TextStyle(
                          fontSize: 15,
                          color:Colors.grey[700]),)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      inputFile( child: TextField(
                        decoration:  InputDecoration(
                          icon: Icon(Icons.person,
                            color: kPrimaryColor,
                          ),
                          hintText: "Your Email",
                          border: InputBorder.none,

                        ),
                      ),),

                      inputFil(child: TextField(
                        decoration:  InputDecoration(
                            icon: Icon(Icons.lock,
                              color: kPrimaryColor,
                            ),
                            hintText: "Password",
                            suffixIcon: Icon(
                                Icons.visibility,
                                color: kPrimaryColor)

                        ),
                        obscureText: true ,
                      ),),
                      //inputFile(label: "Email"),
                      //inputFil(label: "Password", obscureText: true)

                    ],
                  ),
                ),
                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration:
                    BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(50),



                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));


                        // context.read<AuthenticationService>().signIn(
                        //  email: emailController.text.trim(),
                        // password: passwordController.text.trim(),
                        //);

                      },
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

                      color: kPrimaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),

                      ),
                      child: Text(
                        "Login", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,

                      ),
                      ),

                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      // padding: EdgeInsets.all(0.0),
                      child: Text("Forgot password?",
                          style: TextStyle(fontWeight: FontWeight.w300)),
                      onPressed: () {

//                Navigator.pushReplacementNamed(context, '/reset-password');
                      },
                    ),
                    FlatButton(
                      //padding: EdgeInsets.only(left: 0.0),
                      child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w600)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                      },
                    ),
                  ],
                )







              ],
            ))
          ],
        ),
      ),
    );
  }
}



final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class inputFile extends StatelessWidget {
  final Widget child;
  const inputFile ({Key? key,
    required this.child

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: LightColor,
          borderRadius: BorderRadius.circular(29)
      ),
      child: child,
    );
  }
}


class inputFil extends StatelessWidget {
  final Widget child;
  const inputFil ({Key? key,
    required this.child

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: LightColor,
          borderRadius: BorderRadius.circular(29)
      ),
      child: child,
    );
  }
}


/*
Widget inputFile({label, obscureText = false})

{

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),
      SizedBox(
        height: 5,
      ),
      TextField(

        controller: emailController,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
            )
        ),
      ),
      SizedBox(height: 10,)
    ],
  );
}




Widget inputFil({label, obscureText = false})
{
  final _formKey = GlobalKey<FormState>();
  //final GlobalKey<FormState> _Key = new GlobalKey<FormState>();
  return Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    // crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      Text(
        label,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:Colors.black87
        ),

      ),



      SizedBox(
        height: 5,
      ),

      TextField(
        controller: passwordController,
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0,
                horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blueGrey
              ),

            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
            )
        ),
        /*
          validator: (value){
            if (value.isEmpty) {
              return 'verifier votre emeil';
            }
          },

           */
      ),



      SizedBox(height: 10,)
    ],

  );
}

 */



