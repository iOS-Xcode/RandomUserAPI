//
//  RandomUserViewModel.swift
//  RandomUserAPI
//
//  Created by Seokhyun Kim on 2021-03-14.
//

import Foundation
//youtube 확인.
import Combine
import Alamofire
//ObservableObject 관찰이 가능한.
class RandomUserViewModel: ObservableObject {
    //MARK: Properties
    //메모리에서 날리기 위해.
    var subscription = Set<AnyCancellable>()
    //@Published 데이타 변경 사항을 알수 있다.
    @Published var randomUsers = [RandomUser]()
    var baseUrl = "https://randomuser.me/api/?results=50"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            //자동적으로 언래핑.
            .compactMap{ $0.value }
            .map{ $0.results }
            .sink(receiveCompletion: { completion in
                print("데이타스트림 완료")
            }, receiveValue: { receivedValue in
                //guard let self = self else { return }
                print("received value: \(receivedValue.count)")
                self.randomUsers = receivedValue
            }).store(in: &subscription)
    }
}
