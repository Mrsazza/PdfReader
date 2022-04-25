//
//  ContentView.swift
//  PdfReader
//
//  Created by Sazza on 21/4/22.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    let pdfDoc: PDFDocument
    
       init() {
           //for the sake of example, we're going to assume
           //you have a file Lipsum.pdf in your bundle
           let url = Bundle.main.url(forResource: "ThePdf", withExtension: "pdf")!
           pdfDoc = PDFDocument(url: url)!
       }
       
    
    var body: some View {
        NavigationView {
            VStack {
                PDFKitView(showing: pdfDoc)
//                PDFThumbnailRepresented(showing: pdfDoc)
//                    .frame( height: 90, alignment: .leading)
//                    .padding()
            }
            .navigationTitle("PDB Prep")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
