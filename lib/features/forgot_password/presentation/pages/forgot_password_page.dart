import 'package:qa_lint/core/utils/constants/exports.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      final newConnectionStatus = _mapConnectivityResult(result);
      Provider.of<InternetConnectionProvider>(context, listen: false)
          .updateConnectionStatus(newConnectionStatus);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    final newConnectionStatus = _mapConnectivityResult(connectivityResult);
    Provider.of<InternetConnectionProvider>(context, listen: false)
        .updateConnectionStatus(newConnectionStatus);
  }

  InternetConnectionStatus _mapConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return InternetConnectionStatus.connected;
      case ConnectivityResult.none:
      default:
        return InternetConnectionStatus.disconnected;
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogProvider = Provider.of<DialogProvider>(context, listen: false);
    final deviceOrientation = dialogProvider.deviceOrientation(context);
    bool isLandscape = deviceOrientation == Orientation.landscape;
    final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);
    final isConnected = internetConnectionProvider.connectionStatus ==
        InternetConnectionStatus.connected;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: _isTablet(context)
                ? isLandscape
                    ? mediaQuerryHeight(context) * 0.05
                    : mediaQuerryHeight(context) * 0.035
                : mediaQuerryHeight(context) * 0.04,
            color: AppColor.titleTextColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'loginPage');
          },
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        title: customText(
          context: context,
          text: 'Forgot Password',
          fontSize: isLandscape
              ? mediaQuerryHeight(context) * 0.05
              : mediaQuerryHeight(context) * 0.03,
          color: AppColor.titleTextColor,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: isConnected
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: mediaQuerryHeight(context) * 0.05,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: mediaQuerryHeight(context) * 0.3,
                      child: Image.asset(
                        ImagePath.logoQaLint,
                        fit: BoxFit.cover,
                      ),
                    ),
                    customTextFormField(
                      context: context,
                      labelText: 'Email',
                      validator: Validator().emailValidator,
                      controller: emailController,
                      prefixIcon: Icons.email,
                    ),
                    SizedBox(
                      height: mediaQuerryHeight(context) * 0.03,
                    ),
                    SizedBox(
                      width: mediaQuerryWidth(context) * 0.6,
                      child: CustomButton(
                        text: 'Email Reset Link',
                        onPressed: () async {
                          final connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult != ConnectivityResult.none) {
                            if (formKey.currentState!.validate()) {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialogWidget(
                                        title:
                                            'A Password Reset Link has been sent to your Email ID ',
                                        content:
                                            'Follow the instructions and the link received in your email to reset your password',
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        dialogTitleFontSize: dialogProvider
                                            .getDialogTitleFontSize(context),
                                        dialogContentFontSize: dialogProvider
                                            .getDialogContentFontSize(context),
                                        dialogWidth: dialogProvider
                                            .getDialogWidth(context),
                                        dialogHeight: dialogProvider
                                            .getDialogHeight(context),
                                        isTablet: _isTablet(context),
                                        isLandscape: isLandscape);
                                  });
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: mediaQuerryHeight(context) * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          context: context,
                          text: 'Do you have an account?',
                          color: AppColor.titleTextColor,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/loginPage');
                          },
                          child: customText(context: context, text: 'Login'),
                        ),
                      ],
                    ),
                  ],
                )
              : buildContentWithoutInternet(context),
        ),
      ),
    );
  }
}
