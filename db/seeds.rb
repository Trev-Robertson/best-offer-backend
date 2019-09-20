# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Contractor.destroy_all
Specialty.destroy_all
Task.destroy_all
Bid.destroy_all

trevahr = User.create(name: "Trevahr")
renee = User.create(name: "Renee")
sam = User.create(name: "Sam")
luke = User.create(name: "Luke")
chine = User.create(name: "Chine")



contractor1 = Contractor.create(name: "Contractor1")
contractor2 = Contractor.create(name: "Contractor2")
contractor3 = Contractor.create(name: "Contractor3")
contractor4 = Contractor.create(name: "Contractor4")
contractor5 = Contractor.create(name: "Contractor5")



gardening = Specialty.create(name: "gardening")
carpentry = Specialty.create(name: "capentry")
plumbing = Specialty.create(name: "plumbing")
technology = Specialty.create(name: "technology")
electrician = Specialty.create(name: "electrician")

contractor1.specialties << gardening
contractor1.specialties << plumbing
contractor2.specialties << technology
contractor2.specialties << electrician
contractor3.specialties << carpentry
contractor3.specialties << gardening
contractor4.specialties << plumbing
contractor4.specialties << carpentry
contractor5.specialties << electrician
contractor5.specialties << plumbing


task1 = Task.create(name: 'Fix My floor', description: "Please come fix my floor!", user: chine, specialty: carpentry)
task2 = Task.create(name: 'Flowers Needed', description: "Make my yard pretty!", user: renee, specialty: gardening)
task3 = Task.create(name: 'Clogged Toilet', description: "Bring plunger", user: luke, specialty: plumbing)
task4 = Task.create(name: 'Computer virus!', description: "Computer needs Medicine", user: sam, specialty: technology)
task5 = Task.create(name: 'Broken Lamp', description: "It's dark in here", user: trevahr, specialty: electrician)
task6 = Task.create(name: 'Bad Table', description: "Table got 3 legs", user: renee, specialty: carpentry)
task7 = Task.create(name: 'Roses Dies', description: "Save My Roses", user: chine, specialty: gardening)
task8 = Task.create(name: 'Water Everywhere', description: "Sink Backup", user: sam, specialty: plumbing)
task9 = Task.create(name: 'Broken Computer', description: "Dropped it", user:trevahr, specialty: technology)
task10 = Task.create(name: 'Light Show', description: "Sparks are everywhere!", user: luke, specialty: electrician)

bid1 = Bid.create(price: 10, task: task1, contractor: contractor1)
bid2 = Bid.create(price: 15, task: task1, contractor: contractor2)
bid3 = Bid.create(price: 20, task: task2, contractor: contractor3)
bid4 = Bid.create(price: 25, task: task2, contractor: contractor4)
bid5 = Bid.create(price: 30, task: task3, contractor: contractor5)
bid6 = Bid.create(price: 10, task: task3, contractor: contractor1)
bid7 = Bid.create(price: 15, task: task4, contractor: contractor2)
bid8 = Bid.create(price: 20, task: task4, contractor: contractor3)
bid9 = Bid.create(price: 25, task: task5, contractor: contractor4)
bid10 = Bid.create(price: 30, task: task5, contractor: contractor5)

bid11 = Bid.create(price: 10, task: task6, contractor: contractor1)
bid12 = Bid.create(price: 15, task: task6, contractor: contractor2)
bid13 = Bid.create(price: 20, task: task7, contractor: contractor3)
bid14 = Bid.create(price: 25, task: task7, contractor: contractor4)
bid15 = Bid.create(price: 30, task: task8, contractor: contractor5)
bid16 = Bid.create(price: 10, task: task8, contractor: contractor1)
bid17 = Bid.create(price: 15, task: task9, contractor: contractor2)
bid18 = Bid.create(price: 20, task: task9, contractor: contractor3)
bid19 = Bid.create(price: 25, task: task10, contractor: contractor4)
bid20 = Bid.create(price: 30, task: task10, contractor: contractor5)


review1 = Review.create!(stars: 5, content: "This is a review for 1contractor", user: trevahr, contractor: contractor1)
review2 = Review.create!(stars: 4, content: "This is a review for 2contractor", user: renee, contractor: contractor2)
review3 = Review.create!(stars: 4, content: "This is a review for 3contractor", user: sam, contractor: contractor3)
review4 = Review.create!(stars: 1, content: "This is a review for 4contractor", user: luke, contractor: contractor4)
review5 = Review.create!(stars: 3, content: "This is a review for 5contractor", user: chine, contractor: contractor5)





