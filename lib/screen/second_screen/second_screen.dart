import 'package:bloc_counter/screen/second_screen/bloc/secondscreen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  SecondscreenBloc bloc;
  int number = 0;

  @override
  void initState() {
    bloc = BlocProvider.of<SecondscreenBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SecondscreenBloc, SecondscreenState>(
        listener: (context, state) {},
        bloc: bloc,
        child: BlocBuilder<SecondscreenBloc, SecondscreenState>(
            bloc: bloc,
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("Second Screen"),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.forward),
                        onPressed: () {
                          // bloc.add(SecondScreenNavigationEvent());
                          Navigator.pushNamed(context, AppRoutes.weatherScreen);
                        })
                  ],
                  backgroundColor: Colors.blue,
                ),
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              number = int.parse(_textEditingController.text);
                            });
                          },
                          child: Text("Set",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              number += 1;
                            });
                          },
                          child: Text("Increment",
                              style: TextStyle(color: Colors.white)),
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              if (number != 0) {
                                number -= 1;
                              }
                            });
                          },
                          child: Text("Decrement",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    Text(number.toString())
                  ],
                )),
              );
            }));
  }
}
