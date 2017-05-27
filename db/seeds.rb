# //Not the same as current_user

user = User.create(id: 100, email: "jrinard@hotmail.com", password: 'password', password_confirmation: 'password', created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")

unit = Unit.create(id: 100, familyname: "Rinard", street: nil, city: nil, state: nil, zip: nil, country: nil, phonePrimary: nil, phoneSecondary: nil, emailPrimary: nil, emailSecondary: nil, notes: nil, accountOwner: "jrinard@hotmail.com", created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05", user_id: 100)

part = Part.create(id: 100, title: "Mr.", firstName: 'Joshua', lastName: 'Rinard', allergies: nil, parent: nil, birthdate: nil, backCheck: nil, notes: nil, member: nil, leader: nil, unit_id: 100, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")
