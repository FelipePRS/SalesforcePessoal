public with sharing class CasoGranel {
	
	public static void identificarProcesso(String casoId){
		
		if(casoId != null){
			
			list<Case> listCaso = DAOCaso.buscarCaso(casoId);
			
			if(listCaso.size() > 0){
				
				Case caso = listCaso[0];
				
				if(caso.RecordType.name != null){
					
					indetificarDireito(caso);
														
				}
				
			}
		}
						
	}	
	
	
	public static void indetificarDireito(Case caso){
		
		String idDireito = DAODireito.inserirDireito(caso.CaseNumber, caso.AccountId, '552j0000000D7G0');
			
		caso.EntitlementId = idDireito;
		
		update caso ;
		
	}

}