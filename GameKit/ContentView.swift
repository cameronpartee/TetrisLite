import SwiftUI

/*
 *GAME LOGIC NOTE*
 if I wanted to match it to a sequence I would have a function
 inside of the the struct and outside the body that would take
 in some kind of structure and match it to another structure
 */

struct ContentView: View {
    // changeable degree state that binds degree to Avatar
    // state have value bc we are changing the value
    @State var shapeOne: Double = 0
    @State var shapeTwo: Double = 0
    @State var shapeThree: Double = 0
    
    var body: some View {
        // using geometryReader
        GeometryReader { geometry in
            // zstack instead of vstack or hstack
            ZStack {
                // instantiate a gameboard
                // from this level we are passing data back
                GameBoard(shapeOne: self.$shapeOne, shapeTwo: self.$shapeTwo, shapeThree: self.$shapeThree)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
