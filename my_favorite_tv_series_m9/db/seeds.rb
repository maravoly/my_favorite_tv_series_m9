# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating users...'

admin = User.new(
user_name: 'Admin',
email: 'admin@gmail.com',
password: 123456,
admin: true  
)
# admin.skip_confirmation!
admin.save!

chuck_norris = User.new(
user_name: 'Chuck Norris',
email: 'chucknorris@gmail.com',
password: 123456
)
# chuck_norris.skip_confirmation!
chuck_norris.save!

bruce_willis = User.new(
user_name: 'Bruce Willis',
email: 'brucewillis@gmail.com',
password: 123456
)
# bruce_willis.skip_confirmation!
bruce_willis.save!

puts 'users created!!!'

puts 'creando nacionalidades'

Nationality.destroy_all

Nationality.create([
    {name: 'Estados Unidos', description: 'una description opcional', flag_img: 'https://flagcdn.com/32x24/us.png'},
    {name: 'Finlandia', description: 'una description opcional', flag_img: 'https://flagcdn.com/32x24/fi.png'},
    {name: 'Italia', description: 'una description opcional', flag_img: 'https://flagcdn.com/32x24/it.png'},
    {name: 'Korea del sur', description: 'una description opcional', flag_img: 'https://flagcdn.com/32x24/kr.png'}
])

puts 'nacionalidades creadas!!!'

puts 'creando series de tv...'

TvShow.destroy_all

TvShow.create!(
    [
        {
            name: 'game of thrones',
            summary: 'Years after a rebellion spurred by a stolen bride to be and the blind ambitions of a mad King',
            release_date: '2011-04-17',
            rating: 7.8,
            nationality: Nationality.find_by(name: 'Finlandia'),
            user: User.find_by(email: 'brucewillis@gmail.com')
        },
        {
            name: 'Squid Game',
            summary: 'The series revolves around Seong Gi-hun, a divorced and indebted chauffeur, who is invited to play a series of children\'s games for a chance earning a large cash prize.' ,
            release_date: '17-09-2021',
            rating: 5.6,
            nationality: Nationality.find_by(name: 'Korea del sur'),
            user: User.find_by(email: 'chucknorris@gmail.com')
        },
        {
            name: 'Angry Birds',
            summary: 'Red, an angry bird, has been an outcast from Bird Island ever since he was a hatchling due to his short temper and his huge, jet-black eyebrows.',
            release_date: '05-02-2016',
            rating: 6.1,
            nationality: Nationality.find_by(name: 'Estados Unidos'),
            user: User.find_by(email: 'chucknorris@gmail.com')
        },
        {
            name: 'Jaws 2',
            summary: 'Chief Brody suspecting another great white shark is terrorizing the fictional sea side resort of Amity Island, following a series of incidents and disappearances, and his suspicions are eventually proven true.',
            release_date: '16-06-1978',
            rating: 9.8,
            nationality: Nationality.find_by(name: 'Estados Unidos'),
            user: User.find_by(email: 'chucknorris@gmail.com')
        },
        {
            name: 'Agatha Christie\'s Crooked House',
            summary: 'The granddaughter of late Greek-British business tycoon Aristide Leonides, Sophia Leonides, visits private investigator Charles Hayward in his office.',
            release_date: '31-10-2017',
            rating: 8.6,
            nationality: Nationality.find_by(name: 'Italia'),
            user: User.find_by(email: 'brucewillis@gmail.com')
        },
        {
            name: 'Blade Runner: The Final Cut',
            summary: 'A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.',
            release_date: '25-06-1982',
            rating: 6.5,
            nationality: Nationality.find_by(name: 'Estados Unidos'),
            user: User.find_by(email: 'brucewillis@gmail.com')
        }
    ]
)

puts 'Creando Géneros!!!'

Genre.create!([
    {name: 'drama', description: 'films that focus primarily on the development of a relationship between the protagonists'},
    {name: 'documentary', description: 'refers to subjects of scientific, social or cultural interest, among others.'},
    {name: 'thriller', description: 'made with the intention of provoking tension in the viewer.' },
    {name: 'history', description: 'The action takes place in the past, often with the intention of historical reenactment.' },
    {name: 'action', description: 'whose plot involves a moral interaction between good and evil' }
])

tv_show = TvShow.find_by(name: 'Squid Game')
genre = Genre.find_by(name: 'thriller')
tv_show.genres << genre

puts 'finalizado!!!'