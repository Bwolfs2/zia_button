import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class TesteBloc extends BlocBase {
  //dispose will be called automatically by closing its streams
TesteBloc(){
    testeStream = teste.stream; 
  
}
  var teste = BehaviorSubject.seeded(10);

  Observable<int> testeStream;

  @override
  void dispose() {
    super.dispose();
  }
}
