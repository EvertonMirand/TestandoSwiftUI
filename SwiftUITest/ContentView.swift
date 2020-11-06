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
            Text(string).modifier(Padding(value: 2))
            
            //This is an ObservedObject string
            Text(data.string).pad(5)
            
            //string_key
            Text(verbatim: "string_key").padding(10)
            
            //This string in the default file
            Text("string_key" ).bold().italic().tracking(20)
            
            //This string is in another file
            Text("string_key", tableName: "Local", bundle: Bundle.main, comment: "Comment")
            HStack {
                Text("oi").foregroundColor(.orange).kerning(-1)
                Text("oi").baselineOffset(20)
            }
            Group {
                Text("Strikethrough")
                    .strikethrough()
                Text("Red Strikethrough")
                    .strikethrough(color: .red)
                
            }
        }
        
    }
}

struct Padding: ViewModifier {
    let value: CGFloat
    func body(content: Content) -> some View {
        content
            .padding(value)
    }
}

extension View {
    func pad(_ value: CGFloat) -> some View {
        self.modifier(Padding(value: value))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
