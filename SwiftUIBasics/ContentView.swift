// 

import SwiftUI

let names = ["Lucy", "Cherry", "Apple", "Nancy", "Nova"]

struct ContentView: View {
  let persons = names.map { Person(name: $0, avatarName: "avatar") }
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Layout")) {
          NavigationLink(destination: HStackIntroductionView()) {
            Text("HStack Introdunction")
          }
          NavigationLink(destination: HStackAlignment()) {
            Text("HStack Alignment")
          }
        }
      }.navigationBarTitle("SwiftUI Basics")
    }
  }
}

struct PersonRow: View {
  let person: Person
  var body: some View {
    HStack {
      Image(uiImage: UIImage(named: person.avatarName)!)
        .frame(width: 44, height: 44)
        .clipShape(Circle())
        .overlay(
          Text("99+")
            .frame(width: 16, height: 16)
            .background(Color.red)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(Font.caption)
          , alignment: .topTrailing)
      Text(person.name)
      Spacer()
    }
  }
}

struct Person: Identifiable {
  let id = UUID()
  let name: String
  let avatarName: String
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
