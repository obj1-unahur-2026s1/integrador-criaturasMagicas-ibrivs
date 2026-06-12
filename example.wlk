class Criatura {
  const poder 
  const astucia
  var rol
  method esFormidable() = self.esAstuta() or self.esExtraordinario()
  method esAstuta() = false
  method esExtraordinario() = rol.extraordinario(self)
  method poderOfensivo() = poder * 10 + rol.poderExtra()
  method cambioDeRol(unRol) {
    if (rol.puedeCambiar(unRol, self))
      rol = unRol
  }
  method astucia()
}

class Hada inherits Criatura{
  var kmVuelo = 2
  override method esAstuta() = astucia  > 50
  override method esExtraordinario() = super() and self.condicion()
  method condicion() = kmVuelo  > 10
  method aumentarKmVuelo(km){
    kmVuelo = (kmVuelo + km).min(25)
  }
}
class Duende inherits Criatura{
  override method poderOfensivo() = super() * 10
}

object guardian {
  method poderExtra(criatura) = 100
  method extraordinario(criatura) = criatura.poder() > 50 
}
object domador {
  method poderExtra(criatura) = if(criatura.mascotas().any({a => a.tieneCuernos()})) 150 * criatura.mascotas().count({a => a.tieneCuernos()})
  method extraordinario(c) = c.poder() > 14 and c.mascotas().all({a => a.esVeterana()})
}
object hechicero{
  method poderExtra() = 0
  method extraordinario(c) = true
}
class Mascota {
  var edad
  method tieneCuernos() 
  method esVeterana()
}
