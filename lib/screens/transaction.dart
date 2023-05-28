import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unama_bank/controllers/balanceController.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  BalanceController balanceController = Get.put(BalanceController());

  String title = "";
  String pix = "";
  double amount = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferir',
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
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: Image.asset('assets/transaction_image.jpg'))),
                  const SizedBox(height: 40),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (text) {
                        title = text;
                      },
                      decoration: InputDecoration(
                          labelText: "Titulo da transferência",
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
                  const SizedBox(height: 20),
                  TextFormField(
                      onChanged: (text) {
                        pix = text;
                      },
                      decoration: InputDecoration(
                          labelText: "Chave Pix",
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
                  const SizedBox(height: 20),
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
                      if (title == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Titulo inválido.'),
                        ));
                      } else if (pix == "") {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Pix inválido.'),
                        ));
                      } else if (amount <= 0) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Valor inválido.'),
                        ));
                      } else if (amount > balanceController.balance.value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Saldo insuficiente.'),
                        ));
                      } else {
                        balanceController.balance.value -= amount;
                        balanceController.transactions.add(Transaction(
                            title: title, amount: amount * -1, pix: pix));

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
                      'Transferir',
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
