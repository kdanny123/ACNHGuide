//
//  FossilInfo.swift
//  ACNHGuide
//
//

import SwiftUI

struct FossilInfo: View {
    let fossil: Fossil
    
    var body: some View {
        
        ZStack {
            Color(red: 230/255, green: 225/255, blue: 193/255)
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                AsyncImage(
                    url: URL(string: fossil.imageURI),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                    .padding(.bottom, 20)
                Text(fossil.name.nameUSen.localizedCapitalized)
                    .font(Font.custom("FinkHeavy", size: 30))
                    .foregroundColor((Color.init(red: 100/255, green: 49/255, blue: 15/255)))
                Text(fossil.partOf.localizedCapitalized)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.secondary)
                Spacer()
                
                
                    Text("Description")
                                .font(Font.custom("FinkHeavy", size: 30))
                                .foregroundColor((Color.init(red: 100/255, green: 49/255, blue: 15/255)))
                                .padding(.top, 50)
                ScrollView {
                Text(fossil.museumPhrase)
                    }
                
                
                .padding(.horizontal, 25)
            }
        }
    }
}

struct FossilInfo_Previews: PreviewProvider {
    static var previews: some View {
        FossilInfo(fossil: .previewData[6])
    }
}
