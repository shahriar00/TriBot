class Messege{
  String msg;
  final MessegeType messegeType; 

  Messege({required this.msg,required this.messegeType});
}
enum MessegeType{user,bot}