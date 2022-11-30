import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import 'bloc/users_bloc.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UsersBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<UsersBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.usersPostScreen);
              })
        ],
      ),
      body: BlocListener<UsersBloc, UsersState>(
          listener: (context, state) {},
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              if (state is UsersLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UsersFailureState) {
                return Text(bloc.message);
              } else if (state is UsersLoadedState) {
                return SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(bloc.supportText),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: bloc.usersDataList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Id:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(bloc
                                              .usersDataList[index].id
                                              .toString()),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                              bloc.usersDataList[index].email),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "First Name: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(bloc
                                              .usersDataList[index].firstName),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Last Name: ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Expanded(
                                          flex: 2,
                                          child: Text(bloc
                                              .usersDataList[index].lastName),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }

              return Container();
            },
          )),
    );
  }
}
