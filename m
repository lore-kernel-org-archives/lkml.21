Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244348;
	b=EIcwZVeq0mX+5YB2LB4e+zNrA0PpdTuMnFZFa5TCWgVsHaspPiRQLayExVSlaJwYkjL/
	 dk8PfWwDbUNdVU9ASPZp5zYaPodebEkulZP7tVHMO9N/jbhWYE/maxgbSwuRV8BXkSO5H
	 kgBDi02ccwlu8EhTiNl/AsZgqX92CQJiIqlXmNWk0KbbiEDca104LW2zAGZ9oDn7m5vcH
	 oA6KTI/PHs25bPIPesX36JS2kMRWnS2MGCXk/rgUs1y5rvbqE87LCF++YFoRvd5Nafmg8
	 QblmPI6ZGjxEVtwoneaIBacvsNQMJ2ak7LyDyIok10c1HE4RRcer/G7EFOLppHQB5mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BRO7iFim5TO3kyhnlqJsKmtRLu5OZtTESX0CvoKHMNc=;
	b=cAtiBE7xrI/1QPyRNOHCBHgoanEYHIxJ75wdhpD6qKDLTdypbkNclXGnWMQsubUcgQng
	 /1JGhln6TDZiekSjQuFmFzo9jrvLV9a1scENjp5HXdrUNuV6e6HAh6n2iaCp0Sv/t/iTF
	 ah1G6NQLEjQJCAp9i8BOGggssZdPPWESVqKYgSqAlfls2ZIrKcg3Vh4tgdgByGxo8cpPd
	 TeBwcubUNvIXy7zM4dFbN4QZQIzlCUA9XXbB64wqDwNWNvZmHj/xNTVfxkhS3v0UUoaSw
	 HTemyPQxUrMiYsVN6YGshFqa5AGFohUgcKS/s2EdrDFDRAuvnpXFLddBwg/9gMEeVgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pPDepwGG;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C25606A684
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C25606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pPDepwGG
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso3178467c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244348; x=1795849148; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRO7iFim5TO3kyhnlqJsKmtRLu5OZtTESX0CvoKHMNc=;
        b=pPDepwGGUb23mWjZdGhrVTgo2+/ZHDDXRihHeFaRr0SRAcPbECsVyarsNxdL6jpUFg
         9Z8wAHuc+4SEVXzs76OnXW16FPTF5ttbSE2CMgNgOgLFYmnnrHomAKlK5zb2GCJNF28l
         XAMGEBHIJz5x2YD75AsSbjpTuubEpgHsw55xasZ9amTkt4Hrsyr2x22sDysBgqQiuwao
         dXSfGCz2kGwX0L/fHX2nvxpHwDGWnMErUtB4t+nwXhLyrXTFQQhCI+d2WdeqtNhP/iKT
         g6cZ9Al0+pbVmjEa9jaMgJcJgvEq32ax5X9Jwx0TckokOFCgLkgE2NZQ/c+V3kAjfB2v
         fw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244348; x=1795849148;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BRO7iFim5TO3kyhnlqJsKmtRLu5OZtTESX0CvoKHMNc=;
        b=JUY4SUYnGcSP0bRFRfx+d31EhFSI6gE8ehjmOhdlMFxMNwNV2XVYXClXmXwRDyb2AB
         ubm9XUt/nwtOCDeUX9NdxW3g9aKpticXn9dWdZ7iTOayyF6wJPuQNiLbgQs2sgDDm1FR
         tnhGbl6ZMZVaSB38Hj9kw/bUHr6/V4y1QRKxeXopKA2blDgsqhDQvOSEAolBOAiVn/r7
         BEiaarQgOXy9v5tMoVNhek9wvRkDc89Rjt/Ny15wS6mcp4IylBAfEFHHoAapND+H0atD
         kJVwnRlL/+HNKLP2UKWi3SFDkLuwoMHSs0DJQINIwvtkmAUHxxuTq9OHHXYagJL4qJ/g
         VEsg==
X-Forwarded-Encrypted: i=1; AL+hErHVL4UNvevuLzNSglskBDM0GF/sq+/MNYAsDE7tC4DrGhgtdAcZxgpgEuQFy6B/PbNeLAnAs715nvIFaG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UnW5obJrSuJkUjYGO4L657w/uPeAVV2ID2uqOXZLmQdFm/IfL
	B9EyZWdEh3HRv8cZT1W6UmdY9PezwgReKfvv26pUUEYQpNsjffcMf2YiOVCaWLqqog7Uj+4EfAK
	w/yyeH4q/eA==
