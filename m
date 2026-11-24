Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490968;
	b=JVtvUE7rTzhoT2NjcUiMqebh6AFvsv9nVPYPXJXSqZE1R+3bbPV9ZLRUUt/EDI4qZqcQ
	 X5XM3LvHHlvdU8XESHsU/+/vaIZnwx6qVFAyzfje8z30/zk/2uG+rzKoeULBBfpK5Nb+8
	 Vh310CAA+bg2Th+y/SY6pzm3Axf8/w3j0PsGk6lGXdfQKf+S9qfSBIT2UoMR1hIFnBFbT
	 qYOPysoDzIGsWArvAOF79VWrbn9OqRoWaaabPoEiBdJBBUqxSpwVxAYFYuN8StU7qV3ym
	 6FvMrTtLODy58b2d7ABblrSQzdEqTw6kesC66/jkhmWSaabcWfBqHjDnzZW3xVzY+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mAMYPWB6ofQX89H5KQYyprJYDog9FlcEaTRl2IXPg5g=;
	b=wzWUsemxrHMY+d9IvxgLkDXLxHQWeYGATVvWrDD9I38s4obQDK45Y5pE8MaEt0LNCP0/
	 Mh86KTeLqwWGZJgnZ22eSILcya+jIIpqy8pgUWGAYtlr+IdG3incAw3A6+dWS1O0vQrjb
	 QORe4/k6arP2z7xRkcANbkYs3IPfVU6AHga74IuBu7/maa74TC3/Dkkydpb9jM02T6CZO
	 tW1EZTmNILVozCoW29GQ5fzrGeGokIsygpuhhOfTWAi4n/DwZGaPdMp4bUdvPIk490lWK
	 wbXkQIVa2ydMrB2nfSzoZcnja1wrkLu1NmjFGReCDmjxvEawcaXtHiSjkNBIMkhrBhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RD5cyG0K;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6157606A331
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6157606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RD5cyG0K
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3ae17c536so3980414c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795490967; x=1796095767; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAMYPWB6ofQX89H5KQYyprJYDog9FlcEaTRl2IXPg5g=;
        b=RD5cyG0K7l+rMnGP86VQXbVPAepoxxRjrdXnOFINB6gpfZMsT2m9xb7/kRgXSC+V2G
         Tcd4JTMeJjScAfiJT3eswiH8tyqtez/dVFxQWhmxmP/cOo7srEC4sgsz6HQw7BWI77/Z
         A68DG+AeZqnjFA9GxdznQultDVUx8WE91ACPdDwM1D7SRd2rn+NSZiR+5q2p42rS273B
         /DHkB6f9JC/2VW10ClxN0VirdvdQ1nayiZKHe95vX9yrmBW2QGHSb855jChUy5tcAwBZ
         tQQMICffyz0Um+02cgoSR036Zbjvz0f1s0Nx0rp7ojEkfRkMhjVuLq53l7J+DGE6Glr8
         UcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490967; x=1796095767;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAMYPWB6ofQX89H5KQYyprJYDog9FlcEaTRl2IXPg5g=;
        b=kTpgr0QrO16o8DlmsuJzginOxe68QP4SoX984dpPEjbtv24MSOEEUw1UYunaRbENMO
         1PALM1KHwM4eV/XvTM0hU68UjHD0HGErVpqfNYi91WeJZxnilof3Uq4lFGi5SPGIXcIv
         sxd4xXdIGtrX1m/hPTcfn2z2rMvpezGGqiN+xGsaKN94D7I7AHINGC8zGNhNNu207eST
         3t1y39I9Lq7xN1G6WB+DwT+KQMNAkl6oakRzA1QNOIISHtwYvF5L8HclIm3jrdb08X4z
         DxZFRmjP2LLpzVvggmwHsCVwVrs/MMhyL5yFU9CiUXNmVELw8tApr/MavjRPrC/Fvt6O
         UatQ==
