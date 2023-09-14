import 'package:flutter/material.dart';

class task_listTile extends StatelessWidget {
  const task_listTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              focusColor: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              title: Text(
                "Title will be here",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Subtitle will be here",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Chip(
                        label: Text("New"),
                        backgroundColor: Colors.blue,
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.edit)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
