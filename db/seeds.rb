# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#locations = Location.create([{ country: 'Argentina', province: 'Buenos Aires', locality: 'La Plata' },
#{ country: 'Argentina', province: 'Buenos Aires', locality: 'Berazategui' }])
#residences = Residence.create([{ title: 'Holtel 1',  }, { title: 'Hotel 2' }])
resi1= Residence.create({location_id:"1", title: 'Hotel 1', address: 'calle 150 n1992',description:'hotel 5 estrellas'})
resi2= Residence.create({location_id:"2", title: 'Hotel 2', address: 'calle 14 n899',description:'hotel con pileta'})
resi3= Residence.create({location_id:"3", title: 'Hotel 3', address: 'calle 156 n192',description:'hotel con vista a las montañas'})





# Residence.create(title: 'Hotel 3', location: movies.first)
location1= Location.create({country: 'Argentina', province: 'San Luis', locality:'Villa Mercedes'})
location2= Location.create({country: 'Argentina', province: 'Neuquen', locality:'Villa La Angostura'})
location3= Location.create({country: 'Argentina', province: 'Tierra del Fuego', locality:'VUshuaia'})
