import Foundation
import Network

//checking the availability of the network
let config = URLSessionConfiguration.default
config.waitsForConnectivity = true
config.timeoutIntervalForResource = 3

let session = URLSession(configuration: config)

let url = URL(string: "https://www.example.com")!

session.dataTask(with: url) { data, response, error in
    guard let _ = error else {
        print("Connected!")
        return
    }
    print("Disconnected!")
}.resume()


//updating the UI relay to network status

//in app delegate
let monitor = NWPathMonitor()
monitor.start(queue: .global())
//in app delegate end

monitor.pathUpdateHandler = { path in
    if path.status == .satisfied {
        //online status
    } else {
        //offline status
    }
}

if monitor.currentPath.status == .satisfied {
    // Connected
} else {
    // No connection
}

if monitor.currentPath.isExpensive {
    // Using an expensive interface, such as Cellular or a Personal Hotspot
}

if monitor.currentPath.isConstrained {
    // Using Low Data Mode
}


