import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_app/pages/ProfilePage.dart';
import 'package:flutter_app/pages/SettingsPage.dart';

class SettingsUI extends StatelessWidget {

  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Setting UI",
      home: EditProfilePage(),

    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,

          ),
          onPressed: () {Navigator.push(context,
    MaterialPageRoute(builder: (context)=>SettingsPage()));},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ProfilePage()));},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left:16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        child: ListView(
          children: [
            Text (
              "Edit Profile",
            style: TextStyle(fontSize: 25, fontWeight:  FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Stack(
                  children: [
                  Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 2,
                          blurRadius: 10,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(0,10)
                      )
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/ba/27/d7/ba27d717a3b7632a03a168b27018ce20.jpg"
                        ),
                  ),
              ),
            ),
                    Positioned(
                      bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                    ],
                    ),
            ),
            SizedBox(
              height: 35,

            ),
            buildTextField("Full name", "Binti Afriq", false),
            buildTextField("Email", "binti@gmail.com", false),
            buildTextField("Password", "wertyu", true),
            buildTextField("Location", "Nairobi, Kenya", false),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed:() {},
                    child: Text ("Cancel",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.black)),
        ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 2.2,
                      color: Colors.white),
                    ),
                  ),

          ],
            )
        ],
            ),
            ),
      ),
            );
  }
  Widget buildTextField(
      // ignore: non_constant_identifier_names
      String LabelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,

              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: LabelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        ),


        );
  }
}
