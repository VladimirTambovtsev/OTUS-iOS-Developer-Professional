package pro.tambovtsev.petstorekmm

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform