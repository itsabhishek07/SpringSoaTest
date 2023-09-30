public class HttpCalloutInterview {

    public static void makeHttpCallout() {
        
        String requestBody = '{ "args": { "foo1": "bar1", "foo2": "bar2" } }';

        
        HttpRequest httpRequest = new HttpRequest();
        httpRequest.setEndpoint('https://postman-echo.com/get');
        httpRequest.setMethod('GET');
        httpRequest.setHeader('Content-Type', 'application/json');
        httpRequest.setBody(requestBody);

        
        httpRequest.setHeader('x-forwarded-proto', 'https');
        httpRequest.setHeader('x-forwarded-port', '443');
        httpRequest.setHeader('host', 'postman-echo.com');
        httpRequest.setHeader('x-amzn-trace-id', 'Root=1-6517e019-39608b69193216954856381d');
        httpRequest.setHeader('upgrade-insecure-requests', '1');
        httpRequest.setHeader('user-agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36');
        httpRequest.setHeader('accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7');
        httpRequest.setHeader('sec-fetch-site', 'cross-site');
        httpRequest.setHeader('sec-fetch-mode', 'navigate');
        httpRequest.setHeader('sec-fetch-user', '?1');
        httpRequest.setHeader('sec-fetch-dest', 'document');
        httpRequest.setHeader('sec-ch-ua', '"Not.A/Brand";v="8", "Chromium";v="114", "Google Chrome";v="114"');
        httpRequest.setHeader('sec-ch-ua-mobile', '?0');
        httpRequest.setHeader('sec-ch-ua-platform', '"Windows"');
        httpRequest.setHeader('accept-encoding', 'gzip, deflate, br');
        httpRequest.setHeader('accept-language', 'en-IN,en-GB;q=0.9,en-US;q=0.8,en;q=0.7');
        httpRequest.setHeader('if-none-match', 'W/"4b7-jVQNzGWqQJxC2VuowiclnFgXiTU"');
        httpRequest.setHeader('cookie', 'sails.sid=s%3AW2L4Zq6xRcvxKT7txj-hv7ogRa-VY_j5.7Nz5cfy%2BKrGVtn2PLREWwdkSmn0vOQ8%2F21sMLHz8tkE');

        
        Http http = new Http();

        
        HttpResponse httpResponse = http.send(httpRequest);

        
        if (httpResponse.getStatusCode() == 200) {
           
            String responseString = httpResponse.getBody();
            System.debug('HTTP Response: ' + responseString);
        } else {
          
            System.debug('HTTP Request Failed with Status Code: ' + httpResponse.getStatusCode());
            System.debug('HTTP Response: ' + httpResponse.getBody());
        }
    }
}