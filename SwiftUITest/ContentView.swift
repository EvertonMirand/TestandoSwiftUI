//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Everton Miranda Vitório on 05/11/20.
//

import SwiftUI

final class DataModel: ObservableObject {
  static let shared = DataModel()
  @Published var string = "This is an ObservedObject string"
}


struct ContentView: View {
    
    @ObservedObject var data = DataModel.shared
      let substring: Substring = "This is a substring"
      let string = "This is a string"
      var body: some View {
        VStack {
          //This is a substring
          Text(substring)
          
          //This is a string
          Text(string)
          
          //This is an ObservedObject string
          Text(data.string)
          
          //string_key
          Text(verbatim: "string_key")
          
          //This string in the default file
          Text("string_key")
          
          //This string is in another file
          Text("string_key", tableName: "Local", bundle: Bundle.main, comment: "Comment")
            HStack {
                Text("oi")
                Text("oi")
            }
        }

      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
