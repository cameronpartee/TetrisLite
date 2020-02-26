import SwiftUI

struct GameBoard: View {    
    // binding degree to GameBoard
    // bindings have no value, think protocol
    @Binding var shapeOne: Double
    @Binding var shapeTwo: Double
    @Binding var shapeThree: Double
    
    var body: some View {
        // geometryReader
        GeometryReader { geometry in
            // zstack
            ZStack {
                // background color
                Color.orange.opacity(0.35)
                VStack {
                    // Place avatars
                    // from this level we are passing data back
                    Avatar(degree: self.$shapeOne, x1: 90, x2: 90, x3: 0, y1: 0, y2: 80, y3: 80, shapeColor: Color.blue)
                    
                    Avatar(degree: self.$shapeTwo, x1: 10, x2: 90, x3: 10, y1: -20, y2: 100, y3: 70, shapeColor: Color.orange)
                    
                    Avatar(degree: self.$shapeThree, x1: 50, x2: 100, x3: 0, y1: 0, y2: 50, y3: 100, shapeColor: Color.red)
                }.padding()
            }
            .border(Color.purple.opacity(0.24), width: 16.0)
        }
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            // public signature
            GameBoard(shapeOne: .constant(0), shapeTwo: .constant(0), shapeThree: .constant(0))
        }
    }
}
