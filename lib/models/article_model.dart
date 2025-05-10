class Article {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String detailImageUrl;
  final String content;
  final String category;
  final String headerSubtitle;

  Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.detailImageUrl,
    required this.content,
    required this.category,
    required this.headerSubtitle,
  });
}

final List<Article> sampleArticles = [
  Article(
    id: '1',
    title: 'First Day',
    subtitle: 'Breastfeeding with love',
    imageUrl: 'assets/images/a1.jpg',
    detailImageUrl: 'assets/images/1.jpg',
    content:
        'Feed your baby every 2–3 hours, at least 8 times a day. Let the baby empty the breast each time. The more frequently the baby feeds, the more milk your body will produce...\n\n(More content about the first day...)',
    category: 'Parenting',
    headerSubtitle: 'Discover medically accurate parenting practices',
  ),
  Article(
    id: '2',
    title: 'First Sound',
    subtitle: 'The beginning of communication',
    imageUrl: 'assets/images/a2.jpeg',
    detailImageUrl: 'assets/images/2.jpg',
    content: 'Detailed content about your baby’s first words...',
    category: 'Child Development',
    headerSubtitle: 'Track your child’s key developmental milestones',
  ),
  Article(
    id: '3',
    title: 'First Step',
    subtitle: 'Starting to crawl with knees and elbows',
    imageUrl: 'assets/images/a3.jpg',
    detailImageUrl: 'assets/images/3.jpg',
    content: 'Detailed content about your baby’s first steps...',
    category: 'Child Development',
    headerSubtitle: 'Support every step of your child’s growth',
  ),
  Article(
    id: '4',
    title: 'First Time',
    subtitle: 'Making every new experience smooth',
    imageUrl: 'assets/images/a4.jpg',
    detailImageUrl: 'assets/images/4.jpg',
    content: 'Detailed content about your child’s first experiences...',
    category: 'Mom Tips',
    headerSubtitle: 'Be prepared for every new journey',
  ),
];
