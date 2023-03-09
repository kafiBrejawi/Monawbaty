import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monawpaty/src/modules/otp/otp_screen.dart';
import '../../shared/styles/colors.dart';
import '../../shared/components/components.dart';
import 'cubit/registration_cubit.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    var size = MediaQuery.of(context).size;

    List<Step> getSteps() => [
          Step(
              state: RegistrationCubit.get(context).currentStep > 0
                  ? StepState.complete
                  : StepState.indexed,
              title: const Text(""),
              content: Form(
                key: RegistrationCubit.get(context).formKey1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: defaultFormField(
                          controller:
                              RegistrationCubit.get(context).fullNameController,
                          type: TextInputType.text,
                          label: 'الاسم الكامل',
                          prefix: Icons.face,
                          validate: (val) {
                            if (val!.isEmpty) {
                              return 'يجب إدخال الاسم الكامل';
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 60,
                      child: defaultFormField(
                          controller:
                              RegistrationCubit.get(context).emailController,
                          type: TextInputType.emailAddress,
                          label: 'البريد الالكتروني',
                          prefix: Icons.email,
                          validate: (val) {
                            if (val!.isEmpty) {
                              return 'يجب إدخال البريد الالكتروني';
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 60,
                      child: defaultFormField(
                          controller:
                              RegistrationCubit.get(context).userNameController,
                          type: TextInputType.text,
                          label: 'اسم المستخدم',
                          prefix: Icons.person,
                          validate: (val) {
                            if (val!.isEmpty) {
                              return 'يجب إدخال اسم المستخدم';
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      height: 60,
                      child: defaultFormField(
                          controller:
                              RegistrationCubit.get(context).passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'كلمة المرور',
                          prefix: Icons.lock,
                          suffix: RegistrationCubit.get(context).suffix,
                          isPassword: RegistrationCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegistrationCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (val) {
                            if (val!.isEmpty) {
                              return 'يجب إدخال كلمة المرور';
                            }
                            return null;
                          }),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Radio(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return primaryColor;
                            }
                            return Colors.black54;
                          }),
                          value: "male",
                          groupValue: RegistrationCubit.get(context).gender,
                          onChanged: (value) {
                            RegistrationCubit.get(context)
                                .changeRadiogender(value);
                          },
                        ),
                        const Text(
                          "ذكر",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Spacer(),
                        Radio(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return primaryColor;
                            }
                            return Colors.black54;
                          }),
                          value: "female",
                          groupValue: RegistrationCubit.get(context).gender,
                          onChanged: (value) {
                            RegistrationCubit.get(context)
                                .changeRadiogender(value);
                          },
                        ),
                        const Text(
                          "أنثى",
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(width: 16),
                        const Spacer()
                      ],
                    )
                  ],
                ),
              ),
              isActive: RegistrationCubit.get(context).currentStep >= 0),
          Step(
              state: RegistrationCubit.get(context).currentStep > 1
                  ? StepState.complete
                  : StepState.indexed,
              title: const Text(""),
              content: Column(
                children: [
                  const FittedBox(
                      fit: BoxFit.cover,
                      child: Text("■ هل لديك السماحية بحجز مناوبات عمليات :   ",
                          style: TextStyle(
                              color: thirdColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                  Row(
                    children: [
                      const Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return primaryColor;
                          }
                          return Colors.black54;
                        }),
                        value: true,
                        groupValue: RegistrationCubit.get(context).operations,
                        onChanged: (value) {
                          RegistrationCubit.get(context)
                              .changeRadioOperations(value);
                        },
                      ),
                      const Text(
                        "نعم",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return primaryColor;
                          }
                          return Colors.black54;
                        }),
                        value: false,
                        groupValue: RegistrationCubit.get(context).operations,
                        onChanged: (value) {
                          RegistrationCubit.get(context)
                              .changeRadioOperations(value);
                        },
                      ),
                      const Text(
                        "لا",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 20),
                  const FittedBox(
                      fit: BoxFit.cover,
                      child: Text("■ هل لديك السماحية بحجز مناوبات قائد قطاع :",
                          style: TextStyle(
                              color: thirdColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                  Row(
                    children: [
                      const Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return primaryColor;
                          }
                          return Colors.black54;
                        }),
                        value: true,
                        groupValue: RegistrationCubit.get(context).opLeader,
                        onChanged: (value) {
                          RegistrationCubit.get(context)
                              .changeRadioOpLeader(value);
                        },
                      ),
                      const Text(
                        "نعم",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      Radio(
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return primaryColor;
                          }
                          return Colors.black54;
                        }),
                        value: false,
                        groupValue: RegistrationCubit.get(context).opLeader,
                        onChanged: (value) {
                          RegistrationCubit.get(context)
                              .changeRadioOpLeader(value);
                        },
                      ),
                      const Text(
                        "لا",
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 20),
                  const FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                          "■ قم باختيار المركز التابع إليه والرتبة  :               ",
                          style: TextStyle(
                              color: thirdColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      defaultDropdownButton(
                          context: context,
                          choice: RegistrationCubit.get(context).location,
                          label: "المركز",
                          list: RegistrationCubit.get(context).locationList,
                          onChange: (val) {
                            RegistrationCubit.get(context)
                                .changeRadioLocation(val);
                          }),
                      const SizedBox(width: 10),
                      defaultDropdownButton(
                          context: context,
                          choice: RegistrationCubit.get(context).rank,
                          label: "الرتبة",
                          list: RegistrationCubit.get(context).rankList,
                          onChange: (val) {
                            RegistrationCubit.get(context).changeRadioRank(val);
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
              isActive: RegistrationCubit.get(context).currentStep >= 1),
          Step(
              state: RegistrationCubit.get(context).currentStep > 2
                  ? StepState.complete
                  : StepState.indexed,
              title: const Text(""),
              content: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    child: RegistrationCubit.get(context).imageFile == null
                        ? Image.asset('assets/images/id.png')
                        : Image.file(RegistrationCubit.get(context).imageFile!),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildButton(
                        height: 38,
                        fontSize: 16,
                        radius: 5,
                        width: 100,
                        text: "اختيار",
                        backgroundColor: secondaryColor,
                        borderColor: secondaryColor,
                        foregroundColor: Colors.black54,
                        function: () {
                          RegistrationCubit.get(context).getImage();
                        },
                      ),
                      buildButton(
                        height: 38,
                        fontSize: 16,
                        radius: 5,
                        width: 100,
                        text: "تعليمات",
                        backgroundColor: secondaryColor,
                        borderColor: secondaryColor,
                        foregroundColor: Colors.black54,
                        function: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Form(
                    key: RegistrationCubit.get(context).formKey2,
                    child: SizedBox(
                        height: 60,
                        child: defaultFormField(
                            controller:
                                RegistrationCubit.get(context).phoneController,
                            type: TextInputType.phone,
                            label: 'رقم الموبايل',
                            prefix: Icons.call,
                            validate: (val) {
                              if (val!.isEmpty) {
                                return 'يجب إدخال رقم الموبايل';
                              } else if (val.length < 10) {
                                return "يجب إدخال عشر أرقام على الأقل";
                              } else if (val[0] != '0' && val[1] != '9') {
                                return "يجب أن يبدأ رقم الموبايل بـ 09";
                              }
                              return null;
                            })),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              isActive: RegistrationCubit.get(context).currentStep >= 1),
        ];

    return BlocConsumer<RegistrationCubit, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationLoading) {
          circularProgress(context);
        }
        if (state is RegistrationSuccess) {
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        verificationId:
                            RegistrationCubit.get(context).verification!,
                        phoneNumber:
                            RegistrationCubit.get(context).phoneController.text,
                      )));
        }
        if (state is RegistrationFailure) {
          Navigator.pop(context);
          FocusManager.instance.primaryFocus?.unfocus();
          if (state.error.toString() == 'Exception: invalid-data') {
            showSnackBar(
                context: context,
                message: "الرجاء التأكد من صحة البيانات",
                duration: 3,
                icon: Icons.error_outline);
          } else if (state.error.toString() ==
              'Exception: invalid-phone-number') {
            showSnackBar(
                context: context,
                message: "رقم الموبايل غير صالح",
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, right: 10),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();
                          await Future.delayed(
                              const Duration(milliseconds: 100), () {
                            Navigator.pop(context);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        ),
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
                          const Text("تسجيل إشتراك",
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
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 455,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.all(
                                Radius.circular(
                                  25.0,
                                ),
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(
                                  fontFamily: GoogleFonts.cairo().fontFamily,
                                  primarySwatch: Colors.red,
                                  canvasColor: Colors.transparent,
                                  colorScheme: const ColorScheme.light(
                                      primary: primaryColor)),
                              child: Stepper(
                                physics: const NeverScrollableScrollPhysics(),
                                type: StepperType.horizontal,
                                elevation: 0,
                                steps: getSteps(),
                                currentStep:
                                    RegistrationCubit.get(context).currentStep,
                                controlsBuilder: (BuildContext context,
                                    ControlsDetails controls) {
                                  final isLastStep =
                                      RegistrationCubit.get(context)
                                              .currentStep ==
                                          getSteps().length - 1;
                                  return Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: buildButton(
                                            height: 38,
                                            fontSize: 16,
                                            radius: 5,
                                            width: size.width,
                                            text:
                                                isLastStep ? "تأكيد" : "التالي",
                                            backgroundColor: primaryColor,
                                            borderColor: primaryColor,
                                            foregroundColor: Colors.white,
                                            function: () {
                                              String? status =
                                                  RegistrationCubit.get(context)
                                                      .changeCurrentStep(1);
                                              if (status == "completed") {
                                                RegistrationCubit.get(context)
                                                    .registrationUser();
                                              } else if (status ==
                                                  "incompleted") {
                                                showSnackBar(
                                                    context: context,
                                                    message:
                                                        "يجب إدخال كافة البيانات المطلوبة",
                                                    duration: 3,
                                                    icon: Icons.error_outline);
                                              }
                                            }),
                                      ),
                                      if (RegistrationCubit.get(context)
                                              .currentStep !=
                                          0)
                                        const SizedBox(width: 12),
                                      if (RegistrationCubit.get(context)
                                              .currentStep !=
                                          0)
                                        Expanded(
                                          child: buildButton(
                                            height: 38,
                                            fontSize: 16,
                                            radius: 5,
                                            width: size.width,
                                            text: "رجوع",
                                            backgroundColor: secondaryColor,
                                            borderColor: secondaryColor,
                                            foregroundColor: Colors.black54,
                                            function: () {
                                              RegistrationCubit.get(context)
                                                  .changeCurrentStep(-1);
                                            },
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
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
