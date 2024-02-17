import 'package:flutter/material.dart';
import 'package:musang_syncronizehub_odyssey/dao/data_processing/process_data.dart';
import 'package:musang_syncronizehub_odyssey/features/core/models/dashboard/atg_model.dart';
import 'package:musang_syncronizehub_odyssey/helpers/serializers.dart';
import 'package:musang_syncronizehub_odyssey/services/postgrest_service.dart';
import 'package:postgrest/postgrest.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AtgDao {
  final PostgrestClient _client;

  AtgDao(PostgrestService service) : _client = service.client;

  Future<List<ATGModel>> read(int page, int limit,
      {DateTimeRange? dateRange}) async {
    try {
      final int offset = (page - 1) * limit;
      var query = _client
          .from('atg')
          .select(
              'atg_timestamp, tank_barrel, volume_change_barrel, avg_temp_celcius, water_level_meter, product_temp_celcius, alarm, site_id')
          .order('atg_timestamp', ascending: false)
          .range(offset, offset + limit - 1);

      final response = await query;

      List<Map<String, dynamic>> data = response as List<Map<String, dynamic>>;

      if (dateRange != null) {
        data = data.where((item) {
          final timestamp = DateTime.parse(item['atg_timestamp']);
          return timestamp.isAfter(dateRange.start) &&
              timestamp.isBefore(dateRange.end);
        }).toList();
      }

      print('Fetched Data: $data');
      List<ATGModel> atgModels = data
          .map((item) {
            return serializers.deserializeWith(ATGModel.serializer, item);
          })
          .where((item) => item != null)
          .toList()
          .cast<ATGModel>();
      return sortData(atgModels);
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}