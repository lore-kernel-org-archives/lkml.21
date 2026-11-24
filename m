Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559475;
	b=JvsPF0vWPcGLSlqkykgPq54O3ZOjXH+VdBrSGT+/SP3jaajXKyiJC7KQli7wZ8sVh8E3
	 1aYSZLGsrpfsd5PENc1v7RatnzdztGUFuL0Fks17vNs/t/N21WEOcCal3Nrlchzg/b921
	 IfHeU3hskBKiPpaL6/m5unlWxjbmaG/cNDZ/gUD7fcwb4CYU/zIJyBU9RufbSijpsABr9
	 SKP4sCF7TuhMdqPiLfPw14OcaHhOoZNzEvPwStDMOF1valfgB4st3RUqZCCtoj/AbL0AH
	 n0Qz89Y4NMtHERwl5B/i3vXiJaua6j/UC6Fp2VcWJFolCpuPD5y39I/GS73e0PS9+ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7V/ACU51fFvCWw0+7bIibGREJqF726OS4zBMnHqF3LA=;
	b=fFxLoH6u2690fcvJHy26bnaFscqkbXtfgSmD4Oi2V9aBRzopUWn8FdIl7I3tcxCnFJ9w
	 aoXiYdcdhIAesTVvfsFBo6QqqYjxv0cdpBk/h+sI/oSgksSeeonyuaYP3j0QfV+8vv8eO
	 Jo0iaavGrBZODwGZAZuY1/3JHCJHUBNsF0xaGtIENiK10yOVAa0OSSOCd1Cr/K9lnUmO3
	 V64yBDl3gGu6iORHcYE/j7xo+79NbL6Q+6vCPYvMts9CO/riEbUpziqhMfAT8mcqiGuOc
	 mezJ0VGydGC2bkAG6LsBWKepGjnQ6YGLEon7VS2TVBJJ7AXpFGjPj4/oDF0NTVOhSUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YZMqid11;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE83606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DE83606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YZMqid11
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so5908419c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559475; x=1796164275; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7V/ACU51fFvCWw0+7bIibGREJqF726OS4zBMnHqF3LA=;
        b=YZMqid11Mrd2FUcMhYHHVzbZRVQQP9oDhaOB6wmIUguvOl8btVWyExpFE0B+QURUmo
         c23uloG/mUn4k/X9PNV6FmZdUmPi0CzpKfg10+BrbhhuakJc1QN3BfXQNaxpfO4F/9XY
         Za7e/M05tjodv6U9ERsmSXk67J5Rr4ejfNotHNIwyGGNivHdcF73bqiz16b+ePmxsbnk
         AziUx5L1wF43KBMDXHJP4VaYcUqaxeWZBPpfM1YHno6RhuvU/cik8YCCeoc0T+rt6RPl
         IyuQ2zRnTPEqGlJrdVGz7QllrnV7BFqn+q21qy4T6DmPvuNU2MQqzXEUEjq3A2sChv52
         wpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559475; x=1796164275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7V/ACU51fFvCWw0+7bIibGREJqF726OS4zBMnHqF3LA=;
        b=2saW4X83uuvnwN3ozeydyyHJh9HcSx/g7CZBjJFXILOcJUoPwrTA0slGvyEAVYCTcz
         aIMBHnjBoTg474/1KDGXgM1XXQw6XQNJ7dG9bylMH9O3dZ2cxjEx4y6LCIhW5jq7QJQK
         Kq6IRQII1EsMPkmLPLTEcXx1Z37PzUl8VGnBl+QDAhk+tKtRv8bk6JtEl0Jw6jTzh+OD
         KdHOK0bUgmqwH9JiJauN0WpmMyqBEMSy0AGxaLHYQrd4r4ffIWTg4nRTQ9T+Q8jepxEy
         2ml+IZhxbQAVM5U6RYfNVrPycr9/RMR6w3Yf8snXl8goXIoRd+FG5AMmvLCrBQLHEO+p
         KxdQ==
X-Forwarded-Encrypted: i=1; AL+hErH4yhF+ECXVo08gyJqsrbuMxRBbdl1XsB9Sod4uh4Tw0MkGj5li1lApmNQ3oUZlGfQUGX7ccM6w8Q2nrP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zzz5/YZe/23u9fk8lwzIBaRR0Fbk+1Q2bdLiJhBtsbtoCTJ3L
	lzKsix3g7PAs3s9mjHAki7dTSpBJbtmodEkrrgY+UQll4y/fYkuSDXZFNRK80YG/E5eyPVZIG8+
	iAqdEJPQf9w==
