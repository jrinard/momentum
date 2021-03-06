user = User.create(id: 100, email: "j@email.com", password: 'password', password_confirmation: 'password', created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")

unit = Unit.create(id: 100, familyname: "Rinard", street: nil, city: nil, state: nil, zip: nil, country: nil, phonePrimary: nil, phoneSecondary: nil, emailPrimary: nil, emailSecondary: nil, notes: nil, accountowner: "j@email.com", created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05", user_id: 100)
unit2 = Unit.create(id: 101, familyname: "Jobs", street: nil, city: nil, state: nil, zip: nil, country: nil, phonePrimary: nil, phoneSecondary: nil, emailPrimary: nil, emailSecondary: nil, notes: nil, accountowner: "j@email.com", created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05", user_id: 100)


part = Part.create(id: 100, title: "Mr.", firstname: 'Joshua', lastname: 'Rinard', allergies: nil, parent: nil, birthdate: "2000-01-01", backcheck: nil, notes: nil, member: nil, leader: nil, unit_id: 100, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")
part2 = Part.create(id: 101, title: "Mr.", firstname: 'Steve', lastname: 'Jobs', allergies: nil, parent: nil, birthdate: "2000-01-01", backcheck: nil, notes: nil, member: nil, leader: nil, unit_id: 101, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")

department = Department.create(id: 100, name: "Marketing", description: "details", leaderName: "Joshua", part_id: 100, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")
department2 = Department.create(id: 102, name: "R&D", description: "details", leaderName: "Joshua", part_id: 100, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")

revent = Revent.create(id: 1, name: "Staff Lunch", description: "Fancy Vestibulum mi turpis, rhoncus et molestie sed, tristique ac ante. Ut id porta est. Nulla facilisi. In dapibus id lectus sit amet viverra. Etiam enim odio, dapibus in cursus non, interdum in nunc. Nunc vel orci turpis. Donec aliquet semper velit, sit amet placerat dolor semper nec.", start_time: "2017-06-28 12:30:00", locationname: "Main Campus", street: "1 Infinite loop", city: "Vancouver ", state: "Washington", zip: 98683, country: "United States", recurring: false, attendance: nil, volunteers: nil, created_at: "2017-06-08 23:11:36", updated_at: "2017-06-09 20:42:38")
