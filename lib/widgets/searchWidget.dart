import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/NewsController.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({super.key});

  @override
  Widget build(BuildContext context) {
    Newscontroller newscontroller = Get.put(Newscontroller());
    TextEditingController searchController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme
            .of(context)
            .colorScheme
            .primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search News...",
                fillColor: Theme
                    .of(context)
                    .colorScheme
                    .primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(()=> newscontroller.isGetNews.value?Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
            ),
            child: CircularProgressIndicator(
              color: Colors.white,
            ),

          ):InkWell(
            onTap: (){
              newscontroller.searchNews(searchController.text);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
              ),
              child: Icon(Icons.search),

            ),
          ),),


        ],
      ),
    );
  }
}

