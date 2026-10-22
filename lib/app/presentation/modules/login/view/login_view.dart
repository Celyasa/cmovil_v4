import 'package:cmovil_v4/app/presentation/modules/login/controller/login_provider.dart';
import 'package:cmovil_v4/app/presentation/modules/login/controller/login_state.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_background.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_code_field.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_footer.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_header.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const LoginBackground(),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(28, 24, 28, 20),
                  child: Column(
                    children: <Widget>[
                      const LoginHeader(),
                      const Spacer(),
                      Consumer(
                        builder: (context, ref, _) {
                          ref.listen(
                            loginProvider,
                            callback: (notifier) {
                              //if (notifier.state.isSuccess) {
                              //context.goNamed(Routes.homeName);
                              //}
                            },
                          );

                          final LoginState state = ref
                              .watch(loginProvider)
                              .state;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              LoginCodeField(
                                enabled: !state.loading,
                                errorText: state.error,
                                onChanged: loginProvider
                                    .read()
                                    .onUsrCodigoChanged,
                                onSubmitted: (_) {
                                  loginProvider.read().login();
                                },
                              ),
                              const SizedBox(height: 24),
                              LoginSubmitButton(
                                enabled: state.canSubmit,
                                loading: state.loading,
                                onPressed: () {
                                  loginProvider.read().login();
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      const Spacer(flex: 2),
                      const LoginFooter(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
