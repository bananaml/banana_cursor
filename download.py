from transformers import pipeline

def download_model():
    pipeline('fill-mask', model='bert-base-uncased')

if __name__ == "__main__":
    download_model()