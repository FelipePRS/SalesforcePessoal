public with sharing class ControllerGoogleMaps {
	
	public static String latitude {get;set;}
	public static String longitude {get;set;}
	
	public ControllerGoogleMaps(){
		
		latitude = ApexPages.currentPage().getParameters().get('latitude');
		longitude = ApexPages.currentPage().getParameters().get('longitude');
	
	}

}