X-Received: from dlam22-n1.prod.google.com ([2002:a05:701b:2096:10b0:1b5:345d:ed30])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:b82:b0:163:a197:722d
 with SMTP id a92af1059eb24-1b5567f6a63mr6449552c88.4.1795244347246; Fri, 20
 Nov 2026 22:59:07 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:58 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-10-irogers@google.com>
Subject: [PATCH v15 09/23] perf dsos: Ensure DSOs in auxtrace, machine, and
 symbol are in dsos
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Place the DSOs created in addr_filter__resolve_syms(),
machine__process_ksymbol_register(), and maps__split_kallsyms() into a
dsos collection so that all DSOs that may have data fds opened or be
referenced by maps belong to a dsos collection.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/auxtrace.c | 16 +++++++++++++---
 tools/perf/util/machine.c  |  4 ++++
 tools/perf/util/symbol.c   |  4 ++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 8bb491d389a2..1451de019df0 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -29,6 +29,7 @@
 #include "config.h"
 #include "evlist.h"
 #include "dso.h"
+#include "dsos.h"
 #include "map.h"
 #include "pmu.h"
 #include "evsel.h"
@@ -2684,7 +2685,7 @@ static int addr_filter__resolve_kernel_syms(struct addr_filter *filt)
 	return 0;
 }
 
-static struct dso *load_dso(const char *name)
+static struct dso *load_dso(const char *name, struct dsos *dsos)
 {
 	struct map *map;
 	struct dso *dso;
@@ -2693,6 +2694,11 @@ static struct dso *load_dso(const char *name)
 	if (!map)
 		return NULL;
 
+	if (dsos__add(dsos, map__dso(map))) {
+		map__put(map);
+		return NULL;
+	}
+
 	if (map__load(map) < 0)
 		pr_err("File '%s' not found or has no symbols.\n", name);
 
@@ -2794,6 +2800,7 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 {
 	u64 start, size;
 	struct dso *dso;
+	struct dsos dsos;
 	int err = 0;
 
 	if (!filt->sym_from && !filt->sym_to)
@@ -2802,9 +2809,11 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 	if (!filt->filename)
 		return addr_filter__resolve_kernel_syms(filt);
 
-	dso = load_dso(filt->filename);
+	dsos__init(&dsos);
+	dso = load_dso(filt->filename, &dsos);
 	if (!dso) {
 		pr_err("Failed to load symbols from: %s\n", filt->filename);
+		dsos__exit(&dsos);
 		return -EINVAL;
 	}
 
@@ -2831,13 +2840,14 @@ static int addr_filter__resolve_syms(struct addr_filter *filt)
 
 		err = check_end_after_start(filt, start, size);
 		if (err)
-			return err;
+			goto put_dso;
 
 		filt->size = start + size - filt->addr;
 	}
 
 put_dso:
 	dso__put(dso);
+	dsos__exit(&dsos);
 
 	return err;
 }
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 4a3461d79593..02711995f0b6 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -797,6 +797,10 @@ static int machine__process_ksymbol_register(struct machine *machine,
 			dso__set_long_name(dso, "", false);
 		}
 
+		err = dsos__add(&machine->dsos, dso);
+		if (err)
+			goto out;
+
 		map__set_start(map, event->ksymbol.addr);
 		map__set_end(map, map__start(map) + event->ksymbol.len);
 		err = maps__fixup_overlap_and_insert(machine__kernel_maps(machine), map);
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index a1ac1cd1d2e7..8dded88c9763 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1078,6 +1078,10 @@ static int maps__split_kallsyms(struct maps *kmaps, struct dso *dso, u64 delta,
 				dso__set_symtab_type(ndso, DSO_BINARY_TYPE__KALLSYMS);
 			}
 			dso__set_loaded(ndso);
+			if (dsos__add(&machine->dsos, ndso)) {
+				dso__put(ndso);
+				return -1;
+			}
 
 			curr_map = map__new2(pos->start, ndso);
 			if (curr_map == NULL) {
-- 
2.56.1.750.gf70dc682cf-goog

