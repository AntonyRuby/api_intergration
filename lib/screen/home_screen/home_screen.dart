import 'package:bloc_counter/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_counter/screen/home_screen/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../router.dart';

class HomeScreen extends StatefulWidget {
  AuthenticationBloc authBloc;
  HomeScreen(this.authBloc);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CounterBloc bloc;
  final TextEditingController _textEditingController = TextEditingController();
  int number = 0;

  @override
  void initState() {
    bloc = CounterBloc()..add(CounterInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is SecondScreenNavigationState) {
            Navigator.pushNamed(context, AppRoutes.secondScreen);
          }
        },
        bloc: bloc,
        child: BlocBuilder<CounterBloc, CounterState>(
            bloc: bloc,
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("HomePage"),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.forward),
                        onPressed: () {
                          // bloc.add(SecondScreenNavigationEvent());
                          Navigator.pushNamed(context, AppRoutes.secondScreen);
                        })
                  ],
                  backgroundColor: Colors.pink,
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
