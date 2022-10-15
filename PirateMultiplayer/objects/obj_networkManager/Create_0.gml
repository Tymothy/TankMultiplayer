/// @description Connect to server via websocket

clientID = -1;

clientSocket = network_create_socket(network_socket_ws);
network_connect_raw_async(clientSocket, SERVER_IP, SERVER_PORT);
