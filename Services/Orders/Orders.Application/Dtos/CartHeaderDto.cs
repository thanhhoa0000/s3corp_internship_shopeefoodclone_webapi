﻿namespace ShopeeFoodClone.WebApi.Orders.Application.Dtos;

public class CartHeaderDto
{
    public Guid Id { get; set; }
    public Guid CustomerId { get; set; }
    [Required]
    [Range(1, double.MaxValue)]
    public decimal TotalPrice { get; set; }
}
