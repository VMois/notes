from abc import abstractmethod

# Version 2 - a little shorter version where
# AbstractFactory and ConcreteFactory are one thing


class AbstractProductA:
    @abstractmethod
    def method_a(self) -> str:
        raise NotImplemented


class AbstractProductB:
    @abstractmethod
    def method_b(self) -> int:
        raise NotImplemented


class ConcreteProductA1(AbstractProductA):
    def method_a(self) -> str:
        return 'Product A1'


class ConcreteProductA2(AbstractProductA):
    def method_a(self) -> str:
        return 'Product A2'


class ConcreteProductB1(AbstractProductB):
    def method_b(self) -> str:
        return 'Product B1'


class ConcreteProductB2(AbstractProductB):
    def method_b(self) -> str:
        return 'Product B2'


class BaseConcreteFactory:
    def create_product_a(self) -> AbstractProductA:
        return ConcreteProductA1()

    def create_product_b(self) -> AbstractProductB:
        return ConcreteProductB1()


class SubclassConcreteFactory(BaseConcreteFactory):
    def create_product_a(self) -> AbstractProductA:
        return ConcreteProductA2()

    def create_product_b(self) -> AbstractProductB:
        return ConcreteProductB2()


def create_products(factory: BaseConcreteFactory):
    a = factory.create_product_a()
    b = factory.create_product_b()
    print(a.method_a())
    print(b.method_b())


create_products(BaseConcreteFactory())
create_products(SubclassConcreteFactory())


