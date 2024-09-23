class AlertModel {
  final String? senderName;
  final String? event;
  final int? start;
  final int? end;
  final String? description;
  final List<String>? tags;

  AlertModel({
    this.senderName,
    this.event,
    this.start,
    this.end,
    this.description,
    this.tags,
  });
}
