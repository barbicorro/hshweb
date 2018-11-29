# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# Examples:
#
#locations = Location.create([{ country: 'Argentina', province: 'Buenos Aires', locality: 'La Plata' },


resi1= Residence.create({title: 'Hotel 1', address: 'calle 150 n1992',description:'hotel 5 estrellas',
	country:'Argentina', province:'Neuquen', locality:'Villa La Angostura', image: ' https://i.pinimg.com/originals/d1/24/11/d124114c0f8b03734018bf1716a0db3b.jpg'})
resi2= Residence.create({title: 'Hotel 2', address: 'calle 14 n899',description:'hotel con pileta',
	country:'Argentina', province:'Tierra del Fuego', locality:'Usuahia', image:' https://q-ec.bstatic.com/images/hotel/max1024x768/468/46871800.jpg'})
resi3= Residence.create({title: 'Hotel 3', address: 'calle 156 n192', 
	description:'hotel con vista a las montañas',country:'Argentina', province:'San Luis', locality:'Villa Mercedes',image: 'https://www.hotelsofgreece.com/athens/electra-palace-hotel-pool.jpg'})

type1=UserType.create({name:'Usuario Administrador'})
type2=UserType.create({name:'Usuario Premium'})
type3=UserType.create({name:'Usuario base'})



#Status.create(name:string)
status1=Status.create({name: 'enEspera'})
status2=Status.create({name: 'EnSubasta'})
status3=Status.create({name: 'Reservada'})
status4=Status.create({name: 'EnHotSale'})
