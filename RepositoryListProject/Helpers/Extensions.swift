//
//  Extensions.swift
//  RepositoryListProject
//
//  Created by bisma on 26/08/2024.
//

import Foundation
import UIKit
extension UIImage {
    public static func gif(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        
        let count = CGImageSourceGetCount(source)
        var images = [CGImage]()
        var duration: TimeInterval = 0

        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(image)
            }

            if let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil),
               let gifInfo = (properties as NSDictionary)[kCGImagePropertyGIFDictionary] as? NSDictionary,
               let delayTime = gifInfo[kCGImagePropertyGIFDelayTime] as? TimeInterval {
                duration += delayTime
            }
        }

        let frames = images.map { UIImage(cgImage: $0) }
        return UIImage.animatedImage(with: frames, duration: duration)
    }
}
