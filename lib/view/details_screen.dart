import 'package:covid_19_tracker/view/world_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailsScreen extends StatefulWidget {
  String image;
  String name;
  int totalCase, totalDeaths, totalRecovered, active, critical, todayRecovered, test;
  DetailsScreen({
    required this.image,
    required this.name,
    required this.totalCase,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * .06,),
                      ReusableRow(title: "Cases", value: widget.totalCase.toString()),
                      ReusableRow(title: "Recovered", value: widget.totalRecovered.toString()),
                      ReusableRow(title: "Death", value: widget.totalDeaths.toString()),
                      ReusableRow(title: "Active", value: widget.active.toString()),
                      ReusableRow(title: "Test", value: widget.test.toString()),
                      ReusableRow(title: "Critical", value: widget.critical.toString()),
                      ReusableRow(title: "Today Recover", value: widget.todayRecovered.toString()),
                    ],
                  ),
                ),
              ),

              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              ),
            ],
          )
        ],
      ),
    );
  }
}