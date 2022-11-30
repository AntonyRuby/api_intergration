import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_counter/http/repository/home_repository.dart';
import 'package:bloc_counter/models/cat_fact_model/cat_fact.dart';
import 'package:equatable/equatable.dart';
part 'catfact_event.dart';
part 'catfact_state.dart';

class CatFactBloc extends Bloc<CatFactEvent, CatFactState> {
  CatFactBloc() : super(CatFactInitialState());
  List<CatFact> catfactList = [];
  String message;

  @override
  Stream<CatFactState> mapEventToState(
    CatFactEvent event,
  ) async* {
    if (event is CatFactInitialEvent) {
      yield CatFactLoadingState();
      Map<String, dynamic> catFactData = await getCatFactData();

      if (catFactData["success"] == true) {
        List<dynamic> jsonData = (catFactData["data"]);

        jsonData.forEach((element) {
          catfactList.add(CatFact.fromJson(element));
        });

        yield CatFactLoadedState();
      } else {
        message = catFactData["data"];
        yield CatFactFailureState();
      }
    }
  }
}
