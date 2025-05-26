import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled2/core/error/exception.dart';
import 'package:untitled2/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password
  });

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> loginWithEmailPassword({required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw const ServerException('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson());
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailPassword({required String name, required String email, required String password}) async {
    try{
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        }
      );

      if(response.user == null){
        throw ServerException('User is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch(e){
      print('SignUp error: $e'); // Log lỗi nếu có
      throw ServerException(e.toString());
    }
  }
}

