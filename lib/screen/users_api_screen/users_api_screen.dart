import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/usersapi_bloc.dart';

class UsersAPIScreen extends StatefulWidget {
  @override
  _UsersAPIScreenState createState() => _UsersAPIScreenState();
}

class _UsersAPIScreenState extends State<UsersAPIScreen> {
  UsersapiBloc usersbloc;

  @override
  void initState() {
    usersbloc = BlocProvider.of<UsersapiBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
        backgroundColor: Colors.purple,
      ),
      body: BlocListener<UsersapiBloc, UsersapiState>(
          listener: (context, state) {},
          child: BlocBuilder<UsersapiBloc, UsersapiState>(
            builder: (context, state) {
              if (state is UsersapiLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is UsersapiFailureState) {
                return Center(child: Text(usersbloc.message));
              }
              if (state is UsersapiLoadedState) {
                return SafeArea(
                  child: ListView.builder(
                      itemCount: usersbloc.userslist.length,
                      itemBuilder: (context, index) {
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 1, child: Text("ID: ")),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                      usersbloc.userslist[index].id.toString()),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(flex: 1, child: Text("Name: ")),
                                Expanded(
                                    flex: 2,
                                    child:
                                        Text(usersbloc.userslist[index].name)),
                              ],
                            )
                          ],
                        );
                      }),
                );
              } else {
                return Container();
              }
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
