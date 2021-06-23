import SwiftUI

struct NumberPicker: View {
    
    @Binding var number: Int
    let maxNumber: Int = 46
    
    var body: some View {
        
        Picker(selection: $number, label: Text("")) {
            ForEach(0..<maxNumber) { index in
                Text(String(index))
            }
        }
        .frame(width: 200)
    }
}


