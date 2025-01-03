﻿using Microsoft.EntityFrameworkCore;
using Quizpractice.Models;
using Quizpractice.Services.IRepository;

namespace Quizpractice.Services.Repository
{
    public class SubjectRepository : ISubjectRepository
    {
        private readonly SWP391_DBContext _dbContext;
        public SubjectRepository(SWP391_DBContext dbContext)
        {
            _dbContext = dbContext;
        }

        public bool CreateSubject(Subject subject)
        {
            try
            {
                _dbContext.Subjects.Add(subject);
                _dbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        public async Task<List<Subject>> GetAllSubjects()
        {
            return await _dbContext.Subjects.ToListAsync();
        }
        public async Task<Subject> GetById(int id)
        {
            return await _dbContext.Subjects.FirstAsync(s => s.SubjectId == id);
        }

        public bool Update(Subject subject)
        {
            try
            {
                if (subject == null)
                {
                    throw new Exception();
                }
                _dbContext.Subjects.Update(subject);
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
