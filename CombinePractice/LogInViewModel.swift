// 

import Combine
import Foundation

final class LogInViewModel: ObservableObject {
  
  @Published var phoneNumber: String = ""
  @Published var password: String = ""
  
  var valiatedPassword: AnyPublisher<Bool, Never> {
    Publishers.CombineLatest($phoneNumber, $password)
      .map { phone, password in
        phone.count >= 13 && password.count >= 6
      }
      .eraseToAnyPublisher()
  }
  
}
