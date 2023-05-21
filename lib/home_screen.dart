import 'package:flutter/material.dart';
import 'dart:math';

class Lottery extends StatefulWidget {
  const Lottery({super.key});

  @override
  State<Lottery> createState() => _LotteryState();
}

class _LotteryState extends State<Lottery> {
  int lotteryWinningNumber = 4;
  var lotteryNumber = Random().nextInt(10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lottery App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Text(
                    "Lottery Winning Number is $lotteryWinningNumber",
                    style:
                    const TextStyle(fontSize: 22, color: Colors.lightBlue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: lotteryNumber == lotteryWinningNumber
                        ? Column(
                      children: [
                        Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Congratulations! \nYou won the lottery!!!",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blueGrey),
                        ),
                      ],
                    )
                        : Column(
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Your Lottery Number is $lotteryNumber. \nPlease try again later...",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: lotteryNumber == lotteryWinningNumber
                            ? Colors.greenAccent.withOpacity(0.3)
                            : Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            lotteryNumber = lotteryNumber.toInt();
            lotteryNumber = Random().nextInt(10);
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}