// ignore_for_file: use_build_context_synchronously

import 'package:qa_lint/core/utils/constants/exports.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginTextEditingController loginTextEditingController =
      LoginTextEditingController();
  bool isLoading = true;

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
    bool _isTablet(BuildContext context) {
      final shortestSide = MediaQuery.of(context).size.shortestSide;
      return shortestSide >= 600;
    }

    final dialogProvider = Provider.of<DialogProvider>(context, listen: false);
    final deviceOrientation = dialogProvider.deviceOrientation(context);
    final dialogWidth = dialogProvider.getDialogWidth(context);
    final dialogHeight = dialogProvider.getDialogHeight(context);
    final dialogTitleFontSize = dialogProvider.getDialogTitleFontSize(context);
    final dialogContentFontSize =
        dialogProvider.getDialogContentFontSize(context);
    bool isLandscape = deviceOrientation == Orientation.landscape;

    final checkBoxProvider = Provider.of<CheckBoxVisibilityProvider>(context);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: OrientationBuilder(builder: (context, orientation) {
        return Consumer<InternetConnectionProvider>(
          builder: (context, connectionProvider, _) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: connectionProvider.connectionStatus ==
                        InternetConnectionStatus.connected
                    ? Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: _isTablet(context)
                                  ? mediaQuerryHeight(context) * 0.05
                                  : mediaQuerryHeight(context) * 0.1,
                            ),
                            Center(
                              child: Image.asset(
                                ImagePath.logoQaLint,
                                fit: BoxFit.contain,
                                height: _isTablet(context)
                                    ? mediaQuerryHeight(context) * 0.2
                                    : mediaQuerryHeight(context) * 0.1,
                              ),
                            ),
                            SizedBox(
                              height: mediaQuerryHeight(context) * 0.05,
                            ),
                            LoginPageWidget(
                              loginEditingController:
                                  loginTextEditingController,
                            ),
                            const ForgotButtonWidget(),
                            RemembermeTextWidget(
                              checkBoxProvider: checkBoxProvider,
                            ),
                            commonSizedBox(context),
                            Center(
                              child: LoginButtonWidget(
                                formKey: formKey,
                                loginTextEditingController:
                                    loginTextEditingController,
                                dialogTitleFontSize: dialogTitleFontSize,
                                dialogContentFontSize: dialogContentFontSize,
                                dialogWidth: dialogWidth,
                                dialogHeight: dialogHeight,
                                isLandscape: isLandscape,
                              ),
                            ),
                            SizedBox(
                              height: mediaQuerryHeight(context) * 0.01,
                            ),
                            const OrTextAndDividerWidget(),
                            LoginWithGoogle(
                              image: ImagePath.googleLogo,
                              onPressed: () {},
                              text: 'Login with Google',
                            ),
                            const Spacer(),
                            const BottomTextSignup(),
                          ],
                        ),
                      )
                    : buildContentWithoutInternet(context),
              ),
            );
          },
        );
      }),
    );
  }
}
