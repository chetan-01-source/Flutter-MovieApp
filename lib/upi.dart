import 'package:upi_india/upi_india.dart';
import 'package:flutter/material.dart';
UpiIndia _upiIndia = UpiIndia();

class upia {
  Future<UpiResponse> initiateTransactionphonepay() async {
    return _upiIndia.startTransaction(
      app: UpiApp.phonePe,
      receiverUpiId: "9423031548@ybl",
      receiverName: 'Chetan Marathe',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'payment for your movie',
      amount: 1,
    );
  }

  Future<UpiResponse> initiateTransactiongpay() async {
    return _upiIndia.startTransaction(
      app: UpiApp.googlePay,
      receiverUpiId: "9423031548@ybl",
      receiverName: 'Chetan Marathe',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'payment for your movie',
      amount: 1,
    );
  }

  Future<UpiResponse> initiateTransactionpaytmpay() async {
    return _upiIndia.startTransaction(
      app: UpiApp.paytm,
      receiverUpiId: "9423031548@ybl",
      receiverName: 'Chetan Marathe',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'payment for your movie',
      amount: 1,
    );
  }
}