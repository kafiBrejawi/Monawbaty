import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/end_points.dart';
import 'package:http/http.dart' as http;

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  String otpController = "";

  Future<void> verifyOtp({required String phoneNumber}) async {
    try {
      var url = Uri.parse(
          ConstantsService.baseUrl + ConstantsService.verifyOtpEndpoint);

      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            "phoneNumber": "963$phoneNumber",
          }));

      if (response.statusCode == 200) {
        emit(OtpSuccess());
      } else {
        throw Exception('invalid');
      }
    } catch (e) {
      emit(OtpFailure(e.toString()));
    }
  }

  otpAuth(
      {required String verification,
      required String code,
      required String phoneNumber}) async {
    try {
      emit(OtpLoading());
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verification, smsCode: code);
      await auth.signInWithCredential(credential);
      verifyOtp(phoneNumber: phoneNumber);
    } on FirebaseAuthException catch (e) {
      emit(OtpFailure(e.code));
    }
  }
}
