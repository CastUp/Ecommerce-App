import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Constants.dart';
import 'package:flutter/material.dart';

class AuthModel{

  final String id ;
  final String name ;
  final String email ;
  final String password ;
  final String phone ;
  final String imageUrl ;
  final String joinedAt ;
  final Timestamp createdAt ;

  AuthModel({this.id, this.name, this.email, this.password,this.phone,this.imageUrl,this.joinedAt,this.createdAt});

  factory AuthModel.fromJson(Map<String , dynamic> newUser){

    if(newUser != null)
       return AuthModel(
         id       : Constants.ID,
         name     : Constants.NAME,
         email    : Constants.EMAIL,
         password : Constants.PASSWORD,
         phone    : Constants.PHONE,
         imageUrl : Constants.IMAGE,
         joinedAt : Constants.JOINEDAT,
         createdAt: Constants.CREATEDAT,
       );
  }

  Map<String,dynamic> get toJson => {

    Constants.ID       : this.id,
    Constants.NAME     : this.name,
    Constants.EMAIL    : this.email,
    Constants.PASSWORD : this.password,
    Constants.PHONE    : this.phone,
    Constants.IMAGE    : this.imageUrl,
    Constants.JOINEDAT : this.joinedAt,
    Constants.CREATEDAT: this.createdAt,
  };
}