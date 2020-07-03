import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const plantas = []
	
	
	method superficie(){
		return self.ancho() * self.largo()
	}
	
	method cantidadMaxima(){
		return if(ancho > largo) {self.superficie() / 5}
		else {self.superficie() / 3 + largo}
	}
	
	method tieneSangreJoven(){
		return plantas.any({p => p.anioDeObtencion() > 2012})
	}
	
	method hayLugar(){
		return plantas.size() < self.cantidadMaxima()
	}
	
	method diferenciaDeHoraDeSolCon(planta){
		return (self.horasDeSol() - planta.toleranciaAlSol()).abs()
	}
	
	method plantarUnaPlanta(planta){
		if(self.hayLugar() and self.diferenciaDeHoraDeSolCon(planta) >=2)
		 {
			plantas.add(planta)}
		else {
			self.error("No cumple las condiciones")
		}
	}
	
	method plantaMasAlta() {
		return plantas.max({p=>p.altura()}).altura()
	}
	
	method cantidadDePlantas(){return plantas.size()}
	
	method esIdeal(planta){
		return planta.resultaIdeal(self)
	}
	method seAsociaBien(unaPlanta)
	
}

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return self.tieneSangreJoven() and self.esIdeal(unaPlanta)
		}
	
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta){
		return self.cantidadDePlantas() <= 2 and unaPlanta.esFuerte()
	}
}