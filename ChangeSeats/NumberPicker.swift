import SwiftUI

struct NumberPicker: View {
    let title: String
    @Binding var number: Int
    let maxNumber: Int = 26
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
            Picker(selection: $number, label: Text("")) {
                ForEach(0..<maxNumber) { index in
                    Text(String(index))
                }
            }
            .frame(width: 200)
        }
    }
}

struct NumberPicker_Previews: PreviewProvider {
    
    struct PreviewWrapper: View {
        let title = "タイトル"
        @State var number: Int = 15
        
        var body: some View {
            NumberPicker(title: title, number: $number)
        }
    }
    
    static var previews: some View {
        PreviewWrapper()
    }
}
