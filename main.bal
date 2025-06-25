import ballerina/http;
import ballerina/jwt;

configurable int servicePort = 9090;

service / on new http:Listener(servicePort) {

    resource function get greeting(http:Caller caller, http:Request req) returns error? {
        // string[] headerNames = ["Authorization", "Content-Type", "User-Agent", "Test-Key"];
        // string info = "Headers reçus :\n";

        // foreach string name in headerNames {
        //     var valResult = req.getHeader(name);
        //     if valResult is string {
        //         info += name + ": " + valResult + "\n";
        //     }
        // }

        var tokenResult = req.getHeader("Test-Key");

        if tokenResult is string {
            string token = tokenResult;
            var jwt = jwt:decode(token);

            check caller->respond(jwt);
        }

        check caller->respond("check return");
    }
}

