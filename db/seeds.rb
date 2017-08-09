# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie")
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)
jamie = Owner.create(name: "Jamie")
Pet.create(name: "Taco", owner: jamie)
