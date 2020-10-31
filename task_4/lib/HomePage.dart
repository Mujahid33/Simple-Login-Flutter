import 'package:flutter/material.dart';
import 'LoginPage.dart';

class HomePage extends StatelessWidget {
  String username, password;
  HomePage({this.username, this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Text('Username: $username'),
            SizedBox(height: 10,),
            Text('Password: $password'),
            SizedBox(height: 10,),
            Container(
              width: 100,
              child: MaterialButton(
                color: Colors.blue,
                child: Text('Signout', style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
