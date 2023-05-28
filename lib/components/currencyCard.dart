import 'package:flutter/cupertino.dart';

class CurrencyCard extends StatelessWidget {
  final String currencyTitle;
  final double currencyPrice;

  const CurrencyCard(
      {required this.currencyTitle, required this.currencyPrice, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(7),
        child: Column(children: [
          Text(
            currencyTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'R\$ ${currencyPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ]),
      ),
    );
  }
}
