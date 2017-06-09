# //Not the same as current_user

user = User.create(id: 100, email: "jrinard@hotmail.com", password: 'password', password_confirmation: 'password', created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")

unit = Unit.create(id: 100, familyname: "Rinard", street: nil, city: nil, state: nil, zip: nil, country: nil, phonePrimary: nil, phoneSecondary: nil, emailPrimary: nil, emailSecondary: nil, notes: nil, accountOwner: "jrinard@hotmail.com", created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05", user_id: 100)

part = Part.create(id: 100, title: "Mr.", firstname: 'Joshua', lastname: 'Rinard', allergies: nil, parent: nil, birthdate: nil, backCheck: nil, notes: nil, member: nil, leader: nil, unit_id: 100, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")

department = Department.create(id: 100, name: "Worship", description: "details", leaderName: "Joshua", part_id: 100, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")


event = Event.create(id: 1, name: "Sunday Seed", description: "Powerful Vestibulum mi turpis, rhoncus et molestie sed, tristique ac ante. Ut id porta est. Nulla facilisi. In dapibus id lectus sit amet viverra. Etiam enim odio, dapibus in cursus non, interdum in nunc. Nunc vel orci turpis. Donec aliquet semper velit, sit amet placerat dolor semper nec.", date: "2017-01-02", starttime: "2000-01-01 19:30:00", endtime: nil, locationname: "Main Campus", street: "1 Infinit loop", city: "Vancouver ", state: "Washington", zip: 98683, country: "United States", recurring: false, attendance: nil, volunteers: nil, created_at: "2017-06-08 23:11:36", updated_at: "2017-06-09 20:42:38")
