public with sharing class DAODireito {
	
	public static String inserirDireito(String numeroCaso, String conta, String processoSLA){
		
		String idDireito;
		
		try{
				
			Entitlement direito = new Entitlement();
			
			direito.name = numeroCaso;
			direito.AccountId = conta;
			direito.StartDate = Date.today(); 
			direito.SlaProcessId = processoSLA;
			
			insert direito;
			
			idDireito = direito.id;
		}
		catch(Exception e){
			idDireito = null;	
		}
		
		return idDireito;
	}
	
	public static void finalizarDireito(String processoSLA){
		
		list<Entitlement> listaDireito = buscarDireito(processoSLA);
		
		if(listaDireito.size() > 0){
			
			listaDireito[0].EndDate = Date.today();
			
			update listaDireito;
		}	
		
	}
	
	public static list<Entitlement> buscarDireito(String id){
		
		list<Entitlement> listaDireito = new list<Entitlement>();
		
		try{
		
			listaDireito = [SELECT name, AccountId, StartDate 
							FROM Entitlement
							WHERE id =: id];							
						
		}
		catch(Exception e){
			System.debug('Ocorreu um erro na classe DAODireito');			
		}
		
		return listaDireito;		
					
	}
}