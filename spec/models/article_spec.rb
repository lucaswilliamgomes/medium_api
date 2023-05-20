require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    article = Article.new(title: 'Anything',
                          body: 'Lorem ipsum dolor sit amet.',
                          reading_time: 5,
                          cover: Rack::Test::UploadedFile.new(
                            'spec/fixtures/files/image_test.png', 'image/png'
                          ))
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
end
