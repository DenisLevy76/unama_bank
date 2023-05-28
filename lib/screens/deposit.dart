import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unama_bank/controllers/balanceController.dart';

class Deposit extends StatefulWidget {
  const Deposit({super.key});

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  BalanceController balanceController = Get.put(BalanceController());

  String title = "";
  String pix = "";
  double amount = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Depositar',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(seconds: 1),
                      child: Image.asset('assets/11671915_13196.jpg')),
                  const SizedBox(height: 40),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        amount = text != '' ? double.parse(text) : 0;
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.attach_money),
                          prefixIconColor: Colors.black,
                          labelText: "Valor",
                          labelStyle: const TextStyle(fontSize: 18),
                          floatingLabelStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2)),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(height: 40),
                  MaterialButton(
                    onPressed: () {
                      if (amount <= 0) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Valor inválido.'),
                        ));
                      } else {
                        balanceController.balance.value += amount;
                        balanceController.transactions.add(Transaction(
                            title: 'Deposito', amount: amount, pix: ''));

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Transação realizada com sucesso.'),
                        ));
                        Navigator.of(context).pop();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    height: 48,
                    child: const Text(
                      'Depositar',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
