package com.shivamJaiswal.melodies_music_app
import android.database.Cursor
import android.provider.MediaStore
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.musicplayer/media"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getAudioFiles") {
                val audioList = fetchAudioFiles()
                result.success(audioList)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun fetchAudioFiles(): List<Map<String, String>> {
        val audioList = mutableListOf<Map<String, String>>()
        val projection = arrayOf(
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.ARTIST,
            MediaStore.Audio.Media.DATA
        )

        val cursor: Cursor? = contentResolver.query(
            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI,
            projection,
            null,
            null,
            null
        )

        cursor?.use {
            while (it.moveToNext()) {
                val title = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE))
                val artist = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST))
                val data = it.getString(it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA))

                val audioFile = mapOf("title" to title, "artist" to artist, "uri" to data)
                audioList.add(audioFile)
            }
        }
        return audioList
    }
}
