from keras.models import Model, load_model
from keras.utils.np_utils import to_categorical
import os
from PIL import Image
import numpy as np
from tqdm import tqdm
import cv2
from sklearn.metrics import confusion_matrix
# eng.Yasmin

def Dataset_loader(DIR, RESIZE):
    IMG = []
    read = lambda imname: np.asarray(Image.open(imname).convert("RGB"))
    for IMAGE_NAME in tqdm(os.listdir(DIR)):
        PATH = os.path.join(DIR, IMAGE_NAME)
        _, ftype = os.path.splitext(PATH)
        if ftype == ".jpg" or ftype == ".jpeg":
            img = read(PATH)

            img = cv2.resize(img, (RESIZE, RESIZE))

            IMG.append(np.array(img))
    return IMG

SIZE = 300
normal_test = np.array(Dataset_loader('forest_test/normal', SIZE))
fire_test = np.array(Dataset_loader('forest_test/fire', SIZE))

normal_test_label = np.zeros(len(normal_test))
fire_test_label = np.ones(len(fire_test))

X_test = np.concatenate((normal_test, fire_test), axis=0)
y_test = np.concatenate((normal_test_label,fire_test_label), axis=0)
y_test = to_categorical(y_test, num_classes= 2)
# Predict on test
model = load_model('model/weights.best.hdf5')
y_pred = model.predict_classes(X_test, verbose=1)
cm = confusion_matrix(np.argmax(y_test, axis=1), y_pred)
print(cm)


