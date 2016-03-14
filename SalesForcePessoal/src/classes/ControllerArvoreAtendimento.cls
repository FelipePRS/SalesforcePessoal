global class ControllerArvoreAtendimento {
	
	Apexpages.StandardController controller;
	
	public static list<String> listNivelI {get;set;}
	public static list<String> listNivelII {get;set;}
	public static list<String> listNivelIII {get;set;}	
	public static list<ArvoreAtendimento__c> arvore{get;set;}

	public static String idConta {get;set;}
	public static String idContato {get;set;}
	
	//Construtor
	public controllerArvoreAtendimento(ApexPages.StandardController controller){
	
		idConta = ApexPages.currentPage().getParameters().get('conta');
		idContato = ApexPages.currentPage().getParameters().get('contato');
	
		carregarArvore();		
		
	}
		
	
	//Carregar o primeiro nivel
	private static void carregarArvore(){
		
		listNivelI = new list<String>();
		
		list<String> listAux = new list<String>();
		
		arvore = ArvoreAtendimento__c.getall().values();
				
		for(ArvoreAtendimento__c arv: arvore){
	
			listAux.add(arv.NiveII__c);
			
		}
		
		Set<String> myset = new Set<String>();		
		myset.addAll(listAux);
	    listNivelI.addAll(myset);		
		listNivelI.sort();
				
	} 
	
	//Carregar o segundo nivel
	@RemoteAction 
	global static list<String> carregarNivelII(String nivelI){
		
		listNivelII = new list<String>();
		
		list<String> listAux = new list<String>();
		
		arvore = ArvoreAtendimento__c.getall().values();
		
		for(ArvoreAtendimento__c arv: arvore){
			if(arv.NiveII__c == nivelI){
				listAux.add(arv.NivelII__c);
			}			
		}
				
		Set<String> myset = new Set<String>();		
		myset.addAll(listAux);
	    listNivelII.addAll(myset); 
		listNivelII.sort(); 
		
		return 	listNivelII;
		
	}
	
	//Carregar o terceiro nivel
	@RemoteAction 
	global static list<String> carregarNivelIII(String nivelII){
		
		listNivelIII = new list<String>();
		
		arvore = ArvoreAtendimento__c.getall().values();
		
		for(ArvoreAtendimento__c arv: arvore){
			if(arv.NivelII__c == nivelII){ 
				listNivelIII.add(arv.NivelIII__c);
			}				
		}
		
		return 	listNivelIII;
		
	}
	

	
	@RemoteAction 
	global static String redirecionarCaso(String nivelI , String nivelII, String nivelIII){
		
		String codigoTipoRegistro = '';
		String nomeTipoRegistro = '';
		
		system.debug('Nivel I ' + nivelI);
		system.debug('Nivel II ' + nivelII);
		system.debug('Nivel III ' + nivelIII);	
		 
		try{
				
			list<ArvoreAtendimento__c> listRegistro = [SELECT TipoRegistro__c FROM ArvoreAtendimento__c
		                               		 	 	   WHERE NiveII__c =: nivelI AND
		                               		     	         NivelII__c =: nivelII AND
		                              			 	         NivelIII__c =: nivelIII];
		                              			 	         
		    if(listRegistro.size() > 0){
		    	
		    	nomeTipoRegistro = listRegistro[0].TipoRegistro__c;
		    	
		    	if(nomeTipoRegistro != ''){		    	
		    	
		    		codigoTipoRegistro = Schema.SObjectType.Case.getRecordTypeInfosByName().get(nomeTipoRegistro).getRecordTypeId();
		    	
		    	}	
		   		
		    }
		    
		}
		catch(Exception e){
			
		}
		
		return codigoTipoRegistro;
	}

}