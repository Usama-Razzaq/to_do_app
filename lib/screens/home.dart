import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import '../widgets/todo_item.dart';
import 'package:to_do_app/model/todo.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoLIst();
  final _todoController = TextEditingController();
  List<ToDo>_foundToDo = [];

  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                searchBox(),
                Expanded(
                  child: ListView(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          'All ToDos',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        )),
                    for (ToDo todooo in _foundToDo)
                      TodoItem(
                        todo: todooo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                  ] // children
                      ),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todoController,
                          decoration: InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none,
                          ),
                        ),
                  )
                  ),
                  // SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.only(bottom: 16, right: 40),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: tdBlue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        _addToDoItem(_todoController.text);
                      },
                      child: Text('+', style: TextStyle(fontSize: 30, color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: Size(55, 55),
                        // elevation: 10
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
  void _handleToDoChange(ToDo todo){

    setState((){
      todo.isDone = !todo.isDone;

    });
  } // _handleToDoChange
void _deleteToDoItem(String id) {
    setState(() {
    todosList.removeWhere((item)=> item.id == id);
    });
}//_deleteToDoItem

void _addToDoItem(String todo){

    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: todo
      ));
      _todoController.clear();
    });
  }// _addToDoItem

void _runFilter(String enteredKeyword){
    List<ToDo> result = [];
    if(enteredKeyword.isEmpty){
      result = todosList;
    }else{
      result = todosList.where((item)=>item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
      _foundToDo = result;
    });

}

}



searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      onChanged: (value)=> _runFilter(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
          maxHeight: 20,
          minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: tdGrey),
      ),
    ),
  );
}

AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    elevation: 0,
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/avatar.jpg'),
          radius: 20,
        )
      ],
    ),
  );
}
