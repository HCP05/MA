package com.example.myapplication.model

class Client (
    var ID:Int,
    var adresaEmail:String,
    var nrTelefon:String,
    var PachetDorit:Int,
    var adresa:String
)
{
    override fun toString(): String {
        return "$ID , $nrTelefon"
    }
}

fun getListOfClients():List<Client>{
    var u1 : Client = Client(1,"AAA","AAA",1,"aaa")
    var u2 : Client = Client(1,"BBB","BBB",1,"bbb")
    var u3 : Client = Client(1,"CCC","CCC",2,"ccc")
    var u4 : Client = Client(1,"DDD","DDD",3,"ddd")
    var u5 : Client = Client(1,"EEE","EEE",2,"eee")
    var list: List<Client> = listOf(u1,u2,u3,u4,u5)

    return list
}