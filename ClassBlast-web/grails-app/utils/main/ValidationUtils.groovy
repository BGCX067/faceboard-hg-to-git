package main
import java.util.regex.Matcher
import java.util.regex.Pattern

class ValidationUtils {
	def EMAIL_PATTERN ="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})\$"
	private Pattern pattern;
	private Matcher matcher;

	public ValidationUtils() {
		this.pattern = Pattern.compile(EMAIL_PATTERN);
	}

	/**
	 * Validate hex with regular expression
	 *
	 * @param hex
	 *            hex for validation
	 * @return true valid hex, false invalid hex
	 */
	def validateEmail(final String hex) {
		def matcher = this.pattern.matcher(hex);
		matcher.matches();
	}
}
