import express from "express"
import routesProduct  from '../Product/routes/routesProduct';
import routesUser  from '../User/routes/routesUser';
import routesCategory  from '../Category/routes/routesCategory';
import routesOrder from '../Order/routes/routesOrder'
import routesProductOrder from '../Order/routes/routesProductOrder'
import routesPayment from '../Payment/routes/routesPayment'
import routesCart from '../Cart/routes/routesCart'
import routesCartProduct from '../Cart/routes/routesCartProduct'
import routesReview from '../Review/routes/routesReview'
import routesPasarela from './routesPasarela'

const router = express.Router()


router.use('/product', routesProduct)
router.use('/user', routesUser)
router.use('/category', routesCategory)
router.use('/order', routesOrder)
router.use('/productorder', routesProductOrder)
router.use('/payment', routesPayment)
router.use('/cart', routesCart)
router.use('/cartproduct', routesCartProduct)
router.use('/review', routesReview)
router.use('/payment', routesPasarela)


export default router;
