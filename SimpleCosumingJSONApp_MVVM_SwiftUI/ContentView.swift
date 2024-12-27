//
//  ContentView.swift
//  SimpleCosumingJSONApp_MVVM_SwiftUI
//
//  Created by Juan Pablo Lasprilla Correa on 16/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var  vm = ProductListViewModel(webservice: WebService())
    
    var body: some View {
        List(vm.products) { product in
            Text(product.title)
        }.task {
            await vm.populateProducts()
        }
    }
}

#Preview {
    ContentView()
}
