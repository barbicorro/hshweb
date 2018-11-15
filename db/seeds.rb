# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:


resi1= Residence.create({title: 'Hotel 1', address: 'calle 150 n1992',description:'hotel 5 estrellas',
	country:'Argentina', province:'Neuquen', locality:'Villa La Angostura'})
resi2= Residence.create({title: 'Hotel 2', address: 'calle 14 n899',description:'hotel con pileta',
	country:'Argentina', province:'Tierra del Fuego', locality:'Usuahia'})
resi3= Residence.create({title: 'Hotel 3', address: 'calle 156 n192', 
	description:'hotel con vista a las montañas',country:'Argentina', province:'San Luis', locality:'Villa Mercedes'})

