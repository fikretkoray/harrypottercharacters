
  //Hata türlerine göre hata mesajı döndürdüm.
  import 'package:dio/dio.dart';

String getErrorMessage(Object error) {
    if (error is DioException) {
      if (error.type == DioExceptionType.unknown) {
        return 'İnternet bağlantınızda bir sorun oluştu. Lütfen bağlantınızı kontrol edin.';
      } else if (error.type == DioExceptionType.badResponse) {
        return 'Sunucudan beklenen cevap alınamadı. Lütfen tekrar deneyin.';
      } else if (error.type == DioExceptionType.connectionTimeout) {
        return 'Sunucuya bağlanırken bir hata oluştu. Lütfen internet bağlantınızı kontrol edin.';
      } else if (error.type == DioExceptionType.receiveTimeout) {
        return 'Veri alınırken bir sorun oluştu. Lütfen tekrar deneyin.';
      } else if (error.type == DioExceptionType.sendTimeout) {
        return 'Veri gönderilirken bir sorun oluştu. Lütfen tekrar deneyin.';
      } else {
        return 'Bir ağ hatası oluştu. Lütfen tekrar deneyin.';
      }
    }
    return 'Beklenmeyen bir hata oluştu. Lütfen tekrar deneyin.';
  }