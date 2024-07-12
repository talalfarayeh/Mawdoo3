import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wodoo33/modules/home/binding/home_binding.dart';
import 'package:wodoo33/modules/home/view/home_view.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxString googlwUserName = ''.obs,
      googleUserEmail = ''.obs,
      googleUserImg = ''.obs,
      googleUserId = ''.obs;

  Future<void> handleGoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      print("h1");
      if (googleUser != null) {
        print("h2");
        if (FirebaseAuth.instance.currentUser != null) {
          handleGoogleSignOut();
        }
        print("h3");
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;
        print("h4");

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        print("h5");

        await auth.signInWithCredential(credential);
        print("h6");
        User? firebaseUser = FirebaseAuth.instance.currentUser;
        if (firebaseUser != null) {
          googleUserEmail.value = firebaseUser.email!;
          googleUserId.value = firebaseUser.uid;
          googleUserImg.value =
              firebaseUser.photoURL ?? 'no profile picture'.tr;
        }
        Get.offAll(() => const HomeView(), binding: HomeBinding());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> handleGoogleSignOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    googleUserEmail.value = '';
    googleUserId.value = '';
    googleUserImg.value = '';
  }
}
