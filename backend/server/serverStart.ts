import getEnvVariables from "../enviroment/getEnvVariables";
getEnvVariables();
import getKey from "../key/getKey";
import server from "./server";

const serverStart = async() => {

    await getKey();

    console.log("ENV", process.env.NODE_ENV);

    const port = process.env.PORT || 8080;
    
    server.listen(port, () => {
        console.log("Server Running On Port:", port);
    })
}

serverStart();
