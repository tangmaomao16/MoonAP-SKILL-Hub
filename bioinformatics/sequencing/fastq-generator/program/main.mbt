fn next_seed(seed : Int) -> Int {
  (seed * 1664525 + 1013904223) % 2147483647
}

fn pick_base(seed : Int) -> String {
  let value = seed % 5
  if value == 0 {
    "A"
  } else if value == 1 {
    "C"
  } else if value == 2 {
    "G"
  } else if value == 3 {
    "T"
  } else {
    "N"
  }
}

fn build_sequence(seed : Int, length : Int, acc : String) -> (String, Int) {
  if length == 0 {
    (acc, seed)
  } else {
    let next = next_seed(seed)
    build_sequence(next, length - 1, acc + pick_base(next))
  }
}

fn build_quality(length : Int, acc : String) -> String {
  if length == 0 {
    acc
  } else {
    build_quality(length - 1, acc + "I")
  }
}

fn build_record(seed : Int, index : Int, read_length : Int) -> (String, Int) {
  let (sequence, next) = build_sequence(seed, read_length, "")
  let quality = build_quality(read_length, "")
  let header = "@moonap_read_" + index.to_string()
  let record = header + "\n" + sequence + "\n+\n" + quality + "\n"
  (record, next)
}

fn build_fastq(seed : Int, count : Int, read_length : Int, index : Int, acc : String) -> String {
  if count == 0 {
    acc
  } else {
    let (record, next) = build_record(seed, index, read_length)
    build_fastq(next, count - 1, read_length, index + 1, acc + record)
  }
}

fn main {
  ignore(build_fastq(42, 4, 24, 1, ""))
}