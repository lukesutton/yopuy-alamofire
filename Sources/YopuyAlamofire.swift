import Yopuy
import Alamofire
import Foundation

public struct AlamofireAdapter: HTTPAdapter {
    private let manager: SessionManager

    public init(_ manager: SessionManager) {
      self.manager = manager
    }

    public func get(url: URL, query: [String: Any]?, callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(url, method: .get, parameters: query)
      call(request: request, callback: callback)
    }

    public func post(url: URL, body: [String: Any], callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(url, method: .post, parameters: body)
      call(request: request, callback: callback)
    }

    public func put(url: URL, body: [String: Any], callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(url, method: .put, parameters: body)
      call(request: request, callback: callback)
    }

    public func patch(url: URL, body: [String: Any], callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(url, method: .patch, parameters: body)
      call(request: request, callback: callback)
    }

    public func delete(url: URL, callback: @escaping (HTTPAdapterResult) -> Void) {
      let request = manager.request(url, method: .delete)
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
