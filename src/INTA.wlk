import parcelas.*
import plantas.*

object inta {
	
	const parcelas = #{}
	
	method agregarParcela(parcela){
		parcelas.add(parcela)
	}
	
	method cantidadDeParcelas(){
		return parcelas.size()
	}

	
	method promedioDePlantas(){
		return parcelas.sum({p=>p.cantidadDePlantas()}) / self.cantidadDeParcelas()
	}
	
	method parcelasConMasDe4Plantas(){
		return parcelas.filter({p=>p.cantidadDePlantas() > 4})
	}
	
	
	method masAutosustentable(){
		
	}
}
