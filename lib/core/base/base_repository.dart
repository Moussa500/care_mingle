
import 'package:care_mingle/core/base/base_cache.dart';
import 'package:care_mingle/core/base/base_dio.dart';
import 'package:care_mingle/core/network/network_info.dart';
import 'package:dartz/dartz.dart';

class MainRepository {
  final TheHttpExecuter remoteData;
  final LocalData localData;
  final NetworkInfo networkInfo;
  Map<String, String> headers = {};
  MainRepository(
      {required this.remoteData,
      required this.localData,
      required this.networkInfo}) {
    _initializeHeaders();
  }
  Future<void> _initializeHeaders() async {
    var token = await localData.getString('token', 'access_token');
    headers = {
      'content-type': "application/json;charset=UTF-8",
      'Authorization': "Bearer $token",
      
    };
  }
    Map<String,String> multiPartHeader(){
    Map<String,String> headers={
      'Content-Type': 'multipart/form-data'
    };
    return headers;
  }
  Map<String,String> headerNoToken(){
    Map<String,String> headers={
      'Content-type':'application/json;charset=UTF-8'
    };
    return headers;
  }
  Future<Either<dynamic,dynamic>> data({
  required Function getData,
  Function(dynamic)? cashData,
  Function? cachedData,
  required bool needCash,
})async{
  final bool fromTheApi=await networkInfo.isConnected || cachedData==null;
  if (fromTheApi) {
    return Task(()=>getData()).attempt().mapLeftToFailure().run().then((value)=>result(value,cashData,needCash));
  }else{
    return Task(()=>cachedData()).attempt().mapLeftToFailure().run().then((value)=>value);
  }

}
result(Either<dynamic,dynamic>value,Function(dynamic)? cashData,bool needCash){
  final bool isCashDataNull=cashData!=null;
  if (needCash) {
    value.fold((l)=>{},(r)=>isCashDataNull?cashData(r):{});
  }
  return value;
}
}
extension TaskX<T extends Either<Object,U>,U> on Task<T>{
  Task<Either<dynamic,U>> mapLeftToFailure(){
    return map((either)=>either.leftMap((obj){
      return obj;
    }));
  }
}