import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xffffc600)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Task {
  final String taskname, subtask, tasktime, guid;
  final Color status;

  const Task(
      {this.taskname, this.subtask, this.tasktime, this.status, this.guid});
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Task> tasks = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      tasks.add(Task(
          taskname: 'Meeting',
          subtask: 'Room 408',
          tasktime: '12:30',
          status: Colors.red,
          guid: '111111'));
      tasks.add(Task(
          taskname: 'Monthly Reports',
          subtask: 'Room 408',
          tasktime: '14:30',
          status: Colors.yellow));
      tasks.add(Task(
          taskname: 'Call with Mike',
          subtask: 'Room 408',
          tasktime: '15:00',
          status: Colors.purple,
          guid: '111112'));
      tasks.add(Task(
          taskname: 'Update',
          subtask: 'Room 408',
          tasktime: '15:30',
          status: Colors.redAccent,
          guid: '111113'));
      tasks.add(Task(
          taskname: 'Email',
          subtask: 'Room 408',
          tasktime: '15:30',
          status: Colors.orange,
          guid: '111114'));

      tasks.add(Task(
          taskname: 'Meeting1',
          subtask: 'Room 408',
          tasktime: '12:30',
          status: Colors.red,
          guid: '111115'));
      tasks.add(Task(
          taskname: 'Monthly Reports1',
          subtask: 'Room 408',
          tasktime: '14:30',
          status: Colors.yellow,
          guid: '111116'));
      tasks.add(Task(
          taskname: 'Call with Mike1',
          subtask: 'Room 408',
          tasktime: '15:00',
          status: Colors.purple,
          guid: '111117'));
      tasks.add(Task(
          taskname: 'Update1',
          subtask: 'Room 408',
          tasktime: '15:30',
          status: Colors.redAccent,
          guid: '111118'));
      tasks.add(Task(
          taskname: 'Email1',
          subtask: 'Room 408',
          tasktime: '15:30',
          status: Colors.orange,
          guid: '111119'));

      tasks.add(Task(
          taskname: 'Meeting2',
          subtask: 'Room 408',
          tasktime: '12:30',
          status: Colors.red,
          guid: '111121'));
      tasks.add(Task(
          taskname: 'Monthly Reports2',
          subtask: 'Room 408',
          tasktime: '14:30',
          status: Colors.yellow,
          guid: '111122'));
      tasks.add(Task(
          taskname: 'Call with Mike2',
          subtask: 'Room 408',
          tasktime: '15:00',
          status: Colors.purple,
          guid: '111123'));
      tasks.add(Task(
          taskname: 'Update2',
          subtask: 'Room 408',
          tasktime: '15:30',
          status: Colors.redAccent,
          guid: '111124'));
      tasks.add(Task(
          taskname: 'Email2',
          subtask: 'Room 408',
          tasktime: '15:30',
          status: Colors.orange,
          guid: '111125'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0))),
                child: _myHeaderContent(),
              ),
            ),
            Positioned(
              top: 160.0,
              left: 18.0,
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 23, //380.0,
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, position) {
                      return Dismissible(
                          key: ValueKey(tasks[position]),
                          background:
                              _myHiddenContainer(tasks[position].status),
                          child: _myListContainer(
                              tasks[position].taskname,
                              tasks[position].subtask,
                              tasks[position].tasktime,
                              tasks[position].status),
                          onDismissed: (direction) {
                            // quét từ trái sang phải
                            if (direction == DismissDirection.startToEnd) {
                              var t = '';
                              if (tasks == null) {
                                t = 'task is null';
                              } else {
                                t = 'task=${tasks.length}';
                              }
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Delete $t')));

                              if (tasks.contains(tasks.removeAt(position))) {
                                setState(() {
                                  tasks.remove(tasks.removeAt(position));
                                });
                              }
                            }// quét từ phải sang trái 
                            else if (direction ==
                                DismissDirection.endToStart) {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Archive')));
                            }
                          });
                    }),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                final taskval = TextEditingController();
                final subval = TextEditingController();
                final tasktime = TextEditingController();

                Color taskColor;

                return AlertDialog(
                  title: Text('New Task'),
                  content: Container(
                    height: 250.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: TextField(
                          controller: subval,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Task title',
                              hintStyle: TextStyle(color: Colors.grey)),
                        )),
                        Container(
                            child: TextField(
                          controller: taskval,
                          obscureText: false,
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Sub Task',
                              hintStyle: TextStyle(color: Colors.grey)),
                        )),
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                taskColor = Colors.purple;
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                color: Colors.purple,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                taskColor = Colors.amber;
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                color: Colors.amber,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                taskColor = Colors.blue;
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                color: Colors.blue,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                taskColor = Colors.green;
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                color: Colors.green,
                              ),
                            )
                          ],
                        )),
                        Container(
                          child: TextField(
                            controller: tasktime,
                            obscureText: false,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Task Time',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: Color(0xff2da9ef),
                      child: Text('Add', style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        setState(() {
                          tasks.add(new Task(
                              taskname: taskval.text,
                              subtask: subval.text,
                              tasktime: tasktime.text,
                              status: taskColor,
                              guid: '11111000'));
                        });
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              });
        },
        backgroundColor: Color(0xff2da9ef),
        foregroundColor: Color(0xffffffff),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff2da9ef),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.stickyNote),
              onPressed: () {},
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _myHiddenContainer(Color taskColor) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: taskColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(FontAwesomeIcons.solidTrashAlt),
                  color: Colors.white,
                  onPressed: () {
                    print('-->delete 1');
                  })),
          Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  icon: Icon(FontAwesomeIcons.archive),
                  color: Colors.white,
                  onPressed: () {
                    print('-->delete 2');
                  })),
        ],
      ),
    );
  }

  Widget _myListContainer(
      String taskname, String subtask, String tasktime, Color taskcolor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80.0,
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          shadowColor: Color(0x802196F3),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: 10.0,
                  color: taskcolor,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            taskname,
                            style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            subtask,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Text(tasktime,
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black)))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myHeaderContent() {
    return Align(
      child: ListTile(
        leading: Text(
          '26',
          style: TextStyle(fontSize: 50.0, color: Colors.amber),
        ),
        title: Text(
          'Febuary',
          style: TextStyle(fontSize: 34.0, color: Colors.white),
        ),
        subtitle: Text(
          '2019',
          style: TextStyle(fontSize: 24.0, color: Colors.white),
        ),
      ),
    );
  }
}
