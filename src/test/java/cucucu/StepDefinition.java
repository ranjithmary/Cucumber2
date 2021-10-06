package cucucu;

import java.util.concurrent.TimeUnit;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;

public class StepDefinition {

	WebDriver driver;

	@Given("user is on the Adactin page")
	public void user_is_on_the_Adactin_page() {

		WebDriverManager.chromedriver().setup();
		driver = new ChromeDriver();
		driver.get("http://adactinhotelapp.com/");
		driver.manage().window().maximize();
		driver.manage().timeouts().implicitlyWait(100, TimeUnit.SECONDS);
	}

	@When("user should login {string} and {string}")
	public void user_should_login_and(String username, String password) {
		WebElement txtusername = driver.findElement(By.id("username"));
		txtusername.sendKeys(username);
		WebElement txtpass = driver.findElement(By.id("password"));
		txtpass.sendKeys(password);
		WebElement Btnlogin = driver.findElement(By.id("login"));
		Btnlogin.click();

	}

	@When("user should search hotel  {string} {string} {string} {string}  {string} {string} {string} {string}")
	public void user_should_search_hotel(String location, String hotels, String roomtype, String room_nos,
			String datepick_in, String datepick_out, String adult_room, String child_room) {

		WebElement Ddnlocation = driver.findElement(By.id("location"));

		Select select = new Select(Ddnlocation);
		select.selectByVisibleText(location);
		WebElement Ddnhotel = driver.findElement(By.id("hotels"));
		Select select1 = new Select(Ddnhotel);
		select1.selectByVisibleText(hotels);

		WebElement Ddnroomtype = driver.findElement(By.id("room_type"));
		Select select9 = new Select(Ddnroomtype);
		select9.selectByVisibleText(roomtype);

		WebElement Ddnroom = driver.findElement(By.id("room_nos"));
		Select select3 = new Select(Ddnroom);
		select3.selectByVisibleText(room_nos);

		WebElement Datein = driver.findElement(By.id("datepick_in"));
		Datein.clear();
		Datein.sendKeys(datepick_in);
		WebElement Dateo = driver.findElement(By.id("datepick_out"));
		Dateo.clear();
		Dateo.sendKeys(datepick_out);
		WebElement Ddnadroom = driver.findElement(By.id("adult_room"));
		Select select4 = new Select(Ddnadroom);
		select4.selectByVisibleText(adult_room);
		WebElement Ddnchild = driver.findElement(By.id("child_room"));
		Select select5 = new Select(Ddnchild);
		select5.selectByVisibleText(child_room);
		WebElement btnsearch = driver.findElement(By.id("Submit"));
		btnsearch.click();
	}

	@When("user should select hotel and click continue button")
	public void user_should_select_hotel_and_click_continue_button() {

		WebElement racdio = driver.findElement(By.id("radiobutton_0"));
		racdio.click();
		WebElement Btncon = driver.findElement(By.id("continue"));
		Btncon.click();
	}

	@When("user should book hotel {string} {string} {string} {string} {string} {string} {string} {string}")
	public void user_should_book_hotel(String firstname, String lastname, String address, String ccnum, String cctype,
			String cc_expmonth, String cc_expyear, String cccvv) {

		WebElement first = driver.findElement(By.id("first_name"));
		first.sendKeys(firstname);
		WebElement last = driver.findElement(By.id("last_name"));
		last.sendKeys(lastname);
		WebElement Txtadd = driver.findElement(By.id("address"));
		Txtadd.sendKeys(address);
		WebElement txtnum = driver.findElement(By.id("cc_num"));
		txtnum.sendKeys(ccnum);
		WebElement Ddncardtype = driver.findElement(By.id("cc_type"));

		Select select = new Select(Ddncardtype);
		select.selectByVisibleText(cctype);

		WebElement ddnmon = driver.findElement(By.id("cc_exp_month"));
		Select select2 = new Select(ddnmon);
		select2.selectByVisibleText(cc_expmonth);

		WebElement Ddnex = driver.findElement(By.id("cc_exp_year"));
		Select select3 = new Select(Ddnex);
		select3.selectByVisibleText(cc_expyear);
		WebElement txtccv = driver.findElement(By.id("cc_cvv"));
		txtccv.sendKeys(cccvv);

		WebElement btnbook = driver.findElement(By.id("book_now"));
		btnbook.click();
	}

	@When("user should confirm booking")
	public void user_should_confirm_booking() {
		WebElement orderno = driver.findElement(By.id("order_no"));
		String attribute = orderno.getAttribute("value");
		System.out.println(attribute);
	}

	@Then("user should verify sucess msg")
	public void user_should_verify_sucess_msg() {

		WebElement txtsearch = driver.findElement(By.className("login_title"));
		boolean displayed = txtsearch.isDisplayed();
		Assert.assertEquals(displayed, true);
	}

}
