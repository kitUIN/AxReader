import TabBar from '../../components/TabBar'
@Entry
@Component
struct Home {
  build() {
    Column() {


      TabBar({ tabBarIndex: 1 })
    }
  }
}