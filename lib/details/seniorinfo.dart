import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:robot_assistance/constfile.dart';

import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(senior());}

class senior extends StatefulWidget {
  const senior({Key? key}) : super(key: key);

  @override
  _seniorState createState() => _seniorState();
}

class _seniorState extends State<senior> {
  //  File _pickedImage;

  TextEditingController _first_name= new TextEditingController();
  TextEditingController  _family_name = new TextEditingController();
  TextEditingController _Age = new TextEditingController();
  TextEditingController _relative_name = new TextEditingController();
  TextEditingController _relative_number= new TextEditingController();

  //TextEditingController _ = new TextEditingController();

  File? file;

  @override


  Widget build(BuildContext context) {


    bool isLoading = false;
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
            icon: Icon(Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,),


          ),

          title: Text(' Senior information ',
            style: TextStyle(
                color: Colors.white),),
        ),
        body: isLoading ?  Center(
          child: Container(
            height: size.height / 20,
            width: size.height / 20,
            child: CircularProgressIndicator(),
          ),
        )
            : SingleChildScrollView(




          child: Container(

            padding: EdgeInsets.all(40),

            child: Column(



              children: <Widget> [
                SizedBox(height: 10,),
                Stack(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: LightColor,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: kPrimaryLightColor,

                          backgroundImage: file ==null
                              ?null
                              :FileImage(file!),







                          /*
                      child: ClipOval(
                        child: SizedBox(
                         width: 180,
                         height: 180,
                      ),

                         */
                        ),



                      ),

                    ),
                    Positioned(
                      top: 80,
                      left: 170,

                      child: RawMaterialButton(
                        elevation: 5,
                        fillColor: LightColor,
                        child: Icon(Icons.add_a_photo),
                        padding: EdgeInsets.all(7.0),
                        shape: CircleBorder(),
                        onPressed: (){
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: Text( 'choose option',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87

                                      ),
                                    ),
                                    content: SingleChildScrollView (
                                        child: ListBody(children: [
                                          InkWell(
                                            onTap: selectFile,

                                            splashColor: Colors.black87 ,
                                            child:  Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(Icons.camera_alt, color: Colors.black87,),
                                              ),
                                              Text('Camera',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black87
                                                ),)
                                            ],),),

                                          InkWell(
                                            onTap: (){},

                                            splashColor: Colors.black87 ,
                                            child:  Row(children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Icon(Icons.delete, color: Colors.black87,),
                                              ),
                                              Text('Delete',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black87
                                                ),)
                                            ],),)

                                        ],)

                                    ));
                              });
                        } ,


                      ),


                    ),
                    /*
                  Padding(padding: EdgeInsets.only(top: 90,left: 200),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt, color: kPrimaryColor,),

                    onPressed: selectFile,
                  ),)
                  */

                  ],

                ),
                Container(),


                TextField(
                  controller: _first_name,
                  decoration: InputDecoration(
                      hintText: "first name"
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                        color: kPrimaryLightColor
                    ),
                  ),

                ),
                TextField(
                  controller: _family_name,
                  decoration: InputDecoration(
                      hintText: "family name"
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                        color: kPrimaryLightColor
                    ),
                  ),

                ),
                TextField(
                  controller: _Age,
                  decoration: InputDecoration(
                      hintText: "Age"
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                        color: kPrimaryLightColor
                    ),
                  ),

                ),
                TextField(
                  controller: _relative_name,
                  decoration: InputDecoration(
                      hintText: "relative name"
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                        color: kPrimaryLightColor
                    ),
                  ),

                ),
                TextField(
                  controller: _relative_number,
                  decoration: InputDecoration(
                      hintText: "relative number "
                  ),
                ),
                SizedBox(
                  height: 10,
                  child: const DecoratedBox(
                    decoration: const BoxDecoration(
                        color: kPrimaryLightColor
                    ),
                  ),

                ),

                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      padding: EdgeInsets.only(top: 3, left: 3),
                      decoration:
                      BoxDecoration(
                        //color: kPrimaryLightColor,
                        //borderRadius: BorderRadius.circular(50),
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () async{
                          /*
                     FirebaseFirestore.instance.collection("senior info").add({
                        "first_name": _first_name.text,
                        "family_name": _family_name.text,
                        "Age": _Age.text,
                        "relative_name": _relative_name.text,
                        "relative_number": _relative_number.text,
                      });

                       */




/*


                          Firestore.instance.collection("accounts")
                             .add({
                            "first_name": _first_name.text,
                            "family_name": _family_name.text,
                            "Age": _Age.text,
                            "relative_name": _relative_name.text,
                            "relative_number": _relative_number.text,
                          });

 */



                          //  "": _.text,


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
                          "Save ", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,

                        ),
                        ),

                      )
                  ),
                ),







              ],
            ),
          ),
        )




    );



  }

  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles(allowMultiple: false );
    if (result== null) return;
    final path = result.files.single.path!;
    setState(()=> file = File(path));

  }

}




/*
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container();
  }
}


 */