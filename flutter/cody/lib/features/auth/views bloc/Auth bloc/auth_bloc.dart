import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
 // final AuthRepo authRepo;
 //  this.authRepo
  AuthBloc() : super(AuthInitial()) {
    // on<Register>((event, emit)async {
    //   emit(SignUpLoading());
    //   var result = await authRepo.register(email: event.email, name: event.name, password: event.password);
    //   result.fold((failure) => emit(SignUpFailed(failure.errMassage)),
    //           (user) {
    //         emit(SignUpSuccess(user));
    //       });
    // });
    // on<LogIn>((event, emit)async {
    //   emit(LogInLoading());
    //   var result = await authRepo.logIn(email:event.email,password: event.password);
    //   result.fold((failure) => emit(LogInFailed(failure.errMassage)),
    //           (user) {
    //         emit(LogInSuccess(user));
    //       });
    // });
    // on<LogOut>((event, emit)async {
    //   emit(LogOutLoading());
    //   var result = await authRepo.logOut();
    //   result.fold((failure) => emit(LogOutFailed(failure.errMassage)),
    //           (user) {
    //         emit(LogOutSuccess(user));
    //       });
    // });

  }
}
bool isp = false;
class showBloc extends Bloc<AuthEvent, ShowPasswordState> {
  showBloc() : super(ShowPasswordState(isPressed: false)) {
    on<ShowPassword>((event, emit) {
      isp ==false?isp =true: isp =false;
      emit(ShowPasswordState(isPressed: isp));
    });
  }
}
// class IsLogedInBloc extends Bloc<AuthEvent, IsLogedInState> {
//   IsLogedInBloc() : super(IsLogedInState('View App', false)) {
//     on<IsLoged>((event, emit) {
//       if(event.controlers[0].text.isEmpty && event.controlers[1].text.isEmpty )
//         {
//           emit(IsLogedInState('View App', false));
//         } else{
//         emit(IsLogedInState('Login', true));
//       }
//       // List<bool> list=[];
//       // event.controlers.map((e) => e.addListener(() {e.text.isEmpty? list.add(true):list.add(false);}));
//       // int index =0;
//       // for(int i =0 ;i<event.controlers.length ;i++) {
//       //   if(list[i])
//       //     {
//       //       index++;
//       //     }
//       //   if(index ==2) {
//       //
//       //   } else {
//       //
//       //   }
//
//       // if(event.isloged == false) {
//       //   emit(IsLogedInState('View App', false));
//       // } else{
//       //   emit(IsLogedInState('Login', true));
//       // }
//     //  }
//     });
//     on<IsSign>((event, emit) {
//       if(event.isloged == false) {
//         emit(IsLogedInState('View App', false));
//       } else{
//         emit(IsLogedInState('Register', true));
//       }
//     });
//     // on<IsLogedNavigate>((event, emit) {
//     //   if(event.isloged == false) {
//     //     emit(IsLogedInState('View App', false));
//     //   }
//     // });
//   }
// }
