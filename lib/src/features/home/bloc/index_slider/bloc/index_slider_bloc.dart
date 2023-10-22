import 'package:bloc/bloc.dart';

part 'index_slider_event.dart';
part 'index_slider_state.dart';

class IndexSliderBloc extends Bloc<IndexSliderEvent, IndexSliderState> {
  IndexSliderBloc() : super(IndexSliderState( 0)) {
    on<IndexSliderEvent>(_indexSlider);
  }

  void _indexSlider(IndexSliderEvent event, Emitter<IndexSliderState> emit) {

    emit(IndexSliderState(event.index));
  }
}
