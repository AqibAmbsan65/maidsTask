import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:zohatech/Const/Utiles/Utiles.dart';
import '../Const/Strings/App_Strings.dart';
import 'Auth/AuthController.dart';

class SocialLoginService {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthorizationCredentialAppleID? credential;
  UserCredential? _userCredential;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? _user;

  Future<GoogleSignInAccount?> handleGoogleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      return googleSignInAccount;
    } else {
      return null;
    }
  }

  googleSignout() async => await _googleSignIn.signOut();

  // AuthorizationCredentialAppleID? appleSignIn() {
  //   credential = SignInWithApple.getAppleIDCredential(
  //     scopes: [
  //       AppleIDAuthorizationScopes.email,
  //       AppleIDAuthorizationScopes.fullName,
  //     ],
  //   ) as AuthorizationCredentialAppleID?;
  //   if (credential != null) {
  //     return credential;
  //   } else {
  //     return null;
  //   }
  // }

  Future<AuthorizationCredentialAppleID?> appleSignIn() async {
    try {
      credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential != null) {
        return credential;
      } else {
        return null;
      }
    } catch (_) {}
    return null;
  }

  ///////////////////////// Phone Sign In //////////////////////////////////



  Future<void> signInWithPhone(
      {required BuildContext context,
        required String phoneNumber,
        VoidCallback? setProgressBar,
        VoidCallback? cancelProgressBar}) async {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: 'Please wait...', dismissOnTap: true);
    try {
      print("abcd");
      FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) async {
            print("verification completed");
          },
          verificationFailed: (FirebaseAuthException authException) {
            if (authException.code == AppStrings.INVALID_PHONE_NUMBER) {
              utiles.ToastMessage((AppStrings.INVALID_PHONE_NUMBER_MESSAGE));
              EasyLoading.dismiss();


                  } else {

              utiles.ToastMessage((authException.message.toString()));

            }
            //print(authException.message);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            //log("Verification Id:${verificationId}");
            print("sdadasdassas"+forceResendingToken.toString());

            // Get.offAllNamed(Named_Routes.User_verification_Screen,
            //   arguments: [verificationId,forceResendingToken,phoneNumber]
            // );

            AuthController.i.verificationId.value = verificationId;

            // Get.offAllNamed(Named_route.OTP_Screen);

            EasyLoading.dismiss();


          },
          codeAutoRetrievalTimeout: (String verificationId) {
            log("Timeout Verification id:${verificationId.toString()}");
            EasyLoading.dismiss();

          });
    } catch (error) {
      log("error");
      utiles.ToastMessage((error.toString()));
      EasyLoading.dismiss();

    }
  }


  Future<void> verifyPhoneCode(
      {required BuildContext context,
        String? type,
        String? phoneNumnber,
        required String verificationId,
        required String verificationCode}) async {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: 'Please wait...', dismissOnTap: true);
    try {
      print("Verify Phone Code Starts$verificationId   $verificationCode");
      AuthCredential _credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: verificationCode);
      _userCredential = await _firebaseAuth.signInWithCredential(_credential);
      _user = _userCredential?.user;
      print("aagy peechy$_user");
      if (_user != null) {
        await _firebaseAuth.signOut();
        // // API Call Here

        // String? r =  await FirebaseMessagingService().getToken();
        //
        // AuthController.i.SoicalLogin(
        //   socialToken: verificationId,
        //   socialType: "phone",
        //   devicetoken: r,
        //   phone: phoneNumnber,
        //   devicetype: Platform.isAndroid ? AppStrings.ANDROID : AppStrings.IOS,
        // );
      }
    } catch (error) {
      print(error.toString());
      utiles.ToastMessage("Incorrect OTP");
      EasyLoading.dismiss();

    }
  }


  Future<void> resendPhoneCode(
      {required BuildContext context,
        required String phoneNumber,
        required ValueChanged<String?> getVerificationId,
        }) async {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: 'Please wait...', dismissOnTap: true);
    try {
      _firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: const Duration(seconds: 60),
          verificationCompleted: (AuthCredential authCredential) async {},
          verificationFailed: (FirebaseAuthException authException) {
            utiles.ToastMessage((authException.message.toString()));

                //print(authException.message);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            getVerificationId(verificationId);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            log(verificationId.toString());
          });
    } catch (error) {
      utiles.ToastMessage((error.toString()));
      EasyLoading.dismiss();

    }
  }


}