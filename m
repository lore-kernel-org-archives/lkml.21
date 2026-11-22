Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373115;
	b=em61R4gMoNhrYr8f+zSMhcPqnyIUDGv/PQybASK1Ly+MYF6wznjeq3e64k4soVvcsBla
	 OeUMHWooJEn44icVAkUdrg1WHqrnBZQ/013orMRbvHqQmFVjAM/FQdT8Wvr5Tdh1Z+7mu
	 ltEiid8ABne/5DAjkRKPjaZhEslZmbYy4snqqeIxjJtWC7B6uhkR/cZvTduAf+7CNawbo
	 JdJ8hCCmnxJP1j+lbD+PGnGRRn7UocgHVWh2/Io669Gj3YdrScDeYEkk//cbhpwbYDhjf
	 Rv8MIcQ+d149aK4OlDwNg5fGJ11SKolOoXAJ+hxVz87Jv9k4oTviM+klyozcdKSi3Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=;
	b=CB0R43QPUdCQuiqUeEtGi1IGhX1HxDfN7TRzFN8f7WHmYGlseMAeFFXpKG7fVRn6bPC1
	 XSXkuX9XXNFyScSE2bYVHniDbQBS84mNqdilNwyONM8RM1blxvrMrOKXT/lQpCRVQJNak
	 T1nv+apgD+O1igkKEQ4q1RxAnNEk5m6CB8rqXOkLRqAY5/ZIv1maBfJKOhnvkNW1qIDx9
	 Tt3tiUZ4rPFSZvohtgec25JIEYKJAy9bOt4Cld9UVjPggpO4VYLj3I+boQhOUOeoAHELb
	 Njyr/1rQA7aVmoe4jxsCA45Pu34LsMtoXhwAdjwrdMucWoWdXr62UQLQtRo5nkh9x9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2VqsnMS;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FBA606A6AB
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FBA606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J2VqsnMS
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1952026a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373114; x=1795977914; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=;
        b=J2VqsnMSetudlbg3X28ZGahTVDU0VplYxwgPTfZafIWUYdOnrucEA1S+QG/s3hR5Q+
         Lx2bf2fkT5PF+/d5sssl7fZq/7LrVe0pOuZbINJTC+kaglIyFqPcxEc/SU0KLFOowSEe
         U8yzpPM0UASUjtPVefbF3rMY5KBm7hae7NTrRTypCh5H460ZbjfiGXl1hAA5t5KJ3bX2
         iWzyBfVABjOl0Uru1YgLyRM1TPZPkET9ImkA1gbXKijqrx6rgCeulhp/+8XIPYtOvjZw
         GjQQ94Je/xIWaL8oEmzZEb0dIN9KsmOEXTSjCvZBCYYbKvfg6K7Ppl/c0Nzl3DGxzzcS
         t1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373114; x=1795977914;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFh8YMfOZzm6SgOifm9PkexVzUla952anT96VdmLh+w=;
        b=CHmuOZVzH63mt44j09Dnh9TMrwxDgKjHiPkQQaUMA8tlvnaCoz4F6OdXHQ6wdYRWkL
         FTeMxZ6gCzQKxk7GNfHPWt7l9u0U4m91Mxd/WQQm3UzvAO0IpJrUa5p53nr1zu6GkWh8
         zCh+R+Ok/rTcpjWUiGSbIbjYplpV3nXhAsqyQyXMpoiFLDYFmozmtFBfXzGEL1E2MyY1
         c0f/it2MxzdrXnpcrtmpsfhaSCtyzcohFQmlRFrCgJE4ZeztaYoARiEIL9P55INSrZ7p
         Fa9yBAo+aDEB+S9qB1+ehstcCxIHvVGmpln5X5foIUPtzB4D/r+OTWkodrReDo7bSGi7
         T3gw==
X-Forwarded-Encrypted: i=1; AL+hErFVRFgCV/nhe7YlaOwg0GSRUAPFvow5l3TXyr3fD3/8xHnVXec+pE9PAF6LZo+koJLp7wachYngHjyRIag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qDZVMVvT7MzJjQS3B2PRFZy1/X0LTHVfXlk00mWnMH/YM8QUD
	KQNqfvPfeEY6A6QD1VRTm+R6Dw0G3J2SDQsgarJN4B2CkFpnjohPSKkSOmFB6XoD7vGRnrLbl2o
	ihmnmysMfiZAxZiRAwin36A==
