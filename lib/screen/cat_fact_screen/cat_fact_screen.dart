import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../router.dart';
import 'bloc/catfact_bloc.dart';

class CatFactScreen extends StatefulWidget {
  @override
  _CatFactScreenState createState() => _CatFactScreenState();
}

class _CatFactScreenState extends State<CatFactScreen> {
  CatFactBloc catFactBloc;
  @override
  void initState() {
    catFactBloc = BlocProvider.of<CatFactBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Fact"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.usersScreen);
              })
        ],
      ),
      body: BlocListener<CatFactBloc, CatFactState>(
          listener: (context, state) {},
          child: BlocBuilder<CatFactBloc, CatFactState>(
            // bloc: catFactBloc,
            builder: (context, state) {
              if (state is CatFactLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CatFactFailureState) {
                return Center(
                  child: Text(catFactBloc.message),
                );
              } else if (state is CatFactLoadedState) {
                return SafeArea(
                    child: ListView.builder(
                        itemCount: catFactBloc.catfactList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Id:  ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            catFactBloc.catfactList[index].id)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Created At:  ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(catFactBloc
                                            .catfactList[index].createdAt)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Updated At:  ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(catFactBloc
                                            .catfactList[index].updatedAt)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Source: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(catFactBloc
                                            .catfactList[index].source)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Text: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        catFactBloc.catfactList[index].text,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "User: ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(catFactBloc
                                            .catfactList[index].user)),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }));
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
