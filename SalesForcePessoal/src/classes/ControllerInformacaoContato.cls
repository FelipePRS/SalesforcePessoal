public with sharing class ControllerInformacaoContato {
	
	Apexpages.StandardController controller;
	
	public Contact contato {get;set;} 	
	
	//Construtor
	public controllerInformacaoContato(ApexPages.StandardController controller){
		
		contato = (Contact) controller.getRecord();  	
		
	}

}