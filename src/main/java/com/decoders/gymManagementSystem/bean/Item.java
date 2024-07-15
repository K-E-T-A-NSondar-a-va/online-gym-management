package com.decoders.gymManagementSystem.bean;

public class Item {

	private Long itemId;
	private String itemName;
	private Integer totalSeat;
	private Integer seatVacant;

	public Item(GymItem gymItem) {
		this.itemId = gymItem.getItemId();
		
		System.out.println("gymItemId @Item => "+itemId);
		
		this.itemName = gymItem.getItemName();
		this.totalSeat = gymItem.getTotalSeat();
		this.seatVacant = 0;
	}

	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Item(Long itemId, String itemName, Integer totalSeat, Integer seatVacant) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.totalSeat = totalSeat;
		this.seatVacant = seatVacant;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getTotalSeat() {
		return totalSeat;
	}

	public void setTotalSeat(Integer totalSeat) {
		this.totalSeat = totalSeat;
	}

	public Integer getSeatVacant() {
		return seatVacant;
	}

	public void setSeatVacant(Integer seatVacant) {
		this.seatVacant = seatVacant;
	}

}
