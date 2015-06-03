User.create!(email: 'surf.airwaves@hotmail.com', username: 'simapro_admin', password: '12345678', name: 'Simapro Admin', cellphone: '0414-7163143', role: Role.find(1), avatar: '')

puts '#---- ADMIN SEEDED ----#'