import 'package:flutter/material.dart';

import 'LoadingContainer.dart';

class Trendingloading extends StatelessWidget {
  const Trendingloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(10),
        //height: 300,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
          //image: NetworkImage('',),
        ),
        child: Column(
          children: [
            Loadingcontainer(width: MediaQuery.of(context).size.width, height: 200),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Loadingcontainer(width: MediaQuery.of(context).size.width/2, height: 10),
                Loadingcontainer(width: MediaQuery.of(context).size.width/10, height: 10),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child:  Loadingcontainer(width: MediaQuery.of(context).size.width/3, height: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Loadingcontainer(width: 30, height: 30),
                const SizedBox(
                  width: 15,
                ),
                Flexible(child:  Loadingcontainer(width: MediaQuery.of(context).size.width/5, height: 10),),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
