class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :date, :teacher, :student, :story, :mistakes

  def teacher
    { id: object.teacher.id, email: object.teacher.email }
  end

  def student
    { id: object.student.id, name: object.student.name }
  end

  def story
    { id: object.story.id, title: object.story.title, author: object.story.author }
  end

  def mistakes
    # Mistake.where reading_id: object.id
    object.mistakes.map do |mistake|
      {
        id: mistake.id,
        category: mistake.category,
        miscue: mistake.miscue,
        word: {
          id: mistake.word.id,
          content: mistake.word.content
        }
      }
    end
  end
end
