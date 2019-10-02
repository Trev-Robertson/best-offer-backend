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

trevahr = User.create(name: "Trevahr", phone_number: "+13012567282", password: "123", img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
renee = User.create(name: "Renee", phone_number: nil, password: "r", img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
sam = User.create(name: "Sam", phone_number: nil, password: "s", img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
luke = User.create(name: "Luke", phone_number: nil, password: "l", img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
chine = User.create(name: "Chine", phone_number: nil, password: "c", img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
trevor = User.create(name: "Trevor", phone_number: nil, password: "t", img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")



contractor1 = Contractor.create(name: "Contractor1", phone_number: "+13012567282", password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor2 = Contractor.create(name: "Contractor2", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor3 = Contractor.create(name: "Contractor3", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor4 = Contractor.create(name: "Contractor4", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor5 = Contractor.create(name: "Contractor5", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor6 = Contractor.create(name: "Contractor6", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor7 = Contractor.create(name: "Contractor7", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor8 = Contractor.create(name: "Contractor8", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor9 = Contractor.create(name: "Contractor9", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")
contractor10 = Contractor.create(name: "Contractor10", phone_number: nil, password: '1', img_url: "https://randomuser.me/api/portraits/#{["women", "men"].sample}/#{rand(1..99)}.jpg")


gardening = Specialty.create(name: "gardening")
carpentry = Specialty.create(name: "carpentry")
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
contractor6.specialties << gardening
contractor7.specialties << plumbing
contractor8.specialties << technology
contractor9.specialties << electrician
contractor10.specialties << carpentry
contractor6.specialties << gardening
contractor7.specialties << plumbing
contractor8.specialties << carpentry
contractor9.specialties << electrician
contractor10.specialties << plumbing


task1 = Task.create(name: 'Fix My floor', description: "Please come fix my floor!", user: chine, specialty: carpentry)
task2 = Task.create(name: 'Flowers Needed', description: "Make my yard pretty!", user: renee, specialty: gardening)
task3 = Task.create(name: 'Clogged Toilet', description: "Bring plunger", user: luke, specialty: plumbing)
task4 = Task.create(name: 'Computer virus!', description: "Computer needs Medicine", user: sam, specialty: technology)
task5 = Task.create(name: 'Broken Lamp', description: "It's dark in here", user: trevahr, specialty: electrician)
task6 = Task.create(name: 'Bad Table', description: "Table got 3 legs", user: renee, specialty: carpentry)
task7 = Task.create(name: 'Roses Died', description: "Save My Roses!", user: chine, specialty: gardening)
task8 = Task.create(name: 'Water Everywhere', description: "Sink Backup", user: sam, specialty: plumbing)
task9 = Task.create(name: 'Broken Computer', description: "Dropped it", user:trevahr, specialty: technology)
task10 = Task.create(name: 'Light Show', description: "Sparks are everywhere!", user: luke, specialty: electrician)

bid1 = Bid.create(price: 10, task: task1, contractor: contractor1)
bid2 = Bid.create(price: 15, task: task1, contractor: contractor2)
bid3 = Bid.create(price: 20, task: task2, contractor: contractor3)
bid4 = Bid.create(price: 25, task: task2, contractor: contractor4)
bid5 = Bid.create(price: 30, task: task3, contractor: contractor5)
bid6 = Bid.create(price: 10, task: task3, contractor: contractor6)
bid7 = Bid.create(price: 15, task: task4, contractor: contractor7)
bid8 = Bid.create(price: 20, task: task4, contractor: contractor8)
bid9 = Bid.create(price: 25, task: task5, contractor: contractor9)
bid10 = Bid.create(price: 30, task: task5, contractor: contractor10)

bid11 = Bid.create(price: 10, task: task6, contractor: contractor1)
bid12 = Bid.create(price: 15, task: task6, contractor: contractor2)
bid13 = Bid.create(price: 20, task: task7, contractor: contractor3)
bid14 = Bid.create(price: 25, task: task7, contractor: contractor4)
bid15 = Bid.create(price: 30, task: task8, contractor: contractor5)
bid16 = Bid.create(price: 10, task: task8, contractor: contractor6)
bid17 = Bid.create(price: 15, task: task9, contractor: contractor7)
bid18 = Bid.create(price: 20, task: task9, contractor: contractor8)
bid19 = Bid.create(price: 25, task: task10, contractor: contractor9)
bid20 = Bid.create(price: 30, task: task10, contractor: contractor10)
bid21 = Bid.create(price: 10, task: task6, contractor: contractor10)
bid22 = Bid.create(price: 15, task: task6, contractor: contractor9)
bid23 = Bid.create(price: 20, task: task7, contractor: contractor8)
bid24 = Bid.create(price: 25, task: task7, contractor: contractor7)
bid25 = Bid.create(price: 30, task: task8, contractor: contractor6)
bid26 = Bid.create(price: 10, task: task8, contractor: contractor5)
bid27 = Bid.create(price: 15, task: task9, contractor: contractor4)
bid28 = Bid.create(price: 20, task: task9, contractor: contractor3)
bid29 = Bid.create(price: 25, task: task10, contractor: contractor2)
bid30 = Bid.create(price: 30, task: task10, contractor: contractor1)
bid31 = Bid.create(price: 10, task: task1, contractor: contractor6)
bid32 = Bid.create(price: 15, task: task1, contractor: contractor7)
bid33 = Bid.create(price: 20, task: task2, contractor: contractor8)
bid34 = Bid.create(price: 25, task: task2, contractor: contractor9)
bid35 = Bid.create(price: 30, task: task3, contractor: contractor10)
bid36 = Bid.create(price: 10, task: task3, contractor: contractor10)
bid37 = Bid.create(price: 15, task: task4, contractor: contractor9)
bid38 = Bid.create(price: 20, task: task4, contractor: contractor8)
bid39 = Bid.create(price: 25, task: task5, contractor: contractor7)
bid40 = Bid.create(price: 30, task: task5, contractor: contractor6)


# review1 = Review.create!(stars: 5, content: "This is a review for 1contractor", user: trevahr, contractor: contractor1)
# review2 = Review.create!(stars: 4, content: "This is a review for 2contractor", user: renee, contractor: contractor2)
# review3 = Review.create!(stars: 4, content: "This is a review for 3contractor", user: sam, contractor: contractor3)
# review4 = Review.create!(stars: 1, content: "This is a review for 4contractor", user: luke, contractor: contractor4)
# review5 = Review.create!(stars: 3, content: "This is a review for 5contractor", user: chine, contractor: contractor5)
# review6 = Review.create!(stars: 5, content: "This is a review for 6contractor", user: trevahr, contractor: contractor6)
# review7 = Review.create!(stars: 4, content: "This is a review for 7contractor", user: renee, contractor: contractor7)
# review8 = Review.create!(stars: 4, content: "This is a review for 8contractor", user: sam, contractor: contractor8)
# review9 = Review.create!(stars: 1, content: "This is a review for 9contractor", user: luke, contractor: contractor9)
# review10 = Review.create!(stars: 3, content: "This is a review for 10contractor", user: chine, contractor: contractor10)




