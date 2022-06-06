import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/services/firestore_user_service.dart';
import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:ecommerce_app/view/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final name = TextEditingController().obs;
  final registerEmail = TextEditingController().obs;
  final registerPassword = TextEditingController().obs;
  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  RxBool isObscure = false.obs;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    ///////////// to record account in firebase
    // to get Credential of user signin
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _firebaseAuth.signInWithCredential(credential).then((value) {
      saveUsedInFireStore(value);
      Get.offAll(() => HomeView());
    });
    // UserCredential userCredential =
    //     await _firebaseAuth.signInWithCredential(credential);
    // print(userCredential.user);
  }

  void signInWithFacebook() async {
    FacebookLoginResult result = await _facebookLogin.logIn(["email"]);
    final token = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.credential(token);
      await _firebaseAuth.signInWithCredential(credential).then((value) {
        saveUsedInFireStore(value);
        Get.offAll(() => HomeView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
              email: email.value.text, password: password.value.text)
          .whenComplete(() => isLoading.value = false);
      Get.offAll(() => HomeView());
      email.value.clear();
      password.value.clear();
      debugPrint("successssss");
    } catch (error) {
      Get.snackbar("Error login account", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    isLoading.value = true;
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: registerEmail.value.text,
              password: registerPassword.value.text)
          .then((value) async {
        saveUsedInFireStore(value);
      }).whenComplete(() => isLoading.value = false);
      registerEmail.value.clear();
      registerPassword.value.clear();
      name.value.clear();
      Get.snackbar("Account successfully created", "",
          snackPosition: SnackPosition.BOTTOM);
      Get.to(() => LoginView());
    } catch (error) {
      debugPrint("error $error");
      Get.snackbar("Error in creating account", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void visablePassword() {
    isObscure.value = !isObscure.value;
  }

  void saveUsedInFireStore(UserCredential userCredential) async {
    UserModel userModel = UserModel(
      userId: userCredential.user!.uid.toString(),
      name: name == null
          ? userCredential.user!.displayName
          : name.value.text.toString(),
      email: userCredential.user!.email.toString(),
      pic: '',
    );
    await FireStoreUserService().addUserFireStore(userModel);
  }
}
