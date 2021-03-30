// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct SignData: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - appleUid
  ///   - auth
  ///   - email
  ///   - gender
  ///   - name
  public init(appleUid: Swift.Optional<String?> = nil, auth: AuthObject, email: Swift.Optional<String?> = nil, gender: Swift.Optional<Int?> = nil, name: String) {
    graphQLMap = ["appleUid": appleUid, "auth": auth, "email": email, "gender": gender, "name": name]
  }

  public var appleUid: Swift.Optional<String?> {
    get {
      return graphQLMap["appleUid"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "appleUid")
    }
  }

  public var auth: AuthObject {
    get {
      return graphQLMap["auth"] as! AuthObject
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "auth")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var gender: Swift.Optional<Int?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
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
}

public struct AuthObject: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - apple
  ///   - facebook
  public init(apple: Swift.Optional<AppleObject?> = nil, facebook: Swift.Optional<FacebookObject?> = nil) {
    graphQLMap = ["apple": apple, "facebook": facebook]
  }

  public var apple: Swift.Optional<AppleObject?> {
    get {
      return graphQLMap["apple"] as? Swift.Optional<AppleObject?> ?? Swift.Optional<AppleObject?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "apple")
    }
  }

  public var facebook: Swift.Optional<FacebookObject?> {
    get {
      return graphQLMap["facebook"] as? Swift.Optional<FacebookObject?> ?? Swift.Optional<FacebookObject?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "facebook")
    }
  }
}

