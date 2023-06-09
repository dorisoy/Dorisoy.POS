﻿using DCMS.SE.Data.ViewModel;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DCMS.SE.Data.Setting
{
    public class Product
    {
        [Key]
        public int ProductId { get; set; }
        public string ProductCode { get; set; }
        [Display(Name = "Product Name")]
        [Required]
        public string ProductName { get; set; }
        [Required]
        public int CatagoryId { get; set; }
        public int BrandId { get; set; }
        [Required]
        public int UnitId { get; set; }
        [Required]
        public int TaxId { get; set; }
        [Required]
        public Decimal PurchaseRate { get; set; }
        [Required]
        public Decimal SalesRate { get; set; }
        [Required]
        public Decimal Mrp { get; set; }
        [Required]
        public Decimal MinimumStock { get; set; }
        [Required]
        public Decimal MaximumStock { get; set; }
        public string Narration { get; set; }
        public bool IsActive { get; set; }
        public string Barcode { get; set; }
        public string Image { get; set; }
        public int StoreId { get; set; }
        public DateTime? AddedDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        [NotMapped]
        public List<ProductView> Variants { get; set; } = new List<ProductView>();
    }
}
