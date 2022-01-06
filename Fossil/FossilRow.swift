//
//  FossilDetail.swift
//  ACNHGuide
//
//

import SwiftUI

struct FossilRow: View {
    let fossil: Fossil
    var body: some View {
        
        
        NavigationLink(destination: FossilInfo(fossil: fossil)) {
            HStack(alignment: .center) {
                
                AsyncImage(
                    url: URL(string: fossil.imageURI),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                            .padding(.all, 20)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )

                  VStack(alignment: .leading) {
                      Text(fossil.name.nameUSen)
                          .font(.system(size: 26, weight: .bold, design: .default))
                          .foregroundColor(.white)
                      Text(fossil.partOf)
                          .font(.system(size: 16, weight: .bold, design: .default))
                          .foregroundColor(.secondary)
                      HStack {
                          Text("\(fossil.price)")
                              .padding(.top, 8)

                      }
                  }.padding(.trailing, 20)
                  Spacer()
              }
              .frame(maxWidth: .infinity, alignment: .center)
              .background(Color(red: 230/255, green: 225/255, blue: 193/255))
              .modifier(CardModifier())
          .padding(.all, 10)
        }
    }
}

struct FossilDetail_Previews: PreviewProvider {
    static var previews: some View {
        FossilRow(fossil: Fossil.previewData[4])
    }
}
 
