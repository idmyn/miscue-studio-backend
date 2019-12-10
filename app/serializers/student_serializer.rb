class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :teacher
  def teacher
    { id: object.teacher.id }
  end
end
