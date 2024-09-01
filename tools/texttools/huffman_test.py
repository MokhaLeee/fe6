#!/bin/python3

import sys, os
from graphviz import Digraph

import huffman, textdecoder

def test_huff_gen():
    all_data = textdecoder.decode_all_data()
    freq_table = GenerateFreqTable(all_data)
    huff_tree = huffman.BuildHuffmanTree(freq_table)

    huffman_table = huffman.BuildHuffmanTable()
    print("const unsigned int huffman_tree[] = {")
    for branch in huffman_table:
        print(f"    0x{branch:08X},")
    print("};")

def test_compress_value():
    # build huffman
    all_data = textdecoder.decode_all_data()
    freq_table = huffman.GenerateFreqTable(all_data)
    huff_tree = huffman.BuildHuffmanTree(freq_table)

    # compress
    code_table = huffman.build_code_table(huff_tree)

    data = [0xA882, 0xC782, 0xE982, 0x6A81, 0x0000, 0x4983]

    print(huffman.CompressData(data, code_table))

def test_vanilla_huffmantree():
    huffman_table = textdecoder.build_huffman_table()
    huff_tree = textdecoder.rebuild_huffman_tree(huffman_table)
    code_table = huffman.build_code_table(huff_tree)
    huffman.dump_code_table(code_table)

def test_visualize_huffman_tree():

    def _visualize_huffman_tree(node, graph=None, node_id=0):
        if graph is None:
            graph = Digraph(format='png')
            graph.attr('node', shape='circle')

        current_id = str(node_id)

        if node.left is not None:
            left_id = str(node_id * 2 + 1)
            graph.edge(current_id, left_id, label="0")
            _visualize_huffman_tree(node.left, graph, node_id * 2 + 1)

        if node.right is not None:
            right_id = str(node_id * 2 + 2)
            graph.edge(current_id, right_id, label="1")
            _visualize_huffman_tree(node.right, graph, node_id * 2 + 2)

        if node.left is None and node.right is None:
            graph.node(current_id, label=f"0x{node.data:04X}", shape='box')

        return graph

    # build huffman
    all_data = textdecoder.decode_all_data()
    freq_table = huffman.GenerateFreqTable(all_data)
    huff_tree = huffman.BuildHuffmanTree(freq_table)

    # generate graph
    graph = _visualize_huffman_tree(huff_tree)
    graph.render('huffman_tree')

def dump_all_data():
    all_data = textdecoder.decode_all_data()
    print(all_data)

dump_all_data()
