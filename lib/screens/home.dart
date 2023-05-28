import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unama_bank/components/currencyCard.dart';
import 'package:unama_bank/controllers/balanceController.dart';
import 'package:unama_bank/models/currencyResponse.dart';
import 'package:unama_bank/services/getCurrencyPrices.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "ShoesBank",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<CurrencyResponse>(
        future: getCurrency(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar. ${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            return _HomePage(
              btc: snapshot.data!.results!.currencies!.btc!.buy ?? 0.0,
              eur: snapshot.data!.results!.currencies!.eur!.buy ?? 0.0,
              usd: snapshot.data!.results!.currencies!.usd!.buy ?? 0.0,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  BalanceController balanceController = Get.put(BalanceController());
  double usd = 0.0;
  double eur = 0.0;
  double btc = 0.0;

  _HomePage({required this.usd, required this.eur, required this.btc});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient:
                  const LinearGradient(colors: [Colors.black, Colors.black87]),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 48, 24, 48),
              child: Column(
                children: [
                  const Row(children: <Widget>[
                    Text(
                      'Saldo',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ]),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          "R\$ ${balanceController.balance.value.toStringAsFixed(2)}",
                          style: TextStyle(
                              fontSize: 32, color: Colors.green.shade300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/transaction');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  height: 48,
                  child: const Text(
                    'Transferir',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/deposit');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  height: 48,
                  child: const Text(
                    'Depositar',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(color: Colors.grey.shade600),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    "Cotação do dia",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  const Spacer(),
                  MaterialButton(
                    child: const Icon(Icons.share_rounded),
                    onPressed: () {
                      Share.share(
                          'Se liga na cotação de hoje! Dolar: R\$ ${usd.toStringAsFixed(2)} | Euro: R\$ ${eur.toStringAsFixed(2)} | Bitcoin: R\$ ${btc.toStringAsFixed(2)}');
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: [
                CurrencyCard(currencyTitle: 'USD', currencyPrice: usd),
                const SizedBox(
                  width: 8,
                ),
                CurrencyCard(currencyTitle: 'EUR', currencyPrice: eur),
                const SizedBox(
                  width: 8,
                ),
                CurrencyCard(currencyTitle: 'BTC', currencyPrice: btc)
              ]),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Divider(color: Colors.grey.shade600),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: <Widget>[
              Text(
                'Transações recentes',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700),
              )
            ],
          ),
          Obx(
            () => balanceController.transactions.isNotEmpty
                ? ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.attach_money,
                          color: Colors.black,
                        ),
                        title: Text(
                          List.from(balanceController.transactions.reversed)[
                                  index]
                              .title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        trailing: Text(
                          "R\$ ${List.from(balanceController.transactions.reversed)[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: List.from(balanceController
                                              .transactions.reversed)[index]
                                          .amount <
                                      0
                                  ? Colors.red
                                  : Colors.green.shade800,
                              fontSize: 18),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) =>
                        Divider(color: Colors.grey.shade600),
                    itemCount: balanceController.transactions.length,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 64),
                    child: Text(
                      'Nenhuma transação recente.',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade500),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
