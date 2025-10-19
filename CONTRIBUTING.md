# Contributing to NetPromoterScoreKit 🤝

Thank you for your interest in contributing to NetPromoterScoreKit! This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Prerequisites
- Xcode 12.0 or later
- iOS 13.0+ target
- Swift 5.0+
- Basic understanding of UIKit and Swift

### Setting Up Development Environment

1. **Fork the repository**
   ```bash
   git clone https://github.com/ControlKit/NetPromoterScoreKit.git
   cd NetPromoterScoreKit
   ```

2. **Open in Xcode**
   ```bash
   open NetPromoterScoreKit.xcodeproj
   ```

3. **Run tests**
   ```bash
   xcodebuild test -scheme NetPromoterScoreKit
   ```

## 📋 Contribution Guidelines

### Code Style
- Follow Swift API Design Guidelines
- Use meaningful variable and function names
- Add comments for complex logic
- Maintain consistent indentation (4 spaces)

### Commit Messages
Use clear, descriptive commit messages:
```
feat: add dark mode support
fix: resolve memory leak in gauge view
docs: update README with new examples
style: format code according to Swift guidelines
```

### Pull Request Process

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes**
   - Write clean, well-documented code
   - Add tests for new functionality
   - Update documentation if needed

3. **Test your changes**
   ```bash
   xcodebuild test -scheme NetPromoterScoreKit
   ```

4. **Submit a pull request**
   - Provide a clear description
   - Reference any related issues
   - Include screenshots for UI changes

## 🎯 Areas for Contribution

### High Priority
- [ ] Accessibility improvements
- [ ] Performance optimizations
- [ ] Additional UI themes
- [ ] Localization support
- [ ] Unit test coverage

### Medium Priority
- [ ] SwiftUI support
- [ ] Custom animations
- [ ] Advanced customization options
- [ ] Documentation improvements

### Low Priority
- [ ] Additional color schemes
- [ ] Font customization
- [ ] Layout variations

## 🐛 Bug Reports

When reporting bugs, please include:

1. **Environment details**
   - iOS version
   - Xcode version
   - Device type

2. **Steps to reproduce**
   - Clear, numbered steps
   - Expected vs actual behavior

3. **Code sample**
   - Minimal code that reproduces the issue

4. **Screenshots/videos**
   - Visual evidence of the problem

## 💡 Feature Requests

When suggesting features:

1. **Describe the problem**
   - What use case does this solve?
   - Why is it important?

2. **Propose a solution**
   - How should it work?
   - Any design considerations?

3. **Consider alternatives**
   - Are there existing solutions?
   - What are the trade-offs?

## 🧪 Testing

### Running Tests
```bash
# Run all tests
xcodebuild test -scheme NetPromoterScoreKit

# Run specific test
xcodebuild test -scheme NetPromoterScoreKit -only-testing:NetPromoterScoreKitTests/NetPromoterScoreKitTests/testBasicFunctionality
```

### Writing Tests
- Test both success and failure cases
- Use descriptive test names
- Mock external dependencies
- Aim for high code coverage

### Test Structure
```swift
func testFeatureName_WhenCondition_ShouldExpectedResult() {
    // Given
    let input = "test input"
    
    // When
    let result = sut.method(input)
    
    // Then
    XCTAssertEqual(result, expectedOutput)
}
```

## 📚 Documentation

### Code Documentation
- Use Swift documentation comments (`///`)
- Document public APIs
- Include parameter descriptions
- Provide usage examples

### README Updates
- Keep examples up to date
- Add new features to feature list
- Update installation instructions
- Include breaking changes

## 🔄 Release Process

### Version Numbering
Follow semantic versioning (MAJOR.MINOR.PATCH):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Checklist
- [ ] Update version numbers
- [ ] Update CHANGELOG.md
- [ ] Run full test suite
- [ ] Update documentation
- [ ] Create release tag
- [ ] Publish to package managers

## 🏷️ Labels

We use these labels for issues and PRs:

- `bug`: Something isn't working
- `enhancement`: New feature or request
- `documentation`: Improvements to documentation
- `good first issue`: Good for newcomers
- `help wanted`: Extra attention is needed
- `question`: Further information is requested
- `wontfix`: This will not be worked on

## 📞 Getting Help

- **GitHub Issues**: [ControlKit/NetPromoterScoreKit Issues](https://github.com/ControlKit/NetPromoterScoreKit/issues)
- **Discussions**: For questions and general discussion
- **Email**: support@controlkit.com
- **Website**: [ControlKit](https://controlkit.com)

## 🎉 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

## 📄 License

By contributing, you agree that your contributions will be licensed under the same MIT License that covers the project.

---

Thank you for contributing to NetPromoterScoreKit! 🚀

