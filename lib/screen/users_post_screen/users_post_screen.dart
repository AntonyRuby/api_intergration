import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import 'bloc/userspost_bloc.dart';

class UsersPostScreen extends StatefulWidget {
  @override
  _UsersPostScreenState createState() => _UsersPostScreenState();
}

class _UsersPostScreenState extends State<UsersPostScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _jobController = TextEditingController();
  UsersPostBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<UsersPostBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Post Data"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.usersapiScreen);
              })
        ],
      ),
      body: BlocListener<UsersPostBloc, UsersPostState>(
        listener: (context, state) {},
        child: BlocBuilder<UsersPostBloc, UsersPostState>(
          builder: (context, state) {
            if (state is UsersPostFailureState) {
              return Text("");
            } else if (state is UsersPostSuccessState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("Id: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.id),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("Name: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.name),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("Job: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.job),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: Text("CreatedAt: ")),
                          Expanded(
                            flex: 2,
                            child: Text(bloc.userspost.createdAt),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is UsersPostLoadingState) {
              Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersPostInitialState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Name"),
                        controller: _nameController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(hintText: "Job"),
                        controller: _jobController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                          child: Text("Submit"),
                          color: Colors.green,
                          onPressed: () async {
                            String name = _nameController.text;
                            String job = _jobController.text;
                            bloc.add(UsersPostSubmitEvent(name, job));
                          }),
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
