//
//  BaseResponseObject.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 09/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class BaseResponseObject: NSObject {

    private let xmlParser: XMLParser

    // The object name that we want to parse
    private let objectName: String

    // Property where we collect all data before creating wanted object.
    private var dictionaryData: [String: String] = [ : ]

    // Allow to write properties to `dictionaryData`. If it is `true` we receive information about our object.
    private var allowCreatingObject: Bool = false

    // The value for the object properties. We fill it in `dictionaryData` data when delegate method `didEndElement` is called
    private var propertyValue: String = ""

    init(data: Data, objectName: String) {
        xmlParser = XMLParser(data: data)
        self.objectName = objectName
        super.init()
        xmlParser.delegate = self
        xmlParser.parse()
    }

    func createObject(_ dict: [String : String]) {}
}

extension BaseResponseObject: XMLParserDelegate {

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

        if elementName == objectName {
            allowCreatingObject = true
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if allowCreatingObject {
            propertyValue+=string
        }
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == objectName {
            allowCreatingObject = false
            createObject(dictionaryData)
            dictionaryData = [:]
        }
        else if allowCreatingObject {
            dictionaryData[elementName] = propertyValue.trimmingCharacters(in: .whitespacesAndNewlines)
            propertyValue = ""
        }
    }
}

