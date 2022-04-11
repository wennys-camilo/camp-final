import 'package:dio/dio.dart';
import '../../../../../../shared/domain/helpers/errors/failure.dart';
import '../../../../../../shared/external/adapters/http_client/http_client_adapter.dart';
import '../../domain/entities/accessibilities_entities.dart';
import '../../domain/entities/events_categories_entity.dart';
import '../../infra/datasources/events_remote_datasource.dart';
import '../mappers/accessibilities_mapper.dart';
import '../mappers/event_categorie_mapper.dart';

class EventsRemoteDatasourceImpl implements EventsRemoteDatasource {
  final IHttpClientAdapter _httpClient;
  EventsRemoteDatasourceImpl(this._httpClient);

  @override
  Future<List<AccessibilitiesEntity>> accessibilities() async {
    try {
      final response = await _httpClient.get('/disabilities/list');
      print(response.data);
      return (response.data as List)
          .map((e) => AccessibilitiesMapper().to(e))
          .toList();
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace, message: error.message);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }

  @override
  Future<List<EventCategorieEntity>> categories() async {
    try {
      final response = await _httpClient.get('/categories/list');
      print(response.data);
      return (response.data as List)
          .map((e) => EventCategorieMapper().to(e))
          .toList();
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ApiFailure(stackTrace: stackTrace, message: error.message);
    } catch (error, stackTrace) {
      throw DatasourceFailure(
          message: error.toString(), stackTrace: stackTrace);
    }
  }
}
