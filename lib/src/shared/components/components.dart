import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/styles/colors.dart';

Widget buildButton(
        {double? height,
        double? width,
        double? fontSize,
        double? radius,
        required String text,
        required Color backgroundColor,
        required Color foregroundColor,
        required Color borderColor,
        required Function function}) =>
    ElevatedButton(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          side: BorderSide(width: 2, color: borderColor),
          fixedSize: Size(width ?? 100, height ?? 45),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10))),
      onPressed: () {
        function();
      },
      child: Text(text,
          style:
              TextStyle(fontSize: fontSize ?? 20, fontWeight: FontWeight.bold)),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required String? Function(String?) validate,
  required TextInputType type,
  required String hint,
  required IconData prefix,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  IconData? suffix,
  void Function()? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0.3),
        isDense: true,
        filled: true,
        fillColor: secondaryColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        hintText: hint,
        hintStyle:
            const TextStyle(color: thirdColor, fontWeight: FontWeight.w600),
        prefixIcon: Icon(
          prefix,
          color: thirdColor,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: thirdColor,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.white,
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
    );

Widget defaultDropdownButton(
        {double? height,
        double? width,
        double? fontSize,
        double? radius,
        required BuildContext context,
        required String? choice,
        required String label,
        required List<String> list,
        required Function(String?)? onChange}) =>
    Theme(
      data: Theme.of(context).copyWith(),
      child: Container(
          height: height ?? 40,
          width: width ?? 105,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 7),
              border: Border.all(
                  color: thirdColor, width: 1.5, style: BorderStyle.solid)),
          child: DropdownButtonHideUnderline(
              child: DropdownButton(
            isExpanded: true,
            hint: Text(label),
            style: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
              color: Colors.black,
              fontSize: fontSize ?? 14,
            ),
            iconEnabledColor: thirdColor,
            icon: const Icon(
              Icons.arrow_drop_down,
            ),
            items: list
                .map((v) => DropdownMenuItem(
                      value: v,
                      child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            v,
                            textAlign: TextAlign.center,
                          )),
                    ))
                .toList(),
            onChanged: onChange,
            value: choice,
          ))),
    );

Widget defaultChoiceChip(
        {required double width,
        required String label,
        required variable,
        required Function(bool)? onSelected}) =>
    ChoiceChip(
        label: SizedBox(
          width: width,
          height: 40,
          child: Center(
            child: Text(label,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
        ),
        selected: variable == label,
        onSelected: (bool selected) async {},
        selectedColor: primaryColor,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)));

void showSnackBar(
    {required BuildContext context,
    required String message,
    required IconData icon,
    required int duration}) {
  final snackBar = SnackBar(
    duration: Duration(seconds: duration),
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Text(message)
      ],
    ),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

circularProgress(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
                strokeWidth: 7,
                backgroundColor: Colors.grey,
                color: primaryColor),
          ),
        );
      });
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
