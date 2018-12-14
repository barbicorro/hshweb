# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

type1=UserType.create({name:'Usuario Administrador'})
type2=UserType.create({name:'Usuario Premium'})
type3=UserType.create({name:'Usuario Base'})
type4=UserType.create({name:'Usuario superAdmin'})

user4= User.create(date_venc_month:"Abril", date_venc_year:"2019",cod:"123", card_Number:"1234567890123456",
	 name:"Osvaldo",image:"https://schmitman.com/wp-content/uploads/2015/08/homer2-680x380.png",
	 date_of_birth:"1996-09-17",email:"osvaldo@gmail.com",lastname:"Mantecovich",
	 password:"123456",password_confirmation:"123456",card_Marca:"visa",user_type_id:"4")


user1= User.create(date_venc_month:"Abril", date_venc_year:"2019",cod:"123", card_Number:"1234567890123456",
	 name:"Tyron",image:"https://upload.wikimedia.org/wikipedia/en/thumb/5/50/Tyrion_Lannister-Peter_Dinklage.jpg/220px-Tyrion_Lannister-Peter_Dinklage.jpg",
	 date_of_birth:"1996-09-17",email:"lion@gmail.com",lastname:"Lannister",
	 password:"123456",password_confirmation:"123456",card_Marca:"visa",user_type_id:"1")

user2= User.create(date_venc_month:"Abril", date_venc_year:"2019",cod:"123", card_Number:"1234567890123456",
	 	 name:"Katniss",image:"https://az616578.vo.msecnd.net/files/responsive/cover/main/desktop/2016/03/13/635934379782292055-1367934424_jennifer_lawrence_katniss_everdeen-HD-1.jpg",
	 	 date_of_birth:"1995-04-15",email:"kt@gmail.com",lastname:"Everdeen",
	 	 password:"123456",password_confirmation:"123456",card_Marca:"mastercard",user_type_id:"2")

user3= User.create(date_venc_month:"Abril", date_venc_year:"2019",cod:"123", card_Number:"1234567890123456",
		 	 	 name:"Walter",image:"https://static.vix.com/es/sites/default/files/styles/large/public/btg/series.batanga.com/files/breaking-bad-la-transformacion-de-walter-white-2.jpg?itok=j4aG3dr2",
		 	 	 date_of_birth:"1975-04-15",email:"heisenberg@gmail.com",lastname:"White",
		 	 	 password:"123456",password_confirmation:"123456",card_Marca:"mastercard",user_type_id:"3")

 user4= User.create(date_venc_month:"Abril", date_venc_year:"2019",cod:"123", card_Number:"1234567890123456",
				 	 	 name:"Iron",image:"https://static1.squarespace.com/static/583c906ebe659429d1106265/t/5935941859cc687293cd3f6b/1496683572683/",
				 	 	 date_of_birth:"1973-04-15",email:"ironman@gmail.com",lastname:"Man",
				 	 	 password:"123456",password_confirmation:"123456",card_Marca:"mastercard",user_type_id:"1")

#Status.create(name:string)
status1=Status.create({name: 'enEspera'})
status2=Status.create({name: 'EnSubasta'})
status3=Status.create({name: 'Reservada'})
status4=Status.create({name: 'EnHotSale'})

precioMem=Price.create({premium:'0',base:'0'})
