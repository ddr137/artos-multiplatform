
import 'package:artos/models/transfer_form_model.dart';
import 'package:artos/services/transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {

      if (event is TransferPost) {

        try {

          emit(TransferLoading());

          await TransactionService().transfer(event.data);

          emit(TransferSuccess());

        } catch (e) {
          emit(TransferFailed(e.toString()));
        }

      }

    });
  }
}