X-Received: from pjbsn14.prod.google.com ([2002:a17:90b:2e8e:b0:3b0:944b:61fe])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a47:b0:3b3:fc1f:a5c4 with SMTP id 98e67ed59e1d1-3b41c8dc821mr8713904a91.20.1795373114192;
 Sun, 22 Nov 2026 10:45:14 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:48 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-15-jthoughton@google.com>
Subject: [PATCH v3 14/19] selftests/mm: Add HugeTLB vmemmap optimization
 stress test
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Add a script that stresses HugeTLB vmemmap optimization (HVO), in
particular on architectures that update the vmemmap in place while it
may be concurrently accessed:

  - Check that optimizing N folios frees exactly N * (vmemmap pages per
    folio - 1) vmemmap pages (per nr_memmap_pages and
    nr_memmap_boot_pages), and that restoring them gives them back.
  - Repeatedly optimize and restore folios by resizing the hugepage pool,
    while concurrently reading struct pages through /proc/kpageflags and
    /proc/kpagecount, compacting memory, and optionally reading
    page_owner and offlining/onlining memory blocks.
  - Do the same with fail_hugetlb_vmemmap_pte fault injection enabled,
    if available, to exercise the rollback and partially-optimized folio
    paths.

After each phase, the pool must shrink back to its original size and the
memmap accounting must return to its baseline. Finally, the kernel log
must not contain warnings or oopses.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/mm/Makefile           |   2 +
 .../selftests/mm/hugetlb_vmemmap_stress.sh    | 380 ++++++++++++++++++
 .../selftests/mm/ksft_hugetlb_vmemmap.sh      |   4 +
 tools/testing/selftests/mm/run_vmtests.sh     |   4 +
 4 files changed, 390 insertions(+)
 create mode 100755 tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
 create mode 100755 tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 675ec57d47de..9ec348902743 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -150,6 +150,7 @@ TEST_PROGS += ksft_cow.sh
 TEST_PROGS += ksft_gup_test.sh
 TEST_PROGS += ksft_hmm.sh
 TEST_PROGS += ksft_hugetlb.sh
+TEST_PROGS += ksft_hugetlb_vmemmap.sh
 TEST_PROGS += ksft_hugevm.sh
 TEST_PROGS += ksft_kmemleak_confirm.sh
 TEST_PROGS += ksft_kmemleak_dedup.sh
@@ -182,6 +183,7 @@ TEST_FILES += test_hmm.sh
 TEST_FILES += va_high_addr_switch.sh
 TEST_FILES += charge_reserved_hugetlb.sh
 TEST_FILES += hugetlb_reparenting_test.sh
+TEST_FILES += hugetlb_vmemmap_stress.sh
 TEST_FILES += test_page_frag.sh
 TEST_FILES += run_vmtests.sh
 
