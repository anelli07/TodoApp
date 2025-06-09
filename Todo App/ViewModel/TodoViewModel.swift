import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var todos: [TodoModel] = []

    func addTodo(title: String) {
        guard !title.isEmpty else { return }
        todos.append(TodoModel(title: title))
    }

    func removeTodo(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }

    func toggleComplete(todo: TodoModel) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
        }
    }
}
