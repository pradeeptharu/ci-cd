import 'package:qa_lint/core/utils/constants/exports.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupFormFields> createState() => _SignupFormFieldsState();
}

class _SignupFormFieldsState extends State<SignupFormFields> {
  Validator validator = Validator();

  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  void dispose() {
    internetSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      Provider.of<InternetConnectionStates>(context, listen: false)
          .hasInternet = hasInternet;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StreamSubscription<InternetConnectionStatus>? internetSubscription;

  bool isPasswordMatch() {
    final password = signupTextEditingController.passwordController.text;
    final confirmPassword =
        signupTextEditingController.confirmPasswordController.text;
    return password == confirmPassword;
  }

  SignupTextEditingController signupTextEditingController =
      SignupTextEditingController();
  @override
  Widget build(BuildContext context) {
    final internetConnectionProvider =
        Provider.of<InternetConnectionStates>(context);
    final checkBoxVisibilityProvider =
        Provider.of<CheckBoxVisibilityProvider>(context);
    final orientations = MediaQuery.of(context).orientation;
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);

    final dialogProvider = Provider.of<DialogProvider>(context, listen: false);
    final deviceOrientation = dialogProvider.deviceOrientation(context);
    bool isLandscape = deviceOrientation == Orientation.landscape;

    return Form(
      key: formKey,
      child: Column(
        children: [
          customTextFormField(
              prefixIcon: Icons.person_4_rounded,
              context: context,
              labelText: 'First Name',
              validator: validator.firstNameValidator,
              textInputAction: TextInputAction.next,
              controller: signupTextEditingController.firstNameController),
          customTextFormField(
              prefixIcon: Icons.person_4_rounded,
              context: context,
              labelText: 'Last Name',
              validator: validator.lastNameValidator,
              textInputAction: TextInputAction.next,
              controller: signupTextEditingController.lastNameController),
          customTextFormField(
              prefixIcon: Icons.email,
              context: context,
              labelText: 'Email',
              validator: validator.emailValidator,
              textInputAction: TextInputAction.next,
              controller: signupTextEditingController.emailController),
          customTextFormField(
            obscureText: !passwordVisibilityProvider.isPasswordVisible,
            prefixIcon: Icons.key,
            context: context,
            labelText: 'Password',
            validator: validator.passwordValidator,
            textInputAction: TextInputAction.next,
            controller: signupTextEditingController.passwordController,
            suffixIcon: IconButton(
              onPressed: () {
                passwordVisibilityProvider.togglePasswordVisibility();
              },
              icon: Icon(
                passwordVisibilityProvider.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: _isTablet(context)
                    ? (orientations == Orientation.landscape
                        ? iconSizeTabletLandscape(context)
                        : iconSizeTablet(context))
                    : iconSizeMobile(context),
              ),
            ),
          ),
          customTextFormField(
            obscureText: !passwordVisibilityProvider.isPasswordVisible,
            prefixIcon: Icons.key,
            context: context,
            labelText: 'Confirm Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirm Password is required';
              }
              if (!isPasswordMatch()) {
                return 'Password does not match';
              }
              return null;
            },
            textInputAction: TextInputAction.done,
            controller: signupTextEditingController.confirmPasswordController,
            suffixIcon: IconButton(
              onPressed: () {
                passwordVisibilityProvider.togglePasswordVisibility();
              },
              icon: Icon(
                passwordVisibilityProvider.isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                size: _isTablet(context)
                    ? (orientations == Orientation.landscape
                        ? iconSizeTabletLandscape(context)
                        : iconSizeTablet(context))
                    : iconSizeMobile(context),
              ),
            ),
          ),
          SizedBox(
            height: _isTablet(context)
                ? mediaQuerryHeight(context) * 0.03
                : mediaQuerryHeight(context) * 0.03,
          ),
          CustomButton(
            text: 'Sign up',
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final email = signupTextEditingController.emailController.text;
                final firstName =
                    signupTextEditingController.firstNameController.text;
                final lastName =
                    signupTextEditingController.lastNameController.text;
                final phoneNumber =
                    signupTextEditingController.phoneNumberController.text;
                final userData =
                    Provider.of<SignUpUserDataProvider>(context, listen: false);
                userData.setUserData(email, firstName, lastName, phoneNumber);
                if (!checkBoxVisibilityProvider.value) {
                  checkBoxVisibilityProvider.showErrors();
                } else {
                  checkBoxVisibilityProvider.hideErrors();
                  if (internetConnectionProvider.hasInternet) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialogWidget(
                            title: 'No Internet Connection',
                            content:
                                'Make sure that Wi-Fi or mobile data is turned on then try again.',
                            onPressed: () => Navigator.pop(context),
                            dialogTitleFontSize:
                                dialogProvider.getDialogTitleFontSize(context),
                            dialogContentFontSize: dialogProvider
                                .getDialogContentFontSize(context),
                            dialogWidth: dialogProvider.getDialogWidth(context),
                            dialogHeight:
                                dialogProvider.getDialogHeight(context),
                            isTablet: _isTablet(context),
                            isLandscape: isLandscape);
                      },
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
