declare interface Category {
  id: number;
  name: string;
}

declare interface Tag {
  id: number;
  name: string;
}

declare interface Post {
  id: number;
  title: string;
  content: string;
  category: Category;
  tags: Tag[];
  createdTime: string;
}