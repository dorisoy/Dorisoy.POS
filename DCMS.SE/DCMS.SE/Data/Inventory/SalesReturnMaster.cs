﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace DCMS.SE.Data.Inventory
{
    public class SalesReturnMaster
    {
        [Key]
        public int SalesReturnMasterId { get; set; }
        [Required]
        public string SerialNo { get; set; }
        [Required]
        public string VoucherNo { get; set; }
        public int WarehouseId { get; set; }
        public int VoucherTypeId { get; set; }
        public DateTime Date { get; set; }
        public int TerminalId { get; set; }
        public int SalesMasterId { get; set; }
        public string Narration { get; set; }
        public decimal TotalTax { get; set; }
        public decimal TaxRate { get; set; }

        public decimal DisPer { get; set; }
        public decimal BillDiscount { get; set; }
        public decimal ShippingAmount { get; set; }
        public decimal GrandTotal { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal NetAmounts { get; set; }
        public decimal PayAmount { get; set; }
        public decimal BalanceDue { get; set; }
        public string Status { get; set; }
        public decimal PreviousDue { get; set; }
        public int PaymentId { get; set; }
        public string UserId { get; set; }
        public bool POS { get; set; }
        public int FinancialYearId { get; set; }
        public int StoreId { get; set; }
        public DateTime? AddedDate { get; set; }
        public DateTime? ModifyDate { get; set; }
        [NotMapped]
        public List<SalesReturnDetails> listOrder { get; set; } = new List<SalesReturnDetails>();
        public List<DeleteItem> listDelete { get; set; } = new List<DeleteItem>();

    }
}
