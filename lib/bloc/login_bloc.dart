import 'dart:async';
/* import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart'; */

class LoginBloc {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Recuperar los datos del Stream
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  /*  Stream<bool> get formValidStream => 
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true );

 */

  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingresado a los streams
  /* String get email    => _emailController.value;
  String get password => _passwordController.value; */

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
