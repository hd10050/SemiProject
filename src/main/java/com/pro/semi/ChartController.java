package com.pro.semi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController {

		@RequestMapping("/rescueChart.inc")
		public String rescue() {
			return "rescueChart";
		}
		
		@RequestMapping("/hospChart.inc")
		public String hospital() {
			return "hospitalChart";
		}
		
		@RequestMapping("/protect.inc")
		public String protect() {
			
			return "protect";
		}
		
		@RequestMapping("/pharmacy.inc")
		public String phar() {
			
			return "pharmacy";
		}
		
}
