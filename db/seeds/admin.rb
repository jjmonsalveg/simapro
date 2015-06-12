User.create!(email: 'surf.airwaves@hotmail.com', username: 'simapro_admin', password: '12345678', name: 'Simapro Admin', cellphone: '0414-7163143', role: Role.find(1), avatar: '', empresa_forestal_id: 1)

puts '#---- ADMIN SEEDED ----#'