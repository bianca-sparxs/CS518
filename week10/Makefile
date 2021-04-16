help:
	@echo See README.make

prob1:
	bin/prover9 -f AK_group_axioms.in > AK_group_axioms.prover9.out
	@echo ""
	@echo "**** If you see a proof, prover9 is probably okay. ****"
	@echo ""

prob2:
	bin/mace4 -c -f AK_group_abelian.in > AK_group_abelian.mace4.out
	@echo ""
	@echo "**** If you see a proof, mace4 is probably okay. ****"
	@echo ""

prob3:
	bin/prover9 -f AK_group_identity.in > AK_group_identity.prover9.out

prob4:
	bin/mace4 -c -f AK_group_distributive.in > AK_group_distributive.mace4.out


clean:	
	cd ladr             && $(MAKE) realclean
	cd apps.src         && $(MAKE) realclean
	cd mace4.src        && $(MAKE) realclean
	cd provers.src      && $(MAKE) realclean

realclean:
	$(MAKE) clean
	/bin/rm -f bin/*


# The following cleans up, then makes a .tar.gz file of the current
# directory, leaving it in the parent directory.  (Gnu make only.)

DIR = $(shell basename $(PWD))

dist:
	$(MAKE) realclean
	cd .. && tar cvf $(DIR).tar $(DIR)
	gzip -f ../$(DIR).tar
	ls -l ../$(DIR).tar.gz
