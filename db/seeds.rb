# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Examples:
#
#locations = Location.create([{ country: 'Argentina', province: 'Buenos Aires', locality: 'La Plata' },

#{ country: 'Argentina', province: 'Buenos Aires', locality: 'Berazategui' }])


<<<<<<< HEAD
=======


>>>>>>> 5e5b3d0431526de41a243154e33de60611657ef5

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
<<<<<<< HEAD

=======
>>>>>>> 5e5b3d0431526de41a243154e33de60611657ef5


resi1= Residence.create({title: 'Hotel 1', address: 'calle 150 n1992',description:'hotel 5 estrellas',
	country:'Argentina', province:'Neuquen', locality:'Villa La Angostura', image: ' https://i.pinimg.com/originals/d1/24/11/d124114c0f8b03734018bf1716a0db3b.jpg'})
resi2= Residence.create({title: 'Hotel 2', address: 'calle 14 n899',description:'hotel con pileta',
	country:'Argentina', province:'Tierra del Fuego', locality:'Usuahia', image:' https://q-ec.bstatic.com/images/hotel/max1024x768/468/46871800.jpg'})
resi3= Residence.create({title: 'Hotel 3', address: 'calle 156 n192', 
	description:'hotel con vista a las montañas',country:'Argentina', province:'San Luis', locality:'Villa Mercedes',image: 'https://www.hotelsofgreece.com/athens/electra-palace-hotel-pool.jpg'})


