global class Geolocation {
	
	public static Double latitude;
	public static Double longitude;
	
	webservice static void location (String IDConta){
		
		list<Account> listaContas = DAOConta.retornarListaConta(IDConta);
		
		if(listaContas.size() > 0){
		
			String endereco = '';
			
	        if (listaContas[0].BillingStreet != null)
	            endereco += listaContas[0].BillingStreet +', ';
	        if (listaContas[0].BillingCity != null)
	            endereco += listaContas[0].BillingCity +', ';
	        if (listaContas[0].BillingState != null)
	            endereco += listaContas[0].BillingState +' ';
	        if (listaContas[0].BillingPostalCode != null)
	            endereco += listaContas[0].BillingPostalCode +', ';
	        if (listaContas[0].BillingCountry != null)
	            endereco += listaContas[0].BillingCountry;
 
        	endereco = EncodingUtil.urlEncode(endereco, 'UTF-8');
        	
        	String URL = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + endereco;
  	      	
        	HttpResponse resposta = Integracao.executarURL('GET', URL);
        	
        	tratarResponse(resposta);
        	
        	if(latitude != null && longitude != null){
        		listaContas[0].Latitude__c = String.valueOf(latitude);
        		listaContas[0].Longitude__c = String.valueOf(longitude);
        		
        		update listaContas[0];
        	}        	
			
		}
	}
	
	private static void tratarResponse(HttpResponse resposta){
		
		JSONParser parser = JSON.createParser(resposta.getBody());
		
		while (parser.nextToken() != null) {
        	
        	if ( (parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'location') ){
            	
            	parser.nextToken();
                
                while ( parser.nextToken() != JSONToken.END_OBJECT ){
                	
                	String localizacao = parser.getText();
                    
                    parser.nextToken();
                  
                    if (localizacao == 'lat')
                        latitude = parser.getDoubleValue();
                    else if (localizacao == 'lng')
                        longitude = parser.getDoubleValue();
                
                } 
       		}
       }
		
	}

}