abstract class BaseApiServices {
  Future<dynamic> getPostApiResponse( dynamic data,String url, String token);
  Future<dynamic> getGetApiResponse(String url, String token);

}