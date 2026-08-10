import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/error_service/card_number_formatter.dart';
import 'package:flutter_application_team2/core/error_service/card_validator.dart';
import 'package:flutter_application_team2/core/error_service/expiry_date_formatter.dart';
import 'package:flutter_application_team2/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
import 'package:flutter_application_team2/feature/auth/presentation/widget/custom_field.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/card_model.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/credit_card_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddNewCardScreen extends StatefulWidget {
  AddNewCardScreen({super.key, this.card});
  final CardModel? card;

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController expirdController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
void initState() {
  super.initState();
   print(widget.card?.name);
  print(widget.card?.cardNumber);

  if (widget.card != null) {
    nameController.text = widget.card!.name;
    cardNumberController.text = widget.card!.cardNumber;
    expirdController.text = widget.card!.expiry;
    cvvController.text = widget.card!.cvv;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add card',
        onPressed: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CreditCardPreview(
  nameController: nameController,
  cardNumberController: cardNumberController,
  expirdController: expirdController,
),
               /* ClipRRect(borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/icons/Credit Card.png',
                    width: double.infinity,
                    height: 205.h,
                    fit: BoxFit.contain,
                  ),
                ),*/
                SizedBox(height: 35),
                CustomTextFormField(
                  label: 'Name',
                  hintText: 'Brooklyn Simmo',
                  controller: nameController,
                  width: double.infinity,
                  validator: CardValidators.validateName,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  label: 'Card Number',
                  hintText: '1234 5678 9101 1121',
                  controller: cardNumberController,
                  width: double.infinity,
                  validator: CardValidators.validateCardNumber,
                  keyboardType: TextInputType.number,
                  maxLength: 19,
                  inputFormatters: [CardNumberFormatter()],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    CustomTextFormField(
                      label: 'expired',
                      hintText: '06/21',
                      controller: expirdController,
                      width: 155.w,
                      validator: CardValidators.validateExpiry,
                      keyboardType: TextInputType.datetime,
                      maxLength: 5,
                      inputFormatters: [ExpiryDateFormatter()],
                    ),
                    Expanded(child: SizedBox()),
                    CustomTextFormField(
                      label: 'cvv',
                      hintText: '3134',
                      controller: cvvController,
                      width: 155.w,
                      validator: CardValidators.validateCVV,
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                PrimaryBottom(
                  name: 'Add Card',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final card = CardModel(
                        name: nameController.text,
                        cardNumber: cardNumberController.text,
                        expiry: expirdController.text,
                        cvv: cvvController.text,
                      );

                      context.pop(card);
                    }
                  },
                  width: double.infinity,
                ),
                SizedBox(height: 90),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
