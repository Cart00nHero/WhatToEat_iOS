// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class ListShopsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query listShops {
      listShops {
        __typename
        underPrice
        status
        title
        type
        uniqueId
      }
    }
    """

  public let operationName: String = "listShops"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listShops", type: .list(.object(ListShop.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(listShops: [ListShop?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "listShops": listShops.flatMap { (value: [ListShop?]) -> [ResultMap?] in value.map { (value: ListShop?) -> ResultMap? in value.flatMap { (value: ListShop) -> ResultMap in value.resultMap } } }])
    }

    /// Get all shops
    public var listShops: [ListShop?]? {
      get {
        return (resultMap["listShops"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ListShop?] in value.map { (value: ResultMap?) -> ListShop? in value.flatMap { (value: ResultMap) -> ListShop in ListShop(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [ListShop?]) -> [ResultMap?] in value.map { (value: ListShop?) -> ResultMap? in value.flatMap { (value: ListShop) -> ResultMap in value.resultMap } } }, forKey: "listShops")
      }
    }

    public struct ListShop: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Shop"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("underPrice", type: .scalar(Double.self)),
        GraphQLField("status", type: .scalar(Int.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("uniqueId", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(underPrice: Double? = nil, status: Int? = nil, title: String? = nil, type: String? = nil, uniqueId: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Shop", "underPrice": underPrice, "status": status, "title": title, "type": type, "uniqueId": uniqueId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var underPrice: Double? {
        get {
          return resultMap["underPrice"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "underPrice")
        }
      }

      public var status: Int? {
        get {
          return resultMap["status"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var uniqueId: String? {
        get {
          return resultMap["uniqueId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "uniqueId")
        }
      }
    }
  }
}
