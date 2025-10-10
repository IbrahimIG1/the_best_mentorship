import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:omar_ahmed_mentor_ship/e_commers_app/features/home_screen/logic/cubit/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
