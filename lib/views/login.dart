import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project02/views/users.dart';

//Read more: https://pub.dev/packages/google_sign_in

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

// Future<void> _handleSignIn() async {
//   try {
//     await _googleSignIn.signIn();
//   } catch (error) {
//     print(error);
//   }
// }

class _LoginViewState extends State<LoginView> {
  GoogleSignInAccount?
      _currentUser; // '?' kiyanna _currentUser ge values thiyennath puluwan nathi wennath pulwan kyana eka.
  String _contactText = '';
  bool isLoggedIn = false;

  //Overide karanawa login view eke initialize state method eka. (intiState())
  @override
  void initState() {
    super.initState();
    //google login eke current state eka diha balan innawa. logout login unoth automatically state eka change kara gannawa..
    //Event_Listner (.onCurrentUserChanged)
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      //app eke state eka update karanawa.
      setState(() {
        _currentUser = account;
        print(_getUname());
      });
      if (_currentUser != null) {
        //isLoggedIn = true;
        //_handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  void dispose() {
    _handleSignOut();
    super.dispose();
  }

  //funtion ekak
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        isLoggedIn = true;
        username1 = _googleSignIn.currentUser.displayName;
        email = _googleSignIn.currentUser.email;
        userimage = _googleSignIn.currentUser.photoUrl;
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      isLoggedIn = false;
      username1 = "No user..";
      email = "";
      userimage = "";
    } catch (error) {
      print(error);
    }
  }

  Widget _getUserWidget() {
    return _googleSignIn.currentUser != null
        ? Text('User: ' + _googleSignIn.currentUser.displayName)
        : Text("No google user");
  }

  String username1 = "";
  String email = "";
  String userimage = "";

  String? _getUname() {
    if (_currentUser != null) {
      return _currentUser?.displayName;
    } else {
      isLoggedIn = false;

      return "No user";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //widget list eka hadanna kalin user logged welada check karanawa
          children: isLoggedIn
              ? [
                  UserProfile(
                      username: username1, email: email, userImage: userimage),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                    ),
                    onPressed: _handleSignOut,
                    child: Text('Logout'),
                  ),
                ]
              : [
                  Text("Please login...!!!"),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.white,
                    ),
                    onPressed: _handleSignIn,
                    child: Text('Login'),
                  ),
                ],
        ),
      ),
    );
  }
}
