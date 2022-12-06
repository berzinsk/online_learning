import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';

enum PinStatus {
  success,
  failure,
}

class PaymentPinEntry extends StatefulWidget {
  final Function(PinStatus) onPinEntered;

  const PaymentPinEntry({
    super.key,
    required this.onPinEntered,
  });

  @override
  State<PaymentPinEntry> createState() => _PaymentPinEntryState();
}

class _PaymentPinEntryState extends State<PaymentPinEntry> {
  final _pinList = <String>[];

  bool _pinItemExists(int index) => _pinList.asMap().containsKey(index);

  void _onAddPress(int number) {
    if (_pinList.length > 5) {
      return;
    }

    setState(() {
      _pinList.add('$number');
    });
  }

  void _onRemovePressed() {
    if (_pinList.isEmpty) {
      return;
    }

    setState(() {
      _pinList.removeLast();
    });
  }

  void _onNumberPress(NumpadKeyType type) {
    switch (type) {
      case NumpadKeyType.empty:
        break;
      case NumpadKeyType.backspace:
        _onRemovePressed();
        break;
      default:
        _onAddPress(_mapKeyNumber(type));
        break;
    }
  }

  int _mapKeyNumber(NumpadKeyType type) {
    switch (type) {
      case NumpadKeyType.zero:
        return 0;
      case NumpadKeyType.one:
        return 1;
      case NumpadKeyType.two:
        return 2;
      case NumpadKeyType.three:
        return 3;
      case NumpadKeyType.four:
        return 4;
      case NumpadKeyType.five:
        return 5;
      case NumpadKeyType.six:
        return 6;
      case NumpadKeyType.seven:
        return 7;
      case NumpadKeyType.eight:
        return 8;
      case NumpadKeyType.nine:
        return 9;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'Payment Password',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.kDarkBlue),
          ),
          Text(
            'Please enter the payment password',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.kPrimaryTextGray),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PinEntryBox(
                  filled: _pinItemExists(0),
                ),
                PinEntryBox(
                  filled: _pinItemExists(1),
                ),
                PinEntryBox(
                  filled: _pinItemExists(2),
                ),
                PinEntryBox(
                  filled: _pinItemExists(3),
                ),
                PinEntryBox(
                  filled: _pinItemExists(4),
                ),
                PinEntryBox(
                  filled: _pinItemExists(5),
                ),
              ],
            ),
          ),
          Column(
            children: [
              NumberPadRow(
                onNumberPress: _onNumberPress,
                showBottomPadding: true,
                numbers: const [
                  NumpadKeyType.one,
                  NumpadKeyType.two,
                  NumpadKeyType.three,
                ],
              ),
              NumberPadRow(
                onNumberPress: _onNumberPress,
                showBottomPadding: true,
                numbers: const [
                  NumpadKeyType.four,
                  NumpadKeyType.five,
                  NumpadKeyType.six,
                ],
              ),
              NumberPadRow(
                onNumberPress: _onNumberPress,
                showBottomPadding: true,
                numbers: const [
                  NumpadKeyType.seven,
                  NumpadKeyType.eight,
                  NumpadKeyType.nine,
                ],
              ),
              NumberPadRow(
                onNumberPress: _onNumberPress,
                numbers: const [
                  NumpadKeyType.empty,
                  NumpadKeyType.zero,
                  NumpadKeyType.backspace,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum NumpadKeyType {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  empty,
  backspace,
}

class NumberPadRow extends StatelessWidget {
  final List<NumpadKeyType> numbers;
  final bool showBottomPadding;
  final Function(NumpadKeyType) onNumberPress;

  const NumberPadRow({
    Key? key,
    required this.numbers,
    this.showBottomPadding = false,
    required this.onNumberPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: showBottomPadding ? 16 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NumpadKey(
            type: numbers[0],
            onKeyPress: onNumberPress,
          ),
          NumpadKey(
            type: numbers[1],
            onKeyPress: onNumberPress,
          ),
          NumpadKey(
            type: numbers[2],
            onKeyPress: onNumberPress,
          ),
        ],
      ),
    );
  }
}

class NumpadKey extends StatelessWidget {
  final NumpadKeyType type;
  final Function(NumpadKeyType) onKeyPress;

  const NumpadKey({
    Key? key,
    required this.type,
    required this.onKeyPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: type == NumpadKeyType.empty
            ? null
            : () {
                onKeyPress(type);
              },
        child: _buildNumberKey(context, type),
      ),
    );
  }

  Widget _buildNumberKey(BuildContext context, NumpadKeyType type) {
    switch (type) {
      case NumpadKeyType.backspace:
        return Icon(
          Icons.backspace,
          color: AppColors.kDarkBlue,
        );
      case NumpadKeyType.empty:
        return const SizedBox.shrink();
      default:
        final number = _mapKeyNumber(type);
        return Text(
          '$number',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: AppColors.kDarkBlue),
        );
    }
  }

  int _mapKeyNumber(NumpadKeyType type) {
    switch (type) {
      case NumpadKeyType.zero:
        return 0;
      case NumpadKeyType.one:
        return 1;
      case NumpadKeyType.two:
        return 2;
      case NumpadKeyType.three:
        return 3;
      case NumpadKeyType.four:
        return 4;
      case NumpadKeyType.five:
        return 5;
      case NumpadKeyType.six:
        return 6;
      case NumpadKeyType.seven:
        return 7;
      case NumpadKeyType.eight:
        return 8;
      case NumpadKeyType.nine:
        return 9;
      default:
        return 0;
    }
  }
}

class PinEntryBox extends StatelessWidget {
  final bool filled;

  const PinEntryBox({
    Key? key,
    this.filled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 44),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.kShadow,
        ),
      ),
      child: filled
          ? const Center(
              child: Image(
                image: AssetImage('asset/images/icon_pin_filled.png'),
              ),
            )
          : null,
    );
  }
}
