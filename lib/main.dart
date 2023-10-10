import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/blocs/bloc/add_post_bloc/bloc/add_post_bloc.dart';
import 'package:mvvm_flutter/blocs/bloc/delete_post_bloc/delete_post_bloc.dart';
import 'package:mvvm_flutter/blocs/bloc/more_posts_bloc/posts_bloc_bloc.dart';
import 'package:mvvm_flutter/blocs/bloc/put_post_bloc/bloc/update_post_bloc.dart';
import 'package:mvvm_flutter/repositry/repositry_api.dart';
import 'package:mvvm_flutter/views/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider<PostsBlocBloc>(
          create: (context) => PostsBlocBloc(ApiRepositry())..add(FetchData(), ),),
          BlocProvider<AddPostBloc>(create: (context)=>AddPostBloc(ApiRepositry(),)..add(PostAdded()),
          ),
          BlocProvider<DeletePostBloc>(create: (context)=>DeletePostBloc(ApiRepositry(),)..add(DeleteMyPost()),),
          BlocProvider<UpdatePostBloc>(create: (context)=>UpdatePostBloc(ApiRepositry(),)..add(UpdateMyPost()),),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(), 
      ),
    );
  }
}
