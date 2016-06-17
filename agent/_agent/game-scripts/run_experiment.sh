suffix=".preparse"
stats=".stats"
maxstats=".maxstats"
smem=".smem"
#smemq=".smemq"
#smems=".smems"
#smemtq=".smemtq"
#smemts=".smemts"
#smemtr=".smemtr"
#smemt3=".smemt3"
topstate=".top"
dialog=".dialog"
pertaskstats=".pertaskstats"
#pertaskstats2=".pertaskstats2"

rm statsmax.txt
rm pertaskstats.txt
rm smemuse.txt
for rfile in *.preparse
do
	
	cp $rfile soar-game.script
	rfilename=${rfile%$suffix}
	
	#b="fg34z8mrjb95top"
	#if [ "$rfilename" \< "$b" ]; then
	#	echo $rfilename
	#	continue
	#fi
	#echo "oops"
	java SentencesToSoar soar-game.script
	cp soar-game.soar /home/jrkirk/rosie2/rosie-project/rosie/agent/_agent/language-comprehension/comprehension/test-sentences/
	/home/jrkirk/rosie2/rosie-project/soar/out/./cli < game-data-agent.soar
	cp stats.txt newresults2/$rfilename$stats
	cp statsm.txt newresults2/$rfilename$maxstats
	cp s1.txt newresults2/$rfilename$topstate
	cp soar-game.script newresults2/$rfilename$dialog
	
	cp pertaskstats.txt newresults2/$rfilename$pertaskstats
	cp smemuse.txt newresults2/$rfilename$smem
	
	#cp smemquery.txt newresults2/$rfilename$smemq
	#cp smemstore.txt newresults2/$rfilename$smems
	#cp smemtimestore.txt newresults2/$rfilename$smemts
	#cp smemtimequery.txt newresults2/$rfilename$smemtq
	#cp smemtimeret.txt newresults2/$rfilename$smemtr
	#cp smemtimethree.txt newresults2/$rfilename$smemt3

	#rm smemtimethree.txt
	#rm smemtimeret.txt
	#rm smemtimequery.txt
	#rm smemtimestore.txt
	#rm smemstore.txt
	#rm smemquery.txt
	
	rm statsm.txt
	rm pertaskstats.txt
	rm smemuse.txt
		
done
