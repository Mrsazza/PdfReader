//
//  PDFKitView.swift
//  PdfReader
//
//  Created by Sazza on 21/4/22.
//

import SwiftUI
import PDFKit

struct PDFKitView: UIViewRepresentable {
    
    let pdfDocument: PDFDocument

    //var singlePage: Bool = false
    init(showing pdfDoc: PDFDocument) {
        self.pdfDocument = pdfDoc
    }
    
    //you could also have inits that take a URL or Data
    
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.document = pdfDocument
        pdfView.autoresizesSubviews = true
        pdfView.minScaleFactor = pdfView.scaleFactorForSizeToFit
        pdfView.maxScaleFactor = 4.0
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleLeftMargin]
        pdfView.displayDirection = .horizontal
        pdfView.autoScales = true
        pdfView.displayMode = .singlePage//.singlePageContinuous
        pdfView.displaysPageBreaks = true
        pdfView.usePageViewController(true, withViewOptions: [:])
        
        let thumbnailSize: Int = 80
        let pdfThumbnailPerPagePadding = 2

        let pdfThumbnailView = PDFThumbnailView()
        pdfThumbnailView.translatesAutoresizingMaskIntoConstraints = false
        pdfThumbnailView.pdfView = pdfView
        pdfThumbnailView.layoutMode = .horizontal
        pdfThumbnailView.thumbnailSize = CGSize(width: thumbnailSize, height: thumbnailSize)

        //pdfView.addSubview(pdfThumbnailView)
        
//        NSLayoutConstraint.activate([
//            pdfThumbnailView.heightAnchor.constraint(equalToConstant: CGFloat(thumbnailSize)),
//            pdfThumbnailView.leadingAnchor.constraint(equalTo: pdfView.leadingAnchor),
//            pdfThumbnailView.trailingAnchor.constraint(equalTo: pdfView.trailingAnchor),
//            pdfThumbnailView.bottomAnchor.constraint(equalTo: pdfView.bottomAnchor)
//        ])
        
        NSLayoutConstraint.activate([
            pdfThumbnailView.heightAnchor.constraint(equalToConstant: CGFloat(thumbnailSize)),
            pdfThumbnailView.widthAnchor.constraint(equalToConstant: CGFloat(pdfDocument.pageCount*(thumbnailSize + pdfThumbnailPerPagePadding)))
        ])
        
        var pdfThumbnailScrollView = UIScrollView()
        pdfThumbnailScrollView.translatesAutoresizingMaskIntoConstraints = false
        pdfThumbnailScrollView.addSubview(pdfThumbnailView)
        
        NSLayoutConstraint.activate([
            pdfThumbnailView.leadingAnchor.constraint(equalTo: pdfThumbnailScrollView.leadingAnchor),
            pdfThumbnailView.trailingAnchor.constraint(equalTo: pdfThumbnailScrollView.trailingAnchor),
            pdfThumbnailView.topAnchor.constraint(equalTo: pdfThumbnailScrollView.topAnchor),
            pdfThumbnailView.bottomAnchor.constraint(equalTo: pdfThumbnailScrollView.bottomAnchor)
        ])
        
        pdfView.addSubview(pdfThumbnailView)
        
        
        return pdfView
    }
    
    func updateUIView(_ pdfView: PDFView, context: Context) {
        pdfView.document = pdfDocument
    }
}

extension UIView {
    func addSubviewAndConstrain(_ subview: UIView) -> Void {
        subview.frame = self.bounds
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        subview.alpha = 1.0
        self.addSubview(subview)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: subview.widthAnchor, multiplier: 1.0),
            self.heightAnchor.constraint(equalTo: subview.heightAnchor, multiplier: 1.0),
            self.leadingAnchor.constraint(equalTo: subview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: subview.trailingAnchor),
            self.topAnchor.constraint(equalTo: subview.topAnchor),
            self.bottomAnchor.constraint(equalTo: subview.bottomAnchor)
            ])
    }
}
