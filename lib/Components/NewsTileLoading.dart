import 'package:flutter/material.dart';

import 'LoadingContainer.dart';

class Newstileloading extends StatelessWidget {
  const Newstileloading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(
        children: [
          Loadingcontainer(width: MediaQuery.of(context).size.width/3, height: 120),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Loadingcontainer(width: 30, height: 30),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(child: Loadingcontainer(width: MediaQuery.of(context).size.width/3, height: 10)),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Loadingcontainer(width: MediaQuery.of(context).size.width/3, height: 10),
                const SizedBox(
                  height: 5,
                ),
                Loadingcontainer(width: MediaQuery.of(context).size.width/5, height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
