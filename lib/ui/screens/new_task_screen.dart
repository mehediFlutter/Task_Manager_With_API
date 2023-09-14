import 'package:flutter/material.dart';
import 'package:task_manager_project/ui/data/modiuls/network_response.dart';
import 'package:task_manager_project/ui/data/service/network_caller.dart';
import 'package:task_manager_project/ui/screens/add_new_task.dart';
import 'package:task_manager_project/ui/widgets/summary_card.dart';
import 'package:task_manager_project/ui/widgets/task_listTile.dart';
import 'package:task_manager_project/ui/widgets/user_profile_banner.dart';
import '../data/modiuls/summary_count_model.dart';
import '../data/utils/urls.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  SummaryCountModel _summaryCountModel = SummaryCountModel();
  bool _getCountSummaryInProgress = false;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {getCountSummary();});
  }

  Future<void> getCountSummary() async {
    _getCountSummaryInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response = await NetworkCaller().getResponse(Urls.taskStatusCount);
    if(response.isSuccess){
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Summary Data Get Faild!!")));
    }
    _getCountSummaryInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            const user_profile_banner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:_getCountSummaryInProgress? const LinearProgressIndicator(): const Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      number: 123,
                      title: "New",
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      number: 123,
                      title: "Progress",
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      number: 123,
                      title: "Cancel",
                    ),
                  ),
                  Expanded(
                    child: SummaryCard(
                      number: 123,
                      title: "Complete",
                    ),
                  ),
                ],
              ),
            ),
            const task_listTile(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTask(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
