import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

//try change
// custom for text and textstyle
Widget normalText({
  String? text,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  Color? color,
  double? letterSpacing,
  TextOverflow? overflow,
  TextDecoration? decoration,
}) {
  return Text(
    text!,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      overflow: overflow,
      decoration: decoration,
      fontSize: fontSize,
    ),
  );
}

// TextformField Custom Widget
Widget customTextFormField(
    {IconData? prefixIcon,
    required context,
    String? labelText,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? contentPadding,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    ValueChanged<String>? onFieldSubmitted,
    bool obscureText = false,
    TextEditingController? controller,
    bool isTablet = false,
    Widget? suffixIcon}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    padding: const EdgeInsets.all(10),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black54,
                size: tabletIs(context)
                    ? iconSizeTablet(context)
                    : iconSizeMobile(context),
              )
            : null,
        labelText: labelText,
        labelStyle: labelStyle != null
            ? labelStyle.copyWith(color: Colors.black)
            : const TextStyle(color: Colors.black),
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        hoverColor: Colors.green,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
      ),
    ),
  );
}

// custon EWlevation Button

Widget elevationButton(
  BuildContext context,
  Function()? onPressed,
  String text,
  ButtonStyle? style,
) {
  return ElevatedButton(
    style: style,
    onPressed: onPressed,
    child: Text(text),
  );
}

// TextEdtion Controller Make Dynamic

abstract class BaseTextEditingController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

class LoginTextEditingController extends BaseTextEditingController {}

class SignupTextEditingController extends BaseTextEditingController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color splashColor;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.splashColor = Colors.white10,
  });

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        splashColor: splashColor,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.buttonColor,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: MediaQuery.of(context).size.height * 0.058,
            width: MediaQuery.of(context).size.width - 45,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: normalText(
                text: text,
                fontSize: isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1),
          ),
        ),
      ),
    );
  }
}
