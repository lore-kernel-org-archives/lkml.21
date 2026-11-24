Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490974;
	b=WLJIP8KjNBG8z8yChK00dCvopmeL/NM3WT/7BIY0d485dM8CAw7imYqfSYNTNcf81Nex
	 aFGHEN5W3F1m0XuomxRkjo44RywfYVuoZ+uEfslG+pul101p4G9ySGTSekK1pHwEXngRe
	 /nkWxhsz6neQY38anj9CRVfkDn/o7UgOjMjxHqa6B41iay9Jf9YS7GXxvoTtzJAgYHA34
	 ThqLABc79iulB0pKSe1KACT3gY8C3b+KKmdcoCeQjEuNoGgnq00mC7QDfsVKS3HhXh9jG
	 SUJH0pISOiDeN3aWGSunbgkjxNP2f89qk4dHXm5pW+km/98bZShwnAeYnAC6LN4k/iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=doKNLQilCAbEqzOL1HX9YWvLFzi2eOQQRDdb7QtzQNw=;
	b=qWuFLTfi83QLSECN7QESMX3Mb5asMTEyDuaXY/BD3uWkgYpCSiuRoVK3K8A8Z3lMJIlz
	 ClomKys3PACURIOvorIGY6Wz9W/EyloWRy5Ckj8Endz7GsIuVgyl6Q1FTO4PZ67W93vMG
	 zlCn8tNH593JqzzZv8ZzGXF+IyWSjJh//FS9TC5M0v1t3eIylO/hpV0Be4vmwvNECddLZ
	 fCH11gtixt6qocgWjKCrybPsqGf/9DGV0yeIuiwDPDM9bdg7NyrwDNmqrwoqVV45mBhK+
	 dcQRPfQnYC4EzjOux6b0erwp7TTcXe8FWNyyCRVwsZYjBNanAk/CD1EBa5NEXIfb5dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dYw5DZzA;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8124606A333
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8124606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dYw5DZzA
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4ad5e0ddc90so3733480fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795490973; x=1796095773; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doKNLQilCAbEqzOL1HX9YWvLFzi2eOQQRDdb7QtzQNw=;
        b=dYw5DZzAOuJNrnkwbNF3Xd/FRJMc416qYvyBzNEC2VJ+AnHI0CCphW4OnnHkpTERya
         12JGV2DPllA7gNzVPyPj6ZuahOlYcZagsTQL0YOZuS/f/AzPHD4smWBA4SyG8XKQmGwL
         4qwCNPjt3S9BU+lO+P9Dm4jAhJxnG4ilJE2QL7v3UL57U7lP1RLnCQ01PbebxmXpzaPy
         6cn9vF4G1CezOWBs9a82nKsPzFFZHlxWG0FCr+HhWd1i/U8tDaM58KRpjV3ygX6TxAbr
         6U2aCyg5oM+t7iDYvE3FTursIalwAjOJj05j/fZHyjajNRmfT+C+f+xEaIAA3WY04YqG
         Qpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490973; x=1796095773;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=doKNLQilCAbEqzOL1HX9YWvLFzi2eOQQRDdb7QtzQNw=;
        b=dlBy4ceMDsexTDZP6F5dHyRGxzNFEq3/q70neRPCu6zIzFDA6p8Go20DqurRAqov66
         Qrq3ukcTO1VAW4MpINcugXfmhCTgNVtimisFXtWEF2ctPg7tzZYlLzTPFGf9eKn3tBbA
         JHnihBpYQWfJXRfAxJgUg6a/reFbmYCSj1T7MRdD2Rt7wVi1j4X2mX7qNEYow/MJ6qvl
         x3yPeZ6lkmQ7lqCO/wQ5KPFHI8Um7HPO/+6Lb6ChGUh772082ysB1KypHIkEdiTorcng
         tgicX+cq4tOOB0xOJ2pq+QiSke1IwytHv5oRPETbi+3gIblKtRdAUhEUQ8WJGx2XRYv3
         1ZiA==
X-Forwarded-Encrypted: i=1; AL+hErHIXANSSwFeFAhb5lBoOpcNuWTInuT5JQUWgFV6/yZ6z6RB2Iz8eWpjy/78d+geaofYXliB6dfhYILzTw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8EyL1C1llF1f2Fl/XrTfTRLm9JoACtuH71NQ8DackWNho4a0+
	66oP3hyL4Z+Gs/U5hw6+V36MJXklyXu17ki91l25Qw2AiCGskfAw/nopf4XnCqleWglNaRXKEGF
	xaZEbx7LV0w==
X-Received: from oaos11-n2.prod.google.com ([2002:a05:6871:854b:20b0:4a4:2256:e2bd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:e0c9:b0:4a7:1d66:1463
 with SMTP id 586e51a60fabf-4bc83d532bbmr13034002fac.35.1795490972331; Mon, 23
 Nov 2026 19:29:32 -0800 (PST)
Date: Mon, 23 Nov 2026 19:28:57 -0800
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
Message-ID: <20261124032902.3859564-7-irogers@google.com>
Subject: [PATCH v9 06/11] perf symbol: Add symbols__shrink() and symbols__try_delete_unannotated()
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
index f1abe3333ac0..1bcc36e011fc 100644
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
2.56.1.809.ga0b61035b5-goog

