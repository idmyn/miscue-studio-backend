class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :content
  def content
    object.story_words.map do |story_word|
      { id: story_word.id, parent_word: story_word.word.content, content: story_word.content }
    end
  end
end
