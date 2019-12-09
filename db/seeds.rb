krabappel = Teacher.create(email: "edna@example.com", password: "password")

10.times do
  name = Faker::Name.unique.first_name + " " + Faker::Name.unique.last_name
  student = { name: name, teacher_id: krabappel.id }
  Student.create(student)
end

peter = "All children, except one, grow up. They soon know that they will grow up, and the way Wendy knew was this. One day when she was two years old she was playing in a garden, and she plucked another flower and ran with it to her mother. I suppose she must have looked rather delightful, for Mrs. Darling put her hand to her heart and cried, “Oh, why can't you remain like this for ever!” This was all that passed between them on the subject, but henceforth Wendy knew that she must grow up. You always know after you are two. Two is the beginning of the end."

story = Story.create(title: "Peter Pan", author: "J. M. Barrie")

peter.split.each_with_index do |w, i|
  plain = w.scan(/(\w+'?\w+|\w)/)[0][0].downcase
  word = Word.find_or_create_by(content: plain)
  StoryWord.create(
    index: i,
    content: w,
    word_id: word.id,
    story_id: story.id
  )
end
