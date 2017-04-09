# Yopuy Alamofire

A _very_ simple package that adds support for the [Alamofire](https://github.com/Alamofire/Alamofire) package to [Yopuy](https://github.com/lukesutton/Yopuy).

It's easy to use. Just construct an instance of Alamofire's `SessionManager` and convert it into the adapter type.

```swift
import Yopuy
import YopuyAlamofire

let adapter = Alamofire.SessionManager.default.yopuyAdapter
let service = Service(adapter: adapter)
}
```

You can also manually construct an adapter if you already have an instance of the session manager.

```swift
let adapter = AlamofireAdapter(manager: manager)
let service = Service(adapter: adapter)
```
