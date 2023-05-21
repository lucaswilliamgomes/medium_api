SUBJECTS = [
  'Technology and Gadgets',
  'Science and Research',
  'Health and Fitness',
  'Travel and Adventure',
  'Food and Cooking',
  'Fashion and Style',
  'Business and Entrepreneurship',
  'Finance and Investing',
  'Politics and Current Affairs',
  'Sports and Athletics',
  'Education and Learning',
  'Environment and Sustainability',
  'Arts and Culture',
  'Entertainment and Celebrities',
  'Home and Interior Design',
  'Parenting and Family',
  'Relationships and Dating',
  'Self-Improvement and Personal Development',
  'History and Archaeology',
  'Psychology and Mental Health'
]

# Create tags
for subject in SUBJECTS do
  Tag.where(name: subject).first_or_create
end

# Create Articles with title, body, reading_time, cover, and tags
10.times do
  Article.create(
    title: Faker::Science.science,
    body: Faker::Lorem.paragraphs(number: 5).join(' '),
    reading_time: Random.new.rand(5..30),
    cover: Rack::Test::UploadedFile.new(
      'spec/fixtures/files/image_test.png', 'image/png'
    ),
    tags: [Tag.find_by(name: SUBJECTS[Random.new.rand(0...20)])]
  )
end
