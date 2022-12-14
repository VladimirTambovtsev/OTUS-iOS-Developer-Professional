//
// ArticleListResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct ArticleListResponse: Codable, JSONEncodable, Hashable {

    public var numFound: Double
    public var start: Double
    public var maxScore: Double
    public var docs: [ArticleListResponseDocsInner]

    public init(numFound: Double, start: Double, maxScore: Double, docs: [ArticleListResponseDocsInner]) {
        self.numFound = numFound
        self.start = start
        self.maxScore = maxScore
        self.docs = docs
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case numFound
        case start
        case maxScore
        case docs
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(numFound, forKey: .numFound)
        try container.encode(start, forKey: .start)
        try container.encode(maxScore, forKey: .maxScore)
        try container.encode(docs, forKey: .docs)
    }
}

