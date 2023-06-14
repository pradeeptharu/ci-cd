// // TextformField Custom Widget
// import 'package:flutter/material.dart';
// import 'package:qa_lint/core/utils/constants/constants.dart';

// Widget customTextFormField(
//     {IconData? prefixIcon,
//     required context,
//     String? labelText,
//     TextStyle? labelStyle,
//     EdgeInsetsGeometry? contentPadding,
//     String? Function(String?)? validator,
//     TextInputType? keyboardType,
//     TextInputAction? textInputAction,
//     ValueChanged<String>? onFieldSubmitted,
//     bool obscureText = false,
//     TextEditingController? controller,
//     bool isTablet = false,
//     Widget? suffixIcon}) {
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 12),
//     padding: const EdgeInsets.all(10),
//     child: OrientationBuilder(
//       builder: (context, orientation) {
//         final deviceOrantation = MediaQuery.of(context).orientation;
//         bool isLandscape = deviceOrantation == Orientation.landscape;
//         return TextFormField(
//           style: TextStyle(
//               fontSize: tabletIs(context)
//                   ? isLandscape
//                       ? mediaQuerryHeight(context) * 0.028
//                       : mediaQuerryHeight(context) * 0.022
//                   : mediaQuerryHeight(context) * 0.022),
//           controller: controller,
//           obscureText: obscureText,
//           validator: validator,
//           keyboardType: keyboardType,
//           textInputAction: textInputAction,
//           onFieldSubmitted: onFieldSubmitted,
//           decoration: InputDecoration(
//             errorStyle: TextStyle(
//               fontSize: defultFontSize(context),
//             ),
//             suffixIcon: suffixIcon,
//             prefixIcon: prefixIcon != null
//                 ? Icon(
//                     prefixIcon,
//                     color: Colors.black54,
//                     size: tabletIs(context)
//                         ? isLandscape
//                             ? mediaQuerryHeight(context) * 0.04
//                             : iconSizeTablet(context)
//                         : iconSizeMobile(context),
//                   )
//                 : null,
//             labelText: labelText,
//             labelStyle: labelStyle != null
//                 ? labelStyle.copyWith(color: Colors.black)
//                 : const TextStyle(color: Colors.black),
//             contentPadding: contentPadding,
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 style: BorderStyle.solid,
//               ),
//               borderRadius: BorderRadius.circular(24),
//             ),
//             hoverColor: customPrimarySwatch,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(24),
//               borderSide: const BorderSide(
//                 color: customPrimarySwatch,
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
// TextformField Custom Widget
import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

Widget customTextFormField(
    {IconData? prefixIcon,
    required context,
    required String? labelText,
    TextStyle? labelStyle,
    EdgeInsetsGeometry? contentPadding,
    required String? Function(String?)? validator,
    TextInputType? keyboardType,
    required TextInputAction? textInputAction,
    ValueChanged<String>? onFieldSubmitted,
    bool obscureText = false,
    required TextEditingController? controller,
    bool isTablet = false,
    Widget? suffixIcon}) {
  final orientations = MediaQuery.of(context).orientation;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12),
    padding: const EdgeInsets.all(10),
    child: OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrantation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrantation == Orientation.landscape;
        return TextFormField(
          style: TextStyle(
              fontSize: tabletIs(context)
                  ? isLandscape
                      ? mediaQuerryHeight(context) * 0.028
                      : mediaQuerryHeight(context) * 0.022
                  : mediaQuerryHeight(context) * 0.022),
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: defultFontSize(context),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Colors.black54,
                    size: tabletIs(context)
                        ? isLandscape
                            ? mediaQuerryHeight(context) * 0.04
                            : iconSizeTablet(context)
                        : iconSizeMobile(context),
                  )
                : null,
            labelText: labelText,
            labelStyle: labelStyles(
              fontSize: tabletIs(context)
                  ? (orientations == Orientation.landscape
                      ? tabletLandscapeFontSize(context)
                      : tabletFontSize(context))
                  : defultFontSize(context),
            ),
            contentPadding: tabletIs(context)
                ? isLandscape
                    ? EdgeInsets.all(
                        paddingTablet30(context),
                      )
                    : EdgeInsets.all(paddingTablet30(context))
                : EdgeInsets.all(paddingMobile10(context)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            hoverColor: customPrimarySwatch,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                color: customPrimarySwatch,
              ),
            ),
          ),
        );
      },
    ),
  );
}
