# //Not the same as current_user

user = User.create(id: 1, email: "jrinard@hotmail.com", password: 'password', password_confirmation: 'password', street: nil, city: nil, state: nil, zip: nil, country: nil, phonePrimary: nil, phoneSecondary: nil, emailPrimary: nil, emailSecondary: nil, notes: nil, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")
part = Part.create(id: 2, title: "Mr.", firstName: 'Joshua', lastName: 'Rinard', allergies: nil, parent: nil, birthdate: nil, backCheck: nil, notes: nil, member: nil, leader: nil, user_id: 1, created_at: "2017-05-24 22:24:05", updated_at: "2017-05-24 22:24:05")
