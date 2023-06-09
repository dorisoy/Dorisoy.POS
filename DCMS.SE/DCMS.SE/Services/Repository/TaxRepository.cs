﻿using DCMS.SE.Data;
using DCMS.SE.Data.Connection;
using DCMS.SE.Data.Setting;
using DCMS.SE.Services.Interface;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace DCMS.SE.Services.Repository
{
    public class TaxRepository : ITax
    {
        private readonly ApplicationDbContext _context;
        private readonly DatabaseConnection _conn;
        public TaxRepository(ApplicationDbContext context, DatabaseConnection conn)
        {
            _context = context;
            _conn = conn;
        }
        public bool CheckName(string name)
        {
            var checkResult = (from progm in _context.Tax
                                     where progm.TaxName == name
                               select progm.TaxId).Count();
            if (checkResult > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int CheckNameId(string name)
        {
            var checkResult = (from progm in _context.Tax
                               where progm.TaxName == name
                               select progm.TaxId).Count();
            if (checkResult > 0)
            {

                var checkAccount = (from progm in _context.Tax
                                    where progm.TaxName == name
                                    select progm.TaxId).FirstOrDefault();
                return checkAccount;
            }
            else
            {
                return 0;
            }
        }

        public bool Delete(int TaxId)
        {
            SqlConnection sqlcon = new (_conn.DbConn);
            try
            {
                if (sqlcon.State == ConnectionState.Closed)
                {
                    sqlcon.Open();
                }
                SqlCommand cmd = new("IF NOT EXISTS (SELECT TaxId from Product where TaxId=@TaxId) DELETE FROM Tax where TaxId=@TaxId", sqlcon)
                {
                    CommandType = CommandType.Text
                };
                SqlParameter para = new ();
                para = cmd.Parameters.Add("@TaxId", SqlDbType.Int);
                para.Value = TaxId;
                long rowAffacted = cmd.ExecuteNonQuery();
                if (rowAffacted > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                sqlcon.Close();
            }
        }

        public Tax Edit(int id)
        {
            Tax returnView = _context.Tax.Find(id);
            return returnView;
        }

        public List<Tax> GetAll()
        {
            var view = _context.Tax.ToList();
            return view;
        }

        public int Save(Tax model)
        {
            _context.Tax.Add(model);
            _context.SaveChanges();
            int id = model.TaxId;
            return id;
        }

        public void Update(Tax model)
        {
            _context.Tax.Update(model);
            _context.SaveChanges();
        }
    }
}
