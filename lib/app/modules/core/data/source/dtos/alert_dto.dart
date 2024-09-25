import 'dart:convert';

import 'package:clean_weather/app/modules/core/data/extensions/map_parsing_extension.dart';
import 'package:clean_weather/app/modules/core/domain/models/alert_model.dart';

class AlertDto extends AlertModel {
  AlertDto({
    super.senderName,
    super.event,
    super.start,
    super.end,
    super.description,
    super.tags,
  });

  factory AlertDto.fromMap(Map<String, dynamic> map) {
    return AlertDto(
      senderName: map.parseString('sender_name'),
      event: map.parseString('event'),
      start: map.parseInt('start'),
      end: map.parseInt('end'),
      description: map.parseString('description'),
      tags: map.parseStringList('tags'),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'sender_name': senderName,
        'event': event,
        'start': start,
        'end': end,
        'description': description,
        'tags': tags,
      };

  AlertDto.fromModel(AlertModel model)
      : super(
          senderName: model.senderName,
          event: model.event,
          start: model.start,
          end: model.end,
          description: model.description,
          tags: model.tags,
        );

  factory AlertDto.fromJson(String source) =>
      AlertDto.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
