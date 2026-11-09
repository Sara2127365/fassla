
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1fassla/feature/auth/cubit/state_auth.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialState());


  Future<void> signUp(String email, String password, String name) async {
    if (name.isEmpty) {
      emit(ErrorSignUpState(message: 'الرجاء إدخال الاسم'));
      return;
    }
    if (email.isEmpty) {
      emit(ErrorSignUpState(message: 'الرجاء إدخال البريد الإلكتروني'));
      return;
    }
    if (!_isValidEmail(email)) {
      emit(ErrorSignUpState(message: 'صيغة البريد الإلكتروني غير صالحة'));
      return;
    }
    if (password.isEmpty) {
      emit(ErrorSignUpState(message: 'الرجاء إدخال كلمة المرور'));
      return;
    }
    if (password.length < 6) {
      emit(
        ErrorSignUpState(message: 'كلمة المرور يجب أن تكون 6 أحرف على الأقل'),
      );
      return;
    }

    emit(LoadingSignUpState());
    try {
      emit(SuccessSignUpState(message: 'تم إنشاء الحساب بنجاح'));
    } catch (e) {
      emit(ErrorSignUpState(message: e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty) {
      emit(ErrorSignInState(message: 'الرجاء إدخال البريد الإلكتروني'));
      return;
    }
    if (!_isValidEmail(email)) {
      emit(ErrorSignInState(message: 'صيغة البريد الإلكتروني غير صالحة'));
      return;
    }
    if (password.isEmpty) {
      emit(ErrorSignInState(message: 'الرجاء إدخال كلمة المرور'));
      return;
    }

    emit(LoadingSignInState());
    try {
      
      emit(SuccessSignInState(message: 'تم تسجيل الدخول بنجاح'));
    } catch (e) {
      emit(ErrorSignInState(message:e.toString()));
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    if (email.isEmpty) {
      emit(ErrorForgetPasswordState(message: 'الرجاء إدخال البريد الإلكتروني'));
      return;
    }
    if (!_isValidEmail(email)) {
      emit(
        ErrorForgetPasswordState(message: 'صيغة البريد الإلكتروني غير صالحة'),
      );
      return;
    }

    emit(LoadingForgetPasswordState());

    try {
     
      emit(
        SuccessForgetPasswordState(
          message:
              'تم إرسال رابط إعادة التعيين بنجاح إلى بريدك.\nيرجى التحقق من صندوق الوارد (أو مجلد Spam).',
        ),
      );
    
    } catch (e) {
      emit(ErrorForgetPasswordState(message: 'خطأ غير متوقع: '));
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  
 

 

}