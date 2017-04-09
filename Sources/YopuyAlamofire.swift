import Yopuy
import Alamofire

public struct AlamofireAdapter: HTTPAdapter {
    let manager: SessionManager

    public func get(path: String, query: [String: Any]?, callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(path, method: .get, parameters: query)
      call(request: request, callback: callback)
    }

    public func post(path: String, body: [String: Any], callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(path, method: .post, parameters: body)
      call(request: request, callback: callback)
    }

    public func put(path: String, body: [String: Any], callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(path, method: .put, parameters: body)
      call(request: request, callback: callback)
    }

    public func patch(path: String, body: [String: Any], callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(path, method: .patch, parameters: body)
      call(request: request, callback: callback)
    }

    public func delete(path: String, callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(path, method: .delete)
      call(request: request, callback: callback)
    }

    private func call(request: DataRequest, callback: @escaping (HTTPAdapterResult) -> Void) {
      request.validate().responseData { response in
        switch response.result {
        case let .success(data):
          callback(.data(data))
        case let .failure(error):
          callback(.error(error))
        }
      }
    }
}

public extension SessionManager {
  public var yopuyAdapter: AlamofireAdapter {
    return AlamofireAdapter(manager: self)
  }
}
