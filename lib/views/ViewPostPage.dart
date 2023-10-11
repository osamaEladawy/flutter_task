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
      backgroundColor: AppStyle.cardsColor[9],
      body: SafeArea(
        child: Card(
          color: AppStyle.cardsColor[9],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.orange,
                  ),
                  child: Row(
                    children: [
                      myWidgetIcon(context),
                      const SizedBox(width: 100,),
                      Text("Show Post",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:AppStyle.cardsColor[0],),),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Text("${widget.data.title}",textAlign: TextAlign.center,style:  TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color:AppStyle.mainColor),),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    const SizedBox(width:40),
                    Container(
                      alignment: Alignment.center,
                      height: 27,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
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
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("id : ${widget.data.id}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Expanded(child: Text("${widget.data.body}",style:  TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey[600]),),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}