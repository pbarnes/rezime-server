// 1
import { PrismaClient } from '@prisma/client'

// 2
const prisma = new PrismaClient()

// 3
async function main() {
  const newExperience = await prisma.experience.create({
    data: {
      companyName: 'test',
      endDate: null,
      position: 'tester',
      startDate: Date.now(),
    }
  })

  const allLinks = await prisma.experience.findMany()
  console.log(allLinks)
}

// 4
main()
  // 5
  .finally(async () => {
    await prisma.$disconnect()
  })