import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/data/modiuls/network_response.dart';
import 'package:task_manager_project/ui/data/service/network_caller.dart';
import 'package:task_manager_project/ui/widgets/screen_background.dart';
import 'package:task_manager_project/ui/widgets/user_profile_banner.dart';
import '../data/utils/urls.dart';
class AddNewTask extends StatefulWidget {
  AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController _titleTEController = TextEditingController();

  TextEditingController _descriptionTEController = TextEditingController();

  bool _addNewTaskInProgress = false;

  Future<void> addNewTask() async {
    _addNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String,dynamic> requestBody ={
      "title":_titleTEController.text.trim(),
      "description":_descriptionTEController.text.trim(),
      "status":"New"
    };
    final NetworkResponse response = await NetworkCaller().postResponse(Urls.createTask, requestBody);
    _addNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if(response.isSuccess){
      _titleTEController.clear();
      _descriptionTEController.clear();
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task Add Successfully!!")));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task Add Faild!!")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user_profile_banner(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add new task",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _titleTEController,
                        decoration: InputDecoration(hintText: "Title"),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _descriptionTEController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "Description",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _addNewTaskInProgress==false,
                          replacement: const Center(child: CircularProgressIndicator(),),
                          child: ElevatedButton(
                            onPressed: () {
                              addNewTask();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
