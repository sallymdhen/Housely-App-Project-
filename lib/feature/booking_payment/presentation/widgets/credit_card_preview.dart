import 'package:flutter/material.dart';
import 'package:flutter_application_team2/feature/booking_payment/data/service_booking_payment/format_card_preview.dart';

class CreditCardPreview extends StatelessWidget {
  const CreditCardPreview({
    super.key,
    required this.nameController,
    required this.cardNumberController,
    required this.expirdController,
  });

  final TextEditingController nameController;
  final TextEditingController cardNumberController;
  final TextEditingController expirdController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const double figmaWidth = 327;
        const double figmaHeight = 205;

        final double scale = constraints.maxWidth / figmaWidth;

        final double cardHeight = figmaHeight * scale;

        return SizedBox(
          width: constraints.maxWidth,
          height: cardHeight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12 * scale),
            child: AnimatedBuilder(
              animation: Listenable.merge([
                nameController,
                cardNumberController,
                expirdController,
              ]),
              builder: (context, child) {
                return Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF832388),
                              Color(0xFF932883),
                              Color(0xFFA32E7E),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 124.26 * scale,
                      top: -146.3 * scale,
                      child: Container(
                        width: 242.91 * scale,
                        height: 242.27 * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.20),
                        ),
                      ),
                    ),

                    // =====================================================
                    // SECOND WHITE FADE CIRCLE
                    // =====================================================
                    Positioned(
                      left: -110 * scale,
                      top: 50 * scale,
                      child: Container(
                        width: 520 * scale,
                        height: 520 * scale,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(0.1),
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.35, 0.60, 1.0],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 15 * scale,
                      top: 25 * scale,
                      child: Text(
                        'Credit Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14 * scale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 14 * scale,
                      top: 23 * scale,
                      child: SizedBox(
                        width: 48 * scale,
                        height: 30 * scale,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 2 * scale,
                              top: 2 * scale,
                              child: SizedBox(
                                width: 47 * scale,
                                height: 28 * scale,
                                child: Image.asset(
                                  'assets/image/tow_circle.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: 15 * scale,
                      right: 15 * scale,
                      top: 96 * scale,
                      child: Text(
                        cardNumberController.text.isEmpty
                            ? '1234    5678    9101    1121'
                            : FormatCardPreview.formatCardNumberForPreview(
                                cardNumberController.text,
                              ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16 * scale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 15 * scale,
                      bottom: 23 * scale,
                      child: Text(
                        nameController.text.isEmpty
                            ? 'Brooklyn Simmo'
                            : nameController.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13 * scale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 15 * scale,
                      bottom: 23 * scale,
                      child: Text(
                        expirdController.text.isEmpty
                            ? '06/21'
                            : expirdController.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11 * scale,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
