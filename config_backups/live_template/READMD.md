## How to Import Language-Specific Live Templates into JetBrains IDE

If you have customized language-specific live templates that you'd like to migrate or back up in JetBrains IDEs like IntelliJ IDEA, PyCharm, or WebStorm, follow these steps:

### 1. Locate the Live Templates Folder

Before making any changes, identify the directory where the IDE stores its live templates:

- **Windows**: `%USERPROFILE%\.<IDE_NAME><VERSION>\config\templates`
- **macOS**: `~/Library/Application Support/<IDE_NAME><VERSION>/templates`
- **Linux**: `~/.<IDE_NAME><VERSION>/config/templates`

Replace `<IDE_NAME>` with the name of your JetBrains IDE (e.g., `IntelliJ IDEA`, `PyCharm`, `WebStorm`) and `<VERSION>` with the specific version (e.g., `2021.2`).


### 2. Move Live Templates to IDE Directory

Copy each language-specific live template file to the appropriate folder in your IDE's templates directory. For instance, if you have Python-related live templates for PyCharm, move these files to:

```
/Library/Application Support/JetBrains/<IDE_NAME><VERSION_IDE>/templates
```

Replace `<IDE_NAME>` and `<VERSION_IDE>` with the relevant details.

