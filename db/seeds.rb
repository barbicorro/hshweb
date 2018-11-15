# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#locations = Location.create([{ country: 'Argentina', province: 'Buenos Aires', locality: 'La Plata' },

#{ country: 'Argentina', province: 'Buenos Aires', locality: 'Berazategui' }])

# Residence.create(title: 'Hotel 3', location: movies.first)
location1= Location.create({country: 'Argentina', province: 'San Luis', locality:'Villa Mercedes'})
location2= Location.create({country: 'Argentina', province: 'Neuquen', locality:'Villa La Angostura'})
location3= Location.create({country: 'Argentina', province: 'Tierra del Fuego', locality:'Ushuaia'})
location4= Location.create({country: 'Argentina', province: 'Mendoza', locality:'San Martin de los Andes'})

#residences = Residence.create([{ title: 'Holtel 1',  }, { title: 'Hotel 2' }])
resi1= Residence.create({location_id:"1", title: 'Hotel 1', address: 'calle 150 n1992',description:'hotel 5 estrellas'})
resi2= Residence.create({location_id:"2", title: 'Hotel 2', address: 'calle 14 n899',description:'hotel con pileta'})
resi3= Residence.create({location_id:"3", title: 'Hotel 3', address: 'calle 156 n192',description:'hotel con vista a las montañas'})
resi4= Residence.create({location_id:"4", title: 'Hotel 4', address: 'calle 155 n203',description:'hotel con vista a las sierras'})

#Week.create(status:string, residence_id:"")
week1= Week.create({status: 'reservada', residence_id: "1"})
week2= Week.create({status: 'enHotSale', residence_id: "2"})
week3= Week.create({status: 'enEspera', residence_id: "3"})
week4= Week.create({status: 'enInscripcion', residence_id: "4"})

#Sale.create(fechaInicio:datetime, precioBase:float, week_id:"")
sale1=Sale.create({fechaInicio:"2019/05/03 19:00", precioBase: "5000",fechaFin:"2019/05/06 19:00", week_id: "2" })
sale2=Sale.create({fechaInicio:"2019/08/23 15:00", precioBase: "5000",fechaFin:"2019/08/26 15:00", week_id: "3" })
sale1=Sale.create({fechaInicio:"2019/11/17 17:00", precioBase: "7000",fechaFin:"2019/11/20 17:00", week_id: "1" })
sale1=Sale.create({fechaInicio:"2019/12/15 12:00", precioBase: "5000",fechaFin:"2019/12/18 12:00", week_id: "4" })