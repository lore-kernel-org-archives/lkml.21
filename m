Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559488;
	b=PPoeZio5KAYF8y3GVZxOWFOdTVQnENz269D0PeuLSbnOqR23Rfz8qXd9dhL3ogcR712c
	 L0UJLr2HVhPSSDHoG3tZQLbVn1z08YC2Ui8SwnjzQU16CsTI5dKmFHYJGghCI164KJknR
	 fpYfTu9SeXKyAEAJmWRwzeGEihMWHhQByYO5c/ViE3L4iol96S86IqNB7nAdUqcRStLZ8
	 q0l5W9l2PZ4YBEKdyffnQZM84gRUfYc3ZQW6puHy/6mJJIBhCqGiALkVnHyuV0GMxNz6/
	 VvlFyAKT2GKpFl1zs2kzavZqyQSRzWH6o5uCrxG+5h2dehsRJy2LnKmlw2RTX+g2TqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bJ2wLl80H6W61OfbTAD+Kn2BL2XrYH+h5oNwZiTeGoQ=;
	b=o3zyzylrPKQ48zHD1KamESLhCTu/cGnZjk3628ERLQsJQMCuNMsREYdKLJenu+MB5xKE
	 y0VzDFAxNE2fBKYuDBmePdH2MhM6NFium7TYL1TNMxCFrRifkyG692QbYBSkHs9NgGB+i
	 CnchZPzbcMoHzD0u5qN0a9Wo5FrNDDBsP6faiCIfui9Kh/K69sq0V1X5AZXuoS2LMJFlS
	 5+5hWdVP7ZxGv/94aAMaWbhcUQLQblwf2dFEjVR5te8j90ylHu9frVmsvwyqZ7lA+jCQJ
	 qDpGvV4Z0jWyGU0VYtbSaA4b9zYCcEQPrsnk2bPz2wFTXsqysYuH6zka4hIofRYIFWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjzvUHvY;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD9606A68C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9BD9606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjzvUHvY
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so6532704c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559487; x=1796164287; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ2wLl80H6W61OfbTAD+Kn2BL2XrYH+h5oNwZiTeGoQ=;
        b=fjzvUHvYh0KI6kWNbVeHRZlzKoFiRnNL01jIjunsRCL7ChFWSNO0TPC+v3I7YdQTYV
         6LUA66+0fjOD3ty3WTd1NHa6jtBf7aVngkva/M4zFceycoqvu7QF7WtR/uxbWd2zZN2z
         tBTudMeQQWx6u/Nx08CGAJhabiu4QhQBszvEAfaFKUpwO83jz3dUbllJf4wdBJo3vc7V
         E0pPu3iRo6SG2ugmFgbG6XfAl3AvKYmL2KFkisrRsJwPw6iQAtwjgLV2ghNwbx2WHBjk
         6bt9vDyv9tBiJgj8XJsTMei8nZBsdDft4GKGkUfNMD3RLFQFdClqKToRYw10eLDU9jbg
         bwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559487; x=1796164287;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJ2wLl80H6W61OfbTAD+Kn2BL2XrYH+h5oNwZiTeGoQ=;
        b=yjV5BEWKW3NRqbMpPBFMW3EIfHtxE1jKHae2L8lslboqHlSakbBCgUHpuRMqAqdXhl
         KvBZOmd6eWMscnHZXgIJBy2b5lVp2D9nSlxPBAeQrTbylxhP8onBrGmvywudQLslZp3Z
         BD7FoucjEIn3FbPW6KFo4LLk57xjcL3bchh9yGzFqT1aUe405MCNJN9qktI81wrn2wh3
         +eINJ+qZu18PsQ8++wp6xWyz5lQlKq7xRMjk96GIcqSKJbL/KpfJiuvLPeqPQ3uWy3fW
         SZxxnBghKMCY7BT/qYj1LRwplBbaXVz/GqcefqHplfdArG/1AVMIUtegFa1c8rbFKAi0
         XqFg==
X-Forwarded-Encrypted: i=1; AL+hErHzqEysMNU+VxL0hRpM78Tdswr84sSWYj7+1U1Q4HXIrsWw1SRSZ7a6zLZ1sSbS8Es8ShGfg3B47tUOkLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tcajsk43KwPRYtdCZ0481T1bguTxtt501QP4h9BjiGnOdPcYH
	w++oYJenLEFlyVT1CeMxhLYbaY4L3iM+iceu9qrGmrmqPYOSzDGvexnwVmSoDu8qXtmOV+WlTBs
	23rvQu6PUfw==
