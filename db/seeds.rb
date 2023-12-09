restrictions = [
  { name: "単勝・1点", description: "予想の表記方法は「A」", format: "A" },
  { name: "複勝・1点", description: "予想の表記方法は「A」", format: "A" },
  { name: "枠連・1点", description: "予想の表記方法は「AB」", format: "AB" },
  { name: "枠連・3点・バラ", description: "予想の表記方法は「AB-CD-EF」", format: "AB-CD-EF" },
  { name: "枠連・3点・BOX", description: "予想の表記方法は「ABC」", format: "ABC" },
  { name: "枠連・3点・流し", description: "予想の表記方法は「A-BCD」", format: "A-BCD" },
  { name: "枠連・5点・流し", description: "予想の表記方法は「A-BCDEF」", format: "A-BCDEF" },
  { name: "馬連・1点", description: "予想の表記方法は「AB」", format: "AB" },
  { name: "馬連・3点・バラ", description: "予想の表記方法は「AB-CD-EF」", format: "AB-CD-EF" },
  { name: "馬連・3点・BOX", description: "予想の表記方法は「ABC」", format: "ABC" },
  { name: "馬連・3点・流し", description: "予想の表記方法は「A-BCD」", format: "A-BCD" },
  { name: "馬連・10点・5頭BOX", description: "予想の表記方法は「ABCDE」", format: "ABCDE" },
  { name: "馬単・1点", description: "予想の表記方法は「A-B」", format: "A-B" },
  { name: "馬単・5点・流し", description: "予想の表記方法は「A-BCDEF」", format: "A-BCDEF" },
  { name: "馬単・10点・軸1頭マルチ", description: "予想の表記方法は「A-BCDEF」", format: "A-BCDEF" },
  { name: "ワイド・1点", description: "予想の表記方法は「AB」", format: "AB" },
  { name: "3連複・1点", description: "予想の表記方法は「ABC」", format: "ABC" },
  { name: "3連複・5点・軸2頭流し", description: "予想の表記方法は「AB-CDEFG」", format: "AB-CDEFG" },
  { name: "3連複・5点・フォーメーション(A-BC-BCDE)", description: "予想の表記方法は「A-BC-BCDE」", format: "A-BC-BCDE" },
  { name: "3連複・10点・5頭BOX", description: "予想の表記方法は「ABCDE」", format: "ABCDE" },
  { name: "3連複・10点・軸1頭流し相手5頭", description: "予想の表記方法は「A-BCDEF」", format: "A-BCDEF" },
  { name: "3連単・1点", description: "予想の表記方法は「A-B-C」", format: "A-B-C" },
  { name: "3連単・6点・フォーメーション(A-BCD-BCD)", description: "予想の表記方法は「A-BCD-BCD」", format: "A-BCD-BCD" },
  { name: "3連単・6点・3頭BOX", description: "予想の表記方法は「ABC」", format: "ABC" },
  { name: "3連単・10点・フォーメーション(A-BC-BCDEFG)", description: "予想の表記方法は「A-BC-BCDEFG」", format: "A-BC-BCDEFG" },
  { name: "3連単・10点・フォーメーション(AB-AB-CDEFG)", description: "予想の表記方法は「AB-AB-CDEFG」", format: "AB-AB-CDEFG" }
]

restrictions.each do |restriction|
  Restriction.find_or_create_by!(name: restriction[:name]) do |r|
    r.description = restriction[:description]
    r.format = restriction[:format]
  end
end

puts "Restrictions seeded successfully."
