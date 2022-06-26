import { makeExecutableSchema } from '@graphql-tools/schema'
import { GraphQLContext } from './context'
import { TimestampResolver, TimestampTypeDefinition } from 'graphql-scalars'

const typeDefinitions = [
  TimestampTypeDefinition,
 `
  type Query {
    experiences: [Experience]
  }

  type Experience {
    id: ID!
    companyName: String!
    position: String!
    startDate: Timestamp!
    endDate: Timestamp
    duties: [Duty]
  }

  type Duty {
    id: ID!
    description: String
    technologies: [Technology]
    tags: [Tag]
    experiences: Experience!
  }

  type Tag {
    id: ID!
    name: String!
    duties: [Duty]
  }
  
  type Technology {
    id: ID!
    name: String!
    duties: [Duty]
  }

`]

const resolvers = {
  Timestamp: TimestampResolver,
  Query: {
    experiences: async (parent: unknown, args: {}, context: GraphQLContext) => {
      return context.prisma.experience.findMany()
    },
  },
  //   Duty: {

  //   }
}

export const schema = makeExecutableSchema({
  resolvers: [resolvers],
  typeDefs: [typeDefinitions],
})