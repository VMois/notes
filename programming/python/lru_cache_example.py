from functools import lru_cache, wraps
from datetime import datetime, timedelta

def timed_lru_cache(seconds: int, maxsize: int = 128):
    def wrapper_cache(func):
        func = lru_cache(maxsize=maxsize)(func)
        func.lifetime = timedelta(seconds=seconds)
        func.expiration = datetime.utcnow() + func.lifetime

        @wraps(func)
        def wrapped_func(*args, **kwargs):
            if datetime.utcnow() >= func.expiration:
                func.cache_clear()
                func.expiration = datetime.utcnow() + func.lifetime

            return func(*args, **kwargs)
        
        # add missing methods to wrapped function
        wrapped_func.cache_clear = func.cache_clear
        wrapped_func.cache_info = func.cache_info

        return wrapped_func

    return wrapper_cache

@timed_lru_cache(10)
def test(a: int):
    return a^2 + a

test(2)
test(3)
test(2)
print(test.cache_info())
print(test.cache_clear())
print(test.cache_info())