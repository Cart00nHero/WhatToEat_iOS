// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct InputBranch: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - address
  ///   - closedTime
  ///   - name
  ///   - openTime
  ///   - orderId
  ///   - tel
  public init(address: Swift.Optional<GourmetAddress?> = nil, closedTime: Swift.Optional<String?> = nil, name: Swift.Optional<String?> = nil, openTime: Swift.Optional<String?> = nil, orderId: Swift.Optional<Int?> = nil, tel: Swift.Optional<String?> = nil) {
    graphQLMap = ["address": address, "closedTime": closedTime, "name": name, "openTime": openTime, "orderId": orderId, "tel": tel]
  }

  public var address: Swift.Optional<GourmetAddress?> {
    get {
      return graphQLMap["address"] as? Swift.Optional<GourmetAddress?> ?? Swift.Optional<GourmetAddress?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var closedTime: Swift.Optional<String?> {
    get {
      return graphQLMap["closedTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "closedTime")
    }
  }

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var openTime: Swift.Optional<String?> {
    get {
      return graphQLMap["openTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "openTime")
    }
  }

  public var orderId: Swift.Optional<Int?> {
    get {
      return graphQLMap["orderId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "orderId")
    }
  }

  public var tel: Swift.Optional<String?> {
    get {
      return graphQLMap["tel"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "tel")
    }
  }
}

public struct GourmetAddress: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - administrativeArea
  ///   - completeInfo
  ///   - isoNationCode
  ///   - latitude
  ///   - locality
  ///   - longitude
  ///   - nation
  ///   - ownerType
  ///   - postalCode
  ///   - subAdministrativeArea
  ///   - subLocality
  ///   - subThoroughfare
  ///   - thoroughfare
  public init(administrativeArea: Swift.Optional<String?> = nil, completeInfo: Swift.Optional<String?> = nil, isoNationCode: Swift.Optional<String?> = nil, latitude: Swift.Optional<String?> = nil, locality: Swift.Optional<String?> = nil, longitude: Swift.Optional<String?> = nil, nation: Swift.Optional<String?> = nil, ownerType: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, subAdministrativeArea: Swift.Optional<String?> = nil, subLocality: Swift.Optional<String?> = nil, subThoroughfare: Swift.Optional<String?> = nil, thoroughfare: Swift.Optional<String?> = nil) {
    graphQLMap = ["administrativeArea": administrativeArea, "completeInfo": completeInfo, "isoNationCode": isoNationCode, "latitude": latitude, "locality": locality, "longitude": longitude, "nation": nation, "ownerType": ownerType, "postalCode": postalCode, "subAdministrativeArea": subAdministrativeArea, "subLocality": subLocality, "subThoroughfare": subThoroughfare, "thoroughfare": thoroughfare]
  }

  public var administrativeArea: Swift.Optional<String?> {
    get {
      return graphQLMap["administrativeArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "administrativeArea")
    }
  }

  public var completeInfo: Swift.Optional<String?> {
    get {
      return graphQLMap["completeInfo"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completeInfo")
    }
  }

  public var isoNationCode: Swift.Optional<String?> {
    get {
      return graphQLMap["isoNationCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isoNationCode")
    }
  }

  public var latitude: Swift.Optional<String?> {
    get {
      return graphQLMap["latitude"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
    }
  }

  public var locality: Swift.Optional<String?> {
    get {
      return graphQLMap["locality"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "locality")
    }
  }

  public var longitude: Swift.Optional<String?> {
    get {
      return graphQLMap["longitude"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "longitude")
    }
  }

  public var nation: Swift.Optional<String?> {
    get {
      return graphQLMap["nation"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nation")
    }
  }

  public var ownerType: Swift.Optional<String?> {
    get {
      return graphQLMap["ownerType"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ownerType")
    }
  }

  public var postalCode: Swift.Optional<String?> {
    get {
      return graphQLMap["postalCode"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postalCode")
    }
  }

  public var subAdministrativeArea: Swift.Optional<String?> {
    get {
      return graphQLMap["subAdministrativeArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subAdministrativeArea")
    }
  }

  public var subLocality: Swift.Optional<String?> {
    get {
      return graphQLMap["subLocality"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subLocality")
    }
  }

  public var subThoroughfare: Swift.Optional<String?> {
    get {
      return graphQLMap["subThoroughfare"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subThoroughfare")
    }
  }

  public var thoroughfare: Swift.Optional<String?> {
    get {
      return graphQLMap["thoroughfare"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "thoroughfare")
    }
  }
}

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

public final class CreateShopMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation createShop($title: String!, $style: String, $type: String, $underPrice: Float, $branches: [InputBranch]!) {
      createShop(title: $title, style: $style, type: $type, underPrice: $underPrice, branches: $branches) {
        __typename
        uniqueId
        title
        style
        type
        status
        underPrice
      }
    }
    """

  public let operationName: String = "createShop"

  public var title: String
  public var style: String?
  public var type: String?
  public var underPrice: Double?
  public var branches: [InputBranch?]

  public init(title: String, style: String? = nil, type: String? = nil, underPrice: Double? = nil, branches: [InputBranch?]) {
    self.title = title
    self.style = style
    self.type = type
    self.underPrice = underPrice
    self.branches = branches
  }

  public var variables: GraphQLMap? {
    return ["title": title, "style": style, "type": type, "underPrice": underPrice, "branches": branches]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createShop", arguments: ["title": GraphQLVariable("title"), "style": GraphQLVariable("style"), "type": GraphQLVariable("type"), "underPrice": GraphQLVariable("underPrice"), "branches": GraphQLVariable("branches")], type: .object(CreateShop.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createShop: CreateShop? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createShop": createShop.flatMap { (value: CreateShop) -> ResultMap in value.resultMap }])
    }

    public var createShop: CreateShop? {
      get {
        return (resultMap["createShop"] as? ResultMap).flatMap { CreateShop(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createShop")
      }
    }

    public struct CreateShop: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Shop"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("uniqueId", type: .scalar(String.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("style", type: .scalar(String.self)),
        GraphQLField("type", type: .scalar(String.self)),
        GraphQLField("status", type: .scalar(Int.self)),
        GraphQLField("underPrice", type: .scalar(Double.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, title: String? = nil, style: String? = nil, type: String? = nil, status: Int? = nil, underPrice: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "title": title, "style": style, "type": type, "status": status, "underPrice": underPrice])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var style: String? {
        get {
          return resultMap["style"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "style")
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

      public var status: Int? {
        get {
          return resultMap["status"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
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
    }
  }
}