X-Received: from dyaz16-n1.prod.google.com ([2002:a05:693c:6390:10b0:359:72f9:2aab])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4308:b0:1b5:1a6e:1bec
 with SMTP id a92af1059eb24-1b5568779e3mr15810887c88.10.1795559486229; Tue, 24
 Nov 2026 14:31:26 -0800 (PST)
Date: Tue, 24 Nov 2026 14:31:04 -0800
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
Message-ID: <20261124223109.820609-8-irogers@google.com>
Subject: [PATCH v10 07/12] perf symbol: Add symbols__shrink() and symbols__try_delete_unannotated()
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add symbol-container memory shrinking helpers to struct symbols:
- symbols__shrink(): Reclaims the secondary name-sorted index
  (symbols_by_name, rebuilt on demand by dso__sort_by_name()) and trims
  unused over-allocated tail capacity in symbols->symbols while keeping
  all live struct symbol entries intact.
- symbols__try_delete_unannotated(): Deletes all symbols under
  symbols->lock when none have entries in the annotations hashmap, running
  an optional pre_delete callback before freeing the symbols.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/symbol.c | 61 ++++++++++++++++++++++++++++++++++++++++
 tools/perf/util/symbol.h |  3 ++
 2 files changed, 64 insertions(+)

diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 4e80ff176914..f2043872848c 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -253,6 +253,67 @@ void symbols__exit(struct symbols *symbols)
 	exit_rwsem(&symbols->lock);
 }
 
+bool symbols__try_delete_unannotated(struct symbols *symbols,
+				     void (*pre_delete)(void *ctx), void *ctx)
+{
+	down_write(&symbols->lock);
+	for (unsigned int i = 0; i < symbols->cnt; i++) {
+		if (symbol__annotated(symbols->symbols[i])) {
+			up_write(&symbols->lock);
+			return false;
+		}
+	}
+
+	if (pre_delete)
+		pre_delete(ctx);
+
+	symbols__delete_locked(symbols);
+	up_write(&symbols->lock);
+	return true;
+}
+
+/*
+ * Reclaim auxiliary memory from @symbols without freeing live symbol
+ * entries (whose lifetimes are owned by the containing struct dso):
+ * - Free the secondary name-sorted index (@symbols_by_name), which is
+ *   rebuilt on demand by dso__sort_by_name().
+ * - Trim unused over-allocated tail capacity in @symbols->symbols.
+ *
+ * Returns the number of buffers reclaimed/shrunk.
+ */
+size_t symbols__shrink(struct symbols *symbols)
+{
+	size_t freed = 0;
+
+	down_write(&symbols->lock);
+
+	if (symbols->symbols_by_name) {
+		zfree(&symbols->symbols_by_name);
+		freed++;
+	}
+
+	if (symbols->cnt == 0) {
+		if (symbols->allocated > 0) {
+			zfree(&symbols->symbols);
+			symbols->sorted_cnt = 0;
+			symbols->sorted_tail_cnt = 0;
+			symbols->allocated = 0;
+			freed++;
+		}
+	} else if (symbols->cnt < symbols->allocated) {
+		struct symbol **shrunk = realloc(symbols->symbols,
+						 symbols->cnt * sizeof(struct symbol *));
+		if (shrunk) {
+			symbols->symbols = shrunk;
+			symbols->allocated = symbols->cnt;
+			freed++;
+		}
+	}
+
+	up_write(&symbols->lock);
+	return freed;
+}
+
 /*
  * Order symbols by start address only, preserving insertion order among
  * symbols sharing the same start address (matching the previous rbtree
diff --git a/tools/perf/util/symbol.h b/tools/perf/util/symbol.h
index 1aa54c1f1680..dd9be561618d 100644
--- a/tools/perf/util/symbol.h
+++ b/tools/perf/util/symbol.h
@@ -153,6 +153,9 @@ void symbol__delete(struct symbol *sym);
 void symbols__init(struct symbols *symbols);
 void symbols__exit(struct symbols *symbols);
 void symbols__delete(struct symbols *symbols);
+bool symbols__try_delete_unannotated(struct symbols *symbols,
+				     void (*pre_delete)(void *ctx), void *ctx);
+size_t symbols__shrink(struct symbols *symbols);
 void symbols__sort_read_lock(struct symbols *symbols) __acquires_shared(&symbols->lock);
 
 static inline u8 symbol__type(const struct symbol *sym)
-- 
2.56.1.831.g720f3f5937-goog

