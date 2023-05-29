require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  it 'is valid with valid attributes' do
    article = Article.new(title: 'Anything',
                          body: 'Lorem ipsum dolor sit amet.',
                          subtitle: 'Lorem ipsum dolor sit amet.',
                          reading_time: 5,
                          cover: Rack::Test::UploadedFile.new(
                            'spec/fixtures/files/image_test.png', 'image/png'
                          ),
                          tags: [Tag.first, Tag.last])
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article = Article.new(title: nil,
                          body: 'Lorem ipsum dolor sit amet.',
                          reading_time: 5)
    expect(article).to_not be_valid
  end

  it 'is not valid without a body' do
    article = Article.new(title: 'Anything',
                          body: nil,
                          reading_time: 5)
    expect(article).to_not be_valid
  end

  it 'is not valid without a reading_time' do
    article = Article.new(title: 'Anything',
                          body: 'Lorem ipsum dolor sit amet.',
                          reading_time: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a cover' do
    article = Article.new(title: 'Anything',
                          body: 'Lorem ipsum dolor sit amet.',
                          reading_time: 5,
                          cover: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a Tags' do
    article = Article.new(title: 'Anything',
                          body: 'Lorem ipsum dolor sit amet.',
                          reading_time: 5,
                          cover: Rack::Test::UploadedFile.new(
                            'spec/fixtures/files/image_test.png', 'image/png'
                          ),
                          tags: [])
    expect(article).to_not be_valid
  end

  it 'is valid search article by tag' do
    first_tag = Tag.first
    last_tag = Tag.last
    article_with_first_tag = Article.create(title: 'Anything',
                                            body: 'Lorem ipsum dolor sit amet.',
                                            reading_time: 1,
                                            subtitle: 'Lorem ipsum dolor sit amet.',
                                            cover: Rack::Test::UploadedFile.new(
                                              'spec/fixtures/files/image_test.png', 'image/png'
                                            ),
                                            tags: [Tag.first])

    article_with_last_tag = Article.create(title: 'Anything',
                                           body: 'Lorem ipsum dolor sit amet.',
                                           reading_time: 2,
                                           subtitle: 'Lorem ipsum dolor sit amet.',
                                           cover: Rack::Test::UploadedFile.new(
                                             'spec/fixtures/files/image_test.png', 'image/png'
                                           ),
                                           tags: [Tag.last])

    expect(Article.tagged_with(first_tag.name)).to include(article_with_first_tag)
    expect(Article.tagged_with(first_tag.name)).to_not include(article_with_last_tag)
    expect(Article.tagged_with(last_tag.name)).to include(article_with_last_tag)
    expect(Article.tagged_with(last_tag.name)).to_not include(article_with_first_tag)
  end
end
