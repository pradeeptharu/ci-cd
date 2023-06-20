import 'package:qa_lint/core/utils/constants/exports.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;
  final double dialogTitleFontSize;
  final double dialogContentFontSize;
  final double dialogWidth;
  final double dialogHeight;
  final bool isTablet;
  final bool isLandscape;

  const AlertDialogWidget({
    required this.title,
    required this.content,
    required this.onPressed,
    required this.dialogTitleFontSize,
    required this.dialogContentFontSize,
    required this.dialogWidth,
    required this.dialogHeight,
    required this.isTablet,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: dialogTitleFontSize),
        ),
      ),
      content: Text(
        content,
        style: TextStyle(fontSize: dialogContentFontSize),
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isTablet ? 30 : 20),
            ),
            fixedSize: Size(dialogWidth, dialogHeight),
          ),
          onPressed: onPressed,
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: isTablet
                  ? isLandscape
                      ? mediaQuerryHeight(context) * 0.02
                      : mediaQuerryHeight(context) * 0.025
                  : mediaQuerryHeight(context) * 0.02,
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(isTablet ? 20 : 30),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: isTablet
            ? isLandscape
                ? mediaQuerryHeight(context) * 0.2
                : mediaQuerryHeight(context) * 0.09
            : mediaQuerryHeight(context) * 0.05,
        vertical: isTablet
            ? isLandscape
                ? mediaQuerryHeight(context) * 0.06
                : mediaQuerryHeight(context) * 0.04
            : mediaQuerryHeight(context) * 0.035,
      ),
    );
  }
}
