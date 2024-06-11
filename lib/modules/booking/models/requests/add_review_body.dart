class AddReviewBody {
  double? rate;
  String? review;
  int? bookingId;

  AddReviewBody({
    this.rate,
    this.review,
    this.bookingId,
  });

  void copyWith({
    double? rate,
    String? review,
    int? bookingId,
  }) {
    this.rate = rate ?? this.rate;
    this.review = review ?? this.review;
    this.bookingId = bookingId ?? this.bookingId;
  }

  Map<String, dynamic> toJson() {
    return {
      if (bookingId != null) "rate": rate,
      if (bookingId != null) "review": review,
      if (bookingId != null) "booking_id": bookingId,
    };
  }
}