X-Forwarded-Encrypted: i=1; AL+hErFDndyvX4XboRSsJ7Tigyxw3Iv7I9AdnE/up8ihXEkJ3lEG7H7sCIEA5+Igowhwxwhzgn1+tjgpPekDoMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i3iYit6YZ7wBT2W8xk6WaBhEdlb/QL3thE/0R7Tg7Y0h7BUdE
	EaAh2vgPNm1ZPh6+msewKb0cWRcnmUvMlJf0jCIPGPZHBxo6kwQWe4PZ2GGnoCd2Owke7pP2Rdi
	6lKBuFfB7qw==
X-Received: from dlgw19-n1.prod.google.com ([2002:a05:701a:cc93:10b0:1b5:7477:ff02])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701a:8148:10b0:143:2719:f800
 with SMTP id a92af1059eb24-1b556908ecdmr12742486c88.40.1795490966533; Mon, 23
 Nov 2026 19:29:26 -0800 (PST)
Date: Mon, 23 Nov 2026 19:28:55 -0800
In-Reply-To: <20261124032902.3859564-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124032902.3859564-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124032902.3859564-5-irogers@google.com>
Subject: [PATCH v9 04/11] perf test symbols: Add sorted insertion and
 equal-start alias tests
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add unit tests to tools/perf/tests/symbols.c covering the struct symbols
sorted-array implementation:
- Ordered bulk insertion via symbols__insert(), out-of-order dynamic
  insertion via dso__insert_symbol() into the secondary sorted run,
  unsorted append followed by sort-on-lookup, and unmerged-vs-merged
  two-run overlap and equal-start alias lookups.
- Equal-start symbol aliases: rewinding past a trailing zero-length alias
  during lookup, preserving non-zero size in symbols__fixup_end(), alias
  deduplication in symbols__fixup_duplicate(), and scanning equal-start
  groups in map__fixup_end().
- Same-address STB_WEAK / STB_GLOBAL alias resolution in
  test__kallsyms_fixup_end().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/symbols.c | 268 +++++++++++++++++++++++++++++++++++--
 1 file changed, 257 insertions(+), 11 deletions(-)

diff --git a/tools/perf/tests/symbols.c b/tools/perf/tests/symbols.c
index b73da581f895..4e4f8eabec5b 100644
--- a/tools/perf/tests/symbols.c
+++ b/tools/perf/tests/symbols.c
@@ -219,12 +219,248 @@ static int test_file(struct test_info *ti, char *filename)
 	return ret;
 }
 
