//
//  CharlesClient.swift
//  SegmentTestTool
//
//  Created by Michael Rack on 3/12/20.
//  Copyright © 2020 Willow Tree Apps. All rights reserved.
//

import Foundation

class CharlesClient {
    private var baseURLString: String
    private var stopURL: URL?
    private var startURL: URL?
    private var clearURL: URL?
    private var exportURL: URL?
    
    init() {
        self.baseURLString = "http://control.charles"
        self.stopURL = URL(string: "\(self.baseURLString)/recording/stop")
        self.startURL = URL(string: "\(self.baseURLString)/recording/start")
        self.clearURL = URL(string: "\(self.baseURLString)/session/clear")
        self.exportURL = URL(string: "\(self.baseURLString)/session/export-json")
    }
    
    func startRecording(completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: self.startURL!) { (data, response, error) in
            completion(data)
        }
        task.resume()
    }
    
    func stopRecording(completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: self.stopURL!) { (data, response, error) in
            completion(data)
        }
        task.resume()
    }
    
    func clearSession(completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: self.clearURL!) { (data, response, error) in
            completion(data)
        }
        task.resume()
    }
    
    func exportData(completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: self.exportURL!) { (data, response, error) in
            completion(data)
        }
        task.resume()
    }
}
