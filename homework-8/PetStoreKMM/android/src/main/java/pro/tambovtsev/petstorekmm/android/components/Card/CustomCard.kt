package ext.grain.lusya.android.shared.SpecificationCard

import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@OptIn(ExperimentalMaterialApi::class)
@Composable
fun CustomCard(
    status: String,
    title: String,
    price: String,
    category: String?,
    tag: String?,
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(15.dp)
            .clickable { },
        shape = RoundedCornerShape(16.dp),
        elevation = 10.dp
    ) {
        Column(
            modifier = Modifier.padding(15.dp)
        ) {
            Chip(
                onClick = { /* Do something! */ },
                border = BorderStroke(
                    ChipDefaults.OutlinedBorderSize,
                    Color(0xFF7655D3)
                ),
                colors = ChipDefaults.chipColors(
                    backgroundColor = Color(0xFF7655D3),
                    contentColor = Color.White
                ),
            ) {
                Text(status)
            }

            Text(
                title,
                style = TextStyle(
                    fontWeight = FontWeight.W600,
                    fontSize = 18.sp,
                    color = Color(0xFF253242),
                    lineHeight = 24.sp
                )
            )
            Row(modifier = Modifier.padding(top = 16.dp)) {
                Column() {
                    Text(
                        "ID", style = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 14.sp,
                            lineHeight = 20.sp, color = Color(0xFF7A8693)
                        )
                    )
                    Text(price, style = TextStyle(
                        fontWeight = FontWeight.W400,
                        fontSize = 16.sp,
                        lineHeight = 22.sp, color = Color(0xFF253242)
                    ))
                }
                Spacer(Modifier.weight(1f))
                Column(modifier = Modifier.width(110.dp)) {
                    Text(
                        "Категория", style = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 14.sp,
                            lineHeight = 20.sp, color = Color(0xFF7A8693)
                        )
                    )
                    if (category != null) {
                        Text(category, style = TextStyle(
                            fontWeight = FontWeight.W400,
                            fontSize = 16.sp,
                            lineHeight = 22.sp, color = Color(0xFF253242)
                        ))
                    }
                }
            }
            Column(modifier = Modifier.padding(top = 8.dp)) {
                Text(
                    "Тег", style = TextStyle(
                        fontWeight = FontWeight.W400,
                        fontSize = 14.sp,
                        lineHeight = 20.sp, color = Color(0xFF7A8693)
                    )
                )
                if (tag != null) {
                    Text(tag, style = TextStyle(
                        fontWeight = FontWeight.W400,
                        fontSize = 16.sp,
                        lineHeight = 22.sp, color = Color(0xFF253242)
                    ))
                }
            }


        }
    }
}