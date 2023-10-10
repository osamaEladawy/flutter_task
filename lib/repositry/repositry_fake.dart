 //     BlocBuilder<PostsBlocBloc, PostsBlocState>(builder: (context, state) {
      //   if (state is PostsBlocLoading) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      //   if (state is PostsBlocLoaded) {
      //     return ListView.builder(
      //       itemCount: state.posts.length,
      //       itemBuilder: (context, index) {
      //         return Dismissible(
      //           key: UniqueKey(),
      //           onDismissed: (direction) async {
      //           var result = await textHome.deleteMyPost(state.posts[index]);
      //           // ignore: use_build_context_synchronously
      //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$result"))); 
      //            print(result);
      //           },
      //           child: Card(
      //             child: ListTile(
      //               onTap: () async{
      //                await textHome.nextScreen(context,ViewPostPage(data:state.posts[index]),);
                    
      //               },
      //               leading:  IconButton(
      //                 onPressed: () async{
      //                var result = await textHome.nextScreen(context,  UpdatePost(postModel: state.posts[index],));
      //                setState(() {
      //                  result;
      //                });
      //                 },
      //                 icon: const Icon(Icons.edit, color: Colors.greenAccent),),
      //               title: Text("${state.posts[index].title}",
      //                   textAlign: TextAlign.center,
      //                   style: const TextStyle(
      //                       color: Colors.red,
      //                       fontSize: 18,
      //                       fontWeight: FontWeight.bold)),
      //               subtitle: Text(
      //                 "${state.posts[index].body}",
      //                 style: const TextStyle(
      //                     fontSize: 16,
      //                     fontWeight: FontWeight.bold,
      //                     color: Colors.green),
      //               ),
      //               trailing: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: [
      //                   Expanded(
      //                     child: Container(
      //                       alignment: Alignment.center,
      //                       height: 27,
      //                       width: 70,
      //                       decoration: BoxDecoration(
      //                         color: Colors.greenAccent,
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       child: Text(
      //                         "useId : ${state.posts[index].userId}",
      //                         textAlign: TextAlign.center,
      //                         style: const TextStyle(
      //                             fontSize: 16,
      //                             fontWeight: FontWeight.bold,
      //                             color: Colors.black),
      //                       ),
      //                     ),
      //                   ),
      //                   //const SizedBox(height:10),
      //                  const Spacer(),
      //                   Expanded(
      //                     child: Container(
      //                         alignment: Alignment.center,
      //                         height: 27,
      //                         width: 70,
      //                         decoration: BoxDecoration(
      //                           color: Colors.greenAccent,
      //                           borderRadius: BorderRadius.circular(10),
      //                         ),
      //                         child: Text(
      //                           "id : ${state.posts[index].id}",
      //                           style: const TextStyle(
      //                               fontSize: 16,
      //                               fontWeight: FontWeight.bold,
      //                               color: Colors.black),
      //                         )),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   }
      //   return const Center(child: Text("error loading..."));
      // }),