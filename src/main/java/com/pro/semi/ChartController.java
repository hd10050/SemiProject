package com.pro.semi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController {

		@RequestMapping("/rescueChart.inc")
		public String rescue() {
			return "chart_rescue";
		}
		
		@RequestMapping("/hospChart.inc")
		public String hospital() {
			return "chart_hospital";
		}
		
		@RequestMapping("/protect.inc")
		public String protect() {
			
			return "chart_protect";
		}
		
		@RequestMapping("/pharmacy.inc")
		public String phar() {
			
			return "chart_pharmacy";
		}
		
}
