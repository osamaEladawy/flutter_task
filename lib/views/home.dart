//this page will be shown all data or information for users
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:mvvm_flutter/blocs/bloc/delete_post_bloc/delete_post_bloc.dart';
import 'package:mvvm_flutter/blocs/bloc/more_posts_bloc/posts_bloc_bloc.dart';
import 'package:mvvm_flutter/constants.dart';
import 'package:mvvm_flutter/repositry/repositry_api.dart';
import 'package:mvvm_flutter/view_models/delet_view_model.dart';
import 'package:mvvm_flutter/view_models/home_view_model.dart';
import 'package:mvvm_flutter/views/add_post.dart';
import 'package:mvvm_flutter/widgets/home_with_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textHome = TestHomeViewModel(DeleteViewModelWithHome(deletePostBloc: DeletePostBloc(ApiRepositry(),)), postsBlocBloc: PostsBlocBloc(ApiRepositry(),));

  Widget noInternetWithWidgte(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget>[
               const Text(
                 " No Internet Connection!\n please check your Internet connection"
                ,
                 style: TextStyle(
                   color: Colors.red,
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   overflow: TextOverflow.ellipsis,
                 ),
               ),
              const SizedBox(height:20),
              Image.asset("assets/images/undraw.png"),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.mainColor,
        onPressed:()async{
          var result =await textHome.nextScreen(context,const ADDPost(),);
          setState(() {
            result;
          });
        },
        child:const Icon(Icons.add),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult value, Widget child) {
        final bool connected = value != ConnectivityResult.none;
        if(connected){
         return MyHomeWithBody(textHome: textHome,);
        }else{
         return noInternetWithWidgte();
        }
      },
      child: const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}
