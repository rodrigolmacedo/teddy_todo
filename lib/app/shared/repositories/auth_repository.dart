import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart' show Headers, Options, Response;
import 'package:teddy_todo/app/shared/constants/api_constant.dart';
import 'package:teddy_todo/app/shared/models/token_model.dart';
import 'package:teddy_todo/app/shared/models/user_model.dart';
import 'package:teddy_todo/app/shared/services/custom_dio.dart';

class AuthRepository extends Disposable {
  final CustomDio client;
  AuthRepository(this.client);
/*
  Future<TokenModel> getToken(String credentials) async {
    Response response = await client.get(
      URL_LOGIN,
      options: Options(
        headers: {
          "Authorization": "Basic $credentials",
        },
      ),
    );
    return TokenModel.fromJson(response.data)..credentials = credentials;
  }*/
  Future<TokenModel> getToken(String email, String senha) async {
    Response response = await client.post(
      URL_LOGIN,data:{"email":email, "password":senha}, 
         options: Options(contentType:Headers.formUrlEncodedContentType )      
    );
    print(response.data);
    return TokenModel.fromJson(response.data);
  }

  Future<UserModel> getUser() async {
    Response response = await client.get(URL_GET_ME);
    return UserModel.fromJson(response.data);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
