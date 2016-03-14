public with sharing class ControllerDeploy {

	public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
	public List<Pair> lstfieldname{get;set;}
	public List <Pair> fields {get{return lstfieldname;} set{lstfieldname =value;}}
	public List <SelectOption> objectNames{public get; private set;}
	public String selectedObject {get; set;}
	public List<Account> listaConta {get;set;}
	
	// Intialize objectNames and fields
	
	public ControllerDeploy() {
		objectNames = initObjNames();
		fields = new List<Pair>();
		
		listaConta = [SELECT ID, NAME FROM ACCOUNT];
		
		
	}
	// Populate SelectOption list -
	 
	// find all sObjects available in the organization
	
	private List<SelectOption> initObjNames() {
		
		List<SelectOption> objNames = new List<SelectOption>();
		List<String> entities = new List<String>(schemaMap.keySet());
		
		entities.sort();
		
		for(String name : entities)
			objNames.add(new SelectOption(name,name));
		
		return objNames;
	}
	
	// Find the fields for the selected object
	
	
	
	public class Pair
	{
		public String key {get; set;}
		public String val {get; set;}
	}
	
	

}