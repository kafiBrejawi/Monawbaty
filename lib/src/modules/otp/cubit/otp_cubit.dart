import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  var otpController = OtpFieldController();

  otpAuth({required String verification, required String code}) async {
    try {
      emit(OtpLoading());
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verification, smsCode: code);
      await auth.signInWithCredential(credential);
      emit(OtpSuccess());
    } on FirebaseAuthException catch (e) {
      emit(OtpFailure(e.message!));
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}
