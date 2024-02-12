import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Profile Page"),
      ),
      body:  Column(
        children: [
          SizedBox(height: 25,),
        Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(75),color: Colors.black,image: DecorationImage(image: AssetImage("Assets/Photos/Profile.png"))),
          
          ),
        ),
        ],
      ),
    );
  }
}
