import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:smartcommerce/controllers/auth_controller.dart';

import 'default_helper.dart';

class SocialHelper {
  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  static String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // static Future<bool> signWithApple() async {
  //   bool ret = false;
  //   try {
  //     // To prevent replay attacks with the credential returned from Apple, we
  //     // include a nonce in the credential request. When signing in in with
  //     // Firebase, the nonce in the id token returned by Apple, is expected to
  //     // match the sha256 hash of `rawNonce`.
  //     final rawNonce = generateNonce();
  //     final nonce = sha256ofString(rawNonce);
  //
  //     // Request credential for the currently signed in Apple account.
  //     final appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //       nonce: nonce,
  //     );
  //
  //     if (appleCredential.isBlank != true) {
  //       // Create an `OAuthCredential` from the credential returned by Apple.
  //       final oauthCredential = OAuthProvider("apple.com").credential(
  //         idToken: appleCredential.identityToken,
  //         rawNonce: rawNonce,
  //       );
  //
  //       if (oauthCredential != null) {
  //         UserCredential user;
  //         try {
  //           user = await FirebaseAuth.instance
  //               .signInWithCredential(oauthCredential);
  //         } on FirebaseAuthException catch (e) {
  //           if (e.code == 'account-exists-with-different-credential') {
  //             String email = e.email;
  //             AuthCredential pendingCredential = e.credential;
  //
  //             List<String> userSignInMethods =
  //                 await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  //
  //             if (userSignInMethods.contains('google.com')) {
  //               GoogleAuthCredential google =
  //                   await SocialHelper.signWithGoogleFromFacebook(email);
  //               if (google != null) {
  //                 user =
  //                     await FirebaseAuth.instance.signInWithCredential(google);
  //                 if (user.user.email == email) {
  //                   await user.user.linkWithCredential(pendingCredential);
  //                 }
  //               }
  //             }
  //           }
  //         }
  //         if (user == null) {
  //           Helper.showSnackBar("appleSignInError", "tryAgainLater".tr);
  //         } else {
  //           UserHelper.loginToKommunicate();
  //           Get.put(UserController()).getUserContracts();
  //           ret = true;
  //         }
  //       } else {
  //         Helper.showSnackBar("appleSignInError", "tryAgainLater".tr);
  //       }
  //     }
  //   } catch (error) {
  //     print(error);
  //     return false;
  //   }
  //   return ret;
  // }

  static Future<bool> signWithFacebook() async {
    bool ret = false;
    try {
      final facebookLogin = FacebookLogin();
      await facebookLogin.logOut();

      facebookLogin.loginBehavior = FacebookLoginBehavior.nativeWithFallback;
      FacebookLoginResult result = await facebookLogin.logIn(['email']);
      print(result.status);
      print(result.errorMessage);
      if (result.status == FacebookLoginStatus.loggedIn) {
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${result.accessToken.token}'));
        final profile = jsonDecode(graphResponse.body);
        print(profile);
        if (profile["email"] != null && profile["name"] != null) {
          bool success = await Get.put(AuthController()).loginSocialData(
              profile["name"].toString(), "", profile["email"].toString(), "");

          if (success == null) {
            Helper.showSnackBar("facebookSignInError".tr, "tryAgainLater".tr);
          } else {
            ret = true;
          }
        } else {
          Helper.showSnackBar("facebookSignInError".tr, "tryAgainLater".tr);
        }
      }
    } catch (error) {
      print(error);
      return false;
    }
    return ret;
  }

  static signWithGoogle() async {
    bool ret = false;
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      await _googleSignIn.signOut();
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("no google user login");
        return ret;
      }
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth == null) {
        print("no google authentication login");
        Helper.showSnackBar("googleSignInError".tr, "tryAgainLater".tr);
        return ret;
      } else {
        bool data = await Get.put(AuthController())
            .loginSocialData(googleUser.displayName, "", googleUser.email, "");

        if (data != true) {
          Helper.showSnackBar("googleSignInError".tr, "tryAgainLater".tr);
        } else {
          ret = true;
        }
      }
      return ret;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
