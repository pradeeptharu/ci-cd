import 'package:qa_lint/core/utils/constants/exports.dart';

Widget buildContentWithoutInternet(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: mediaQuerryHeight(context) * 0.08),
      Image.asset(
        ImagePath.noInternet,
        fit: BoxFit.cover,
      ),
      SizedBox(height: mediaQuerryHeight(context) * 0.02),
      customText(
          context: context,
          text: 'Something went wrong !',
          fontSize: mediaQuerryHeight(context) * 0.038,
          fontWeight: FontWeight.w400,
          color: AppColor.titleTextColor),
      customText(
          context: context,
          text: 'Make sure you are connected to network.',
          color: AppColor.titleTextColor),
      SizedBox(height: mediaQuerryHeight(context) * 0.15),
      LoginWithGoogle(
        image: ImagePath.retry,
        text: 'Retry',
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/loginPage');
        },
      ),
    ],
  );
}
