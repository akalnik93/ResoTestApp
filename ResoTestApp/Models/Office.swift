import Foundation

class Office : Codable {
    
    let officeName: String
    let officeAddress: String
    
    enum CodingKeys: String, CodingKey {
        case officeName = "SSHORTNAME"
        case officeAddress = "SSHORTADDRESS"
    }
    
}
