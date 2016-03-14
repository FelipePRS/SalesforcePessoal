public with sharing class DAOConta {
	
	//Retorna a lista de conta por ID
	public static list<Account> retornarListaConta(String IDConta){
		
		list<Account> listaContas = new list<Account>();
		
		try{
			listaContas = [SELECT BillingCity,BillingCountry,BillingPostalCode,BillingState,BillingStreet 
			               FROM Account 
			               WHERE ID =: IDConta];
		}
		catch(Exception e){
			
		}
		
		return listaContas;
	}

}