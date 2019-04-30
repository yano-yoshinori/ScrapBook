//
//  DraggableTextView.swift
//  ScrapBook
//
//  Created by 矢野 義範 on 2019/04/30.
//  Copyright © 2019 矢野 義範. All rights reserved.
//

import Cocoa

class DraggableTextView: NSTextView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }

    // window を最前面に持ってくる
    func bringTopMost() {
        let apps: [NSRunningApplication] = NSRunningApplication.runningApplications(withBundleIdentifier: "hachisai.ScrapBook")
        apps.first?.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
    }

    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        self.bringTopMost()
        return NSDragOperation()
    }

    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pasteboard: NSPasteboard = sender.draggingPasteboard
        let data = pasteboard.data(forType: NSPasteboard.PasteboardType.string)

        if (data == nil) {
            return false
        }

        var str = String(data: data!, encoding: .utf8)!
        str = str.trimmingCharacters(in: .whitespaces)
        str.append("\n\n")

        let count = self.textStorage!.characters.count

        let replacementRange: NSRange = NSRange(location: count, length: 0)
        self.insertText(str, replacementRange: replacementRange)

        let count2 = self.textStorage!.characters.count

        let range: NSRange = NSRange(location: count2, length: 0)
        self.setSelectedRange(range)

        return true
    }
}
