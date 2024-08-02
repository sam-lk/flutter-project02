import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project02/views/login.dart';
import '../models/user.dart';

//double click and press F2. then change the all place
class UserProfile extends StatefulWidget {
  final String username;
  final String email;
  final String userImage;
  const UserProfile(
      {Key? key,
      required this.username,
      required this.email,
      required this.userImage})
      : super(key: key);

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
  // void getUser() async {
  //   try {
  //     //---------------
  //     //week-6 ekedi Dio eka downgrade kara 3.0.10 walata. firebase version issue ekak nisa.
  //     //Java Home path eka add kara cmd eken SHA-1 ID eka ganna. (https://mkyong.com/java/how-to-set-java_home-on-windows-10/)
  //     //VS-Code -> Help -> Show All Commands -> search/select 'Preferences: Open Settings (UI)' -> search/select 'Flutter Run Additional Args' -> Add item -> '--no-sound-null-safety' and click OK
  //     //firebase console -> left panel: Authentication -> Sign-in Methods -> Click 'Add new providor' -> kemathi ekak thorala enable karanna thiyenne. ()
  //     //login view ekak create kara.
  //     //---------------

  //     //week-5 and week-6 video follow karanna firebase and google auth walata
  //     //https://developers.google.com/android/guides/client-auth
  //     //https://firebase.google.com/docs/analytics/get-started?platform=android ---- (Analytics SDK)
  //     //support mail ekata kemathi mail ekak.
  //     //dependency add karanna.
  //     //json file eka project eke app folder ekta danna.
  //     //---------------

  //     //Dio kiyana library eka add karanna 'pubspec.yaml' file eke dependencies wala flutter ekata udin.
  //     //dio: ^4.0.4
  //     //---------------

  //     //Permission add karanna one internet walata:
  //     //1)android/app/src/main/AndroidManifest.xml
  //     //2)add blow code before "<application" line
  //     //3)<uses-permission android:name= "android.permission.INTERNET"/>
  //     //---------------
  //     //https://61631622c483380017300818.mockapi.io/v1/ShopItem
  //     var reponse = await Dio()
  //         .get('https://61631622c483380017300818.mockapi.io/v1/users/1');

  //     //print(reponse);
  //     setState(() {
  //       _user = User.fromJson(reponse.data);
  //       _loaded = true;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (!_loaded) {
    //   getUser();
    // }
    //getUser();

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            //Image container
            Container(
              margin: EdgeInsets.all(50),
              child: Image.network(widget.userImage),
            ),
            //Text
            Text(widget.username),
            Text(widget.email),
            //Button
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.red,
            //     onPrimary: Colors.white,
            //   ),
            //   onPressed: () {
            //     //getHttp();
            //   },
            //   child: Text('Logout'),
            // ),
          ],
        ),
      ),
    );
  }
}
