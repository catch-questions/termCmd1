//
//  ContentView.swift
//  termCmd1
//
//  Created by os on 2020/02/20.
//  Copyright © 2020 Catch Questions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var oldPosition: CGSize = .zero
    @State var newPosition: CGSize = .zero
    @State var scaleFlt: CGFloat = 1.0
    @State var gestureSwitch: Bool = false
    @State var txtLabel:String = "位置変更"
    
@State var str = """
echo
print
ctr + P
ctr + N
;

clear
touch
mkdir
cd
ls
ls -l
ls -a
../

pwd
vi q w
cat
cp
rm
rmdir
rm -r
rm -rf

open
killall

open apps quickly
open -a "/Applications/Safari.app"; open -a /Applications/Xcode.app;

kill cloud app
killall OneDrive; killall Box;
"""
    
    
    
    
    var body: some View {
        VStack {
            Text(str)
                
                .offset(x: self.oldPosition.width, y: self.oldPosition.height)
                .gesture(DragGesture()
                    .onChanged { value in
                        if self.gestureSwitch == false {
                            self.oldPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                        }
                        
                }
                .onEnded { value in
                    if self.gestureSwitch == false {
                        self.oldPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                        print(self.newPosition.width)
                        self.newPosition = self.oldPosition
                    }
                    
                    }
            )
                .scaleEffect(scaleFlt)
                .gesture(MagnificationGesture()
                    .onChanged { value in
                        if self.gestureSwitch == true {
                            self.scaleFlt = value.magnitude
                        }
                    }
            )
            
            Spacer()
            
            Button(action: {
                self.gestureSwitch.toggle()
                if self.gestureSwitch == true {
                    self.txtLabel = "大きさ変更"
                } else {
                    self.txtLabel = "位置変更"
                }
            }) {
                Text(self.txtLabel)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
