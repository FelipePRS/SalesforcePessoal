public with sharing class Integracao {
	
	private static HttpRequest criarRequest(String method, String endpoint ){
				
		HttpRequest httpRequest = new HttpRequest();

        httpRequest.setMethod( method );
        httpRequest.setTimeout( 50000 );
       
        httpRequest.setEndpoint( endpoint ); 

		return httpRequest;
	}
	
	public static HttpResponse executarURL (String method, String endPoint){
		
		HttpResponse response = null;
		
		try{
		
			HttpRequest request = criarRequest(method,endPoint);
			
			Http http = new Http();
	     
	        response = http.send(request);
        
		}
		catch(Exception e){
			
		}
		
		return response;
	}
}