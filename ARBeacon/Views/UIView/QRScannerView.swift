//
//  QRCodeScannerView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/30/21.
//

import SwiftUI
import CodeScanner

struct QRCodeScannerView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started"

    var scannerSheet: some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode) // title: scan a qr code
            
            Button("Scan QR Code") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

struct QRCodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerView()
    }
}


