import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
import 'package:flutter_application_team2/feature/auth/data/user_model.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/custom_field.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/paypal_model.dart';
import 'package:go_router/go_router.dart';

class PaypalScreen extends StatefulWidget {
  const PaypalScreen({
    super.key,
    this.paypal,
  });

  final PaypalModel? paypal;

  @override
  State<PaypalScreen> createState() => _PaypalScreenState();
}

class _PaypalScreenState extends State<PaypalScreen> {
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loadEmail();
  }

  Future<void> loadEmail() async {
    if (widget.paypal != null) {
      emailController.text = widget.paypal!.email;
    } else {
      final user = await UserModel.getSavedUser();

      if (user != null) {
        emailController.text = user.email;
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'PayPal',
        onPressed: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 50),

              Image.asset(
                'assets/icons/pay_pal.png',
                width: 120,
                height: 120,
              ),

              const SizedBox(height: 40),

              CustomTextFormField(
                label: 'PayPal Email',
                hintText: 'example@gmail.com',
                controller: emailController,
                width: double.infinity,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }

                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Invalid email';
                  }

                  return null;
                },
              ),

              const Spacer(),

              PrimaryBottom(
                name: 'Connect PayPal',
                width: double.infinity,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.pop(
                      PaypalModel(
                        email: emailController.text,
                      ),
                    );
                  }
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}