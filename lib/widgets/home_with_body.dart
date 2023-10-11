import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/blocs/bloc/delete_post_bloc/delete_post_bloc.dart';
import 'package:mvvm_flutter/repositry/repositry_api.dart';
import 'package:mvvm_flutter/view_models/delet_view_model.dart';
import 'package:mvvm_flutter/view_models/home_view_model.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';
import 'package:mvvm_flutter/views/ViewPostPage.dart';
import 'package:mvvm_flutter/views/update_post.dart';

import '../constants.dart';

class MyHomeWithBody extends StatefulWidget {
final TestHomeViewModel textHome;
const MyHomeWithBody({super.key, required this.textHome});
  @override
  State<MyHomeWithBody> createState() => _MyHomeWithBodyState();
}

class _MyHomeWithBodyState extends State<MyHomeWithBody> {
  var delete = DeleteViewModelWithHome(deletePostBloc: DeletePostBloc(ApiRepositry(),));
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(25),),
                ),
                child: const Text("My Posts",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)),
            const SizedBox(height: 15,),
            Expanded(
              child: FutureBuilder<List<ViewPostModel>>(
                future:widget.textHome.fetchAllPosts(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if(snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  var posts = snapshot.data;
                  return ListView.builder(
                    itemCount: posts!.length,
                    itemBuilder: (context, index) {
                      return BlocBuilder<DeletePostBloc,DeletePostState>(
                        builder: (BuildContext context, state)=>Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction){
                            widget.textHome.deleteViewModelWithHome.deleteMyPost(posts[index]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            color: AppStyle.cardsColor[9],
                            child: ListTile(
                              onTap: () {
                                widget.textHome.nextScreen(context,ViewPostPage(data:posts[index]),);
                              },
                              leading:  IconButton(
                                onPressed: () async{
                                  ViewPostModel? result = await widget.textHome.nextScreen(context,  UpdatePost(postModel:posts[index],));
                                  setState(() {
                                    result;
                                  });
                                },
                                icon:  Icon(Icons.edit,color: AppStyle.mainColor,),),
                              title: Container(
                                margin:const EdgeInsets.symmetric(vertical: 10),
                                child: Text("${posts[index].title}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 7, 1, 0),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Text(
                                "${posts[index].body}",
                                style:  TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600]),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 27,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "useId : ${posts[index].userId}",
                                        textAlign: TextAlign.center,
                                        style:   TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 27,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "id : ${posts[index].id}",
                                        style: TextStyle(
                                            fontSize: 16.5,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[600] ),
                                      ),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}