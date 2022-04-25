//
//  PDFThumbnailRepresented.swift
//  PdfReader
//
//  Created by Sazza on 24/4/22.
//

import PDFKit
import SwiftUI

struct PDFThumbnailRepresented : UIViewRepresentable {
    let pdfDocument: PDFDocument
    //var singlePage: Bool = false
    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }
    
    func makeUIView(context: Context) -> PDFThumbnailView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        let thumbnail = PDFThumbnailView()
        thumbnail.pdfView = pdfView
        thumbnail.thumbnailSize = CGSize(width: 100, height: 100)
        thumbnail.layoutMode = .horizontal
        return thumbnail
    }
    
    func updateUIView(_ uiView: PDFThumbnailView, context: Context) {
        //do any updates you need
        //you could update the thumbnailSize to the size of the view here if you want, for example
        //uiView.thumbnailSize = uiView.bounds.size
    }
}
