#if canImport(Pulse)
import Foundation
import ObjectiveC
import Pulse

public class PulseRemoteLoggerEnableService: NSObject {
    @objc
    public class func start() {
        guard #available(iOS 14.0, *) else {
            print("\n\(Date().description) [ ⚠️ iOS 14 시뮬레이터에서 호출하시기 바랍니다. ⚠️ ]\n")
            return
        }
        print("\n\(Date().description) [ 🤖 Pulse 연동을 시작합니다. 🤖 ]\n")

        URLSessionProxyDelegate.enableAutomaticRegistration()
        RemoteLogger.shared.enable()
        if let server = RemoteLogger.shared.servers.first {
            RemoteLogger.shared.connect(to: server)
            print("\n\(Date().description) [ 🤖 Pulse 연동 완료 🤖 ]\n")
        } else {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                RemoteLogger.shared.servers.first.map {
                    RemoteLogger.shared.connect(to: $0)
                    print("\n\(Date().description) [ 🤖 Pulse 연동 완료 🤖 ]\n")
                }
            }
        }
    }
}
#else
public class PulseRemoteLoggerEnableService: NSObject {
    @objc
    public class func start() {}
}
#endif
