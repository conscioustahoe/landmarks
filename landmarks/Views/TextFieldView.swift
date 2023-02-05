//
//  TextFieldView.swift
//  landmarks
//
//  Created by Ashutosh Narang on 04/02/23.
//

import SwiftUI

struct TextFieldView: View {
    @State private var messageState = MessageState()
    @State private var inputText = ""
    @State private var responseText = ""

    var body: some View {
        VStack {
            HStack {
                TextField("Enter text", text: $inputText)
                    .padding()
                    .border(.blue)
                Button(action: {
                    responseText = "Waiting for response ..."
                    self.messageState.callGPT(prompt: inputText) { (result) -> () in
                            switch result {
                            case .success(let data):
                                print(data)
                                responseText = data
                            case .failure(let error):
                                
                                responseText = error.localizedDescription
                                
                            }
                        }
                    }) {
                    Text("Submit")
                            .padding()
                  }
            }
            .padding()
            Text(responseText)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
