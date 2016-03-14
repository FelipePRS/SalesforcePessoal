trigger Caso on Case (after insert) {
	
	for(Case caso:Trigger.new){
	
		if(trigger.isAfter){ 
			//CasoGranel.identificarProcesso(caso.id);
		}
	
	}

}