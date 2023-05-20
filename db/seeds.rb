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

for subject in SUBJECTS do
  Tag.where(name: subject).first_or_create
end
