
import 'package:artos/models/topup_form_model.dart';
import 'package:artos/services/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'topup_event.dart';
part 'topup_state.dart';

class TopupBloc extends Bloc<TopupEvent, TopupState> {
  TopupBloc() : super(TopupInitial()) {
    on<TopupEvent>((event, emit) async {

      if (event is TopupPost) {

        try {

          emit(TopupLoading());

          final redirectUrl = await TransactionService().topUp(event.data);

          emit(TopupSuccess(redirectUrl));

        } catch (e) {
          emit(TopupFailed(e.toString()));
        }

      }

    });
  }
}