public struct AppleObject: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - uid
  public init(email: Swift.Optional<String?> = nil, uid: String) {
    graphQLMap = ["email": email, "uid": uid]
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var uid: String {
    get {
      return graphQLMap["uid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "uid")
    }
  }
}

public struct FacebookObject: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - token
  public init(email: String, token: String) {
    graphQLMap = ["email": email, "token": token]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var token: String {
    get {
      return graphQLMap["token"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }
}

public struct InputAddress: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - administrativeArea
  ///   - completeInfo
  ///   - floor
  ///   - isoNationCode
  ///   - latitude
  ///   - locality
  ///   - longitude
  ///   - name
  ///   - nation
  ///   - postalCode
  ///   - room
  ///   - subAdministrativeArea
  ///   - subLocality
  ///   - subThoroughfare
  ///   - thoroughfare
  ///   - ward
  public init(administrativeArea: String, completeInfo: String, floor: Swift.Optional<String?> = nil, isoNationCode: String, latitude: String, locality: String, longitude: String, name: Swift.Optional<String?> = nil, nation: String, postalCode: Swift.Optional<String?> = nil, room: Swift.Optional<String?> = nil, subAdministrativeArea: String, subLocality: String, subThoroughfare: String, thoroughfare: String, ward: Swift.Optional<String?> = nil) {
    graphQLMap = ["administrativeArea": administrativeArea, "completeInfo": completeInfo, "floor": floor, "isoNationCode": isoNationCode, "latitude": latitude, "locality": locality, "longitude": longitude, "name": name, "nation": nation, "postalCode": postalCode, "room": room, "subAdministrativeArea": subAdministrativeArea, "subLocality": subLocality, "subThoroughfare": subThoroughfare, "thoroughfare": thoroughfare, "ward": ward]
  }

  public var administrativeArea: String {
    get {
      return graphQLMap["administrativeArea"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "administrativeArea")
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

  public var isoNationCode: String {
    get {
      return graphQLMap["isoNationCode"] as! String
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

  public var locality: String {
    get {
      return graphQLMap["locality"] as! String
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

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var nation: String {
    get {
      return graphQLMap["nation"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "nation")
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

  public var room: Swift.Optional<String?> {
    get {
      return graphQLMap["room"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "room")
    }
  }

  public var subAdministrativeArea: String {
    get {
      return graphQLMap["subAdministrativeArea"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subAdministrativeArea")
    }
  }

  public var subLocality: String {
    get {
      return graphQLMap["subLocality"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subLocality")
    }
  }

  public var subThoroughfare: String {
    get {
      return graphQLMap["subThoroughfare"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subThoroughfare")
    }
  }

  public var thoroughfare: String {
    get {
      return graphQLMap["thoroughfare"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "thoroughfare")
    }
  }

  public var ward: Swift.Optional<String?> {
    get {
      return graphQLMap["ward"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ward")
    }
  }
}

public struct InputBranch: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - orderId
  ///   - style
  ///   - subtitle
  ///   - tel
  ///   - title
  ///   - type
  ///   - underPrice
  ///   - uniqueId
  public init(orderId: Swift.Optional<Int?> = nil, style: Swift.Optional<String?> = nil, subtitle: Swift.Optional<String?> = nil, tel: Swift.Optional<String?> = nil, title: String, type: Swift.Optional<String?> = nil, underPrice: Swift.Optional<Double?> = nil, uniqueId: Swift.Optional<String?> = nil) {
    graphQLMap = ["orderId": orderId, "style": style, "subtitle": subtitle, "tel": tel, "title": title, "type": type, "underPrice": underPrice, "uniqueId": uniqueId]
  }

  public var orderId: Swift.Optional<Int?> {
    get {
      return graphQLMap["orderId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "orderId")
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

  public var subtitle: Swift.Optional<String?> {
    get {
      return graphQLMap["subtitle"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subtitle")
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

  public var underPrice: Swift.Optional<Double?> {
    get {
      return graphQLMap["underPrice"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
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
  ///   - completeInfo
  ///   - floor
  ///   - isoNationCode
  ///   - latitude
  ///   - locality
  ///   - longitude
  ///   - name
  ///   - nation
  ///   - ownerId
  ///   - postalCode
  ///   - room
  ///   - subAdministrativeArea
  ///   - subLocality
  ///   - subThoroughfare
  ///   - thoroughfare
  ///   - ward
  public init(administrativeArea: Swift.Optional<String?> = nil, completeInfo: Swift.Optional<String?> = nil, floor: Swift.Optional<String?> = nil, isoNationCode: Swift.Optional<String?> = nil, latitude: Swift.Optional<String?> = nil, locality: Swift.Optional<String?> = nil, longitude: Swift.Optional<String?> = nil, name: Swift.Optional<String?> = nil, nation: Swift.Optional<String?> = nil, ownerId: Swift.Optional<String?> = nil, postalCode: Swift.Optional<String?> = nil, room: Swift.Optional<String?> = nil, subAdministrativeArea: Swift.Optional<String?> = nil, subLocality: Swift.Optional<String?> = nil, subThoroughfare: Swift.Optional<String?> = nil, thoroughfare: Swift.Optional<String?> = nil, ward: Swift.Optional<String?> = nil) {
    graphQLMap = ["administrativeArea": administrativeArea, "completeInfo": completeInfo, "floor": floor, "isoNationCode": isoNationCode, "latitude": latitude, "locality": locality, "longitude": longitude, "name": name, "nation": nation, "ownerId": ownerId, "postalCode": postalCode, "room": room, "subAdministrativeArea": subAdministrativeArea, "subLocality": subLocality, "subThoroughfare": subThoroughfare, "thoroughfare": thoroughfare, "ward": ward]
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

  public var floor: Swift.Optional<String?> {
    get {
      return graphQLMap["floor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "floor")
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

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
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

  public var ownerId: Swift.Optional<String?> {
    get {
      return graphQLMap["ownerId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ownerId")
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

  public var room: Swift.Optional<String?> {
    get {
      return graphQLMap["room"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "room")
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

  public var ward: Swift.Optional<String?> {
    get {
      return graphQLMap["ward"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ward")
    }
  }
}

public struct InputCoordinate: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - latitude
  ///   - longitude
  public init(latitude: Swift.Optional<String?> = nil, longitude: Swift.Optional<String?> = nil) {
    graphQLMap = ["latitude": latitude, "longitude": longitude]
  }

  public var latitude: Swift.Optional<String?> {
    get {
      return graphQLMap["latitude"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "latitude")
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
}

public final class SignFoodieMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignFoodie($signData: SignData!) {
      signFoodie(signData: $signData) {
        __typename
        uniqueId
        email
        name
        gender
        auth {
          __typename
          facebook {
            __typename
            email
            token
          }
        }
      }
    }
    """

  public let operationName: String = "SignFoodie"

  public var signData: SignData

  public init(signData: SignData) {
    self.signData = signData
  }

  public var variables: GraphQLMap? {
    return ["signData": signData]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signFoodie", arguments: ["signData": GraphQLVariable("signData")], type: .object(SignFoodie.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signFoodie: SignFoodie? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "signFoodie": signFoodie.flatMap { (value: SignFoodie) -> ResultMap in value.resultMap }])
    }

    public var signFoodie: SignFoodie? {
      get {
        return (resultMap["signFoodie"] as? ResultMap).flatMap { SignFoodie(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signFoodie")
      }
    }

    public struct SignFoodie: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Foodie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(Int.self)),
          GraphQLField("auth", type: .object(Auth.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, email: String? = nil, name: String? = nil, gender: Int? = nil, auth: Auth? = nil) {
        self.init(unsafeResultMap: ["__typename": "Foodie", "uniqueId": uniqueId, "email": email, "name": name, "gender": gender, "auth": auth.flatMap { (value: Auth) -> ResultMap in value.resultMap }])
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

      public var auth: Auth? {
        get {
          return (resultMap["auth"] as? ResultMap).flatMap { Auth(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "auth")
        }
      }

      public struct Auth: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AuthData"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("facebook", type: .object(Facebook.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(facebook: Facebook? = nil) {
          self.init(unsafeResultMap: ["__typename": "AuthData", "facebook": facebook.flatMap { (value: Facebook) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var facebook: Facebook? {
          get {
            return (resultMap["facebook"] as? ResultMap).flatMap { Facebook(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "facebook")
          }
        }

        public struct Facebook: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SignWithFacebook"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("email", type: .scalar(String.self)),
              GraphQLField("token", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(email: String? = nil, token: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "SignWithFacebook", "email": email, "token": token])
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
}

public final class SignFoodieWithAppleMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SignFoodieWithApple($signData: SignData!) {
      signFoodieWithApple(signData: $signData) {
        __typename
        uniqueId
        email
        name
        gender
        auth {
          __typename
          apple {
            __typename
            uid
            email
          }
        }
      }
    }
    """

  public let operationName: String = "SignFoodieWithApple"

  public var signData: SignData

  public init(signData: SignData) {
    self.signData = signData
  }

  public var variables: GraphQLMap? {
    return ["signData": signData]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("signFoodieWithApple", arguments: ["signData": GraphQLVariable("signData")], type: .object(SignFoodieWithApple.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signFoodieWithApple: SignFoodieWithApple? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "signFoodieWithApple": signFoodieWithApple.flatMap { (value: SignFoodieWithApple) -> ResultMap in value.resultMap }])
    }

    public var signFoodieWithApple: SignFoodieWithApple? {
      get {
        return (resultMap["signFoodieWithApple"] as? ResultMap).flatMap { SignFoodieWithApple(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signFoodieWithApple")
      }
    }

    public struct SignFoodieWithApple: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Foodie"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(Int.self)),
          GraphQLField("auth", type: .object(Auth.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, email: String? = nil, name: String? = nil, gender: Int? = nil, auth: Auth? = nil) {
        self.init(unsafeResultMap: ["__typename": "Foodie", "uniqueId": uniqueId, "email": email, "name": name, "gender": gender, "auth": auth.flatMap { (value: Auth) -> ResultMap in value.resultMap }])
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

      public var auth: Auth? {
        get {
          return (resultMap["auth"] as? ResultMap).flatMap { Auth(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "auth")
        }
      }

      public struct Auth: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["AuthData"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("apple", type: .object(Apple.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(apple: Apple? = nil) {
          self.init(unsafeResultMap: ["__typename": "AuthData", "apple": apple.flatMap { (value: Apple) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var apple: Apple? {
          get {
            return (resultMap["apple"] as? ResultMap).flatMap { Apple(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "apple")
          }
        }

        public struct Apple: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["SignWithApple"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("uid", type: .scalar(String.self)),
              GraphQLField("email", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(uid: String? = nil, email: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "SignWithApple", "uid": uid, "email": email])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var uid: String? {
            get {
              return resultMap["uid"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "uid")
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
        }
      }
    }
  }
}

public final class CreateGourmetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateGourmet($foodieId: String, $address: InputAddress!, $shopBranch: InputBranch!) {
      createGourmet(foodieId: $foodieId, address: $address, shopBranch: $shopBranch) {
        __typename
        uniqueId
        orderId
        title
        subtitle
        tel
        style
        type
        underPrice
        address {
          __typename
          ownerId
          completeInfo
          name
          postalCode
          nation
          isoNationCode
          locality
          subLocality
          ward
          administrativeArea
          subAdministrativeArea
          thoroughfare
          subThoroughfare
          floor
          room
          latitude
          longitude
        }
      }
    }
    """

  public let operationName: String = "CreateGourmet"

  public var foodieId: String?
  public var address: InputAddress
  public var shopBranch: InputBranch

  public init(foodieId: String? = nil, address: InputAddress, shopBranch: InputBranch) {
    self.foodieId = foodieId
    self.address = address
    self.shopBranch = shopBranch
  }

  public var variables: GraphQLMap? {
    return ["foodieId": foodieId, "address": address, "shopBranch": shopBranch]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createGourmet", arguments: ["foodieId": GraphQLVariable("foodieId"), "address": GraphQLVariable("address"), "shopBranch": GraphQLVariable("shopBranch")], type: .object(CreateGourmet.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createGourmet: CreateGourmet? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "createGourmet": createGourmet.flatMap { (value: CreateGourmet) -> ResultMap in value.resultMap }])
    }

    /// create shop with foddie
    public var createGourmet: CreateGourmet? {
      get {
        return (resultMap["createGourmet"] as? ResultMap).flatMap { CreateGourmet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createGourmet")
      }
    }

    public struct CreateGourmet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ShopBranch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("orderId", type: .scalar(Int.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("tel", type: .scalar(String.self)),
          GraphQLField("style", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("underPrice", type: .scalar(Double.self)),
          GraphQLField("address", type: .object(Address.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, orderId: Int? = nil, title: String? = nil, subtitle: String? = nil, tel: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, address: Address? = nil) {
        self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "title": title, "subtitle": subtitle, "tel": tel, "style": style, "type": type, "underPrice": underPrice, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }])
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

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var subtitle: String? {
        get {
          return resultMap["subtitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subtitle")
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

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("ownerId", type: .scalar(String.self)),
            GraphQLField("completeInfo", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("postalCode", type: .scalar(String.self)),
            GraphQLField("nation", type: .scalar(String.self)),
            GraphQLField("isoNationCode", type: .scalar(String.self)),
            GraphQLField("locality", type: .scalar(String.self)),
            GraphQLField("subLocality", type: .scalar(String.self)),
            GraphQLField("ward", type: .scalar(String.self)),
            GraphQLField("administrativeArea", type: .scalar(String.self)),
            GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
            GraphQLField("thoroughfare", type: .scalar(String.self)),
            GraphQLField("subThoroughfare", type: .scalar(String.self)),
            GraphQLField("floor", type: .scalar(String.self)),
            GraphQLField("room", type: .scalar(String.self)),
            GraphQLField("latitude", type: .scalar(String.self)),
            GraphQLField("longitude", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ownerId: String? = nil, completeInfo: String? = nil, name: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, ward: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, room: String? = nil, latitude: String? = nil, longitude: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Address", "ownerId": ownerId, "completeInfo": completeInfo, "name": name, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "ward": ward, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "room": room, "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var ownerId: String? {
          get {
            return resultMap["ownerId"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ownerId")
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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

        public var ward: String? {
          get {
            return resultMap["ward"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ward")
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

        public var room: String? {
          get {
            return resultMap["room"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "room")
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
      }
    }
  }
}

public final class UpdateGourmetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateGourmet($foodieId: String, $branchId: String!, $branch: InputBranch!, $address: InputAddress) {
      updateGourmet(
        foodieId: $foodieId
        branchId: $branchId
        branch: $branch
        address: $address
      ) {
        __typename
        uniqueId
        orderId
        title
        subtitle
        tel
        style
        type
        underPrice
        address {
          __typename
          ownerId
          completeInfo
          name
          postalCode
          nation
          isoNationCode
          locality
          subLocality
          ward
          administrativeArea
          subAdministrativeArea
          thoroughfare
          subThoroughfare
          floor
          room
          latitude
          longitude
        }
      }
    }
    """

  public let operationName: String = "UpdateGourmet"

  public var foodieId: String?
  public var branchId: String
  public var branch: InputBranch
  public var address: InputAddress?

  public init(foodieId: String? = nil, branchId: String, branch: InputBranch, address: InputAddress? = nil) {
    self.foodieId = foodieId
    self.branchId = branchId
    self.branch = branch
    self.address = address
  }

  public var variables: GraphQLMap? {
    return ["foodieId": foodieId, "branchId": branchId, "branch": branch, "address": address]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateGourmet", arguments: ["foodieId": GraphQLVariable("foodieId"), "branchId": GraphQLVariable("branchId"), "branch": GraphQLVariable("branch"), "address": GraphQLVariable("address")], type: .object(UpdateGourmet.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateGourmet: UpdateGourmet? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "updateGourmet": updateGourmet.flatMap { (value: UpdateGourmet) -> ResultMap in value.resultMap }])
    }

    /// update gourmet
    public var updateGourmet: UpdateGourmet? {
      get {
        return (resultMap["updateGourmet"] as? ResultMap).flatMap { UpdateGourmet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateGourmet")
      }
    }

    public struct UpdateGourmet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ShopBranch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("orderId", type: .scalar(Int.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("tel", type: .scalar(String.self)),
          GraphQLField("style", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("underPrice", type: .scalar(Double.self)),
          GraphQLField("address", type: .object(Address.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, orderId: Int? = nil, title: String? = nil, subtitle: String? = nil, tel: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, address: Address? = nil) {
        self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "title": title, "subtitle": subtitle, "tel": tel, "style": style, "type": type, "underPrice": underPrice, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }])
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

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var subtitle: String? {
        get {
          return resultMap["subtitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subtitle")
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

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("ownerId", type: .scalar(String.self)),
            GraphQLField("completeInfo", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("postalCode", type: .scalar(String.self)),
            GraphQLField("nation", type: .scalar(String.self)),
            GraphQLField("isoNationCode", type: .scalar(String.self)),
            GraphQLField("locality", type: .scalar(String.self)),
            GraphQLField("subLocality", type: .scalar(String.self)),
            GraphQLField("ward", type: .scalar(String.self)),
            GraphQLField("administrativeArea", type: .scalar(String.self)),
            GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
            GraphQLField("thoroughfare", type: .scalar(String.self)),
            GraphQLField("subThoroughfare", type: .scalar(String.self)),
            GraphQLField("floor", type: .scalar(String.self)),
            GraphQLField("room", type: .scalar(String.self)),
            GraphQLField("latitude", type: .scalar(String.self)),
            GraphQLField("longitude", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ownerId: String? = nil, completeInfo: String? = nil, name: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, ward: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, room: String? = nil, latitude: String? = nil, longitude: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Address", "ownerId": ownerId, "completeInfo": completeInfo, "name": name, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "ward": ward, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "room": room, "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var ownerId: String? {
          get {
            return resultMap["ownerId"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ownerId")
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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

        public var ward: String? {
          get {
            return resultMap["ward"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ward")
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

        public var room: String? {
          get {
            return resultMap["room"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "room")
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
      }
    }
  }
}

public final class DislikeGourmetMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DislikeGourmet($foodieId: String!, $branchId: String!) {
      dislikeGourmet(foodieId: $foodieId, branchId: $branchId) {
        __typename
        uniqueId
        orderId
        title
        subtitle
        tel
        style
        type
        underPrice
        shop {
          __typename
          uniqueId
          name
          status
        }
        address {
          __typename
          ownerId
          completeInfo
          name
          postalCode
          nation
          isoNationCode
          locality
          subLocality
          ward
          administrativeArea
          subAdministrativeArea
          thoroughfare
          subThoroughfare
          floor
          room
          latitude
          longitude
        }
      }
    }
    """

  public let operationName: String = "DislikeGourmet"

  public var foodieId: String
  public var branchId: String

  public init(foodieId: String, branchId: String) {
    self.foodieId = foodieId
    self.branchId = branchId
  }

  public var variables: GraphQLMap? {
    return ["foodieId": foodieId, "branchId": branchId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootMutationType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("dislikeGourmet", arguments: ["foodieId": GraphQLVariable("foodieId"), "branchId": GraphQLVariable("branchId")], type: .object(DislikeGourmet.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(dislikeGourmet: DislikeGourmet? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootMutationType", "dislikeGourmet": dislikeGourmet.flatMap { (value: DislikeGourmet) -> ResultMap in value.resultMap }])
    }

    /// dislike_gourmet
    public var dislikeGourmet: DislikeGourmet? {
      get {
        return (resultMap["dislikeGourmet"] as? ResultMap).flatMap { DislikeGourmet(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "dislikeGourmet")
      }
    }

    public struct DislikeGourmet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["ShopBranch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("uniqueId", type: .scalar(String.self)),
          GraphQLField("orderId", type: .scalar(Int.self)),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("subtitle", type: .scalar(String.self)),
          GraphQLField("tel", type: .scalar(String.self)),
          GraphQLField("style", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("underPrice", type: .scalar(Double.self)),
          GraphQLField("shop", type: .object(Shop.selections)),
          GraphQLField("address", type: .object(Address.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(uniqueId: String? = nil, orderId: Int? = nil, title: String? = nil, subtitle: String? = nil, tel: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, shop: Shop? = nil, address: Address? = nil) {
        self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "title": title, "subtitle": subtitle, "tel": tel, "style": style, "type": type, "underPrice": underPrice, "shop": shop.flatMap { (value: Shop) -> ResultMap in value.resultMap }, "address": address.flatMap { (value: Address) -> ResultMap in value.resultMap }])
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

      public var title: String? {
        get {
          return resultMap["title"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var subtitle: String? {
        get {
          return resultMap["subtitle"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "subtitle")
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

      public var shop: Shop? {
        get {
          return (resultMap["shop"] as? ResultMap).flatMap { Shop(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "shop")
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

      public struct Shop: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Shop"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("uniqueId", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uniqueId: String? = nil, name: String? = nil, status: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "name": name, "status": status])
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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

      public struct Address: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Address"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("ownerId", type: .scalar(String.self)),
            GraphQLField("completeInfo", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("postalCode", type: .scalar(String.self)),
            GraphQLField("nation", type: .scalar(String.self)),
            GraphQLField("isoNationCode", type: .scalar(String.self)),
            GraphQLField("locality", type: .scalar(String.self)),
            GraphQLField("subLocality", type: .scalar(String.self)),
            GraphQLField("ward", type: .scalar(String.self)),
            GraphQLField("administrativeArea", type: .scalar(String.self)),
            GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
            GraphQLField("thoroughfare", type: .scalar(String.self)),
            GraphQLField("subThoroughfare", type: .scalar(String.self)),
            GraphQLField("floor", type: .scalar(String.self)),
            GraphQLField("room", type: .scalar(String.self)),
            GraphQLField("latitude", type: .scalar(String.self)),
            GraphQLField("longitude", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(ownerId: String? = nil, completeInfo: String? = nil, name: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, ward: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, room: String? = nil, latitude: String? = nil, longitude: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Address", "ownerId": ownerId, "completeInfo": completeInfo, "name": name, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "ward": ward, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "room": room, "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var ownerId: String? {
          get {
            return resultMap["ownerId"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ownerId")
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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

        public var ward: String? {
          get {
            return resultMap["ward"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ward")
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

        public var room: String? {
          get {
            return resultMap["room"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "room")
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
      }
    }
  }
}

public final class LocationsDynamicQueryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LocationsDynamicQuery($foodieId: String, $whereAnd: AddressDqCmd!) {
      locationsDynamicQuery(foodieId: $foodieId, whereAnd: $whereAnd) {
        __typename
        ownerId
        completeInfo
        name
        postalCode
        nation
        isoNationCode
        locality
        subLocality
        ward
        administrativeArea
        subAdministrativeArea
        thoroughfare
        subThoroughfare
        floor
        room
        latitude
        longitude
        shopBranch {
          __typename
          uniqueId
          orderId
          title
          subtitle
          tel
          style
          type
          underPrice
          shop {
            __typename
            uniqueId
            name
            status
          }
        }
      }
    }
    """

  public let operationName: String = "LocationsDynamicQuery"

  public var foodieId: String?
  public var whereAnd: AddressDqCmd

  public init(foodieId: String? = nil, whereAnd: AddressDqCmd) {
    self.foodieId = foodieId
    self.whereAnd = whereAnd
  }

  public var variables: GraphQLMap? {
    return ["foodieId": foodieId, "whereAnd": whereAnd]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("locationsDynamicQuery", arguments: ["foodieId": GraphQLVariable("foodieId"), "whereAnd": GraphQLVariable("whereAnd")], type: .list(.object(LocationsDynamicQuery.selections))),
      ]
    }

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

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ownerId", type: .scalar(String.self)),
          GraphQLField("completeInfo", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("postalCode", type: .scalar(String.self)),
          GraphQLField("nation", type: .scalar(String.self)),
          GraphQLField("isoNationCode", type: .scalar(String.self)),
          GraphQLField("locality", type: .scalar(String.self)),
          GraphQLField("subLocality", type: .scalar(String.self)),
          GraphQLField("ward", type: .scalar(String.self)),
          GraphQLField("administrativeArea", type: .scalar(String.self)),
          GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
          GraphQLField("thoroughfare", type: .scalar(String.self)),
          GraphQLField("subThoroughfare", type: .scalar(String.self)),
          GraphQLField("floor", type: .scalar(String.self)),
          GraphQLField("room", type: .scalar(String.self)),
          GraphQLField("latitude", type: .scalar(String.self)),
          GraphQLField("longitude", type: .scalar(String.self)),
          GraphQLField("shopBranch", type: .object(ShopBranch.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ownerId: String? = nil, completeInfo: String? = nil, name: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, ward: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, room: String? = nil, latitude: String? = nil, longitude: String? = nil, shopBranch: ShopBranch? = nil) {
        self.init(unsafeResultMap: ["__typename": "Address", "ownerId": ownerId, "completeInfo": completeInfo, "name": name, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "ward": ward, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "room": room, "latitude": latitude, "longitude": longitude, "shopBranch": shopBranch.flatMap { (value: ShopBranch) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ownerId: String? {
        get {
          return resultMap["ownerId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ownerId")
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
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

      public var ward: String? {
        get {
          return resultMap["ward"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ward")
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

      public var room: String? {
        get {
          return resultMap["room"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "room")
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

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("uniqueId", type: .scalar(String.self)),
            GraphQLField("orderId", type: .scalar(Int.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("subtitle", type: .scalar(String.self)),
            GraphQLField("tel", type: .scalar(String.self)),
            GraphQLField("style", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("underPrice", type: .scalar(Double.self)),
            GraphQLField("shop", type: .object(Shop.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uniqueId: String? = nil, orderId: Int? = nil, title: String? = nil, subtitle: String? = nil, tel: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, shop: Shop? = nil) {
          self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "title": title, "subtitle": subtitle, "tel": tel, "style": style, "type": type, "underPrice": underPrice, "shop": shop.flatMap { (value: Shop) -> ResultMap in value.resultMap }])
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

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var subtitle: String? {
          get {
            return resultMap["subtitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subtitle")
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

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("uniqueId", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("status", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(uniqueId: String? = nil, name: String? = nil, status: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "name": name, "status": status])
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

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
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

public final class SearchForRangeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query SearchForRange($foodieId: String, $minCoordinate: InputCoordinate!, $maxCoordinate: InputCoordinate!) {
      searchForRange(
        foodieId: $foodieId
        minCoordinate: $minCoordinate
        maxCoordinate: $maxCoordinate
      ) {
        __typename
        ownerId
        completeInfo
        name
        postalCode
        nation
        isoNationCode
        locality
        subLocality
        ward
        administrativeArea
        subAdministrativeArea
        thoroughfare
        subThoroughfare
        floor
        room
        latitude
        longitude
        shopBranch {
          __typename
          uniqueId
          orderId
          title
          subtitle
          tel
          style
          type
          underPrice
          shop {
            __typename
            uniqueId
            name
            status
          }
        }
      }
    }
    """

  public let operationName: String = "SearchForRange"

  public var foodieId: String?
  public var minCoordinate: InputCoordinate
  public var maxCoordinate: InputCoordinate

  public init(foodieId: String? = nil, minCoordinate: InputCoordinate, maxCoordinate: InputCoordinate) {
    self.foodieId = foodieId
    self.minCoordinate = minCoordinate
    self.maxCoordinate = maxCoordinate
  }

  public var variables: GraphQLMap? {
    return ["foodieId": foodieId, "minCoordinate": minCoordinate, "maxCoordinate": maxCoordinate]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["RootQueryType"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("searchForRange", arguments: ["foodieId": GraphQLVariable("foodieId"), "minCoordinate": GraphQLVariable("minCoordinate"), "maxCoordinate": GraphQLVariable("maxCoordinate")], type: .list(.object(SearchForRange.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(searchForRange: [SearchForRange?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "RootQueryType", "searchForRange": searchForRange.flatMap { (value: [SearchForRange?]) -> [ResultMap?] in value.map { (value: SearchForRange?) -> ResultMap? in value.flatMap { (value: SearchForRange) -> ResultMap in value.resultMap } } }])
    }

    /// 利用球體公式計算出邊界座標後上傳搜尋
    public var searchForRange: [SearchForRange?]? {
      get {
        return (resultMap["searchForRange"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SearchForRange?] in value.map { (value: ResultMap?) -> SearchForRange? in value.flatMap { (value: ResultMap) -> SearchForRange in SearchForRange(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [SearchForRange?]) -> [ResultMap?] in value.map { (value: SearchForRange?) -> ResultMap? in value.flatMap { (value: SearchForRange) -> ResultMap in value.resultMap } } }, forKey: "searchForRange")
      }
    }

    public struct SearchForRange: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Address"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("ownerId", type: .scalar(String.self)),
          GraphQLField("completeInfo", type: .scalar(String.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("postalCode", type: .scalar(String.self)),
          GraphQLField("nation", type: .scalar(String.self)),
          GraphQLField("isoNationCode", type: .scalar(String.self)),
          GraphQLField("locality", type: .scalar(String.self)),
          GraphQLField("subLocality", type: .scalar(String.self)),
          GraphQLField("ward", type: .scalar(String.self)),
          GraphQLField("administrativeArea", type: .scalar(String.self)),
          GraphQLField("subAdministrativeArea", type: .scalar(String.self)),
          GraphQLField("thoroughfare", type: .scalar(String.self)),
          GraphQLField("subThoroughfare", type: .scalar(String.self)),
          GraphQLField("floor", type: .scalar(String.self)),
          GraphQLField("room", type: .scalar(String.self)),
          GraphQLField("latitude", type: .scalar(String.self)),
          GraphQLField("longitude", type: .scalar(String.self)),
          GraphQLField("shopBranch", type: .object(ShopBranch.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(ownerId: String? = nil, completeInfo: String? = nil, name: String? = nil, postalCode: String? = nil, nation: String? = nil, isoNationCode: String? = nil, locality: String? = nil, subLocality: String? = nil, ward: String? = nil, administrativeArea: String? = nil, subAdministrativeArea: String? = nil, thoroughfare: String? = nil, subThoroughfare: String? = nil, floor: String? = nil, room: String? = nil, latitude: String? = nil, longitude: String? = nil, shopBranch: ShopBranch? = nil) {
        self.init(unsafeResultMap: ["__typename": "Address", "ownerId": ownerId, "completeInfo": completeInfo, "name": name, "postalCode": postalCode, "nation": nation, "isoNationCode": isoNationCode, "locality": locality, "subLocality": subLocality, "ward": ward, "administrativeArea": administrativeArea, "subAdministrativeArea": subAdministrativeArea, "thoroughfare": thoroughfare, "subThoroughfare": subThoroughfare, "floor": floor, "room": room, "latitude": latitude, "longitude": longitude, "shopBranch": shopBranch.flatMap { (value: ShopBranch) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var ownerId: String? {
        get {
          return resultMap["ownerId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ownerId")
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
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

      public var ward: String? {
        get {
          return resultMap["ward"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "ward")
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

      public var room: String? {
        get {
          return resultMap["room"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "room")
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

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("uniqueId", type: .scalar(String.self)),
            GraphQLField("orderId", type: .scalar(Int.self)),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("subtitle", type: .scalar(String.self)),
            GraphQLField("tel", type: .scalar(String.self)),
            GraphQLField("style", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("underPrice", type: .scalar(Double.self)),
            GraphQLField("shop", type: .object(Shop.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(uniqueId: String? = nil, orderId: Int? = nil, title: String? = nil, subtitle: String? = nil, tel: String? = nil, style: String? = nil, type: String? = nil, underPrice: Double? = nil, shop: Shop? = nil) {
          self.init(unsafeResultMap: ["__typename": "ShopBranch", "uniqueId": uniqueId, "orderId": orderId, "title": title, "subtitle": subtitle, "tel": tel, "style": style, "type": type, "underPrice": underPrice, "shop": shop.flatMap { (value: Shop) -> ResultMap in value.resultMap }])
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

        public var title: String? {
          get {
            return resultMap["title"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var subtitle: String? {
          get {
            return resultMap["subtitle"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "subtitle")
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

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("uniqueId", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("status", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(uniqueId: String? = nil, name: String? = nil, status: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Shop", "uniqueId": uniqueId, "name": name, "status": status])
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

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
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
