import 'package:flutter/material.dart';

class CreditCardModel{

  final String cardNumber ;
  final String cardHoldername ;
  final String cvvNumber ;
  final String expiredate ;
  final bool isCvvFocused ;

  CreditCardModel(
      {this.cardNumber,
      this.cardHoldername,
      this.cvvNumber,
      this.expiredate,
      this.isCvvFocused});
}