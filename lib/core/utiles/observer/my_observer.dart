import 'package:bloc/bloc.dart';

class MyObserver extends BlocObserver{
  @override
  void onCreate (BlocBase bloc){
    super.onCreate(bloc);
    print(bloc);
  }
  @override
  void onChange(BlocBase bloc,Change change){
    super.onChange(bloc, change);
    print(' $bloc , $change ');
  }
  @override
  void onError (BlocBase bloc,Object error,StackTrace stackTrace){
    super.onError(bloc, error, stackTrace);
    print(error);
  }
}