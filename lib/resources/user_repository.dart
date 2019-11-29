import 'firebase.dart';
import '../models/models.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    return;
    //return await _firebaseAuth.signOut();
  }

  bool isSignedIn() {
    return _firebaseAuth.currentUser != null;
  }

  //TODO: Replace this metod to one which returns an User object
  User getUser() {
    return _firebaseAuth.currentUser;
  }
}
