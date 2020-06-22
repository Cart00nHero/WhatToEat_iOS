// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct InputToken: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - token
  ///   - type
  public init(token: String, type: String) {
    graphQLMap = ["token": token, "type": type]
  }

  public var token: String {
    get {
      return graphQLMap["token"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var type: String {
    get {
      return graphQLMap["type"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public struct InputAddress: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - administrativeArea
  ///   - annotation
  ///   - completeInfo
  ///   - floor
  ///   - fullInfo
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
  public init(administrativeArea: Swift.Optional<String?> = nil, annotation: Swift.Optional<String?> = nil, completeInfo: String, floor: Swift.Optional<String?> = nil, fullInfo: String, isoNationCode: Swift.Optional<String?> = nil, latitude: String, locality: Swift.Optional<String?> = nil, longitude: String, nation: Swift.Optional<String?> = nil, ownerType: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, subAdministrativeArea: Swift.Optional<String?> = nil, subLocality: Swift.Optional<String?> = nil, subThoroughfare: Swift.Optional<String?> = nil, thoroughfare: Swift.Optional<String?> = nil) {
    graphQLMap = ["administrativeArea": administrativeArea, "annotation": annotation, "completeInfo": completeInfo, "floor": floor, "fullInfo": fullInfo, "isoNationCode": isoNationCode, "latitude": latitude, "locality": locality, "longitude": longitude, "nation": nation, "ownerType": ownerType, "postalCode": postalCode, "subAdministrativeArea": subAdministrativeArea, "subLocality": subLocality, "subThoroughfare": subThoroughfare, "thoroughfare": thoroughfare]
  }

  public var administrativeArea: Swift.Optional<String?> {
    get {
      return graphQLMap["administrativeArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "administrativeArea")
    }
  }

  public var annotation: Swift.Optional<String?> {
    get {
      return graphQLMap["annotation"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "annotation")
    }
  }

  public var completeInfo: String {
    get {
      return graphQLMap["completeInfo"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completeInfo")
    }
  }

  public var floor: Swift.Optional<String?> {
    get {
      return graphQLMap["floor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "floor")
    }
  }

  public var fullInfo: String {
    get {
      return graphQLMap["fullInfo"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fullInfo")
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

  public var latitude: String {
    get {
      return graphQLMap["latitude"] as! String
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

  public var longitude: String {
    get {
      return graphQLMap["longitude"] as! String
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

public struct InputBranch: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - closedTime
  ///   - name
  ///   - openTime
  ///   - orderId
  ///   - shop
  ///   - tel
  ///   - uniqueId
  public init(closedTime: Swift.Optional<String?> = nil, name: String, openTime: Swift.Optional<String?> = nil, orderId: Swift.Optional<Int?> = nil, shop: InputShop, tel: Swift.Optional<String?> = nil, uniqueId: Swift.Optional<String?> = nil) {
    graphQLMap = ["closedTime": closedTime, "name": name, "openTime": openTime, "orderId": orderId, "shop": shop, "tel": tel, "uniqueId": uniqueId]
  }

  public var closedTime: Swift.Optional<String?> {
    get {
      return graphQLMap["closedTime"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "closedTime")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
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

  public var shop: InputShop {
    get {
      return graphQLMap["shop"] as! InputShop
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shop")
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

  public var uniqueId: Swift.Optional<String?> {
    get {
      return graphQLMap["uniqueId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "uniqueId")
    }
  }
}

public struct InputShop: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - status
  ///   - style
  ///   - title
  ///   - type
  ///   - underPrice
  ///   - uniqueId
  public init(status: Swift.Optional<Int?> = nil, style: Swift.Optional<String?> = nil, title: String, type: Swift.Optional<String?> = nil, underPrice: Double, uniqueId: Swift.Optional<String?> = nil) {
    graphQLMap = ["status": status, "style": style, "title": title, "type": type, "underPrice": underPrice, "uniqueId": uniqueId]
  }

  public var status: Swift.Optional<Int?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var style: Swift.Optional<String?> {
    get {
      return graphQLMap["style"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "style")
    }
  }

  public var title: String {
    get {
      return graphQLMap["title"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "title")
    }
  }

  public var type: Swift.Optional<String?> {
    get {
      return graphQLMap["type"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }

  public var underPrice: Double {
    get {
      return graphQLMap["underPrice"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "underPrice")
    }
  }

  public var uniqueId: Swift.Optional<String?> {
    get {
      return graphQLMap["uniqueId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "uniqueId")
    }
  }
}

/// address dynamic query parameters
public struct AddressDqCmd: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - administrativeArea
  ///   - annotation
  ///   - completeInfo
  ///   - floor
  ///   - fullInfo
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
  public init(administrativeArea: Swift.Optional<String?> = nil, annotation: Swift.Optional<String?> = nil, completeInfo: Swift.Optional<String?> = nil, floor: Swift.Optional<String?> = nil, fullInfo: Swift.Optional<String?> = nil, isoNationCode: Swift.Optional<String?> = nil, latitude: Swift.Optional<String?> = nil, locality: Swift.Optional<String?> = nil, longitude: Swift.Optional<String?> = nil, nation: Swift.Optional<String?> = nil, ownerType: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, subAdministrativeArea: Swift.Optional<String?> = nil, subLocality: Swift.Optional<String?> = nil, subThoroughfare: Swift.Optional<String?> = nil, thoroughfare: Swift.Optional<String?> = nil) {
    graphQLMap = ["administrativeArea": administrativeArea, "annotation": annotation, "completeInfo": completeInfo, "floor": floor, "fullInfo": fullInfo, "isoNationCode": isoNationCode, "latitude": latitude, "locality": locality, "longitude": longitude, "nation": nation, "ownerType": ownerType, "postalCode": postalCode, "subAdministrativeArea": subAdministrativeArea, "subLocality": subLocality, "subThoroughfare": subThoroughfare, "thoroughfare": thoroughfare]
  }

  public var administrativeArea: Swift.Optional<String?> {
    get {
      return graphQLMap["administrativeArea"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "administrativeArea")
    }
  }

  public var annotation: Swift.Optional<String?> {
    get {
      return graphQLMap["annotation"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "annotation")
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

  public var floor: Swift.Optional<String?> {
    get {
      return graphQLMap["floor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "floor")
    }
  }

  public var fullInfo: Swift.Optional<String?> {
    get {
      return graphQLMap["fullInfo"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "fullInfo")
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

public final class CreateFoodieMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateFoodie($email: String!, $gender: Int, $name: String!, $token: InputToken!) {
      createFoodie(email: $email, gender: $gender, name: $name, token: $token) {
        __typename
        email
        name
        gender
        token {
          __typename
          type
          token
        }
      }
    }
    """

  public let operationName: String = "CreateFoodie"

  public var email: String
  public var gender: Int?
  public var name: String
  public var token: InputToken

  public init(email: String, gender: Int? = nil, name: String, token: InputToken) {
    self.email = email
    self.gender = gender
    self.name = name
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["email": email, "gender": gender, "name": name, "token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFoodie", arguments: ["email": GraphQLVariable("email"), "gender": GraphQLVariable("gender"), "name": GraphQLVariable("name"), "token": GraphQLVariable("token")], type: .object(CreateFoodie.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createFoodie: CreateFoodie? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createFoodie": createFoodie.flatMap { (value: CreateFoodie) -> ResultMap in value.resultMap }])
    }

    /// create_foodie
    public var createFoodie: CreateFoodie? {
      get {
        return (resultMap["createFoodie"] as? ResultMap).flatMap { CreateFoodie(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createFoodie")
      }
    }

    public struct CreateFoodie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Foodie"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("gender", type: .scalar(Int.self)),
        GraphQLField("token", type: .object(Token.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(email: String? = nil, name: String? = nil, gender: Int? = nil, token: Token? = nil) {
        self.init(unsafeResultMap: ["__typename": "Foodie", "email": email, "name": name, "gender": gender, "token": token.flatMap { (value: Token) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var gender: Int? {
        get {
          return resultMap["gender"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var token: Token? {
        get {
          return (resultMap["token"] as? ResultMap).flatMap { Token(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "token")
        }
      }

      public struct Token: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["SignToken"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("token", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(type: String? = nil, token: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "SignToken", "type": type, "token": token])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var token: String? {
          get {
            return resultMap["token"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "token")
          }
        }
      }
    }
  }
}

public final class CreateLocationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateLocation($address: InputAddress!, $shopBranch: InputBranch!) {
      createLocation(address: $address, shopBranch: $shopBranch) {
        __typename
        ownerType
        completeInfo
        fullInfo
        postalCode
        nation
        isoNationCode
        locality
        subLocality
        administrativeArea
        subAdministrativeArea
        thoroughfare
        subThoroughfare
        floor
        latitude
        longitude
        annotation
        shopBranch {
          __typename
          uniqueId
          orderId
          name
          openTime
          closedTime
          tel
          shop {
            __typename
            uniqueId
            title
            style
            type
            underPrice
            status
          }
        }
      }
    }
    """

  public let operationName: String = "CreateLocation"

  public var address: InputAddress
  public var shopBranch: InputBranch

  public init(address: InputAddress, shopBranch: InputBranch) {
    self.address = address
    self.shopBranch = shopBranch
  }

  public var variables: GraphQLMap? {
    return ["address": address, "shopBranch": shopBranch]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createLocation", arguments: ["address": GraphQLVariable("address"), "shopBranch": GraphQLVariable("shopBranch")], type: .object(CreateLocation.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createLocation: CreateLocation? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createLocation": createLocation.flatMap { (value: CreateLocation) -> ResultMap in value.resultMap }])
    }

    /// create location
    public var createLocation: CreateLocation? {
      get {
        return (resultMap["createLocation"] as? ResultMap).flatMap { CreateLocation(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createLocation")
      }
    }

    public struct CreateLocation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Address"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("ownerType", type: .scalar(String.self)),
        GraphQLField("completeInfo", type: .scalar(String.self)),
        GraphQLField("fullInfo", type: .scalar(String.self)),
        GraphQLField("postalCode", type: .scalar(String.self)),
        GraphQLField("nation", type: .scalar(String.self)),
        GraphQLField("isoNationCode", type: .scalar(String.self)),
        GraphQLField("locality", type: .scalar(String.self)),
        GraphQLField("subLocality", type: .scalar(String.self)),
        GraphQLField("administrativeArea", type: .scalar(String.self)),
        GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
        GraphQLField("thoroughfare", type: .scalar(String.self)),
        GraphQLField("subThoroughfare", type: .scalar(String.self)),
        GraphQLField("floor", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("annotation", type: .scalar(String.self)),
        GraphQLField("shopBranch", type: .object(ShopBranch.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ownerType: String? = nil, completeInfo: String? = nil, fullInfo: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, latitude: String? = nil, longitude: String? = nil, annotation: String? = nil, shopBranch: ShopBranch? = nil) {
        self.init(unsafeResultMap: ["__typename": "Address", "ownerType": ownerType, "completeInfo": completeInfo, "fullInfo": fullInfo, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "latitude": latitude, "longitude": longitude, "annotation": annotation, "shopBranch": shopBranch.flatMap { (value: ShopBranch) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ownerType: String? {
        get {
          return resultMap["ownerType"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ownerType")
        }
      }

      public var completeInfo: String? {
        get {
          return resultMap["completeInfo"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completeInfo")
        }
      }

      public var fullInfo: String? {
        get {
          return resultMap["fullInfo"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fullInfo")
        }
      }

      public var postalCode: String? {
        get {
          return resultMap["postalCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "postalCode")
        }
      }

      public var nation: String? {
        get {
          return resultMap["nation"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nation")
        }
      }

      public var isoNationCode: String? {
        get {
          return resultMap["isoNationCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "isoNationCode")
        }
      }

      public var locality: String? {
        get {
          return resultMap["locality"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locality")
        }
      }

      public var subLocality: String? {
        get {
          return resultMap["subLocality"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subLocality")
        }
      }

      public var administrativeArea: String? {
        get {
          return resultMap["administrativeArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "administrativeArea")
        }
      }

      public var subAdministrativeArea: String? {
        get {
          return resultMap["subAdministrativeArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subAdministrativeArea")
        }
      }

      public var thoroughfare: String? {
        get {
          return resultMap["thoroughfare"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thoroughfare")
        }
      }

      public var subThoroughfare: String? {
        get {
          return resultMap["subThoroughfare"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subThoroughfare")
        }
      }

      public var floor: String? {
        get {
          return resultMap["floor"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "floor")
        }
      }

      public var latitude: String? {
        get {
          return resultMap["latitude"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return resultMap["longitude"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "longitude")
        }
      }

      public var annotation: String? {
        get {
          return resultMap["annotation"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "annotation")
        }
      }

      public var shopBranch: ShopBranch? {
        get {
          return (resultMap["shopBranch"] as? ResultMap).flatMap { ShopBranch(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shopBranch")
        }
      }

      public struct ShopBranch: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ShopBranch"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("orderId", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("openTime", type: .scalar(String.self)),
          GraphQLField("closedTime", type: .scalar(String.self)),
          GraphQLField("tel", type: .scalar(String.self)),
          GraphQLField("shop", type: .object(Shop.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uniqueId: String? = nil, orderId: Int? = nil, name: String? = nil, openTime: String? = nil, closedTime: String? = nil, tel: String? = nil, shop: Shop? = nil) {
          self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "name": name, "openTime": openTime, "closedTime": closedTime, "tel": tel, "shop": shop.flatMap { (value: Shop) -> ResultMap in value.resultMap }])
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

        public var orderId: Int? {
          get {
            return resultMap["orderId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "orderId")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var openTime: String? {
          get {
            return resultMap["openTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "openTime")
          }
        }

        public var closedTime: String? {
          get {
            return resultMap["closedTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "closedTime")
          }
        }

        public var tel: String? {
          get {
            return resultMap["tel"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "tel")
          }
        }

        public var shop: Shop? {
          get {
            return (resultMap["shop"] as? ResultMap).flatMap { Shop(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "shop")
          }
        }

        public struct Shop: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Shop"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("uniqueId", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("style", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("underPrice", type: .scalar(Double.self)),
            GraphQLField("status", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(uniqueId: String? = nil, title: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, status: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "title": title, "style": style, "type": type, "underPrice": underPrice, "status": status])
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
        }
      }
    }
  }
}

public final class CreateShopMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateShop($title: String!, $style: String, $type: String, $underPrice: Float, $branches: [InputBranch]!) {
      createShop(title: $title, style: $style, type: $type, underPrice: $underPrice, branches: $branches) {
        __typename
        uniqueId
        title
        style
        type
        status
        underPrice
        branches {
          __typename
          uniqueId
          orderId
          name
          openTime
          closedTime
          tel
          address {
            __typename
            ownerType
            completeInfo
            fullInfo
            nation
            isoNationCode
            locality
            subLocality
            administrativeArea
            subAdministrativeArea
            postalCode
            thoroughfare
            subThoroughfare
            latitude
            longitude
            annotation
          }
        }
      }
    }
    """

  public let operationName: String = "CreateShop"

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
        GraphQLField("branches", type: .list(.object(Branch.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, title: String? = nil, style: String? = nil, type: String? = nil, status: Int? = nil, underPrice: Double? = nil, branches: [Branch?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "title": title, "style": style, "type": type, "status": status, "underPrice": underPrice, "branches": branches.flatMap { (value: [Branch?]) -> [ResultMap?] in value.map { (value: Branch?) -> ResultMap? in value.flatMap { (value: Branch) -> ResultMap in value.resultMap } } }])
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

      public var branches: [Branch?]? {
        get {
          return (resultMap["branches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Branch?] in value.map { (value: ResultMap?) -> Branch? in value.flatMap { (value: ResultMap) -> Branch in Branch(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Branch?]) -> [ResultMap?] in value.map { (value: Branch?) -> ResultMap? in value.flatMap { (value: Branch) -> ResultMap in value.resultMap } } }, forKey: "branches")
        }
      }

      public struct Branch: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ShopBranch"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("orderId", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("openTime", type: .scalar(String.self)),
          GraphQLField("closedTime", type: .scalar(String.self)),
          GraphQLField("tel", type: .scalar(String.self)),
          GraphQLField("address", type: .object(Address.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uniqueId: String? = nil, orderId: Int? = nil, name: String? = nil, openTime: String? = nil, closedTime: String? = nil, tel: String? = nil, address: Address? = nil) {
          self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "name": name, "openTime": openTime, "closedTime": closedTime, "tel": tel, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }])
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

        public var orderId: Int? {
          get {
            return resultMap["orderId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "orderId")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var openTime: String? {
          get {
            return resultMap["openTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "openTime")
          }
        }

        public var closedTime: String? {
          get {
            return resultMap["closedTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "closedTime")
          }
        }

        public var tel: String? {
          get {
            return resultMap["tel"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "tel")
          }
        }

        public var address: Address? {
          get {
            return (resultMap["address"] as? ResultMap).flatMap { Address(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "address")
          }
        }

        public struct Address: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Address"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("ownerType", type: .scalar(String.self)),
            GraphQLField("completeInfo", type: .scalar(String.self)),
            GraphQLField("fullInfo", type: .scalar(String.self)),
            GraphQLField("nation", type: .scalar(String.self)),
            GraphQLField("isoNationCode", type: .scalar(String.self)),
            GraphQLField("locality", type: .scalar(String.self)),
            GraphQLField("subLocality", type: .scalar(String.self)),
            GraphQLField("administrativeArea", type: .scalar(String.self)),
            GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
            GraphQLField("postalCode", type: .scalar(String.self)),
            GraphQLField("thoroughfare", type: .scalar(String.self)),
            GraphQLField("subThoroughfare", type: .scalar(String.self)),
            GraphQLField("latitude", type: .scalar(String.self)),
            GraphQLField("longitude", type: .scalar(String.self)),
            GraphQLField("annotation", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(ownerType: String? = nil, completeInfo: String? = nil, fullInfo: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, postalCode: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, latitude: String? = nil, longitude: String? = nil, annotation: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Address", "ownerType": ownerType, "completeInfo": completeInfo, "fullInfo": fullInfo, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "postalCode": postalCode, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "latitude": latitude, "longitude": longitude, "annotation": annotation])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var ownerType: String? {
            get {
              return resultMap["ownerType"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "ownerType")
            }
          }

          public var completeInfo: String? {
            get {
              return resultMap["completeInfo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "completeInfo")
            }
          }

          public var fullInfo: String? {
            get {
              return resultMap["fullInfo"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "fullInfo")
            }
          }

          public var nation: String? {
            get {
              return resultMap["nation"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nation")
            }
          }

          public var isoNationCode: String? {
            get {
              return resultMap["isoNationCode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "isoNationCode")
            }
          }

          public var locality: String? {
            get {
              return resultMap["locality"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "locality")
            }
          }

          public var subLocality: String? {
            get {
              return resultMap["subLocality"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "subLocality")
            }
          }

          public var administrativeArea: String? {
            get {
              return resultMap["administrativeArea"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "administrativeArea")
            }
          }

          public var subAdministrativeArea: String? {
            get {
              return resultMap["subAdministrativeArea"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "subAdministrativeArea")
            }
          }

          public var postalCode: String? {
            get {
              return resultMap["postalCode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "postalCode")
            }
          }

          public var thoroughfare: String? {
            get {
              return resultMap["thoroughfare"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "thoroughfare")
            }
          }

          public var subThoroughfare: String? {
            get {
              return resultMap["subThoroughfare"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "subThoroughfare")
            }
          }

          public var latitude: String? {
            get {
              return resultMap["latitude"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "latitude")
            }
          }

          public var longitude: String? {
            get {
              return resultMap["longitude"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "longitude")
            }
          }

          public var annotation: String? {
            get {
              return resultMap["annotation"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "annotation")
            }
          }
        }
      }
    }
  }
}

public final class LocationsDynamicQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LocationsDynamicQuery($whereAnd: AddressDqCmd!) {
      locationsDynamicQuery(whereAnd: $whereAnd) {
        __typename
        ownerType
        completeInfo
        fullInfo
        postalCode
        nation
        isoNationCode
        locality
        subLocality
        administrativeArea
        subAdministrativeArea
        thoroughfare
        subThoroughfare
        floor
        latitude
        longitude
        annotation
        shopBranch {
          __typename
          uniqueId
          orderId
          name
          openTime
          closedTime
          tel
          shop {
            __typename
            uniqueId
            title
            style
            type
            underPrice
            status
          }
        }
      }
    }
    """

  public let operationName: String = "LocationsDynamicQuery"

  public var whereAnd: AddressDqCmd

  public init(whereAnd: AddressDqCmd) {
    self.whereAnd = whereAnd
  }

  public var variables: GraphQLMap? {
    return ["whereAnd": whereAnd]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("locationsDynamicQuery", arguments: ["whereAnd": GraphQLVariable("whereAnd")], type: .list(.object(LocationsDynamicQuery.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(locationsDynamicQuery: [LocationsDynamicQuery?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "locationsDynamicQuery": locationsDynamicQuery.flatMap { (value: [LocationsDynamicQuery?]) -> [ResultMap?] in value.map { (value: LocationsDynamicQuery?) -> ResultMap? in value.flatMap { (value: LocationsDynamicQuery) -> ResultMap in value.resultMap } } }])
    }

    /// locations dynamic query
    public var locationsDynamicQuery: [LocationsDynamicQuery?]? {
      get {
        return (resultMap["locationsDynamicQuery"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LocationsDynamicQuery?] in value.map { (value: ResultMap?) -> LocationsDynamicQuery? in value.flatMap { (value: ResultMap) -> LocationsDynamicQuery in LocationsDynamicQuery(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LocationsDynamicQuery?]) -> [ResultMap?] in value.map { (value: LocationsDynamicQuery?) -> ResultMap? in value.flatMap { (value: LocationsDynamicQuery) -> ResultMap in value.resultMap } } }, forKey: "locationsDynamicQuery")
      }
    }

    public struct LocationsDynamicQuery: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Address"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("ownerType", type: .scalar(String.self)),
        GraphQLField("completeInfo", type: .scalar(String.self)),
        GraphQLField("fullInfo", type: .scalar(String.self)),
        GraphQLField("postalCode", type: .scalar(String.self)),
        GraphQLField("nation", type: .scalar(String.self)),
        GraphQLField("isoNationCode", type: .scalar(String.self)),
        GraphQLField("locality", type: .scalar(String.self)),
        GraphQLField("subLocality", type: .scalar(String.self)),
        GraphQLField("administrativeArea", type: .scalar(String.self)),
        GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
        GraphQLField("thoroughfare", type: .scalar(String.self)),
        GraphQLField("subThoroughfare", type: .scalar(String.self)),
        GraphQLField("floor", type: .scalar(String.self)),
        GraphQLField("latitude", type: .scalar(String.self)),
        GraphQLField("longitude", type: .scalar(String.self)),
        GraphQLField("annotation", type: .scalar(String.self)),
        GraphQLField("shopBranch", type: .object(ShopBranch.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ownerType: String? = nil, completeInfo: String? = nil, fullInfo: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, latitude: String? = nil, longitude: String? = nil, annotation: String? = nil, shopBranch: ShopBranch? = nil) {
        self.init(unsafeResultMap: ["__typename": "Address", "ownerType": ownerType, "completeInfo": completeInfo, "fullInfo": fullInfo, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "latitude": latitude, "longitude": longitude, "annotation": annotation, "shopBranch": shopBranch.flatMap { (value: ShopBranch) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ownerType: String? {
        get {
          return resultMap["ownerType"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ownerType")
        }
      }

      public var completeInfo: String? {
        get {
          return resultMap["completeInfo"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completeInfo")
        }
      }

      public var fullInfo: String? {
        get {
          return resultMap["fullInfo"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fullInfo")
        }
      }

      public var postalCode: String? {
        get {
          return resultMap["postalCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "postalCode")
        }
      }

      public var nation: String? {
        get {
          return resultMap["nation"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "nation")
        }
      }

      public var isoNationCode: String? {
        get {
          return resultMap["isoNationCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "isoNationCode")
        }
      }

      public var locality: String? {
        get {
          return resultMap["locality"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locality")
        }
      }

      public var subLocality: String? {
        get {
          return resultMap["subLocality"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subLocality")
        }
      }

      public var administrativeArea: String? {
        get {
          return resultMap["administrativeArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "administrativeArea")
        }
      }

      public var subAdministrativeArea: String? {
        get {
          return resultMap["subAdministrativeArea"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subAdministrativeArea")
        }
      }

      public var thoroughfare: String? {
        get {
          return resultMap["thoroughfare"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thoroughfare")
        }
      }

      public var subThoroughfare: String? {
        get {
          return resultMap["subThoroughfare"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subThoroughfare")
        }
      }

      public var floor: String? {
        get {
          return resultMap["floor"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "floor")
        }
      }

      public var latitude: String? {
        get {
          return resultMap["latitude"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "latitude")
        }
      }

      public var longitude: String? {
        get {
          return resultMap["longitude"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "longitude")
        }
      }

      public var annotation: String? {
        get {
          return resultMap["annotation"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "annotation")
        }
      }

      public var shopBranch: ShopBranch? {
        get {
          return (resultMap["shopBranch"] as? ResultMap).flatMap { ShopBranch(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shopBranch")
        }
      }

      public struct ShopBranch: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ShopBranch"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("orderId", type: .scalar(Int.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("openTime", type: .scalar(String.self)),
          GraphQLField("closedTime", type: .scalar(String.self)),
          GraphQLField("tel", type: .scalar(String.self)),
          GraphQLField("shop", type: .object(Shop.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uniqueId: String? = nil, orderId: Int? = nil, name: String? = nil, openTime: String? = nil, closedTime: String? = nil, tel: String? = nil, shop: Shop? = nil) {
          self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "name": name, "openTime": openTime, "closedTime": closedTime, "tel": tel, "shop": shop.flatMap { (value: Shop) -> ResultMap in value.resultMap }])
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

        public var orderId: Int? {
          get {
            return resultMap["orderId"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "orderId")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var openTime: String? {
          get {
            return resultMap["openTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "openTime")
          }
        }

        public var closedTime: String? {
          get {
            return resultMap["closedTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "closedTime")
          }
        }

        public var tel: String? {
          get {
            return resultMap["tel"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "tel")
          }
        }

        public var shop: Shop? {
          get {
            return (resultMap["shop"] as? ResultMap).flatMap { Shop(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "shop")
          }
        }

        public struct Shop: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Shop"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("uniqueId", type: .scalar(String.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("style", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("underPrice", type: .scalar(Double.self)),
            GraphQLField("status", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(uniqueId: String? = nil, title: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, status: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "title": title, "style": style, "type": type, "underPrice": underPrice, "status": status])
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
        }
      }
    }
  }
}
