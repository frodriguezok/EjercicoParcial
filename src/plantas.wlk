import parcelas.*

class Planta {
	var property anioDeObtencion
	var property altura
	var property toleranciaAlSol = 7

	
	method esFuerte(){
		return self.toleranciaAlSol() > 9
	}
	
	method daNuevasSemillas(){
		return self.esFuerte()
	}

	method espacioQueOcupa()
	
	method resultaIdeal(unaParcela)	
	
}

class Menta inherits Planta {
	override method espacioQueOcupa(){
		return altura * 3
	}
	
	override method daNuevasSemillas(){
		return super() or self.espacioQueOcupa() > 1
	}
	
	override method resultaIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}
}

class Soja inherits Planta {
	override method toleranciaAlSol(){
		return if(altura < 0.5){6} 
		else if(altura.between(0.5,1)){8}
		else {12}
	}
	
	override method daNuevasSemillas(){
		return super() or 
		(self.anioDeObtencion() > 2007 and altura.between(0.75,0.9))
	}
	
	override method espacioQueOcupa() {
		return altura / 2
	}
	
	override method resultaIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.toleranciaAlSol()
	}
		
}

class Quinoa inherits Planta {
	var property espacio
	
	override method espacioQueOcupa(){
		return espacio
	}
	
	override method toleranciaAlSol(){
		return if(espacio < 0.3){
			toleranciaAlSol = 10
			toleranciaAlSol
		}
		else {super()}
	}
	
	override method daNuevasSemillas(){
		return super() or self.anioDeObtencion().between(2001,2008)
	}
	
	override method resultaIdeal(unaParcela){
		return unaParcela.plantaMasAlta() <= 1.5
	}
	
}

class SojaTransgenica inherits Soja {
	
	override method daNuevasSemillas(){
		return false
	}
	
	override method resultaIdeal(unaParcela){
		return unaParcela.cantidadMaxima() == 1
	}
}

class HierbaBuena inherits Menta {
	override method espacioQueOcupa(){
		return super() * 2
	}
}




