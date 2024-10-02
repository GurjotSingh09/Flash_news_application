import 'package:flutter/material.dart';

import '../model/newsModel.dart';

class Trendingcards extends StatelessWidget {
  final String imageUrl;

  final String time;
  final String title;
  final String Author;
  final VoidCallback ontap;

  const Trendingcards({super.key, required this.imageUrl, required this.time, required this.title, required this.Author, required this.ontap});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ontap,
      child: Container(
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
              Container(
                height: 200,
                width: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Image.network(imageUrl,fit: BoxFit.cover,)),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "$time",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 20,
                    child: Text(Author![0]),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(child: Text('$Author',)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    );
  }
}
