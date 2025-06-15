import os
import filecmp
import shutil

def compare_and_copy(folder1, folder2, target_folder):
    # 确保目标文件夹存在（处理递归时的子文件夹）
    os.makedirs(target_folder, exist_ok=True)
    
    # 获取文件夹内容（包括隐藏文件，排除当前和父目录）
    def get_items(folder):
        return [item for item in os.listdir(folder) if item not in ['.', '..']]
    
    contents1 = set(get_items(folder1))
    contents2 = set(get_items(folder2))
    
    # ---------------------- 处理共有内容 ----------------------
    common_contents = contents1 & contents2  # 交集
    for item in common_contents:
        path1 = os.path.join(folder1, item)
        path2 = os.path.join(folder2, item)
        target_path = os.path.join(target_folder, item)
        
        try:
            is_file1 = os.path.isfile(path1)
            is_file2 = os.path.isfile(path2)
        except OSError as e:
            print(f"警告：无法获取文件类型 - {item}，错误：{e}")
            continue
        
        if is_file1 and is_file2:
            # 深度比较文件内容（对比字节数据）
            if filecmp.cmp(path1, path2, shallow=False):
                print(f"文件内容相同：{item}")
            else:
                print(f"文件内容不同：{item}")
                shutil.copy2(path2, target_path)  # 复制folder2的文件到目标
                print(f"已复制到：{target_path}")
        elif os.path.isdir(path1) and os.path.isdir(path2):
            # 递归处理子文件夹
            compare_and_copy(path1, path2, target_path)
        else:
            print(f"类型冲突：{item}（一个是文件，一个是文件夹）")
            # 尝试复制（以folder2为准）
            if os.path.isfile(path2):
                shutil.copy2(path2, target_path)
            else:
                shutil.copytree(path2, target_path, dirs_exist_ok=True)
    
    # ---------------------- 处理folder2独有的内容 ----------------------
    for item in contents2 - contents1:
        source_path = os.path.join(folder2, item)
        target_path = os.path.join(target_folder, item)
        try:
            if os.path.isfile(source_path):
                print(f"独有文件（folder2）：{item}")
                shutil.copy2(source_path, target_path)
            elif os.path.isdir(source_path):
                print(f"独有文件夹（folder2）：{item}")
                shutil.copytree(source_path, target_path, dirs_exist_ok=True, ignore=shutil.ignore_patterns('.DS_Store', '__MACOSX'))
            else:
                print(f"跳过非文件/文件夹项：{item}")
        except Exception as e:
            print(f"复制失败：{item}，错误：{e}")
    
    # ---------------------- 处理folder1独有的内容（可选）----------------------
    for item in contents1 - contents2:
        print(f"独有内容（folder1，未复制）：{item}")

# 主逻辑
if __name__ == "__main__":
    folder1_path = input("请输入第一个文件夹路径：").strip()
    folder2_path = input("请输入第二个文件夹路径：").strip()
    target_folder_path = input("请输入目标文件夹路径：").strip()
    
    # 检查源文件夹是否存在
    for path in [folder1_path, folder2_path]:
        if not os.path.exists(path):
            print(f"错误：文件夹不存在 - {path}")
            exit(1)
    
    compare_and_copy(folder1_path, folder2_path, target_folder_path)
    print("操作完成！差异内容已复制到目标文件夹。")