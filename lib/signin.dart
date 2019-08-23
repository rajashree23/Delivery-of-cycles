import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_maps_webservice/places.dart';

import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  name = user.displayName;
  email = user.email;
  imageUrl = user
      .photoUrl; // Only taking the first part of the name, i.e., First Nameif (name.contains(" ")) {   name = name.substring(0, name.indexOf(" "));}

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  // print(_auth);
  // print("HEEEEEEEEEEEEEEEEEEEEEEELOOOOOOOOOOOOOOOOOOO") ;

  // print(id);
  return currentUser.getIdToken();
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}

// hackathon1-711a3

// AIzaSyAAsdT4ypXdy_0tOrE5NMl-pess_Eo07D0