X-Received: from dlam23-n1.prod.google.com ([2002:a05:701b:2097:10b0:1b2:4da6:71c1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:418c:20b0:1b5:39a3:75e5
 with SMTP id a92af1059eb24-1b556901fccmr16724099c88.33.1795559474171; Tue, 24
 Nov 2026 14:31:14 -0800 (PST)
Date: Tue, 24 Nov 2026 14:30:58 -0800
In-Reply-To: <20261124223109.820609-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124223109.820609-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124223109.820609-2-irogers@google.com>
Subject: [PATCH v10 01/12] perf symbol: Fix symbols__fixup_end() for
 equal-start zero-sized aliases
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When multiple zero-sized symbols share the same start address (such as
STB_GLOBAL and STB_WEAK aliases in /proc/kallsyms), symbols__fixup_end()
previously skipped earlier entries in the equal-start group and only
updated end on the final entry before the next distinct address.

Because __dso__load_kallsyms() and ELF loaders call symbols__fixup_end()
before symbols__fixup_duplicate(), inflating only the last entry gave it
a non-zero length while leaving earlier aliases at the same address with
zero length. In choose_best_symbol(), the initial "Prefer a symbol with
non zero length" check then unconditionally selected whichever alias
happened to appear last, bypassing the STT_NOTYPE, STB_WEAK, STB_GLOBAL,
underscore-count, and arch__choose_best_symbol() heuristics (for example
dropping a global symbol when followed by a weak alias at the same
address).

Track group_start across each equal-start group in symbols__fixup_end():
when no symbol at that start address already has a non-zero size
(!addr_has_sized), synthesize end for every symbol in the group so
subsequent deduplication compares equal-length aliases using binding and
name heuristics (and so allow_aliases callers do not retain zero-length
earlier aliases). When any symbol at that address already has an
explicit non-zero size (addr_has_sized), leave zero-sized aliases at
zero as before so choose_best_symbol() continues to prefer explicitly
sized symbols.

Fixes: 694bf407b061 ("perf symbols: Add some heuristics for choosing the best duplicate symbol")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol.c | 74 +++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 32 deletions(-)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 35b08c05a2fd..920951aaa5be 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -518,7 +518,7 @@ void symbols__fixup_duplicate(struct symbols *symbols)
 /* Update zero-sized symbols using the address of the next symbol */
 void symbols__fixup_end(struct symbols *symbols, bool is_kallsyms)
 {
-	struct symbol *curr, *prev;
+	unsigned int group_start = 0;
 	bool addr_has_sized;
 
 	down_write(&symbols->lock);
@@ -529,14 +529,12 @@ void symbols__fixup_end(struct symbols *symbols, bool is_kallsyms)
 		return;
 	}
 
-	curr = symbols->symbols[0];
-	addr_has_sized = curr->end > curr->start;
+	addr_has_sized = symbols->symbols[0]->end > symbols->symbols[0]->start;
 
 	for (unsigned int i = 1; i < symbols->cnt; i++) {
-		prev = curr;
-		curr = symbols->symbols[i];
+		struct symbol *curr = symbols->symbols[i];
 
-		if (curr->start == prev->start) {
+		if (curr->start == symbols->symbols[group_start]->start) {
 			if (curr->end > curr->start)
 				addr_has_sized = true;
 			continue;
@@ -558,40 +556,52 @@ void symbols__fixup_end(struct symbols *symbols, bool is_kallsyms)
 		 * like in:
 		 *   ffffffffc1937000 T hdmi_driver_init  [snd_hda_codec_hdmi]
 		 */
-		if (!addr_has_sized && prev->end == prev->start) {
-			const char *prev_mod;
-			const char *curr_mod;
+		if (!addr_has_sized) {
+			const char *curr_mod = is_kallsyms ? strchr(curr->name, '[') : NULL;
 
-			if (!is_kallsyms) {
-				prev->end = curr->start;
-			} else {
-				prev_mod = strchr(prev->name, '[');
-				curr_mod = strchr(curr->name, '[');
-
-				/* Last kernel/module symbol mapped to end of page */
-				if (!prev_mod != !curr_mod) {
-					prev->end = roundup(prev->end + 4096, 4096);
-				/* Last symbol in the previous module */
-				} else if (prev_mod && strcmp(prev_mod, curr_mod)) {
-					prev->end = roundup(prev->end + 4096, 4096);
-				} else {
-					prev->end = curr->start;
-				}
+			for (unsigned int j = group_start; j < i; j++) {
+				struct symbol *prev = symbols->symbols[j];
 
-				/* The next module can start within that page */
-				if (prev->end > curr->start)
-					prev->end = curr->start;
+				if (prev->end != prev->start)
+					continue;
 
-				pr_debug4("%s sym:%s end:%#" PRIx64 "\n",
-					  __func__, prev->name, prev->end);
+				if (!is_kallsyms) {
+					prev->end = curr->start;
+				} else {
+					const char *prev_mod = strchr(prev->name, '[');
+
+					/* Last kernel/module symbol mapped to end of page */
+					if (!prev_mod != !curr_mod) {
+						prev->end = roundup(prev->end + 4096, 4096);
+					/* Last symbol in the previous module */
+					} else if (prev_mod && strcmp(prev_mod, curr_mod)) {
+						prev->end = roundup(prev->end + 4096, 4096);
+					} else {
+						prev->end = curr->start;
+					}
+
+					/* The next module can start within that page */
+					if (prev->end > curr->start)
+						prev->end = curr->start;
+
+					pr_debug4("%s sym:%s end:%#" PRIx64 "\n",
+						  __func__, prev->name, prev->end);
+				}
 			}
 		}
+		group_start = i;
 		addr_has_sized = curr->end > curr->start;
 	}
 
-	/* Last entry */
-	if (!addr_has_sized && curr->end == curr->start)
-		curr->end = roundup(curr->start, 4096) + 4096;
+	/* Last equal-start group */
+	if (!addr_has_sized) {
+		for (unsigned int j = group_start; j < symbols->cnt; j++) {
+			struct symbol *curr = symbols->symbols[j];
+
+			if (curr->end == curr->start)
+				curr->end = roundup(curr->start, 4096) + 4096;
+		}
+	}
 
 	up_write(&symbols->lock);
 }

base-commit: 148690b95cc425950dbba79d73eb4f7938347fce
-- 
2.56.1.831.g720f3f5937-goog

