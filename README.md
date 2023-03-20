

## About

This project transfrom UVR 5.4[1] from windows to linux ubuntu1604 platform, maybe reimplement it in C/C++ in future. 

## Installation & Run

These instructions are for those installing UVR 5.4, maybe UVR 5.x also work, require python 3.8/3.9.

sudo apt-get install sox
sudo apt-get install ffmpeg

1. clone the Source code.

   pip install --no-cache-dir -r requirements.txt
   pip install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

2. Download the models via the "Settings" menu within the application
   or download from original project[1]. 
   
3. run python3.9 UVR.py, main interface show as below

![image](https://github.com/NanKeRen2020/UVR5_Linux/blob/main/main.png)

You can get more detail and update from the original project[1].


## References

[1] https://github.com/Anjok07/ultimatevocalremovergui.

[2] Takahashi et al., "Multi-scale Multi-band DenseNets for Audio Source Separation", https://arxiv.org/pdf/1706.09588.pdf.
