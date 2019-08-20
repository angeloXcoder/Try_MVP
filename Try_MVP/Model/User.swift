

import Foundation
struct User : Codable {
	let user_id : String?
	let user_name : String?
	let user_email : String?
	let user_password : String?
	let user_telep : String?
	let user_address : String?
	let user_token_device : String?
    init(user_id : String,user_name : String,user_email : String,user_password : String,user_telep : String,user_address : String,user_token_device : String) {
        self.user_id            = user_id
        self.user_name          = user_name
        self.user_email         = user_email
        self.user_password      = user_password
        self.user_telep         = user_telep
        self.user_address       = user_address
        self.user_token_device  = user_token_device
        
    }

	enum CodingKeys: String, CodingKey {

		case user_id = "user_id"
		case user_name = "user_name"
		case user_email = "user_email"
		case user_password = "user_password"
		case user_telep = "user_telep"
		case user_address = "user_address"
		case user_token_device = "user_token_device"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
		user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
		user_email = try values.decodeIfPresent(String.self, forKey: .user_email)
		user_password = try values.decodeIfPresent(String.self, forKey: .user_password)
		user_telep = try values.decodeIfPresent(String.self, forKey: .user_telep)
		user_address = try values.decodeIfPresent(String.self, forKey: .user_address)
		user_token_device = try values.decodeIfPresent(String.self, forKey: .user_token_device)
	}

}
