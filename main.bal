import ballerina/http;

configurable int servicePort = 9090;

service / on new http:Listener(servicePort) {
    
    resource function get greeting() returns string {
        return "Hello World POC";
    }
}