import { TabBarItem } from './TabBar';
const tabBarList: TabBarItem[] = [
  {
    title: '书架',
    url: 'pages/bookshelf/BookShelf',
    icon: $rawfile('tabBar/bookshelf.png'),
    selectIcon: $rawfile('tabBar/bookshelf_active.png')
  },
  {
    title: '书城',
    url: 'pages/home/Home',
    icon: $rawfile('tabBar/home.png'),
    selectIcon: $rawfile('tabBar/home_active.png')
  },
  {
    title: '分类',
    url: 'pages/cart/Cart',
    icon: $rawfile('tabBar/kind.png'),
    selectIcon: $rawfile('tabBar/kind_active.png')
  },
  {
    title: '我的',
    url: 'pages/user/User',
    icon: $rawfile('tabBar/my.png'),
    selectIcon: $rawfile('tabBar/my_active.png')
  }
];

export default tabBarList;