```bash
#!/usr/bin/env bash
##############################################################################
#
# Gradle wrapper script for unix-like systems.
#
#
# To use this script, add it to the root of your project and run it.
# It will download the appropriate gradle distribution and execute it.
#
#
##############################################################################

DIR=$(cd "$(dirname "$0")"; pwd)
APP_BASE_NAME=$(basename "$DIR")

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass options to the JVM.
DEFAULT_JVM_OPTS=""

# Use the supplied gradle command line arguments as-is.
ARGS="$@"

# Determine the gradle home directory.
if [ -n "$GRADLE_HOME" ]; then
    GRADLE_HOME="$GRADLE_HOME"
else
    GRADLE_HOME="$DIR/gradle"
fi

# Determine the gradle distribution directory.
GRADLE_DIST_DIR="$DIR/gradle/wrapper/dists"

# Determine the gradle distribution zip file.
GRADLE_DIST_ZIP="$DIR/gradle/wrapper/gradle-wrapper.jar"

# Determine the gradle distribution url.
GRADLE_DIST_URL=$(grep -Po '^distributionUrl=.*' "$GRADLE_DIST_ZIP" | sed 's/distributionUrl=//g' | tr -d '\r')

# Ensure the gradle distribution directory exists.
mkdir -p "$GRADLE_DIST_DIR"

# Determine the gradle distribution name.
GRADLE_DIST_NAME=$(basename "$GRADLE_DIST_URL")

# Determine the gradle distribution directory.
GRADLE_DIST_DIR="$GRADLE_DIST_DIR/$GRADLE_DIST_NAME"

# Determine the gradle distribution root directory.
GRADLE_DIST="$GRADLE_DIST_DIR/${GRADLE_DIST_NAME%%-bin.zip}"

# Create the gradle distribution directory if it does not exist.
if [ ! -d "$GRADLE_DIST" ]; then
    echo "Downloading gradle distribution from '$GRADLE_DIST_URL'."
    if [ -n "$GRADLE_DIST_URL" ]; then
        if command -v wget >/dev/null 2>&1; then
            wget --no-verbose "$GRADLE_DIST_URL" -P "$GRADLE_DIST_DIR"
        elif command -v curl >/dev/null 2>&1; then
            curl -f -L "$GRADLE_DIST_URL" -o "$GRADLE_DIST_DIR/$GRADLE_DIST_NAME"
        else
            echo "Neither wget nor curl could be found to download the gradle distribution."
            exit 1
        fi
        unzip "$GRADLE_DIST_DIR/$GRADLE_DIST_NAME" -d "$GRADLE_DIST_DIR"
        rm "$GRADLE_DIST_DIR/$GRADLE_DIST_NAME"
    else
        echo "Gradle distribution url is not defined."
        exit 1
    fi
fi

# Execute gradle.
if [ -n "$GRADLE_HOME" ]; then
    echo "Using gradle distribution in '$GRADLE_HOME'."
    exec "$GRADLE_HOME/bin/gradle" "$@"
else
    echo "Using gradle distribution in '$GRADLE_DIST'."
    exec "$GRADLE_DIST/bin/gradle" "$@"
fi
```