
 import 'dart:convert';
import '../Model/todo.dart';
 import 'package:http/http.dart' as http;

class TodoServices{

  Future<List<Todo>> getTodo()async{
    const url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      final todo = json.map((e) => Todo.fromMap(e)).toList();
      return todo;
    }
    throw "Something went wrong";
  }


 }