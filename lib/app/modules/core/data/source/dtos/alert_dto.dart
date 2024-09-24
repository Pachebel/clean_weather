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
      start: int.tryParse(map['start'].toString()),
      end: int.tryParse(map['end'].toString()),
      description: map['description'] as String?,
      tags: map['tags'] != null
          ? List<String>.from(map['tags'] as List<dynamic>)
          : null,
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
