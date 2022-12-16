import SwiftUI
import shared
//
//class ViewModel: ObservableObject {
//    @Published var items = [Pet]()
//
//    func loadData() {
//        do {
//
//
//
//
////            PetApi.findPetsByStatus(Pet.Status.available)
////            let res = await PetApi().findPetsByStatus(status: ["available"])
//        } catch(let err) {
//            print(err.localizedDescription)
//        }
//    }
//}

struct ContentView: View {
    let greet = Greeting().greeting()
    
//    let p = PetApi(baseUrl: "", httpClientEngine: nil, httpClientConfig: nil, jsonSerializer: Kotlinx_serialization_jsonJson).deletePet(petId: 1, apiKey: "api-key" as Any as! String)
//
    //    @ObservedObject var vm = ViewModel()
    
    init() async {
        do {
            let res = try? await PetApi().deletePet(petId: 1, apiKey: "")
        } catch {
            
        }
    }
            //        PetApi.deletePet(petId: 1 as PetApi, apiKey: "api-key") { res, err in
            //            print("res: \(res)")
            //            print("res: \(err)")
            //        }
            //        let res = PetApi.getPetById()
            
//        }
        
        var body: some View {
            HStack {
                Text(greet)
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
