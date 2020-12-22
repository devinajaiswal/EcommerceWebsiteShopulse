package in.co.ecommerce.entity;

import java.sql.Blob;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "E_PRODUCT")
public class ProductEntity extends BaseEntity {

	@Column(name = "NAME", length = 225)
	private String name;
	@Column(name = "CODE", length = 225)
	private String code;
	@Column(name = "PRICE", length = 225)
	private String price;
	@Column(name = "DESCRIPTION", length = 225)
	private String description;
	@Column(name = "QUANTITY", length = 225)
	private String quantity;
	@Column(name = "IMAGE", length = 225)
	private byte[] image;

	public ProductEntity() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ProductEntity [name=" + name + ", code=" + code + ", price=" + price + ", description=" + description
				+ ", quantity=" + quantity + ", image=" + Arrays.toString(image) + ", id=" + id + ", createdBy="
				+ createdBy + ", modifiedBy=" + modifiedBy + ", createdDateTime=" + createdDateTime
				+ ", modifiedDateTime=" + modifiedDateTime + "]";
	}

	
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	@Override
	public String getKey() {
		return String.valueOf(id);
	}

	@Override
	public String getValue() {
		return name;
	}

}