diff --git a/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
new file mode 100755
index 000000000000..b64fdb3ed761
--- /dev/null
+++ b/tools/testing/selftests/mm/hugetlb_vmemmap_stress.sh
@@ -0,0 +1,380 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Stress test for HugeTLB vmemmap optimization (HVO).
+#
+# Phases:
+#   1. accounting: allocate N hugepages, check that nr_memmap_pages +
+#      nr_memmap_boot_pages drops by exactly N * (vmemmap pages per folio - 1),
+#      then free them and check it returns to the baseline.
+#   2. stress: churn the pool (optimize/restore) while concurrently reading
+#      struct pages (/proc/kpageflags, /proc/kpagecount), compacting memory,
+#      and optionally reading page_owner and offlining/onlining memory.
+#   3. pte-inject: like 2, with fail_hugetlb_vmemmap_pte enabled; this hits
+#      both the optimize rollback and the restore (partial HVO) paths.
+#
+# After each phase the pool is drained back to its original size, memmap
+# accounting must be back at the phase's baseline, and the kernel log must
+# not contain warnings/oopses.
+#
+# The fault-injection phases require CONFIG_FAIL_HUGETLB_VMEMMAP and
+# CONFIG_FAULT_INJECTION_DEBUG_FS, and are skipped otherwise.
+
+set -u
+
+KSFT_PASS=0
+KSFT_FAIL=1
+KSFT_SKIP=4
+
+size_kb=
+nr=16
+duration=60
+prob=20
+readers=4
+struct_page_size=64
+do_page_owner=0
+do_hotplug=0
+
+usage() {
+	cat <<EOF
+Usage: $0 [options]
+  -s KB     hugepage size in kB (default: default hugepage size)
+  -n N      number of hugepages to churn (default: $nr)
+  -t SEC    duration of each stress phase (default: $duration)
+  -p PCT    fault-injection probability in percent (default: $prob)
+  -j N      number of struct page reader processes (default: $readers)
+  -S BYTES  sizeof(struct page) (default: $struct_page_size)
+  -o        also read /sys/kernel/debug/page_owner during stress
+  -m        also offline/online memory blocks during stress (dissolves
+            free hugepages, exercising the restore path)
+
+For exact accounting checks, run on a hugepage size whose pool is
+initially empty (e.g. no boot-time reservations of that size).
+EOF
+	exit $KSFT_SKIP
+}
+
+while getopts "s:n:t:p:j:S:omh" opt; do
+	case $opt in
+	s) size_kb=$OPTARG ;;
+	n) nr=$OPTARG ;;
+	t) duration=$OPTARG ;;
+	p) prob=$OPTARG ;;
+	j) readers=$OPTARG ;;
+	S) struct_page_size=$OPTARG ;;
+	o) do_page_owner=1 ;;
+	m) do_hotplug=1 ;;
+	*) usage ;;
+	esac
+done
+
+log() { echo "# $*"; }
+skip() { echo "SKIP: $*"; exit $KSFT_SKIP; }
+
+failures=0
+fail() { echo "FAIL: $*"; failures=$((failures + 1)); }
+pass() { echo "PASS: $*"; }
+
+[ "$(id -u)" -eq 0 ] || skip "must be run as root"
+
+[ -r /proc/sys/vm/hugetlb_optimize_vmemmap ] ||
+	skip "HVO not supported (no vm.hugetlb_optimize_vmemmap)"
+[ "$(cat /proc/sys/vm/hugetlb_optimize_vmemmap)" = 1 ] ||
+	skip "HVO disabled (vm.hugetlb_optimize_vmemmap=0)"
+grep -q '^nr_memmap_pages ' /proc/vmstat ||
+	skip "no nr_memmap_pages in /proc/vmstat"
+
+[ -n "$size_kb" ] || size_kb=$(awk '/^Hugepagesize:/ {print $2}' /proc/meminfo)
+hp_dir=/sys/kernel/mm/hugepages/hugepages-${size_kb}kB
+[ -d "$hp_dir" ] || skip "no ${size_kb}kB hugepages"
+
+page_size=$(getconf PAGESIZE)
+vmemmap_pages=$(( size_kb * 1024 / page_size * struct_page_size / page_size ))
+freed_per_folio=$(( vmemmap_pages - 1 ))
+[ "$freed_per_folio" -gt 0 ] ||
+	skip "${size_kb}kB hugepages are not HVO-optimizable"
+
+dbgfs=/sys/kernel/debug
+mountpoint -q $dbgfs || mount -t debugfs none $dbgfs 2>/dev/null
+
+orig_nr=$(cat "$hp_dir/nr_hugepages")
+target_nr=$(( orig_nr + nr ))
+marker="hvo-stress-$$-$(date +%s)"
+tmpdir=$(mktemp -d)
+pids=()
+
+log "hugepage size ${size_kb}kB, page size $page_size"
+log "struct page size $struct_page_size"
+log "vmemmap pages/folio: $vmemmap_pages ($freed_per_folio freed by HVO)"
+log "pool: $orig_nr initially, churning between $orig_nr and $target_nr"
+[ "$orig_nr" -eq 0 ] ||
+	log "WARNING: pool not initially empty, accounting may be inexact"
+
+memmap_total() {
+	awk '/^nr_memmap_(boot_)?pages / {s += $2} END {print s + 0}' \
+		/proc/vmstat
+}
+
+set_nr() {
+	echo "$1" > "$hp_dir/nr_hugepages" 2>/dev/null
+	cat "$hp_dir/nr_hugepages"
+}
+
+# Shrink the pool back to orig_nr. Restore may transiently fail (e.g. with
+# fault injection active), so retry for a while.
+drain() {
+	local i cur surplus
+
+	for i in $(seq 20); do
+		# Pages whose vmemmap could not be restored are kept as free
+		# surplus pages, which shrinking nr_hugepages does not free.
+		# Writing the current size converts them back to persistent
+		# pages first.
+		set_nr "$(cat "$hp_dir/nr_hugepages")" > /dev/null
+		cur=$(set_nr "$orig_nr")
+		[ "$cur" -eq "$orig_nr" ] && return 0
+		sleep 1
+	done
+	surplus=$(cat "$hp_dir/surplus_hugepages")
+	fail "pool stuck at $cur hugepages ($surplus surplus)," \
+		"expected $orig_nr"
+	return 1
+}
+
+fa_dir() { echo "$dbgfs/$1"; }
+
+fa_enable() {
+	local d
+	d=$(fa_dir "$1")
+	echo 0 > "$d/verbose"
+	echo N > "$d/task-filter"
+	echo 1 > "$d/interval"
+	echo 1000000 > "$d/times"
+	echo "$prob" > "$d/probability"
+}
+
+# Disable and print the number of injected failures.
+fa_disable() {
+	local d left
+	d=$(fa_dir "$1")
+	echo 0 > "$d/probability"
+	left=$(cat "$d/times")
+	echo 0 > "$d/times"
+	echo $(( 1000000 - left ))
+}
+
+check_dmesg() {
+	local bad pat
+
+	pat='WARNING:|BUG[: ]|Oops|Unable to handle kernel'
+	pat+='|Internal error|KASAN:|UBSAN:'
+	pat+='|list_(add|del) corruption|page dumped because'
+	bad=$(dmesg | sed -n "/$marker/,\$p" | grep -E "$pat")
+	# Offlining a memory block that contains unmovable pages fails and
+	# dumps the offending page; that is expected with -m.
+	[ "$do_hotplug" -eq 1 ] &&
+		bad=$(echo "$bad" | grep -v 'page dumped because: unmovable page')
+	if [ -n "$bad" ]; then
+		fail "kernel log reports problems:"
+		echo "$bad" | head -20 | sed 's/^/#   /'
+	fi
+}
+
+## Workers
+
+churn() {
+	while :; do
+		set_nr "$target_nr" > /dev/null
+		set_nr "$orig_nr" > /dev/null
+	done
+}
+
+kpage_reader() {
+	while :; do
+		dd if=/proc/kpageflags of=/dev/null bs=4M status=none
+		dd if=/proc/kpagecount of=/dev/null bs=4M status=none
+	done
+}
+
+compactor() {
+	while :; do
+		echo 1 > /proc/sys/vm/compact_memory
+		sleep 1
+	done
+}
+
+page_owner_reader() {
+	while :; do
+		cat $dbgfs/page_owner > /dev/null
+	done
+}
+
+hotplugger() {
+	local blk state removable
+
+	while :; do
+		for blk in /sys/devices/system/memory/memory*; do
+			state=$(cat "$blk/state" 2>/dev/null)
+			removable=$(cat "$blk/removable" 2>/dev/null || echo 1)
+			[ "$state" = online ] || continue
+			[ "$removable" = 1 ] || continue
+			echo "$blk" >> "$tmpdir/hotplug"
+			# A signal aborts a pending offline_pages(). Use
+			# --foreground so that the writer stays in the worker's
+			# process group and is killed by stop_workers().
+			timeout --foreground 10 \
+				sh -c "echo offline > $blk/state" 2>/dev/null
+			echo online > "$blk/state" 2>/dev/null
+			sleep 1
+		done
+	done
+}
+
+start_workers() {
+	local i
+
+	# Start each worker in its own process group (job control), so that
+	# stop_workers() can kill the commands it is running as well.
+	set -m
+	churn & pids+=($!)
+	for i in $(seq "$readers"); do
+		kpage_reader & pids+=($!)
+	done
+	compactor & pids+=($!)
+	if [ "$do_page_owner" -eq 1 ]; then
+		if [ -r $dbgfs/page_owner ]; then
+			page_owner_reader & pids+=($!)
+		else
+			log "page_owner not available, not reading it"
+		fi
+	fi
+	[ "$do_hotplug" -eq 1 ] && { hotplugger & pids+=($!); }
+	set +m
+}
+
+# Stop the workers, including any command they are running (e.g. a dd of
+# /proc/kpageflags), so that nothing touches struct pages after a phase ends.
+stop_workers() {
+	local pid i alive
+
+	[ "${#pids[@]}" -gt 0 ] || return 0
+	for pid in "${pids[@]}"; do
+		kill -TERM -- "-$pid" 2>/dev/null
+	done
+	for i in $(seq 30); do
+		alive=0
+		for pid in "${pids[@]}"; do
+			kill -0 -- "-$pid" 2>/dev/null && alive=1
+		done
+		[ "$alive" -eq 0 ] && break
+		sleep 1
+	done
+	if [ "$alive" -eq 1 ]; then
+		log "WARNING: workers still running, killing them"
+		for pid in "${pids[@]}"; do
+			kill -KILL -- "-$pid" 2>/dev/null
+		done
+	fi
+	# Reap the workers only once they are gone, so that this cannot block.
+	wait "${pids[@]}" 2>/dev/null
+	pids=()
+}
+
+cleanup() {
+	local blk t
+
+	stop_workers
+	for t in fail_hugetlb_vmemmap_pte; do
+		[ -d "$(fa_dir $t)" ] && fa_disable $t > /dev/null
+	done
+	if [ -f "$tmpdir/hotplug" ]; then
+		sort -u "$tmpdir/hotplug" | while read -r blk; do
+			[ "$(cat "$blk/state")" = online ] ||
+				echo online > "$blk/state" 2>/dev/null
+		done
+	fi
+	# drain() also frees free surplus pages left by failed restores.
+	drain > /dev/null
+	rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+trap 'exit $KSFT_FAIL' INT TERM
+
+# Run a stress phase. $1: name, $2: fault attr to enable ("" for none).
+stress_phase() {
+	local name=$1 fa=$2 base after injected
+
+	if [ -n "$fa" ] && [ ! -d "$(fa_dir "$fa")" ]; then
+		echo "SKIP: $name (no $(fa_dir "$fa"))"
+		return
+	fi
+
+	log "phase $name: ${duration}s"
+	base=$(memmap_total)
+	[ -n "$fa" ] && fa_enable "$fa"
+	start_workers
+	sleep "$duration"
+	stop_workers
+	if [ -n "$fa" ]; then
+		injected=$(fa_disable "$fa")
+		log "$name: injected $injected failures"
+		[ "$injected" -gt 0 ] ||
+			log "WARNING: $name: no failures injected"
+	fi
+
+	drain || return
+	after=$(memmap_total)
+	if [ "$after" -ne "$base" ]; then
+		fail "$name: memmap pages $after after drain, expected $base"
+	else
+		pass "$name"
+	fi
+}
+
+accounting_phase() {
+	local base got added after expect
+
+	log "phase accounting"
+	base=$(memmap_total)
+	got=$(set_nr "$target_nr")
+	added=$(( got - orig_nr ))
+	if [ "$added" -le 0 ]; then
+		fail "accounting: could not allocate any ${size_kb}kB hugepages"
+		return
+	fi
+	[ "$added" -eq "$nr" ] || log "accounting: only allocated $added of $nr"
+
+	after=$(memmap_total)
+	expect=$(( base - added * freed_per_folio ))
+	if [ "$after" -ne "$expect" ]; then
+		fail "accounting: memmap pages $after after optimizing" \
+			"$added folios, expected $expect (baseline $base)"
+	else
+		pass "accounting: optimize freed $(( base - after ))" \
+			"vmemmap pages"
+	fi
+
+	drain || return
+	after=$(memmap_total)
+	if [ "$after" -ne "$base" ]; then
+		fail "accounting: memmap pages $after after restore," \
+			"expected $base"
+	else
+		pass "accounting: restore"
+	fi
+}
+
+echo "$marker" > /dev/kmsg
+
+accounting_phase
+stress_phase stress ""
+stress_phase pte-inject fail_hugetlb_vmemmap_pte
+
+check_dmesg
+
+if [ "$failures" -ne 0 ]; then
+	echo "FAILED: $failures check(s)"
+	exit $KSFT_FAIL
+fi
+echo "OK"
+exit $KSFT_PASS
diff --git a/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh b/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh
new file mode 100755
index 000000000000..905b75b2cfb4
--- /dev/null
+++ b/tools/testing/selftests/mm/ksft_hugetlb_vmemmap.sh
@@ -0,0 +1,4 @@
+#!/bin/sh -e
+# SPDX-License-Identifier: GPL-2.0
+
+./run_vmtests.sh -t hugetlb_vmemmap
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 973cb715b326..f439affe5d70 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -79,6 +79,8 @@ separated by spaces:
 	test transparent huge pages
 - hugetlb
 	test hugetlbfs huge pages
+- hugetlb_vmemmap
+	test the hugetlb vmemmap optimization
 - migration
 	invoke move_pages(2) to exercise the migration entry code
 	paths in the kernel
@@ -327,6 +329,8 @@ echo "$enable_soft_offline" > /proc/sys/vm/enable_soft_offline
 CATEGORY="hugetlb" run_test ./hugetlb-read-hwpoison
 fi
 
+CATEGORY="hugetlb_vmemmap" run_test ./hugetlb_vmemmap_stress.sh
+
 if [ $VADDR64 -ne 0 ]; then
 	# va high address boundary switch test
 	CATEGORY="hugevm" run_test bash ./va_high_addr_switch.sh
-- 
2.56.1.809.ga0b61035b5-goog

