import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task1fassla/feature/auth/signup/signup_screen.dart';
import 'package:task1fassla/feature/home/cubit/home_cubit.dart';
import 'package:task1fassla/feature/cart/cubit/cart_cubit.dart';
// 1. Import your CheckoutCubit
import 'package:task1fassla/feature/checkout/cubit/check_out_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TaskFassla());
}

class TaskFassla extends StatelessWidget {
  const TaskFassla({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit()..loadCart(),
        ),
        // 2. Add CheckoutCubit here
        BlocProvider(
          create: (context) => CheckoutCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupScreen(),
      ),
    );
  }
}