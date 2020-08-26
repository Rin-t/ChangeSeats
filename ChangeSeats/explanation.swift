//
//  Explanation.swift
//  ChangeSeats
//
//  Created by Rin on 2020/08/24.
//  Copyright © 2020 竹村凜. All rights reserved.
//

import SwiftUI

struct Explanation: View {
    @EnvironmentObject var shareData: ShareData
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("番号の振り分け")
                    .font(.largeTitle)
                    .padding(.bottom, 10)
                
                Spacer()
                    
                Text("男子1~\(shareData.boys)番まで")
                    .font(.title)
                    .padding()
                
                Text("女子1~\(shareData.girls)番まで")
                    .font(.title)
                
                Spacer()
                
                NavigationLink(destination: Result()){
                    Text("Let's 抽選")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(width: 120, height: 60)
                        .background(Capsule()
                            .foregroundColor(.blue)
                            .frame(width: 120, height: 60))
                        .overlay(Capsule().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                        .padding(.bottom,40)
                }
            }
            
            
        }
        
    }
}

struct Explanation_Previews: PreviewProvider {
    static var previews: some View {
        Explanation()
            .environmentObject(ShareData())
    }
}
