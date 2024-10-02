import 'package:flutter/material.dart';


class Newstile extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String time;
  final String Author;
  final VoidCallback ontap;

  const Newstile({super.key, required this.imageUrl, required this.title, required this.time, required this.Author, required this.ontap,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.background),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageUrl,fit: BoxFit.cover,)),

            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 15,
                        child: Text(Author![0]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(child: Text(Author)),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                   Text(
                    title,style: TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(time,style: Theme.of(context).textTheme.labelSmall,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
