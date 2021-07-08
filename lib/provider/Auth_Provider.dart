import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/Auth_Model.dart';
import 'package:ecommerce/screens/MainScreens.dart';
import 'package:ecommerce/screens/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthProvider with ChangeNotifier{

  static FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static CollectionReference _collectionReference = FirebaseFirestore.instance.collection("Users");

  Future<void> signUpNewUser(BuildContext context ,{@required String name , @required String email ,
    @required String password , String image = "" , @required String phone}) async{

    String imageUrl = await _UploadImageUser(image: image);

    if(imageUrl != null){
      try{

        UserCredential respons = await _firebaseAuth.createUserWithEmailAndPassword(
            email: email.toLowerCase().trim(),
            password: password.trim()
        );

        var date = DateTime.now().toString();
        var datePars = DateTime.parse(date);
        var fromattedDate = "${datePars.day}-${datePars.month}-${datePars.year}";

        AuthModel authNewUser = new AuthModel(
          id: respons.user.uid,
          name: name.toLowerCase().trim(),
          email: email.toLowerCase().trim(),
          password: password.trim(),
          phone: phone.trim(),
          imageUrl: imageUrl,
          joinedAt: fromattedDate,
          createdAt: Timestamp.now(),
        );

        await _collectionReference.doc(respons.user.uid).set(authNewUser.toJson)
            .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MainScreens())));

      }catch(e){

        Fluttertoast.showToast(msg: e.toString());
      }
    }else{
      Fluttertoast.showToast(msg: "Please Enter Image");
    }

  }


  Future<void> signIn(BuildContext context , {@required String email , @required String password}) async{

    try{

      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email.toLowerCase().trim(), password: password.trim()
      );

      if(user != null)
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MainScreens()));

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  Future<void> googleSignIn(BuildContext context) async{

    try{

      final googleSignIn = new GoogleSignIn();
      final googleAccount = googleSignIn.signIn();

      if(googleAccount != null){

        final googleAuth = await googleAccount;
        final googleCurrentAuth = await googleAuth.authentication ;

        if(googleCurrentAuth.idToken != null && googleCurrentAuth.accessToken != null){

          final _authResult =  await _firebaseAuth.signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleCurrentAuth.idToken,
            accessToken: googleCurrentAuth.accessToken,
          ));

          var date = DateTime.now().toString();
          var datePars = DateTime.parse(date);
          var fromattedDate = "${datePars.day}-${datePars.month}-${datePars.year}";

          AuthModel _authNewUser = new AuthModel(
              id: _authResult.user.uid,
              name: _authResult.user.displayName.toLowerCase().trim(),
              email: _authResult.user.email.toLowerCase().trim(),
              password: "googleSignIn",
              phone: _authResult.user.phoneNumber != null ? _authResult.user.phoneNumber.toString() : "",
              imageUrl: _authResult.user.photoURL,
              joinedAt: fromattedDate,
              createdAt: Timestamp.now(),
          );

          await _collectionReference.doc(_authResult.user.uid).set(_authNewUser.toJson)
              .then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> MainScreens())));
        }
      }

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());

    }


  }


  Future<String> _UploadImageUser({@required String image}) async{

    try{

      Random random = new Random();
      double randoms = random.nextDouble().roundToDouble();

      Reference _firebaseStorage = FirebaseStorage.instance.ref().child("ImagesUsers").child("${randoms++}.jpg");

      await _firebaseStorage.putFile(File(image));

      return await _firebaseStorage.getDownloadURL();

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  Future<void> LogOut(BuildContext context) async{

    await _firebaseAuth.signOut().then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> LandingPage())));
  }


  Stream fetchInfoUser ()=> _collectionReference.doc(_firebaseAuth.currentUser.uid).snapshots();

}