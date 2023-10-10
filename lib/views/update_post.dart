import 'package:flutter/material.dart';
import 'package:mvvm_flutter/blocs/bloc/put_post_bloc/bloc/update_post_bloc.dart';
import 'package:mvvm_flutter/constants.dart';
import 'package:mvvm_flutter/models/post_model.dart';
import 'package:mvvm_flutter/repositry/repositry_api.dart';
import 'package:mvvm_flutter/view_models/update_post_view_model.dart';
import 'package:mvvm_flutter/view_models/view_post_model.dart';

class UpdatePost extends StatefulWidget {
final ViewPostModel postModel;
const UpdatePost({super.key, required this.postModel});

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  final TextEditingController to_Title = TextEditingController();
  final TextEditingController to_body = TextEditingController();
  var upgrade = PutPostViewModel(updatePostBloc: UpdatePostBloc(ApiRepositry()));

  @override
  void initState() {
    super.initState();
    to_Title.text = widget.postModel.title!;
    to_body.text = widget.postModel.body!;
  }
@override
  void dispose() {
    super.dispose();
    to_Title.dispose();
    to_body.dispose();
  }
late String title,body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppStyle.cardsColor[AppStyle.color],
      appBar: AppBar(
        elevation: 0,
         centerTitle: true,
         backgroundColor: AppStyle.mainColor,
        title: Text(upgrade.title,style: TextStyle(color: AppStyle.cardsColor[AppStyle.color]),),
        leading: myWidgetIcon(context),
      ),
      body: Padding(
        padding:const EdgeInsets.symmetric(horizontal:8.0,vertical: 10),
        child: Column(
          children: [
            TextField(
              maxLines: 3,
              controller: to_Title,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: widget.postModel.title,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height:7),
            Expanded(
              child: TextField(
                maxLines: null,
                controller: to_body,
                decoration: InputDecoration(
                  labelText: 'Body',
                  hintText: widget.postModel.body,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
           const SizedBox(height: 10,),
           ElevatedButton.icon(
             style: ElevatedButton.styleFrom(
              backgroundColor:kBackGroundButton,
              shape:const StadiumBorder()
            ),
            onPressed: ()async{
              var post = ViewPostModel(
                postModel: PostModel(
                id: widget.postModel.id,
                title: to_Title.text,
                body: to_body.text,
              ),);
               await upgrade.updateMyPost(post);
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${post.id}"),backgroundColor: Colors.orange,));
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
              print(post);
            },
            label: Text(kSave,style: TextStyle(color: AppStyle.cardsColor[AppStyle.color],),),
            icon:  Icon(Icons.save,color: AppStyle.cardsColor[AppStyle.color],),
            
            ),
          ],
        ),
      ),
    );
  }
}