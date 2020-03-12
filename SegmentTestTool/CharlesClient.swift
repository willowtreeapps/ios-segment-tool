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
        self.startURL = URL(string: "\(self.baseURLString)/recording/stop")
        self.clearURL = URL(string: "\(self.baseURLString)/recording/stop")
        self.exportURL = URL(string: "\(self.baseURLString)/recording/stop")
    }
    
    func startRecording() {
        let task = URLSession.shared.dataTask(with: self.startURL!) { (data, response, error) in
        }
        task.resume()
    }
    
    func stopRecording() {
        let task = URLSession.shared.dataTask(with: self.startURL!) { (data, response, error) in
        }
        task.resume()
    }
    
    func clearSession() {
        let task = URLSession.shared.dataTask(with: self.startURL!) { (data, response, error) in
        }
        task.resume()
    }
    
    func exportData(handler: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: self.startURL!) { (data, response, error) in
            handler(data)
        }
        task.resume()
    }
}
