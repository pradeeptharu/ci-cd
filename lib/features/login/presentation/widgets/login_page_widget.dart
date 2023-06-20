import 'package:qa_lint/core/utils/constants/exports.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({
    Key? key,
    required this.loginEditingController,
  }) : super(key: key);
  final LoginTextEditingController loginEditingController;

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  // LoginTextEditingController loginEditingController =
  Validator validator = Validator();

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            customTextFormField(
                prefixIcon: Icons.email,
                context: context,
                labelText: 'Email',
                validator: validator.emailValidator,
                textInputAction: TextInputAction.next,
                controller: widget.loginEditingController.emailController),
            customTextFormField(
              obscureText: !passwordVisibilityProvider.isPasswordVisible,
              prefixIcon: Icons.key,
              context: context,
              labelText: 'Password',
              validator: validator.loginPasswordValidator,
              textInputAction: TextInputAction.done,
              controller: widget.loginEditingController.passwordController,
              suffixIcon: IconButton(
                onPressed: () {
                  passwordVisibilityProvider.togglePasswordVisibility();
                },
                icon: Icon(
                  passwordVisibilityProvider.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: isTablet(context)
                      ? (orientations == Orientation.landscape
                          ? iconSizeTabletLandscape(context)
                          : iconSizeTablet(context))
                      : iconSizeMobile(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
