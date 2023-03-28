// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CharactersInformationMainViewQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CharactersInformationMainView {
      characters(page: 1) {
        __typename
        results {
          __typename
          id
          name
          status
          species
          gender
          image
          episode {
            __typename
            id
            name
            episode
            air_date
          }
        }
      }
    }
    """

  public let operationName: String = "CharactersInformationMainView"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("characters", arguments: ["page": 1], type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(characters: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all characters
    public var characters: Character? {
      get {
        return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "characters")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Characters"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Characters", "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("species", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("episode", type: .nonNull(.list(.object(Episode.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, species: String? = nil, gender: String? = nil, image: String? = nil, episode: [Episode?]) {
          self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "species": species, "gender": gender, "image": image, "episode": episode.map { (value: Episode?) -> ResultMap? in value.flatMap { (value: Episode) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the character.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// The species of the character.
        public var species: String? {
          get {
            return resultMap["species"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "species")
          }
        }

        /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
        public var gender: String? {
          get {
            return resultMap["gender"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// Episodes in which this character appeared.
        public var episode: [Episode?] {
          get {
            return (resultMap["episode"] as! [ResultMap?]).map { (value: ResultMap?) -> Episode? in value.flatMap { (value: ResultMap) -> Episode in Episode(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Episode?) -> ResultMap? in value.flatMap { (value: Episode) -> ResultMap in value.resultMap } }, forKey: "episode")
          }
        }

        public struct Episode: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Episode"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(GraphQLID.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("episode", type: .scalar(String.self)),
              GraphQLField("air_date", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID? = nil, name: String? = nil, episode: String? = nil, airDate: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Episode", "id": id, "name": name, "episode": episode, "air_date": airDate])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The id of the episode.
          public var id: GraphQLID? {
            get {
              return resultMap["id"] as? GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The name of the episode.
          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The code of the episode.
          public var episode: String? {
            get {
              return resultMap["episode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "episode")
            }
          }

          /// The air date of the episode.
          public var airDate: String? {
            get {
              return resultMap["air_date"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "air_date")
            }
          }
        }
      }
    }
  }
}

public final class GetEpisodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetEpisode($id: ID = "1") {
      episode(id: $id) {
        __typename
        id
        name
        air_date
        episode
      }
    }
    """

  public let operationName: String = "GetEpisode"

  public var id: GraphQLID?

  public init(id: GraphQLID? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episode", arguments: ["id": GraphQLVariable("id")], type: .object(Episode.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episode: Episode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episode": episode.flatMap { (value: Episode) -> ResultMap in value.resultMap }])
    }

    /// Get a specific episode by ID
    public var episode: Episode? {
      get {
        return (resultMap["episode"] as? ResultMap).flatMap { Episode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "episode")
      }
    }

    public struct Episode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episode"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("air_date", type: .scalar(String.self)),
          GraphQLField("episode", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, airDate: String? = nil, episode: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Episode", "id": id, "name": name, "air_date": airDate, "episode": episode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the episode.
      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the episode.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The air date of the episode.
      public var airDate: String? {
        get {
          return resultMap["air_date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "air_date")
        }
      }

      /// The code of the episode.
      public var episode: String? {
        get {
          return resultMap["episode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "episode")
        }
      }
    }
  }
}
