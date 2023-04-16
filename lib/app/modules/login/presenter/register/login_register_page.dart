import 'package:flutter/material.dart';
import 'package:patota_app/app/modules/auth/services/auth_service.dart';
import 'package:patota_app/app/modules/home/presenter/widgets/custom_logo_widget.dart';
import 'package:patota_app/app/modules/login/domain/entities/auth_user.dart';
import 'package:patota_app/app/modules/login/domain/models/auth_user.dart';
import 'package:patota_app/core/dependency_injector/doctor.dart';
import 'package:patota_app/core/routes/routes.dart';
import 'package:patota_app/shared/widgets/custom_text_form_field_widget.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final _auth = doctor<AuthService>();
  final _globalKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo usuário'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                const CustomLogoWidget(),
                Form(
                  key: _globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormFieldWidget(
                        label: 'Nome completo',
                        controller: nameController,
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Email',
                        controller: emailController,
                      ),
                      CustomTextFormFieldWidget(
                        label: 'Senha',
                        controller: passwordController,
                      ),
                      CustomTextFormFieldWidget(
                          label: 'Confirmar senha',
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe uma senha';
                            }
                            return null;
                          }),
                      ElevatedButton(
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            final IAuthUser authUser = AuthUser()
                              ..displayName = nameController.text
                              ..email = emailController.text
                              ..password = confirmPasswordController.text;

                            await _auth.register(authUser).then((_) {
                              Navigator.popAndPushNamed(
                                context,
                                Routes.home,
                              );
                            });
                          }
                        },
                        child: const Text('Criar Conta'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
