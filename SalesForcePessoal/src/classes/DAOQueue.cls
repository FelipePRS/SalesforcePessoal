public class DAOQueue {

	public static list<Group> obterID(String nome){
			
		list<Group> listQueue = new list<Group>();
		
		try{
		
			listQueue = [SELECT name, id 
			             FROM Group 
			             WHERE Type =: 'Queue' AND name =:nome];			
			
			
		}catch(Exception e){
			
		}
		
		return listQueue;
	}

}