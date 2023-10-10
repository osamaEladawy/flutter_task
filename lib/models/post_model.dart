class PostModel{
int? id;
int? userId;
String? title;
String? body;

PostModel({this.id, this.userId, this.title, this.body});

PostModel.fromJson(Map<String,dynamic> data){
   (
    id=data['id'] ,
    userId=data['userId'] ,
    title=data['title'] ,
    body=data['body'] ,
  );
}

  Map<String, dynamic> toJson() =>{
      'id':id,
      'userId':userId,
      'title':title,
      'body':body,
  };

  @override
  String toString() {
    return "id $id\n userId $userId\n title $title\n body $body";
  }
}