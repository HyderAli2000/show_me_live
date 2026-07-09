class EventCheckoutData {
  const EventCheckoutData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.displayDate,
    this.fullDate = 'Saturday, June 15, 2026',
    this.time = '6:00 PM - 11:00 PM',
    this.attendees = '1,234 Joining',
    this.description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    this.ticketPrice = 25.02,
    this.platformFee = 3.50,
  });

  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String displayDate;
  final String fullDate;
  final String time;
  final String attendees;
  final String description;
  final double ticketPrice;
  final double platformFee;

  double get total => ticketPrice + platformFee;

  String get formattedTicketPrice => '\$${ticketPrice.toStringAsFixed(2)}';

  String get formattedPlatformFee => '\$${platformFee.toStringAsFixed(2)}';

  String get formattedTotal => '\$${total.toStringAsFixed(2)}';
}
