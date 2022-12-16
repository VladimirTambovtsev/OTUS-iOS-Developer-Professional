package pro.tambovtsev.petstorekmm.android

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.twotone.Call
import androidx.compose.material.icons.twotone.List
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import ext.grain.lusya.android.shared.SpecificationCard.CustomCard
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import org.openapitools.client.apis.PetApi
import org.openapitools.client.apis.StoreApi
import org.openapitools.client.models.Pet
import pro.tambovtsev.petstorekmm.Greeting

@Composable
fun MyApplicationTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    val colors = if (darkTheme) {
        darkColors(
            primary = Color(0xFFBB86FC),
            primaryVariant = Color(0xFF3700B3),
            secondary = Color(0xFF03DAC5)
        )
    } else {
        lightColors(
            primary = Color(0xFF6200EE),
            primaryVariant = Color(0xFF3700B3),
            secondary = Color(0xFF03DAC5)
        )
    }
    val typography = Typography(
        body1 = TextStyle(
            fontFamily = FontFamily.Default,
            fontWeight = FontWeight.Normal,
            fontSize = 16.sp
        )
    )
    val shapes = Shapes(
        small = RoundedCornerShape(4.dp),
        medium = RoundedCornerShape(4.dp),
        large = RoundedCornerShape(0.dp)
    )

    MaterialTheme(
        colors = colors,
        typography = typography,
        shapes = shapes,
        content = content
    )
}

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MyApplicationTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colors.background
                ) {
                    Greeting(Greeting().greeting())
                }
            }
        }
    }
}


@Composable
fun Greeting(text: String) {
    val coroutineScope = rememberCoroutineScope()
    var (loadResult, setLoadResult) = remember { mutableStateOf<List<Pet?>>(listOf(null)) }

    Column( modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally) {


        Text(
            text = "OpenApi Generated Data",
            textAlign = TextAlign.Center,
            fontWeight = FontWeight.W600,
            fontSize = 24.sp,
            modifier = Modifier.padding(top = 42.dp)
        )

        IconButton(
            onClick = {
                coroutineScope.launch {
                    withContext(Dispatchers.IO) {
                        try {
                            val res = PetApi().findPetsByStatus(listOf("available"))
                            val data = res.body()
                            println(res)
                            setLoadResult(data)
                        } catch (e: Exception) {
                            println(e.message)
                        }
                    }
                }

            }
        ) {
            Icon(Icons.TwoTone.List, contentDescription = "Load")
        }
    }


    if (loadResult != null) {
        LazyColumn(
            modifier = Modifier
                .height(200.dp)
                .padding(top = 150.dp)
        ) {
            items(items = loadResult, itemContent = { item ->
                item?.status?.let {
                    CustomCard(
                        status = it.value,
                        title = item.name,
                        price = "${item.id}",
                        category = item.category?.name,
                        tag = item.category?.name,
                    )
                }
            })
        }
    }
}

//@Preview
//@Composable
//fun DefaultPreview() {
//    MyApplicationTheme {
//        Greeting("Hello, Android!")
//    }
//}
