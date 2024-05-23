// import { Table, Column, Model, ForeignKey, BelongsTo, DataType } from 'sequelize-typescript';
// import { Category } from './Category';
// import { User } from './User';

// @Table
// export class Product extends Model<Product> {
//   @Column({ 
//     type: DataType.STRING,
//     allowNull: false
//   })
//   name!: string;

//   @Column({ 
//     type: DataType.STRING,
//     allowNull: false
//   })
//   description!: string;
    
//   @Column({ 
//     type: DataType.FLOAT, // Usamos FLOAT para representar precios
//     allowNull: false
//   })
//   price!: number;
    
//   @Column({ 
//     type: DataType.INTEGER, // Usamos INTEGER para representar cantidades de stock
//     allowNull: false
//   })
//   stock!: number;

//   @Column({         
//     type: DataType.STRING,
//     allowNull: false
//   })
//   condition!: string;  

//   @Column({         
//     type: DataType.STRING,
//     allowNull: false
//   })
//   image!: string; 

//   @ForeignKey(() => User)
//   @Column
//   userId!: number;

//   @BelongsTo(() => User)
//   user!: User;
    
//   @ForeignKey(() => Category)
//   @Column
//   categoryId!: number;

//   @BelongsTo(() => Category)
//   category!: Category;
// }
///////////////////////////////////////

import { Table, Column, Model, ForeignKey, BelongsTo, DataType, DefaultScope } from 'sequelize-typescript';
import { Category } from './Category';
import { User } from './User';

@DefaultScope(() => ({
  where: { deletedAt: null },
}))
@Table({
  paranoid: true, // Habilita el borrado lógico
  timestamps: true, // Habilita createdAt y updatedAt
})
export class Product extends Model<Product> {
  @Column({ 
    type: DataType.STRING,
    allowNull: false
  })
  name!: string;

  @Column({ 
    type: DataType.STRING,
    allowNull: false
  })
  description!: string;
    
  @Column({ 
    type: DataType.FLOAT, // Usamos FLOAT para representar precios
    allowNull: false
  })
  price!: number;
    
  @Column({ 
    type: DataType.INTEGER, // Usamos INTEGER para representar cantidades de stock
    allowNull: false
  })
  stock!: number;

  @Column({         
    type: DataType.STRING,
    allowNull: false
  })
  condition!: string;  

  @Column({         
    type: DataType.STRING,
    allowNull: false
  })
  image!: string; 

  @ForeignKey(() => User)
  @Column
  userId!: number;

  @BelongsTo(() => User)
  user!: User;
    
  @ForeignKey(() => Category)
  @Column
  categoryId!: number;

  @BelongsTo(() => Category)
  category!: Category;

  @Column({ type: DataType.DATE })
  deletedAt!: Date | null; // Añade la columna deletedAt para el borrado lógico
}