import 'package:firebase_auth/firebase_auth.dart';
import 'package:lavenda/Model/my_user.dart';

class UserController {
  FirebaseAuth auth = FirebaseAuth.instance;

  void registerUser(String email, String password) async {
    myUser user = myUser();
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
