import 'dart:convert';

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
      senderName: map['sender_name'] as String?,
      event: map['event'] as String?,
      start: map['start'] as int?,
      end: map['end'] as int?,
      description: map['description'] as String?,
      tags: List<String>.from(map['tags'] as List<dynamic>),
    );
  }

// TODO: ver de novo todos os toMap e deixar nesse padrao
// de acordo com o que se recebe da api
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
