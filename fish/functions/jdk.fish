function jdk
    set -x JAVA_HOME_PARENT /Library/Java/JavaVirtualMachines
    set -x versions (ls "$JAVA_HOME_PARENT")
    if set -q argv[1]
        echo "$argv[1]"
        for v in $versions
            switch $v
            case "*$argv[1]*"
                set -x target $v
                break
            end
        end
    else
        echo "usage: jdk <version>"
        echo "Available JDK versions: $versions"
        return 1
    end
    if set -q target
        set -gx JAVA_HOME "$JAVA_HOME_PARENT/$target/Contents/Home"
        echo "Set JAVA_HOME to $JAVA_HOME"
        java -version
    end
end
