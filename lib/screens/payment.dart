import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../resources/constants/colors.dart';
import '../model/course.dart';
import '../components/shared/button_primary.dart';
import '../components/payment/payment_pin_entry.dart';

class Payment extends StatelessWidget {
  final Course? course;

  const Payment({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Payment Method',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: AppColors.kDarkBlue),
        ),
        leading: GestureDetector(
          child: const Icon(Icons.close, color: Colors.black),
          onTap: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${course?.price.toStringAsFixed(2)} €',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 36, color: AppColors.kDarkBlue),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 198,
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/payment_card.png'),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '... 4829',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white, fontSize: 18),
                        ),
                        Text(
                          'Balance',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                          '23 900.00 €',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    const Image(
                      image: AssetImage('asset/images/icon_card_type.png'),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  ButtonPrimary(
                    title: 'Pay Now',
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (context) {
                          return PaymentPinEntry(
                            onPinEntered: (result) {},
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
