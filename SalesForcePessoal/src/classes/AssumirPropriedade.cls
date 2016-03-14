global class AssumirPropriedade {
    
    webservice static Boolean assumir(String idCaso, String proprietario){
		
		list<case> listCase = DAOCaso.buscarCaso(idCaso);
		
		boolean retorno = true;
		
		try{
		
			if(listCase.size() > 0){
				
				listCase[0].OwnerId = proprietario;
				
				update listCase[0];
			}
		
		}
		catch(Exception e){
			retorno = false;			
		}
		
		return retorno;
    }
    
    webservice static Boolean enviarParaFila(String idCaso, String nomeFila){
    	
    	list<Group> listGroup = DAOQueue.obterID(nomeFila);
    	
    	boolean retorno = true;
    	
    	if(listGroup.size() > 0){
    		
    		String idFila = listGroup[0].Id;
    		
    		retorno = assumir(idCaso,idFila);
    	}
    	
    	return retorno;
		
    }

}