//
//  StringUtils.swift
//  ARBeacon
//
//  Created by Gove Allen on 9/30/21.
//

import Foundation

/// String extension to allow handling of base64 encoding and decoding.
/// see https://stackoverflow.com/a/52453210/15034002
///
extension String {
    
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String {
        var st = self;
        if (st.count % 4 <= 2){
            st += String(repeating: "=", count: (st.count % 4))
        }
        guard let data = Data(base64Encoded: st) else { return "" }
        return String(data: data, encoding: .utf8) ?? ""
    }
    
    static func base64Decoded(str:String) -> String {
        var st = str;
        if (st.count % 4 <= 2){
            st += String(repeating: "=", count: (st.count % 4))
        }
        guard let data = Data(base64Encoded: st) else { return "" }
        return String(data: data, encoding: .utf8) ?? ""
    }
}
