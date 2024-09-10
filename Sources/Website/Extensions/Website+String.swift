extension String {
    
    func sanitize() -> Self {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
