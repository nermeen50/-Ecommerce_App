import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    ///////////// to record account in firebase
    print("jjjjjjjjjjjjj $googleUser");
    // to get Credential of user signin
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _firebaseAuth.signInWithCredential(credential);
    // UserCredential userCredential =
    //     await _firebaseAuth.signInWithCredential(credential);
    // print(userCredential.user);
  }

  void signInWithFacebook() async {
    FacebookLoginResult result = await _facebookLogin.logIn(["email"]);
    final token = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(token);
      await _firebaseAuth.signInWithCredential(credential);
    }
  }
}
