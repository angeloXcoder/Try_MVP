

import Foundation
struct Json4Swift_Base : Codable {
	let message : String?
	let jwt : String?
	let user : User?
 
  

	enum CodingKeys: String, CodingKey {

		case message = "message"
		case jwt = "jwt"
		case user = "user"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		jwt = try values.decodeIfPresent(String.self, forKey: .jwt)
		user = try values.decodeIfPresent(User.self, forKey: .user)
	}

}
