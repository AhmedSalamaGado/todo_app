class TodoDm{
  static String collectionName="todos";
  String id;
  String title;
  String discription;
  DateTime time;
  bool isDone;

  TodoDm({required this.id,required this.title,required this.discription,required this.time,required this.isDone});
}