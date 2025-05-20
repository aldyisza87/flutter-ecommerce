import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce/data/models/responses/list_product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<CheckoutEvent>((event, emit) {});
  }
}
