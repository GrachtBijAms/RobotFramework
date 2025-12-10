# Robot Framework Project

A test automation project built with **Robot Framework** and **Selenium Library** for web browser testing.

## 📋 Project Overview

This project contains automated test cases for web application testing using Robot Framework, a generic open-source automation framework. It demonstrates basic test automation patterns including browser automation with Selenium.

## 📁 Project Structure

```
RobotFramework/
├── Tests/
│   └── home.robot          # Test cases for homepage
├── resources/
│   └── Keywords.resource   # Reusable keyword definitions
├── report.html            # Test execution report
├── log.html              # Detailed test execution logs
├── output.xml            # Test results in XML format
└── README.md             # This file
```

## 🔧 Prerequisites

- Python 3.x
- Robot Framework
- SeleniumLibrary
- Firefox browser (default browser used)

## 🚀 Installation

1. **Clone or download the project:**
   ```bash
   cd RobotFramework
   ```

2. **Create a virtual environment (recommended):**
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # On macOS/Linux
   ```

3. **Install dependencies:**
   ```bash
   pip install robotframework
   pip install robotframework-seleniumlibrary
   ```

4. **Install GeckoDriver (for Firefox):**
   - Download from: https://github.com/mozilla/geckodriver/releases
   - Add to your PATH or specify in tests

## 📝 Test Cases

### Tests/home.robot

- **Example Test**: Opens Google homepage and closes the browser
- **Example Test 2**: Alternative approach to open Google homepage and close the browser

### resources/Keywords.resource

- **Go to WebPage**: Custom keyword that opens a browser, navigates to a URL, and maximizes the browser window
  - Arguments: `page_url`, `browser`

## ▶️ Running Tests

Execute tests using Robot Framework:

```bash
# Run all tests
robot Tests/

# Run specific test file
robot Tests/home.robot

# Generate custom output
robot --outputdir results Tests/

# Run with specific browser
robot --variable BROWSER:chrome Tests/
```

## 📊 Test Reports

After running tests, the following reports are generated:

- **report.html** - Executive summary of test results
- **log.html** - Detailed test execution logs with screenshots
- **output.xml** - Machine-readable test results

Open `report.html` in a browser to view the test execution summary.

## 🔄 Variables

Key variables defined in the test suite:

- `${PAGE_URL}` - Target URL (default: https://www.google.com)
- `${BROWSER}` - Browser type (default: firefox)

## 📚 Libraries Used

- **SeleniumLibrary** - For web browser automation
  - Open Browser
  - Close Browser
  - Maximize Browser Window

## 🤝 Contributing

Feel free to add more test cases and keywords to expand the test suite.

## ❓ Troubleshooting

- **Firefox not found**: Ensure Firefox is installed and in PATH
- **GeckoDriver issues**: Download and configure GeckoDriver for your system
- **Selenium errors**: Verify SeleniumLibrary is installed: `pip install --upgrade robotframework-seleniumlibrary`

## 📖 Resources

- [Robot Framework Documentation](https://robotframework.org/)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/)
- [Robot Framework GitHub](https://github.com/robotframework/robotframework)

---

**Last Updated:** December 2025
