In this file: C:\Users\kos\AppData\Local\Pub\Cache\hosted\pub.dev\ffmpeg_kit_flutter-6.0.3-LTS\android\build.gradle

Add the following:

```gradle
repositories {
    flatDir {
        dirs 'C:\\Users\\kos\\AndroidStudioProjects\\jidoujisho\\yuuna\\android\\app\\libs'
    }
}

...

dependencies {
    ...
    implementation(name: 'ffmpeg-kit-full-6.0-2', ext: 'aar')
    implementation("com.arthenica:smart-exception-java:0.2.1")
}

```
