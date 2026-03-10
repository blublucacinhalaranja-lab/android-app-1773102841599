```kotlin
package com.example.calculator

import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.example.calculator.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private var operand1: Double? = null
    private var operator: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.button0.setOnClickListener { appendToDisplay("0") }
        binding.button1.setOnClickListener { appendToDisplay("1") }
        binding.button2.setOnClickListener { appendToDisplay("2") }
        binding.button3.setOnClickListener { appendToDisplay("3") }
        binding.button4.setOnClickListener { appendToDisplay("4") }
        binding.button5.setOnClickListener { appendToDisplay("5") }
        binding.button6.setOnClickListener { appendToDisplay("6") }
        binding.button7.setOnClickListener { appendToDisplay("7") }
        binding.button8.setOnClickListener { appendToDisplay("8") }
        binding.button9.setOnClickListener { appendToDisplay("9") }
        binding.buttonDecimal.setOnClickListener { appendToDisplay(".") }

        binding.buttonAdd.setOnClickListener { performOperation("+") }
        binding.buttonSubtract.setOnClickListener { performOperation("-") }
        binding.buttonMultiply.setOnClickListener { performOperation("*") }
        binding.buttonDivide.setOnClickListener { performOperation("/") }

        binding.buttonEquals.setOnClickListener { calculateResult() }
        binding.buttonClear.setOnClickListener { clearDisplay() }
    }

    private fun appendToDisplay(value: String) {
        binding.displayEditText.append(value)
    }

    private fun performOperation(operator: String) {
        try {
            operand1 = binding.displayEditText.text.toString().toDouble()
            this.operator = operator
            binding.displayEditText.text.clear()
        } catch (e: NumberFormatException) {
            binding.displayEditText.setText("Error")
        }
    }

    private fun calculateResult() {
        try {
            val operand2 = binding.displayEditText.text.toString().toDouble()
            val result = when (operator) {
                "+" -> operand1!! + operand2
                "-" -> operand1!! - operand2
                "*" -> operand1!! * operand2
                "/" -> operand1!! / operand2
                else -> operand2
            }
            binding.displayEditText.setText(result.toString())
            operand1 = null
            operator = null
        } catch (e: NumberFormatException) {
            binding.displayEditText.setText("Error")
        } catch (e: NullPointerException) {
            binding.displayEditText.setText("Error")
        }
    }

    private fun clearDisplay() {
        binding.displayEditText.text.clear()
        operand1 = null
        operator = null
    }
}
```