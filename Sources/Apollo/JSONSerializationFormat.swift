import Foundation

public final class JSONSerializationFormat {
  public class func serialize(value: JSONEncodable) throws -> Data {
    if let jsonValue = value.jsonValue as? String {
        let escapedValue = jsonValue.replacingOccurrences(of: "\\", with: "", options: .literal, range: nil).capitalized
        return try JSONSerialization.data(withJSONObject: escapedValue, options: [])
    }
    return try JSONSerialization.data(withJSONObject: value.jsonValue, options: [])
  }
  
  public class func deserialize(data: Data) throws -> JSONValue {
    return try JSONSerialization.jsonObject(with: data, options: [])
  }
}
