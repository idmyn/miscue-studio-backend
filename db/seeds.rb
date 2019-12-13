krabappel = Teacher.create(email: "edna@springfield.edu", password: "password")

10.times do
  name = Faker::Name.unique.first_name + " " + Faker::Name.unique.last_name
  student = { name: name, teacher_id: krabappel.id }
  Student.create(student)
end

peter = "All children, except one, grow up. They soon know that they will grow up, and the way Wendy knew was this. One day when she was two years old she was playing in a garden, and she plucked another flower and ran with it to her mother. I suppose she must have looked rather delightful, for Mrs. Darling put her hand to her heart and cried, “Oh, why can't you remain like this for ever!” This was all that passed between them on the subject, but henceforth Wendy knew that she must grow up. You always know after you are two. Two is the beginning of the end."

jungle = "It was seven o’clock of a very warm evening in the Seeonee hills when Father Wolf woke up from his day’s rest, scratched himself, yawned, and spread out his paws one after the other to get rid of the sleepy feeling in their tips. Mother Wolf lay with her big gray nose dropped across her four tumbling, squealing cubs, and the moon shone into the mouth of the cave where they all lived. “Augrh!” said Father Wolf. “It is time to hunt again.” He was going to spring down hill when a little shadow with a bushy tail crossed the threshold and whined: “Good luck go with you, O Chief of the Wolves. And good luck and strong white teeth go with noble children that they may never forget the hungry in this world.”"

peter_story = Story.create(title: "Peter Pan", author: "J. M. Barrie")

peter.split.each_with_index do |w, i|
  plain = w.scan(/(\w+'?\w+|\w)/)[0][0].downcase
  word = Word.find_or_create_by(content: plain)
  StoryWord.create(
    index: i,
    content: w,
    word_id: word.id,
    story_id: peter_story.id
  )
end

jungle_story = Story.create(title: "The Jungle Book", author: "Rudyard Kipling")

jungle.split.each_with_index do |w, i|
  plain = w.scan(/(\w+'?\w+|\w)/)[0][0].downcase
  word = Word.find_or_create_by(content: plain)
  StoryWord.create(
    index: i,
    content: w,
    word_id: word.id,
    story_id: jungle_story.id
  )
end
