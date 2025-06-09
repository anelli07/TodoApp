import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoViewModel()
    @State private var newTodo = ""
    @EnvironmentObject var authService: AuthService

    var body: some View {
        ZStack {
            Color.lightblue.edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
            VStack (spacing: 20) {
                Spacer()
                HStack {
                    TextField("New Todo", text: $newTodo)
                        .padding(12)
                        .background(Color.white)
                        .cornerRadius(8)
                    Button("Add") {
                        viewModel.addTodo(title: newTodo)
                        newTodo = ""
                    }
                }
                .padding(.horizontal)
                
                List {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Text(todo.title)
                                .strikethrough(todo.isCompleted)
                            Spacer()
                            Button {
                                viewModel.toggleComplete(todo: todo)
                            } label: {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: viewModel.removeTodo)
                }
                .scrollContentBackground(.hidden) // Убираем системный фон
            }
            .padding()
        }
    }
}

#Preview {
    TodoListView()
}

