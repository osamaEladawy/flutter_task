import 'package:flutter/material.dart';
import 'package:mvvm_flutter/constants.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class ViewPostPage extends StatefulWidget {
final ViewPostModel data;

  const ViewPostPage({super.key, required this.data});
  @override
  State<ViewPostPage> createState() => _ViewPostPageState();
}

class _ViewPostPageState extends State<ViewPostPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppStyle.cardsColor[AppStyle.color],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.mainColor,
        centerTitle: true,
        leading: myWidgetIcon(context),
        title: Text(widget.data.titleAppBar,style: TextStyle(color: AppStyle.cardsColor[AppStyle.color]),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("${widget.data.title}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.red),),
             const SizedBox(height: 8,),
             Row(
              children: [
              const SizedBox(width:40),
              Container(
                alignment: Alignment.center,
                height: 27,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("useId : ${widget.data.userId}",textAlign: TextAlign.center,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                ),
                const SizedBox(width:15),
               Text('<==============>',style: TextStyle(color: AppStyle.mainColor,fontWeight: FontWeight.bold),
              ),
               const SizedBox(width:15),
              Container(
                 alignment: Alignment.center,
                height: 27,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("id : ${widget.data.id}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                ),
                ),
             ],
             ),
             const SizedBox(height: 8,),
              Expanded(child: Text("${widget.data.body}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 38, 157, 42)),),),
            ],
          ),
        ),
      ),
    );
  }
}