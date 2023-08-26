import joblib


def pred(val: [[]]) -> int:
    model = joblib.load("H:/flutter_projects/API_neuro_stem/stress_detector_v17.joblib")
    print(model)
    print(model.predict(val)[0])
    res = model.predict(val)[0]
    return res
