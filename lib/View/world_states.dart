import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = const <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .01,),
               PieChart(
                  dataMap: const {
                    "Total": 20,
                    "Recovered": 15,
                    "Deaths": 5,
                  },
                 chartRadius: MediaQuery.of(context).size.width / 2.3,
                 legendOptions: const LegendOptions(
                   legendPosition: LegendPosition.left,
                 ),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
               Padding(
                 padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .06),
                 child: Card(
                  child: Column(
                    children: [
                      ReusableRow(title: 'Total', value: '200',),
                      ReusableRow(title: "Total", value: '300'),
                      ReusableRow(title: "Total", value: '300'),
                      ReusableRow(title: "Total", value: '300'),
                    ],
                  ),
              ),
               ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff1aa260),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text("Track Countries"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(height: 5,)
        ],
      ),
    );
  }
}
