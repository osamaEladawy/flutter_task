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
      backgroundColor: AppStyle.cardsColor[AppStyle.color],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppStyle.mainColor,
        title: Text(
          addPost.title,
          style: TextStyle(color: AppStyle.cardsColor[AppStyle.color]),
        ),
        leading: myWidgetIcon(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              maxLines: 3,
              controller: to_Title,
              decoration: const InputDecoration(
                labelText: kTitle,
                hintText: kHintTextTitle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                style: TextStyle(color: AppStyle.cardsColor[AppStyle.color]),
              ), icon:  Icon(Icons.save,color: AppStyle.cardsColor[AppStyle.color],),
            ),
          ],
        ),
      ),
    );
  }
}
