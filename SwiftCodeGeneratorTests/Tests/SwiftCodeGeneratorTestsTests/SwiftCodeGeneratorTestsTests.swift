import XCTest
import class Foundation.Bundle

@available(macOS 12.0, *)
final class SwiftCodeGeneratorTestsTests: XCTestCase {
    /// Addresses
    /// get https://fakerapi.it/api/v1/addresses
    func getAddressesRequest() async throws {
        let parameters = [
            "_quantity":"100",
            "_locale":"en_US",
        ]

        var components = URLComponents(string: "https://fakerapi.it/api/v1/addresses")!

        for parameter in parameters {
        if parameter.value.lowercased() == "null" { continue }
            components.queryItems?.append(URLQueryItem(name: parameter.key, value: parameter.value))
        }

        // Create request with HTTP method
        var request = URLRequest(url: components.url!)
        request.httpMethod = "get".uppercased()
        
        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
        print("Response: \(response.debugDescription)")
        print("Data: \(String(data: data, encoding: .utf8) ?? "Unable to render data as UTF-8 string")")
        //let json = try JSONSerialization.jsonObject(with: data, options: [])
        //print("JSON: \(json)")
    }
    
    func testGet() async throws {
        try await getAddressesRequest()
    }
}
