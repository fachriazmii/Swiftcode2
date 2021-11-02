//
//  ContentView.swift
//  Memorize
//
//  Created by Muhammad Fahri Azmi on 16/07/21.
//

import SwiftUI


struct ContentView: View {
    var emojis = ["✈️", "🚀", "🛻", "🚒", "🚙", "🚕", "🚌", "🚅", "🚜" ,"🛩" ,"🛰" ,"⛵️" ,"🚁" ,"🛥" ,"🚢" ,"🚔" ,"🚛" ,"🚠", "🛵" , "🏍", "🚨", "🚑", "🚲", "🚎" ]
    
    @State var emojiCount = 20


    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    
                    ForEach (emojis [0..<emojiCount], id: \.self) {
                        emoji in CardView(Content: emoji).aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                remove
                Spacer()
                add
                
                
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
        
    }
    
    
    
    var remove: some View{
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View{
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image( systemName: "plus.circle")
        }
    }
}





struct CardView : View {
    var Content : String
    @ State var isFaceUp: Bool = true
    var body: some View {
        ZStack  {
            let Shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                Shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                Shape.strokeBorder(lineWidth: 5)
                Text(Content).font(.largeTitle)
            } else{
                Shape.fill()
                
            }
            
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
