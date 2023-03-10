import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monawpaty/src/shared/components/components.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../../shared/styles/colors.dart';
import 'cubit/otp_cubit.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;
  const OtpScreen(
      {super.key, required this.verificationId, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    var size = MediaQuery.of(context).size;

    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpLoading) {
          circularProgress(context);
        }
        if (state is OtpSuccess) {
          Navigator.pop(context);
          //  navigateAndFinish(context, const HomeScreen());
        }
        if (state is OtpFailure) {
          Navigator.pop(context);
          FocusManager.instance.primaryFocus?.unfocus();
          if (state.error.toString() == 'Exception: invalid') {
            showSnackBar(
                context: context,
                message: "الرجاء التأكد من صحة الرمز",
                duration: 3,
                icon: Icons.error_outline);
          } else {
            showSnackBar(
                context: context,
                message: "الرجاء المحاولة لاحقا",
                duration: 3,
                icon: Icons.error_outline);
          }
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: secondaryColor,
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: size.height * 0.4,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadiusDirectional.vertical(
                      bottom: Radius.circular(
                        25.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.4 - 30,
                  child: Visibility(
                    visible: !isKeyboard,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(
                                  20.0,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/logo.png",
                              ),
                            ),
                          ),
                          const Text("رمز التحقق",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22)),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: !isKeyboard
                              ? size.height * 0.4 - 175
                              : size.height * 0.4 - 250,
                        ),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            height: 275,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(
                                  25.0,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: thirdColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                      fontFamily:
                                          GoogleFonts.cairo().fontFamily,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text:
                                              "الرجاء إدخال رمز التحقق الذي أرسلناه \t \t \t \t \t \t \t \t \t \t إلى رقمك"),
                                      TextSpan(
                                        text:
                                            '   ${phoneNumber.substring(phoneNumber.length - 4)}*****963+',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: OTPTextField(
                                      otpFieldStyle: OtpFieldStyle(
                                          backgroundColor: secondaryColor,
                                          enabledBorderColor: thirdColor,
                                          focusBorderColor: primaryColor),
                                      controller:
                                          OtpCubit.get(context).otpController,
                                      length: 6,
                                      width: MediaQuery.of(context).size.width,
                                      textFieldAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      fieldWidth: 42,
                                      fieldStyle: FieldStyle.box,
                                      outlineBorderRadius: 15,
                                      style: const TextStyle(fontSize: 17),
                                      onChanged: (pin) {},
                                      onCompleted: (pin) {}),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                buildButton(
                                  width: size.width,
                                  text: "تأكيد",
                                  backgroundColor: primaryColor,
                                  borderColor: primaryColor,
                                  foregroundColor: Colors.white,
                                  function: () {
                                    OtpCubit.get(context).otpAuth(
                                        verification: verificationId,
                                        code: '111222');
                                  },
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget codeInput(
        {required TextEditingController controller,
        required BuildContext context}) =>
    SizedBox(
      height: 55,
      width: 42,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: secondaryColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: thirdColor,
              width: 2.0,
            ),
          ),
        ),
        style: const TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
