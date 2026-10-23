import 'package:cmovil_v4/app/presentation/modules/login/controller/login_provider.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_background.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_code_field.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_footer.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_header.dart';
import 'package:cmovil_v4/app/presentation/modules/login/view/widgets/login_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/consumer/consumer_widget.dart';

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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(28, 24, 28, 20),
              child: Column(
                children: <Widget>[
                  const LoginHeader(),
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, _) {
                      final controller = ref.watch(loginProvider);
                      final state = controller.state;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          LoginCodeField(
                            enabled: !state.loading,
                            errorText: null,
                            onChanged: controller.onUsrCodigoChanged,
                            onSubmitted: (_) => controller.login(),
                          ),
                          if (state.error != null) ...[
                            const SizedBox(height: 12),
                            Text(
                              state.error!,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ],

                          const SizedBox(height: 24),
                          LoginSubmitButton(
                            enabled: state.canSubmit,
                            loading: state.loading,
                            onPressed: controller.login,
                          ),
                        ],
                      );
                    },
                  ),
                  const Spacer(flex: 2),
                  const LoginFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
