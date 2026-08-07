import 'package:flutter/material.dart';
import 'package:flutter_application_team2/core/constant/app_color.dart';
import 'package:flutter_application_team2/core/constant/app_text_style.dart';
import 'package:flutter_application_team2/core/widgets/custom_app_bar.dart';
import 'package:flutter_application_team2/core/widgets/primary_bottom.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/card_model.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/paypal_model.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/calendar_bottom_sheet.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/custom_divider.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/details_of_price.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/edit_password_row.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/payment_method_tile.dart';
import 'package:flutter_application_team2/feature/booking_payment/presentation/widgets/succes_pay_sheet.dart';
import 'package:flutter_application_team2/feature/details_screen/presentation/widget/shar_and_shat_widget.dart';
import 'package:flutter_application_team2/feature/home_screen/data/estate_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_manager.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_model.dart';
import 'package:flutter_application_team2/feature/my_booking_screen/data/booking_status_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ReserveScreen extends StatefulWidget {
  ReserveScreen({super.key, required this.estate});

  final EstateModel estate;

  @override
  State<ReserveScreen> createState() => _ReserveScreenState();
}

class _ReserveScreenState extends State<ReserveScreen> {
  CardModel? savedCard;
  DateTime? selectedStart;

  DateTime? selectedEnd;
  BookingModel? currentBooking;
  PaypalModel? savedPaypal;

  @override
  Widget build(BuildContext context) {
    final originalPrice = widget.estate.price!;
    const discountPercentage = 20.0;
    const tax = 10.0;

    final total = originalPrice * (1 - discountPercentage / 100);
    final monthlyPayment = total - tax;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Booking',
        onPressed: () {
          context.pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 99,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColor.lightgrey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          widget.estate.image!,
                          width: 88,
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(width: 8),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.estate.name!,
                              style: AppTextStyle.NearbyName.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),

                            Row(
                              children: [
                                Image.asset(
                                  'assets/icons/Location.png',
                                  width: 16.w,
                                  height: 16.h,
                                  color: AppColor.greyColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  widget.estate.location ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.NearbyLoc.copyWith(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.estate.price}/month',
                                  style: AppTextStyle.NearbyPrice.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amberAccent,
                                      size: 14,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      '${widget.estate.route}',
                                      style: AppTextStyle.NearbyPrice.copyWith(
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Period',
                style: AppTextStyle.labelTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () async {
                  print(' انتقااااااااااااااااااإلى صفحة ريسيرف ديت');
                  final result = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const CalendarBottomSheet(),
                  );

                  if (result != null) {
                    setState(() {
                      selectedStart = result['start'];
                      selectedEnd = result['end'];

                      currentBooking = BookingManager.getBookingByEstate(
                        widget.estate,
                      );

                      if (currentBooking == null) {
                        currentBooking = BookingModel(
                          estate: widget.estate,
                          checkInDate: selectedStart!,
                          checkOutDate: selectedEnd!,
                          status: BookingStatusType.waitingPayment,
                        );

                        BookingManager.bookings.add(currentBooking!);
                      } else {
                        currentBooking!.checkInDate = selectedStart!;
                        currentBooking!.checkOutDate = selectedEnd!;
                      }
                    });
                  }
                },
                child: Row(
                  children: [
                    ActionIcon(img: 'assets/icons/Calendar.png'),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date',
                          style: AppTextStyle.NearbyLoc.copyWith(fontSize: 12),
                        ),
                        SizedBox(height: 2),

                        Text(
                          selectedStart != null && selectedEnd != null
                              ? '${DateFormat('dd MMM').format(selectedStart!)} - ${DateFormat('dd MMM').format(selectedEnd!)}'
                              : '3 july - 5 july ',

                          style: AppTextStyle.NearbyName.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Icon(Icons.chevron_right, color: AppColor.lightgrey),
                  ],
                ),
              ),
              SizedBox(height: 12),
              CustomDivider(),
              SizedBox(height: 12),
              Text(
                'Make sure to check your date before making any sort of payments',
                style: AppTextStyle.NearbyLoc.copyWith(fontSize: 12),
              ),
              SizedBox(height: 24),
              Text(
                'Payments',
                style: AppTextStyle.labelTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                
                
              ),
              SizedBox(height: 16),
              savedCard == null && savedPaypal == null
                  ? Column(
                      children: [
                        PaymentMethodTile(
                          imgPath: 'assets/icons/credit-card.png',
                          title: 'Credit or Debit card',
                          onTap: () async {
                            final card = await context.push<CardModel>(
                              '/addNewCard',
                            );

                            if (card != null) {
  setState(() {
    savedCard = card;
    savedPaypal = null;
  });
}
                          },
                        ),

                        SizedBox(height: 8),

                        PaymentMethodTile(
  imgPath: 'assets/icons/pay_pal.png',
  title: 'Paypal',
  onTap: () async {
    final paypal = await context.push<PaypalModel>(
      '/paypal',
    );

    if (paypal != null) {
      setState(() {
        savedPaypal = paypal;
        savedCard = null;
      });
    }
  },
),
                      ],
                    )
                  : savedCard != null
    ? EditPasswordRow(
        imgPath: 'assets/icons/logo _payment.png',
        title:
            '............ ${savedCard!.cardNumber.substring(savedCard!.cardNumber.length - 4)}',
        onTap: () async {
          final editedCard = await context.push<CardModel>(
            '/addNewCard',
            extra: savedCard,
          );

          if (editedCard != null) {
            setState(() {
              savedCard = editedCard;
            });
          }
        },
      )
    : EditPasswordRow(
        imgPath: 'assets/icons/pay_pal.png',
        title: savedPaypal!.email,
        onTap: () async {
          final editedPaypal = await context.push<PaypalModel>(
            '/paypal',
            extra: savedPaypal,
          );

          if (editedPaypal != null) {
            setState(() {
              savedPaypal = editedPaypal;
            });
          }
        },
      ),

              SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 1,
                child: Container(color: AppColor.lightgrey),
              ),
              SizedBox(height: 12),
              Text(
                'Enter a Voucher',
                style: AppTextStyle.authTitle.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Price Details',
                style: AppTextStyle.labelTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 24),
              Column(
                children: [
                  DetailsOfPrice(
                    title: 'Monthly payment',
                    value: '\$${monthlyPayment.toStringAsFixed(2)}',
                  ),
                  SizedBox(height: 16),

                  DetailsOfPrice(
                    title: 'Tax',
                    value: '\$${tax.toStringAsFixed(2)}',
                  ),
                  SizedBox(height: 16),

                  DetailsOfPrice(
                    title: 'Total',
                    value: '\$${total.toStringAsFixed(2)}',
                  ),
                ],
              ),
              SizedBox(height: 26),
           
if (savedCard != null || savedPaypal != null)
  PrimaryBottom(
    name: 'Confirm and Pay',
    width: double.infinity,
    onPressed: () {
      
      if (currentBooking != null) {
        setState(() {
         
          currentBooking!.status = BookingStatusType.checkIn;
        });

       
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const SuccesPaySheet(),
        );
      }
    },
  ),

              SizedBox(height: 26),
            ],
          ),
        ),
      ),
    );
  }
}
