import 'package:flutter/material.dart';
import 'package:mvvm_flutter/blocs/bloc/add_post_bloc/bloc/add_post_bloc.dart';
import 'package:mvvm_flutter/constants.dart';
import 'package:mvvm_flutter/models/post_model.dart';
import 'package:mvvm_flutter/repositry/repositry_api.dart';
import 'package:mvvm_flutter/view_models/add_post_view_model.dart';

class ADDPost extends StatefulWidget {
  const ADDPost({super.key});

  @override
  State<ADDPost> createState() => _ADDPostState();
}

class _ADDPostState extends State<ADDPost> {
  final TextEditingController to_Title = TextEditingController();
  final TextEditingController to_Body = TextEditingController();
  final addPost = ADDPostViewModel(
    postBloc: AddPostBloc(
      ApiRepositry(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[9],
      body: SafeArea(
        child: Card(
          color:AppStyle.cardsColor[9],
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
                      Text("Add Post",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppStyle.cardsColor[0],),),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                TextField(
                  maxLines: 3,
                  controller: to_Title,
                  decoration: const InputDecoration(
                    labelText: kTitle,
                    hintText: kHintTextTitle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: TextField(
                    maxLines: null,
                    controller: to_Body,
                    decoration: const InputDecoration(
                      labelText: kBody,
                      hintText: kHintTextBody,
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.all(Radius.circular(20)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kBackGroundButton,
                      shape: const StadiumBorder()),
                  onPressed: () async {
                    var post = PostModel(
                      title: to_Title.text,
                      body: to_Body.text,
                    );
                    var result = await addPost.addMyPost(post);
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${result.id}"),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pop();
                    print(result);
                  },
                  label: Text(
                    kSave,
                    style: TextStyle(color: AppStyle.cardsColor[0]),
                  ), icon:  Icon(Icons.save,color: AppStyle.cardsColor[0],),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
