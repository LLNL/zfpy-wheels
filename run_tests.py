import zfpy
import numpy as np

orig_array = np.random.rand(10,10)

compressed_array = zfpy.compress_numpy(orig_array, write_header=True)
decompressed_array = zfpy.decompress_numpy(compressed_array)
ret = np.allclose(decompressed_array, orig_array)
if ret:
    print('Test passed') 

