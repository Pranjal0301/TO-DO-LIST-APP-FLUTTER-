import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO LIST!',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),

    );
  }

}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' TO DO ?? '),
      ),
      body: Column(
        children: [
          Progress(),
          const MyStatefulWidget(),


        ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Added onPressed code here!


        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),

    );

  }

}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Progress Bar!!!! '),
        LinearProgressIndicator(value: 0.2),
      ],
    );
  }
}



class TaskItem extends StatefulWidget {
  final String label;

  TaskItem({Key? key, required this.label}) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _value = newValue),
          value: _value,
        ),
        Text(widget.label),
      ],
    );
  }
}
/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const int numItems = 10;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Number'),
          ),
        ],
        rows: List<DataRow>.generate(
          numItems,
              (int index) => DataRow(


            cells: <DataCell>[DataCell(Text('Task $index'))],
            selected: selected[index],
            onSelectChanged: (bool? value) {

              setState(() {
                selected[index] = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}

