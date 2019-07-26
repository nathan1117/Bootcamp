@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest request) {
        
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"Id":1,"name":"pig","eats":"pig foods","says":"oink oink"}}');
        response.setStatusCode(200);
        return response;

    }
}