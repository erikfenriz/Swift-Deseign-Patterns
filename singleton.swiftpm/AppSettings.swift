//
//  AppSettings.swift
//  singleton
//

import Foundation

final public class AppSettings {
    nonisolated(unsafe) public static let shared = AppSettings()
    private var settings: [String: Any] = [:]
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
    private init() {}
    
    public func set(value: Any, forKey key: String) {
        concurrentQueue.sync(flags: .barrier){
            self.settings[key] = value
        }
    }
    
    public func object(forKey key: String) -> Any? {
        var result: Any?
        concurrentQueue.sync {
            result = settings[key]
        }
        return result
    }
    
    public func reset() {
        settings.removeAll()
    }
}
