from abc import abstractmethod

# Version 1 - longer


class AbstractProductA:
    @abstractmethod
    def method_a(self) -> str:
        raise NotImplemented


class AbstractProductB:
    @abstractmethod
    def method_b(self) -> int:
        raise NotImplemented


class AbstractFactory:
    @abstractmethod
    def create_product_a(self) -> AbstractProductA:
        raise NotImplemented

    @abstractmethod
    def create_product_b(self) -> AbstractProductB:
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


class ConcreteFactory1(AbstractFactory):
    def create_product_a(self) -> AbstractProductA:
        return ConcreteProductA1()

    def create_product_b(self) -> AbstractProductB:
        return ConcreteProductB1()


class ConcreteFactory2(AbstractFactory):
    def create_product_a(self) -> AbstractProductA:
        return ConcreteProductA2()

    def create_product_b(self) -> AbstractProductB:
        return ConcreteProductB2()


def create_products(factory: AbstractFactory):
    a = factory.create_product_a()
    b = factory.create_product_b()
    print(a.method_a())
    print(b.method_b())


create_products(ConcreteFactory1())
create_products(ConcreteFactory2())


