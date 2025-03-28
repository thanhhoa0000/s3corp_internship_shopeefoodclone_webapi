﻿namespace ShopeeFoodClone.WebApi.Orders.Domain.Entities;

public class Order : IEntity
{
    [Key]
    public Guid Id { get; set; } =  Guid.NewGuid();
    [Required]
    public Guid CustomerId { get; set; }
    [Required]
    public Guid StoreId { get; set; }
    [Required]
    [Range(1, double.MaxValue)]
    [Column(TypeName = "decimal(18,0)")]
    public decimal TotalPrice { get; set; }
    public DateTime OrderDate { get; set; } = DateTime.UtcNow;
    public OrderStatus OrderStatus { get; set; } = OrderStatus.Pending;
    [Required]
    public required string CustomerName { get; set; }
    [Required]
    [DataType(DataType.PhoneNumber)]
    public required string PhoneNumber { get; set; }
    [Required]
    public required string Address { get; set; }
    public ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();
}
