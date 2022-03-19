class Error {
  Error({
    required this.messages,
  });

  String messages;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        messages: (json["messages"] ?? json["message"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "messages": messages,
      };

  @override
  String toString() {
    return "messages: $messages";
  }
}
