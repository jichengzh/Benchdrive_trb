import xml.etree.ElementTree as ET


def split_list_into_n_parts(lst, n):
    k, m = divmod(len(lst), n)
    return (lst[i * k + min(i, m):(i + 1) * k + min(i + 1, m)] for i in range(n))
# def split_list_into_n_parts(lst, n):
#     # 确保总数足够分配
#     assert len(lst) >= 6 + n - 1, "总数不足以满足自定义分配需求"

#     # 初始化分配
#     k, m = divmod(len(lst), n)
#     parts = [k + (1 if i < m else 0) for i in range(n)]

#     # 自定义调整：第一个少分 6 条，第三个多分 6 条
#     parts[0] -= 3
#     parts[1] += 6
#     parts[2] -= 3

#     # 检查调整后的分配是否合理
#     assert all(p >= 0 for p in parts), "分配结果中存在负数，检查自定义逻辑"
#     assert sum(parts) == len(lst), "分配总数不等于原列表长度"

#     # 根据分配结果切分列表
#     result = []
#     start = 0
#     for p in parts:
#         result.append(lst[start:start + p])
#         start += p
#     return result


def main(base_route, task_num, algo, planner_type):
    tree = ET.parse(f'{base_route}.xml')
    root = tree.getroot()
    case = root.findall('route')
    results = split_list_into_n_parts(case, task_num)
    for index, re in enumerate(results):
        new_root = ET.Element("routes")
        for x in re:
            new_root.append(x)
        new_tree = ET.ElementTree(new_root)
        new_tree.write(f'{base_route}_{index}_{algo}_{planner_type}.xml', encoding='utf-8', xml_declaration=True)

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("base_route", type=str)
    parser.add_argument("task_num", type=int)
    parser.add_argument("algo", type=str)
    parser.add_argument("planner_type", type=str)
    args = parser.parse_args()
    main(args.base_route, args.task_num, args.algo, args.planner_type)