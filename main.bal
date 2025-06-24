import ballerina/http;

configurable int servicePort = 9090;

service / on new http:Listener(servicePort) {

    resource function get greeting(http:Caller caller, http:Request req) returns error? {
        var headerResult = req.getHeader("Authorization");

        if headerResult is string {
            string authHeader = headerResult;
            check caller->respond(authHeader);

        } else {

            string[] headerNames = ["Authorization", "Content-Type", "User-Agent","Test-Key"];
            string info = "Headers reçus :\n";

            foreach string name in headerNames {
                var valResult = req.getHeader(name);
                if valResult is string {
                    info += name + ": " + valResult + "\n";
                }
            }

            check caller->respond(info);
        }
    }
}
