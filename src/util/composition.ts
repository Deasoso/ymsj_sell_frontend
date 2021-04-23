import { SetupContext } from '@vue/composition-api'
import { store } from '@/store'

export const useStore = (self: SetupContext) => self.root.$store as typeof store

export const useRouter = (self: SetupContext) => ({
  route: self.root.$route,
  router: self.root.$router
})
