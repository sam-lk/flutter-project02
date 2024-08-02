import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';

//double click and press F2. then change the all place
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  User _user = User(
      "Please wait",
      "<< Loading >>",
      "https://images.squarespace-cdn.com/content/v1/575a6067b654f9b902f452f4/1552683653140-0UUVQSSUEWVC73AWAEQG/300Logo.png",
      "",
      "");

  bool _loaded = false;
  void getUser() async {
    try {
      //---------------
      //Dio kiyana library eka add karanna 'pubspec.yaml' file eke dependencies wala flutter ekata udin.
      //dio: ^4.0.4
      //---------------
      //Permission add karanna one internet walata:
      //1)android/app/src/main/AndroidManifest.xml
      //2)add blow code before "<application" line
      //3)<uses-permission android:name= "android.permission.INTERNET"/>
      //---------------
      //https://61631622c483380017300818.mockapi.io/v1/ShopItem
      var reponse = await Dio()
          .get('https://61631622c483380017300818.mockapi.io/v1/users/1');

      //print(reponse);
      setState(() {
        _user = User.fromJson(reponse.data);
        _loaded = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded) {
      getUser();
    }
    //getUser();

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            //Image container
            Container(
              margin: EdgeInsets.all(50),
              child: Image.network(_user.avatar),
            ),
            //Text
            Text('${_user.firstName} ${_user.lastName}'),
            Text(_user.email),
            //Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
              ),
              onPressed: () {
                //getHttp();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
