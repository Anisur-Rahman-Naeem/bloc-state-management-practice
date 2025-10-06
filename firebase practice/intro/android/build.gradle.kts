import org.gradle.api.tasks.Delete
import org.gradle.api.file.Directory

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:8.0.2") // Adjust version if necessary
        classpath("com.google.gms:google-services:4.4.3")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// ✅ Fixed: use File, not String
//rootProject.buildDir = file("../build")
//
//subprojects {
//    project.buildDir = file("${rootProject.buildDir}/${project.name}")
//    evaluationDependsOn(":app")
//}

tasks.register<Delete>("clean") {
    delete(rootProject.buildDir)
}

// Optional: redefine build directories using layout API
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(name)
    layout.buildDirectory.set(newSubprojectBuildDir)
    evaluationDependsOn(":app")
}
