# Publication Guide for pub.dev

Complete guide for publishing ldk_node to pub.dev and maintaining pub.dev best practices.

## Pre-Publication Checklist

### Code Quality
- [ ] All tests passing: `flutter test`
- [ ] No lint warnings: `flutter analyze`
- [ ] Code formatted: `dart format .`
- [ ] Documentation complete: `dart doc`

### Documentation
- [ ] README.md is comprehensive (500+ words)
- [ ] Example code in `/example` folder works
- [ ] All public APIs documented with dartdoc
- [ ] CHANGELOG.md updated with version notes
- [ ] API examples clear and runnable

### Repository
- [ ] `pubspec.yaml` has correct metadata
- [ ] `LICENSE` file present (MIT and/or Apache)
- [ ] `.gitignore` configured
- [ ] `example/` folder has working demo
- [ ] No `*.lock` files for libraries (only apps)

### Package Configuration

Ensure `pubspec.yaml` has:

```yaml
name: ldk_node
version: 0.7.0
description: >
  Non-custodial Bitcoin and Lightning Network node for Flutter.
  Build self-sovereign Bitcoin applications on mobile devices.
homepage: https://github.com/LtbLightning/ldk_node_flutter
repository: https://github.com/LtbLightning/ldk_node_flutter
documentation: https://pub.dev/documentation/ldk_node/latest/
issue_tracker: https://github.com/LtbLightning/ldk_node_flutter/issues

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  path_provider: ^2.1.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  plugin:
    platforms:
      android:
        ffiPlugin: true
      ios:
        ffiPlugin: true
      macos:
        ffiPlugin: true
      linux:
        ffiPlugin: true
      windows:
        ffiPlugin: true
```

## Publishing to pub.dev

### Step 1: Setup pub.dev Account

```bash
# Login to Google
dart pub login

# Or set credentials
export PUB_CREDENTIALS_FILE="$HOME/.pub-cache/credentials.json"
```

### Step 2: Verify Package

```bash
# Check for issues
dart pub publish --dry-run

# Review output for warnings/errors
```

### Step 3: Publish

```bash
# Publish to pub.dev
dart pub publish

# Follow prompts
# Review package info
# Confirm publication
```

### Step 4: Verify Publication

```bash
# Visit https://pub.dev/packages/ldk_node
# Check that version appears
# Verify documentation generated correctly
# Test installing: flutter pub add ldk_node
```

## After Publication

### Version Updates

For each new version:

1. Update `CHANGELOG.md` with changes
2. Update version in `pubspec.yaml`
3. Tag release in git
4. Publish with `dart pub publish`

### Maintaining Rating

pub.dev scores packages on:

| Category | Score Requirement | How to Improve |
|----------|------------------|-----------------|
| Code Quality | 130+ | Run `dart analyze`, fix warnings |
| Documentation | Aim for 100% | Document all public APIs |
| Popularity | Higher is better | Use in projects, promote |
| Platform Support | All available | Keep all platforms supported |
| Maintenance | Recent activity | Respond to issues promptly |

## Documentation Best Practices

### README Structure

```markdown
# Package Name
[Badges]

## Overview
Brief description (1-2 sentences)

## Features
- Feature 1
- Feature 2

## Getting Started
Installation instructions

## Quick Start
Minimal working example (10-20 lines)

## API Documentation
Link to pub.dev docs

## Examples
Link to example folder

## Troubleshooting
Common issues

## Contributing
How to contribute

## License
License information
```

### Dartdoc Comments

```dart
/// Brief description (first line auto-summarized)
/// 
/// Longer explanation if needed. Can include:
/// - Bullet points
/// - Examples (see [usage] below)
/// 
/// Example:
/// ```dart
/// final node = await builder.build();
/// await node.start();
/// ```
/// 
/// See also:
/// - [relatedClass]
/// - [relatedMethod()]
class MyClass {
  /// Creates a new instance.
  MyClass();
}
```

## Badges

Add to README:

```markdown
[![pub package](https://img.shields.io/pub/v/ldk_node.svg)](https://pub.dev/packages/ldk_node)
[![likes](https://img.shields.io/pub/likes/ldk_node)](https://pub.dev/packages/ldk_node)
[![popularity](https://img.shields.io/pub/popularity/ldk_node)](https://pub.dev/packages/ldk_node)
[![points](https://img.shields.io/pub/points/ldk_node)](https://pub.dev/packages/ldk_node)
```

## Common Issues & Solutions

### Issue: Documentation doesn't show examples

**Solution:** Examples must be in properly formatted dartdoc comments:
```dart
/// Example:
/// ```dart
/// await node.start();
/// ```
```

### Issue: Code quality score low

**Solution:** Run and fix:
```bash
dart analyze
dart format .
flutter test
```

### Issue: Platform support score low

**Solution:** Ensure pubspec.yaml declares platform support:
```yaml
flutter:
  plugin:
    platforms:
      android:
        ffiPlugin: true
      ios:
        ffiPlugin: true
      # ... all supported platforms
```

### Issue: Documentation score not 100%

**Solution:** Check all public classes/methods have docs:
```bash
dart doc --check-for-missing-docs
```

## Versioning

Follow [Semantic Versioning](https://semver.org/):

```
MAJOR.MINOR.PATCH
0.7.0

- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes
```

Examples:
- 0.7.0 → 0.8.0: New features
- 0.7.0 → 1.0.0: Breaking changes
- 0.7.0 → 0.7.1: Bug fixes

## Deprecation

Deprecate features gracefully:

```dart
@Deprecated('Use newMethod() instead. This method will be removed in v1.0.0')
void oldMethod() {
  // Old implementation
}
```

## CHANGELOG Format

```markdown
## [0.7.0] - 2024-01-20

### Added
- New BOLT12 offers support
- Channel splicing support
- LSP integration

### Changed
- Updated to LDK 0.7.0
- Improved error handling
- API naming consistency

### Fixed
- Memory leak in event handling
- Crash on mainnet sync

### Deprecated
- `receivePayment()` - use `bolt11Payment()` instead

### Removed
- Old synchronous APIs
```

## Supporting New Versions

When Flutter or Dart updates:

1. Test on new version
2. Update `environment` in pubspec.yaml
3. Fix any compatibility issues
4. Publish patch version
5. Update documentation

## Community

### Engagement
- Respond to GitHub issues within 24-48 hours
- Review pull requests promptly
- Provide detailed issue templates
- Create discussion category for questions

### Support
- Link to [documentation](./DOCUMENTATION.md)
- Create FAQ for common issues
- Share example projects
- Highlight community projects

## Analytics

Monitor pub.dev stats:

```bash
# Dry run shows download metrics
dart pub publish --dry-run

# Check stats at:
# https://pub.dev/packages/ldk_node/score
```

## Promotion

Help users find the package:

1. **Documentation**: Comprehensive docs on pub.dev
2. **Examples**: Working examples in repository
3. **Social**: Share on Twitter, Reddit, forums
4. **Community**: Participate in Flutter community
5. **Integration**: Show real-world use cases
6. **Talks**: Present at Flutter/Bitcoin meetups

## Related Resources

- [pub.dev Publishing Guide](https://dart.dev/tools/pub/publishing)
- [Dart Package Guidelines](https://dart.dev/guides/libraries/creating-packages)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)
