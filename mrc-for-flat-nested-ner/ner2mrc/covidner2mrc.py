# encoding: utf-8


import os
import sys
sys.path.insert(0, os.getcwd())
from utils.bmes_decode import bmes_decode
import json

def convert_file(input_file, output_file, tag2query_file):
    """
    Convert GENIA(xiaoya) data to MRC format
    """
    f = open(input_file)
    # all_data = json.load(open(input_file))
    tag2query = json.load(open(tag2query_file))
    output = []
    origin_count = 0
    new_count = 0
    d = dict()
    for line in f.readlines():
        # print(line)
        data = json.loads(line)
        print(data)
        # print(line
    # for data in all_data:
        origin_count += 1
        context = data[0]
        labels = data[1]["entities"]
        # print(labels)
        label2positions = dict()
        for label in labels: 
            if label[-1] in label2positions.keys():
                label2positions[label[-1]].append([label[0],label[1]])
            else:
                label2positions[label[-1]] = [[label[0],label[1]]]

        # label2positions = labels
        for tag_idx, (tag, query) in enumerate(tag2query.items()):
            positions = label2positions.get(tag, [])
            # print(positions)
            # mrc_sample = {
            #     "context": context,
            #     "query": query,
            #     "start_position": [int(x.split(";")[0]) for x in positions],
            #     "end_position": [int(x.split(";")[1]) for x in positions],
            #     "qas_id": f"{origin_count}.{tag_idx}"
            # }
            mrc_sample = {
                "context": context,
                "query": query,
                "entity_label": tag,
                "start_position": [x[0] for x in positions],
                "end_position": [x[1] for x in positions],
                "qas_id": f"{origin_count}.{tag_idx}"
            }
            # print(mrc_sample)
            output.append(mrc_sample)
            new_count += 1
        print(new_count)
    json.dump(output, open(output_file, "w"), ensure_ascii=False, indent=2)
    print(f"Convert {origin_count} samples to {new_count} samples and save to {output_file}")


def main():
    genia_raw_dir = "./datasets/covidner_nonoverlapping_spacy"
    genia_mrc_dir = "./datasets/covidner_nonoverlapping_mrc"
    tag2query_file = "./datasets/covidner_nonoverlapping_spacy/covid.json"
    os.makedirs(genia_mrc_dir, exist_ok=True)
    for phase in ["train", "dev", "test"]:
        old_file = os.path.join(genia_raw_dir, f"{phase}.json")
        new_file = os.path.join(genia_mrc_dir, f"mrc-ner.{phase}")
        convert_file(old_file, new_file, tag2query_file)


if __name__ == '__main__':
    main()
