import ballerina/http;

configurable int servicePort = 9090;

service / on new http:Listener(servicePort) {

    resource function get greeting(http:Caller caller, http:Request req) returns error? {
        var headerResult = req.getHeader("Authorization");

        if headerResult is string {
            string authHeader = headerResult;
            check caller->respond(authHeader);

        } else {
            check caller->respond("Header Authorization manquant.");
        }
    }
}
