class StorySerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :content
  def content
    object.story_words.map do |story_word|
      { id: story_word.id, wordId: story_word.word_id, content: story_word.content }
    end
  end
end
