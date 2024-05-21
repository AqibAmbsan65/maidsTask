import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zohatech/Const/App_Navigation/App_navigation.dart';
import 'package:zohatech/Const/Colors/App_Colors.dart';
import 'package:zohatech/Const/Strings/App_Strings.dart';
import 'package:zohatech/Const/Utiles/Utiles.dart';
import 'package:zohatech/GlobleWidgets/CustomText.dart';
import 'package:zohatech/Network/Auth/CoreController.dart';
import 'package:zohatech/Network/User_perference/User_Preference_View_Model.dart';
import 'package:zohatech/Screens/Home/Model/TodoModel.dart';
import 'package:zohatech/Screens/Home/Widgets/MyDrawer.dart';
import '../Widgets/AddEditWidget.dart';
import '../Widgets/ListItem.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController todoMessage = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    CoreController.i.Todo(context: context);
  }

  @override
  Widget build(BuildContext context) {
    print(SharedPreference().getBearerToken());

    return Scaffold(
        backgroundColor: App_Colors.forthColor,
        appBar: AppBar(
          backgroundColor: App_Colors.secondaryColor,
          title: CustomText(
              text: "Todo",
              textcolor: App_Colors.THEME_COLOR_BLACK,
              weight: FontWeight.bold,
              fontsize: 20),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //
          //       },
          //       icon: Icon(
          //         Icons.logout,
          //         color: App_Colors.THEME_COLOR_BLACK,
          //         size: 28,
          //       ))
          // ],
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            utiles.showDialogs(
                context: context,
                widget: AddEditWidget(
                  mainTitle: AppStrings.AddTodo,
                  fromKey: _fromKey,
                  todoMessage: todoMessage,
                  saveontap: () {
                    if (_fromKey.currentState!.validate()) {
                      AppNavigation.navigateCloseDialog(context);
                      CoreController.i.todoModel.value.todos?.insert(
                          0,
                          Todos(
                              id: 1,
                              todo: todoMessage.text,
                              completed: true,
                              userId: SharedPreference().getUser()!.id));
                      CoreController.i.todoModel.refresh();
                      todoMessage.clear();
                    }
                  },
                ));
          },
          backgroundColor: App_Colors.primaryColor,
          child: const Icon(
            Icons.add,
            color: App_Colors.THEME_COLOR_WHITE,
            size: 32,
          ),
        ),
        body: Obx(() => RefreshIndicator(

          onRefresh: () async{
            await CoreController.i.Todo(context: context);
          },
          child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: CoreController.i.todoModel.value.todos?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(
                    editontap: () {
                      todoMessage.text =
                          CoreController.i.todoModel.value.todos![index].todo!;

                      utiles.showDialogs(
                          context: context,
                          widget: AddEditWidget(
                            mainTitle: AppStrings.EditTodo,
                            fromKey: _fromKey,
                            todoMessage: todoMessage,
                            saveontap: () {
                              if (_fromKey.currentState!.validate()) {
                                AppNavigation.navigateCloseDialog(context);
                                CoreController.i.todoModel.value.todos?[index]
                                    .todo = todoMessage.text;
                                CoreController.i.todoModel.value.todos?[index]
                                    .completed = true;
                                CoreController.i.todoModel.refresh();
                              }
                            },
                          ));
                    },
                    deleteontap: () {
                      print(CoreController.i.todoModel.value.todos?[index].id);
                      CoreController.i.todoModel.value.todos?.removeAt(index);
                      CoreController.i.todoModel.refresh();
                    },
                    status:
                        CoreController.i.todoModel.value.todos?[index].completed,
                    todo:
                        "${CoreController.i.todoModel.value.todos?[index].todo}",
                  );
                },
              ),
        )));
  }
}