+static int test_symbols_sorted_insert(void)
+	__context_unsafe(/* single-threaded white-box test */)
+{
+	struct dso *dso = dso__new("/tmp/perf_test_sorted_insert");
+	struct symbols *symbols;
+	int ret = TEST_FAIL;
+
+	if (!dso)
+		return TEST_FAIL;
+
+	symbols = dso__symbols(dso);
+
+	/*
+	 * Insert 100 odd-indexed symbols in ascending order via
+	 * symbols__insert(), then insert 5 even-indexed symbols out of order via
+	 * dso__insert_symbol() and verify they land in the secondary sorted run.
+	 */
+	for (unsigned int i = 0; i < 100; i++) {
+		char name[32];
+		u64 addr = (u64)(i * 2 + 1) * 0x100;
+		struct symbol *sym;
+
+		snprintf(name, sizeof(name), "sym_%u", i * 2 + 1);
+		sym = symbol__new(addr, 0x40, STB_GLOBAL, STT_FUNC, name);
+		if (!sym || symbols__insert(symbols, sym))
+			goto out;
+	}
+	if (symbols->sorted_cnt != 100 || symbols->cnt != 100) {
+		pr_debug("Expected sorted_cnt=100, cnt=100 after ordered inserts\n");
+		goto out;
+	}
+
+	for (unsigned int i = 0; i < 5; i++) {
+		char name[32];
+		u64 addr = (u64)(i * 20) * 0x100;
+		struct symbol *sym;
+
+		snprintf(name, sizeof(name), "ins_%u", i * 20);
+		sym = symbol__new(addr, 0x40, STB_GLOBAL, STT_FUNC, name);
+		if (!sym || dso__insert_symbol(dso, sym))
+			goto out;
+		if (symbols->sorted_cnt + symbols->sorted_tail_cnt != symbols->cnt) {
+			pr_debug("dso__insert_symbol did not preserve sorted runs!\n");
+			goto out;
+		}
+	}
+
+	/*
+	 * Now append 95 remaining even-indexed symbols in descending order via
+	 * symbols__insert() to exercise the unsorted append + sort-on-lookup path.
+	 */
+	for (unsigned int i = 99; i > 0; i--) {
+		char name[32];
+		u64 addr;
+		struct symbol *sym;
+
+		if ((i * 2) % 20 == 0 && (i * 2) < 100)
+			continue;
+		addr = (u64)(i * 2) * 0x100;
+		snprintf(name, sizeof(name), "ins_%u", i * 2);
+		sym = symbol__new(addr, 0x40, STB_GLOBAL, STT_FUNC, name);
+		if (!sym || symbols__insert(symbols, sym))
+			goto out;
+	}
+	if (symbols->sorted_cnt + symbols->sorted_tail_cnt >= symbols->cnt ||
+	    symbols->cnt != 200) {
+		pr_debug("Unexpected sorted_cnt=%u sorted_tail_cnt=%u cnt=%u before lookup\n",
+			 symbols->sorted_cnt, symbols->sorted_tail_cnt, symbols->cnt);
+		goto out;
+	}
+
+	for (unsigned int i = 0; i < 200; i++) {
+		u64 addr = (u64)i * 0x100 + 0x10;
+		struct symbol *sym = dso__find_symbol(dso, addr);
+
+		if (!sym || sym->start != (u64)i * 0x100) {
+			pr_debug("Lookup failed at idx %u (addr=%#" PRIx64 ")\n", i, addr);
+			goto out;
+		}
+	}
+
+	/*
+	 * Insert dynamic symbols into the unmerged secondary sorted run and
+	 * verify lookups match merged-array semantics in all prefix/tail
+	 * overlap and equal-start cases:
+	 * - [0x0, 0x40) in prefix + [0x20, 0x30) in tail: 0x24 -> inner,
+	 *   0x34 -> NULL (closer tail start shadows outer prefix symbol).
+	 * - [0x100, 0x140) in prefix + [0x80, 0x180) in tail: 0x150 -> NULL
+	 *   (closer prefix start shadows outer tail symbol).
+	 * - [0x200, 0x240) in prefix + [0x200, 0x260) in tail: 0x250 -> alias
+	 *   (equal-start group spans prefix and tail).
+	 */
+	{
+		struct symbol *inner = symbol__new(0x20, 0x10, STB_GLOBAL, STT_FUNC,
+						   "inner_tail_sym");
+		struct symbol *outer = symbol__new(0x80, 0x100, STB_GLOBAL, STT_FUNC,
+						   "outer_tail_sym");
+		struct symbol *alias = symbol__new(0x200, 0x60, STB_GLOBAL, STT_FUNC,
+						   "longer_tail_alias");
+
+		if (!inner || dso__insert_symbol(dso, inner)) {
+			symbol__delete(outer);
+			symbol__delete(alias);
+			goto out;
+		}
+		if (!outer || dso__insert_symbol(dso, outer)) {
+			symbol__delete(alias);
+			goto out;
+		}
+		if (!alias || dso__insert_symbol(dso, alias))
+			goto out;
+		if (symbols->sorted_tail_cnt == 0 || symbols->sorted_cnt >= symbols->cnt) {
+			pr_debug("Expected unmerged secondary sorted run!\n");
+			goto out;
+		}
+		if (dso__find_symbol(dso, 0x24) != inner ||
+		    dso__find_symbol(dso, 0x34) != NULL ||
+		    dso__find_symbol(dso, 0x150) != NULL ||
+		    dso__find_symbol(dso, 0x250) != alias) {
+			pr_debug("Unmerged tail lookup mismatch!\n");
+			goto out;
+		}
+		symbols__sort_read_lock(symbols);
+		up_read(&symbols->lock);
+		if (dso__find_symbol(dso, 0x24) != inner ||
+		    dso__find_symbol(dso, 0x34) != NULL ||
+		    dso__find_symbol(dso, 0x150) != NULL ||
+		    dso__find_symbol(dso, 0x250) != alias) {
+			pr_debug("Merged lookup mismatch!\n");
+			goto out;
+		}
+	}
+
+	ret = TEST_OK;
+out:
+	dso__put(dso);
+	return ret;
+}
+
+static int test_symbols_equal_start_aliases(void)
+{
+	struct dso *dso = dso__new("/tmp/perf_test_equal_start_aliases");
+	struct map *map = NULL;
+	struct symbols *symbols;
+	struct symbol *sized_sym, *zero_alias, *last_sized, *last_short, *found;
+	int ret = TEST_FAIL;
+
+	if (!dso)
+		return TEST_FAIL;
+
+	map = map__new2(0, dso);
+	if (!map)
+		goto out;
+
+	symbols = dso__symbols(dso);
+	sized_sym = symbol__new(0x1000, 0x40, STB_GLOBAL, STT_FUNC, "sized_sym");
+	zero_alias = symbol__new(0x1000, 0, STB_GLOBAL, STT_FUNC, "zero_alias");
+	last_sized = symbol__new(0x2000, 0x80, STB_GLOBAL, STT_FUNC, "last_sized");
+	if (!sized_sym || !zero_alias || !last_sized) {
+		symbol__delete(sized_sym);
+		symbol__delete(zero_alias);
+		symbol__delete(last_sized);
+		goto out;
+	}
+
+	if (symbols__insert(symbols, sized_sym)) {
+		symbol__delete(zero_alias);
+		symbol__delete(last_sized);
+		goto out;
+	}
+	if (symbols__insert(symbols, zero_alias)) {
+		symbol__delete(last_sized);
+		goto out;
+	}
+	if (symbols__insert(symbols, last_sized))
+		goto out;
+
+	/*
+	 * With 3 entries [0x1000..0x1040, 0x1000..0x1000, 0x2000..0x2080], a
+	 * lookup at 0x1020 must rewind past the trailing zero-length alias at
+	 * 0x1000 and find sized_sym.
+	 */
+	found = dso__find_symbol(dso, 0x1020);
+	if (found != sized_sym) {
+		pr_debug("Expected sized_sym at 0x1020, got %s\n",
+			 found ? found->name : "NULL");
+		goto out;
+	}
+
+	/*
+	 * symbols__fixup_end() must not inflate zero_alias to 0x2000 when
+	 * sized_sym already provides a non-zero size at 0x1000.
+	 */
+	symbols__fixup_end(symbols, /*is_kallsyms=*/false);
+	if (zero_alias->end != 0x1000) {
+		pr_debug("zero_alias inflated to %#" PRIx64 "\n", zero_alias->end);
+		goto out;
+	}
+	symbols__fixup_duplicate(symbols);
+	found = dso__find_symbol(dso, 0x1020);
+	if (found != sized_sym || found->end != 0x1040) {
+		pr_debug("After dedup expected sized_sym [0x1000, 0x1040), got %s\n",
+			 found ? found->name : "NULL");
+		goto out;
+	}
+
+	/*
+	 * Append a shorter alias at the final start address 0x2000 (as when
+	 * symbol_conf.allow_aliases is set) and verify map__fixup_end() uses
+	 * the maximum end across the equal-start group.
+	 */
+	last_short = symbol__new(0x2000, 0x10, STB_WEAK, STT_FUNC, "last_short");
+	if (!last_short || symbols__insert(symbols, last_short))
+		goto out;
+
+	map__fixup_end(map);
+	if (map__end(map) != 0x2080) {
+		pr_debug("Expected map end 0x2080, got %#" PRIx64 "\n", map__end(map));
+		goto out;
+	}
+
+	ret = TEST_OK;
+out:
+	map__put(map);
+	dso__put(dso);
+	return ret;
+}
+
 static int test__symbols(struct test_suite *test __maybe_unused, int subtest __maybe_unused)
 {
 	char filename[PATH_MAX];
 	struct test_info ti;
 	int ret;
 
+	ret = test_symbols_sorted_insert();
+	if (ret != TEST_OK)
+		return ret;
+
+	ret = test_symbols_equal_start_aliases();
+	if (ret != TEST_OK)
+		return ret;
+
 	ret = init_test_info(&ti);
 	if (ret != TEST_OK)
 		return ret;
@@ -240,24 +476,28 @@ static int test__symbols(struct test_suite *test __maybe_unused, int subtest __m
 
 struct kallsyms_sym {
 	u64 start;
+	u8 binding;
 	const char *name;
 };
 
 /*
  * kallsyms from an x86 host where nf_tables was loaded in the page right
  * after the last symbol of dca, plus a kernel symbol followed closely by a
- * module and a module far away from the others.
+ * module, a weak/global alias pair at the same address, and a module far
+ * away from the others.
  */
 static const struct kallsyms_sym kallsyms_syms[] = {
-	{ 0xffffffff81000000, "_stext" },
-	{ 0xffffffff81000ff0, "last_kernel_symbol" },
-	{ 0xffffffff81001000, "near_module_symbol\t[near]" },
-	{ 0xffffffffc0c4aa40, "dca_exit\t[dca]" },
-	{ 0xffffffffc0c4aa50, "dca_sysfs_exit\t[dca]" },
-	{ 0xffffffffc0c4b000, "__nft_trace_packet\t[nf_tables]" },
-	{ 0xffffffffc0c4b0b0, "nft_do_chain\t[nf_tables]" },
-	{ 0xffffffffc0c4b4e0, "nf_tables_core_module_exit\t[nf_tables]" },
-	{ 0xffffffffc2000000, "far_module_symbol\t[far]" },
+	{ 0xffffffff81000000, STB_GLOBAL, "_stext" },
+	{ 0xffffffff81000500, STB_WEAK, "weak_alias_symbol" },
+	{ 0xffffffff81000500, STB_GLOBAL, "global_target_symbol" },
+	{ 0xffffffff81000ff0, STB_GLOBAL, "last_kernel_symbol" },
+	{ 0xffffffff81001000, STB_GLOBAL, "near_module_symbol\t[near]" },
+	{ 0xffffffffc0c4aa40, STB_GLOBAL, "dca_exit\t[dca]" },
+	{ 0xffffffffc0c4aa50, STB_GLOBAL, "dca_sysfs_exit\t[dca]" },
+	{ 0xffffffffc0c4b000, STB_GLOBAL, "__nft_trace_packet\t[nf_tables]" },
+	{ 0xffffffffc0c4b0b0, STB_GLOBAL, "nft_do_chain\t[nf_tables]" },
+	{ 0xffffffffc0c4b4e0, STB_GLOBAL, "nf_tables_core_module_exit\t[nf_tables]" },
+	{ 0xffffffffc2000000, STB_GLOBAL, "far_module_symbol\t[far]" },
 };
 
 static int check_symbol(struct dso *dso, u64 addr, const char *name, u64 end)
@@ -287,7 +527,8 @@ static int test__kallsyms_fixup_end(struct test_suite *test __maybe_unused,
 		return TEST_FAIL;
 
 	for (unsigned int i = 0; i < ARRAY_SIZE(kallsyms_syms); i++) {
-		struct symbol *sym = symbol__new(kallsyms_syms[i].start, 0, 0, 0,
+		struct symbol *sym = symbol__new(kallsyms_syms[i].start, 0,
+						 kallsyms_syms[i].binding, STT_FUNC,
 						 kallsyms_syms[i].name);
 
 		if (!sym)
@@ -296,8 +537,13 @@ static int test__kallsyms_fixup_end(struct test_suite *test __maybe_unused,
 	}
 
 	symbols__fixup_end(dso__symbols(dso), true);
+	symbols__fixup_duplicate(dso__symbols(dso));
 
 	ret = TEST_OK;
+	/* Same-address weak/global alias pair resolves to global_target_symbol. */
+	if (check_symbol(dso, 0xffffffff81000510, "global_target_symbol",
+			 0xffffffff81000ff0))
+		ret = TEST_FAIL;
 	/* The next symbol is too close for the end of the page. */
 	if (check_symbol(dso, 0xffffffff81000ff8, "last_kernel_symbol",
 			 0xffffffff81001000))
-- 
2.56.1.809.ga0b61035b5-goog

