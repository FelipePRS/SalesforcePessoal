/**************************************************************************************************************
* Avanxo Brasil
* @author 			Felipe Souza href=<fsouza@avanxo.com>
* Proyect:			Ultragaz Brazil
* Description:		
*
* Changes (Version)
* -------------------------------------
*			No.		Fecha			Autor					Descripción
*			-----	----------		--------------------	---------------
* @version	 1.0	2014-11-04		Felipe Souza (FS)      Class created
* @version	 1.0	2014-11-04		Felipe Souza (FS)      Class 
*************************************************************************************************************/

public with sharing class DAOCaso {
	
	
	public static list<Case> buscarCaso(String id){
		
		list<Case> listCase = new list<Case>();
		
		try{
			listCase = [SELECT OwnerId, RecordType.name 
			            FROM Case 
			            WHERE id =: id];			
		}
		
		catch(Exception e){
						
		}
		
		return listCase;
		
	}

}