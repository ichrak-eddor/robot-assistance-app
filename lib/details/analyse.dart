import 'package:flutter/material.dart';
import 'package:robot_assistance/constfile.dart';


class analyse extends StatelessWidget {
  const analyse({Key? key}) : super(key: key);

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
            icon: Icon(Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,),


          ),
        )
    );

  }
}
