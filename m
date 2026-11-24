Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559486;
	b=1tkDNuJeaYXb3CfeeE8Pe/rXNBGfR43Gsk++DSkLAYNmNLO1ItZvBwKvErv5A/Cgd2+l
	 yWjqVBYoKT0EONpxRypWwUEAIaTz6knxv3FsV5d3tR1pVaqqZzARFqkDVYm9fGTPM/U+k
	 dXPlYLO6+LKw3mvQVyiPzVbZG8ImqPJSUjoTSXFltTYDeJxnsNtnAuDjCL71r7GXuAAQe
	 z0G3zFKhZyl1H6IB8jlfX6rd8DlFs/qwBytshAEwyTDiIt6zFovl3jxG0wzVPLCWIH3Nk
	 12kPNpicklrxGPKfw037Z2Vh9p3oH/p0FmJUFWZMtfnUHsahMtxNCLgv2hr/k9drrzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lLNotT62feMRZ/N4UsjYkvr6GW2w99BiJ+/SI+mEyxM=;
	b=wTFYzU6Kg056AsTZMLBOOR0ZQjRxttKRj3RPXbHvrcqc+g1ij0WuAtxV/+mEXlLjVcTw
	 3VfNYl4LDv3bRzllHLKHFsgEJZ0NUNJdNeOtZpx3uTzvQz4f3/wf8A15kI93nv1pYu+WH
	 uysdJFYdoeJX4E2HjwDwJ3IEn7TTQ4R8SPVmwfNP162He9Vg/Yak7pPkMGMMpMgY/r2+3
	 VSE32gxFbGdu5s2oaqJOMfAnAw1WPS0Hvp3Q4GsKqewjcf8VBTY8Ax/lZObb3erGxF5wt
	 APlDCoUz0GUIYZKaRfXysq1JHREP9h/cADXG1HxgXybvLzHECzDIAOlMG0hFfK9sXmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B0qQMC52;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9487606A689
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9487606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=B0qQMC52
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3a348a6dbso4120927c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795559485; x=1796164285; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLNotT62feMRZ/N4UsjYkvr6GW2w99BiJ+/SI+mEyxM=;
        b=B0qQMC52VuPJ7JzWfvF39jTGdX+R2JQxh5vI2fk/pxg7dmvUAGsYvjtPr1UVFKe1Ob
         WChWki9vBG8QLo+O08AG7e1IeHCqQmZ1cU+UuO8ZZZSVDlQlfzg8c5mg0tMOg18LaQN/
         6W7eKKH1LuPHonGQdXX1fELG4UimQrwROXqlsnwtvVPD2FSzuYoiDuvbiZO1jCBgwL37
         O73FxP6V+0y8c33qRl0biUPlsViudheFAVvr/vG3ydrcHqTFzuKEaMw8fAD9e6gp3oxa
         scsFVBnDhNTNENmVSTMWAvKIhnFGq/1qqxoMN+QsT1FscXGy6LUKiqGhvnkr5ndaCSyS
         zRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559485; x=1796164285;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLNotT62feMRZ/N4UsjYkvr6GW2w99BiJ+/SI+mEyxM=;
        b=UzV0dU5GAGDPlgRGGZVVlzWHjcl1XwOPVI1YLiZ9gH5NHz4dj5/0oMSybJQvSeicod
         Oo/pcXAm3meawwnSRLUN8KxWroB3G7F2NB6qARvKGfRCYKCJ6nFMsO9+VRDxEasOaeWt
         SDeXmkiFZawxyG71OaAgC0FWtct5J63mJxi/xPFNT5VDCUio+a+VytKnyrV1fhGfwOWB
         /uPwupwCQw2nNoloadwgta1rdjbsK+6V83z++7n95fakLt/yA0LXI3UBKlVIa+hKayTz
         LZ+bee+KNXPOXbKnwyvQkB/oQRyUlOLQpsDOUU4EinpNC04DIcCmoovoBHiz4GFUQ5/m
         u3OQ==
X-Forwarded-Encrypted: i=1; AL+hErEqPGyRbfHlIutNegqq4IESiViQmK0e2w0yjcQyrgT1RySJAvbD6L17JATh2IWqzQkwia308pPoZCZA6a0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HgF9JFclub3LBwiR0PPN/Ggwyit9nYYIuGxN1aBHg+5mtD7dx
	i2ZklJ5fAUyCQGXnN41716c3exTdU3D2SNCLIpRWHQlTd70n/Ra2Cz6p9JJ1k5mQgNRCheIMYNx
	alSOb9iHb3w==
X-Received: from dleb17-n1.prod.google.com ([2002:a05:701b:4251:10b0:1a7:f7dd:f258])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea8d:b0:1a7:216d:157c
 with SMTP id a92af1059eb24-1b556902db6mr15983910c88.34.1795559484349; Tue, 24
 Nov 2026 14:31:24 -0800 (PST)
Date: Tue, 24 Nov 2026 14:31:03 -0800
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
Message-ID: <20261124223109.820609-7-irogers@google.com>
Subject: [PATCH v10 06/12] perf dso: Synchronize dso_cache access and make
 dso->loaded atomic
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Alireza Haghdoost <haghdoost@uber.com>, Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Prepare struct dso for concurrent cache and symbol shrinking:
- Split __dso_cache__free() out of dso_cache__free() with
  __must_hold(dso__lock(dso)) so rb_first() is read under dso__lock(dso),
  and hold dso__lock(dso) across __dso_cache__find() and
  dso_cache__memcpy() in dso_cache_io(), re-looking up after
  dso_cache__populate() reacquires the lock.
- Make dso->loaded an _Atomic bool accessed with acquire/release ordering,
  and avoid redundant dso__set_loaded() writes when dso__load() finds the
  DSO already loaded under dso__lock(dso).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c    | 48 +++++++++++++++++++++++++---------------
 tools/perf/util/dso.h    |  5 +++--
 tools/perf/util/symbol.c |  5 ++++-
 3 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index ab0c87d0595e..83611d7ccaff 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -3,6 +3,7 @@
 
 #include <assert.h>
 #include <errno.h>
+#include <stdatomic.h>
 #include <stdlib.h>
 
 #include <asm/bug.h>
@@ -1053,12 +1054,12 @@ static int bpf_size(struct dso *dso)
 #endif // HAVE_LIBBPF_SUPPORT
 
 static void
-dso_cache__free(struct dso *dso)
+__dso_cache__free(struct dso *dso)
+	__must_hold(dso__lock(dso))
 {
 	struct rb_root *root = &dso__data(dso)->cache;
 	struct rb_node *next = rb_first(root);
 
-	mutex_lock(dso__lock(dso));
 	while (next) {
 		struct dso_cache *cache;
 
@@ -1067,10 +1068,18 @@ dso_cache__free(struct dso *dso)
 		rb_erase(&cache->rb_node, root);
 		free(cache);
 	}
+}
+
+static void
+dso_cache__free(struct dso *dso)
+{
+	mutex_lock(dso__lock(dso));
+	__dso_cache__free(dso);
 	mutex_unlock(dso__lock(dso));
 }
 
 static struct dso_cache *__dso_cache__find(struct dso *dso, u64 offset)
+	__must_hold(dso__lock(dso))
 {
 	const struct rb_root *root = &dso__data(dso)->cache;
 	struct rb_node * const *p = &root->rb_node;
@@ -1221,27 +1230,30 @@ static struct dso_cache *dso_cache__populate(struct dso *dso,
 	return cache;
 }
 
-static struct dso_cache *dso_cache__find(struct dso *dso,
-					 struct machine *machine,
-					 u64 offset,
-					 ssize_t *ret)
-{
-	struct dso_cache *cache = __dso_cache__find(dso, offset);
-
-	return cache ? cache : dso_cache__populate(dso, machine, offset, ret);
-}
-
 static ssize_t dso_cache_io(struct dso *dso, struct machine *machine,
 			    u64 offset, u8 *data, ssize_t size, bool out)
 {
 	struct dso_cache *cache;
 	ssize_t ret = 0;
 
-	cache = dso_cache__find(dso, machine, offset, &ret);
-	if (!cache)
-		return ret;
+	mutex_lock(dso__lock(dso));
+	cache = __dso_cache__find(dso, offset);
+	while (!cache) {
+		mutex_unlock(dso__lock(dso));
+		cache = dso_cache__populate(dso, machine, offset, &ret);
+		if (!cache)
+			return ret;
+		mutex_lock(dso__lock(dso));
+		/*
+		 * Re-lookup under dso__lock(dso) in case dso__shrink() freed
+		 * the cache while the lock was dropped.
+		 */
+		cache = __dso_cache__find(dso, offset);
+	}
 
-	return dso_cache__memcpy(cache, offset, data, size, out);
+	ret = dso_cache__memcpy(cache, offset, data, size, out);
+	mutex_unlock(dso__lock(dso));
+	return ret;
 }
 
 /*
@@ -1800,7 +1812,7 @@ int dso__name_len(const struct dso *dso)
 
 bool dso__loaded(const struct dso *dso)
 {
-	return RC_CHK_ACCESS(dso)->loaded;
+	return atomic_load_explicit(&RC_CHK_ACCESS(dso)->loaded, memory_order_acquire);
 }
 
 bool dso__sorted_by_name(const struct dso *dso)
@@ -1838,7 +1850,7 @@ struct dso *dso__new_id(const char *name, const struct dso_id *id)
 		dso->binary_type = DSO_BINARY_TYPE__NOT_FOUND;
 		dso->dbginfo_type = DSO_BINARY_TYPE__NOT_FOUND;
 		dso->is_64_bit = (sizeof(void *) == 8);
-		dso->loaded = 0;
+		atomic_init(&dso->loaded, false);
 		dso->rel = 0;
 		dso->has_srcline = 1;
 		dso->a2l_fails = 1;
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 63c1b7d6f6f8..70a121fd7ecd 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -6,6 +6,7 @@
 #include <linux/types.h>
 #include <linux/rbtree.h>
 #include <sys/types.h>
+#include <stdatomic.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <linux/bitops.h>
@@ -343,7 +344,7 @@ DECLARE_RC_STRUCT(dso) {
 	u8		 is_64_bit:1;
 	u8		 bintype_searched:1;
 	u8		 debuginfo_searched:1;
-	bool		 loaded;
+	_Atomic bool	 loaded;
 	u8		 rel;
 	char		 name[];
 };
@@ -599,7 +600,7 @@ static inline enum dso_load_errno *dso__load_errno(struct dso *dso)
 
 static inline void dso__set_loaded(struct dso *dso)
 {
-	RC_CHK_ACCESS(dso)->loaded = true;
+	atomic_store_explicit(&RC_CHK_ACCESS(dso)->loaded, true, memory_order_release);
 }
 
 static inline struct mutex *dso__lock(struct dso *dso)
diff --git a/tools/perf/util/symbol.c b/tools/perf/util/symbol.c
index 10b6c847d5e9..4e80ff176914 100644
--- a/tools/perf/util/symbol.c
+++ b/tools/perf/util/symbol.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dirent.h>
 #include <errno.h>
+#include <stdatomic.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
@@ -2372,8 +2373,9 @@ int dso__load(struct dso *dso, struct map *map)
 	/* check again under the dso->lock */
 	if (dso__loaded(dso)) {
 		ret = 1;
-		goto out;
+		goto out_unlock;
 	}
+	atomic_store_explicit(&RC_CHK_ACCESS(dso)->loaded, false, memory_order_release);
 
 	kmod = dso__is_kmod(dso);
 
@@ -2531,6 +2533,7 @@ int dso__load(struct dso *dso, struct map *map)
 		ret = 0;
 out:
 	dso__set_loaded(dso);
+out_unlock:
 	mutex_unlock(dso__lock(dso));
 	nsinfo__mountns_exit(&nsc);
 
-- 
2.56.1.831.g720f3f5937-goog

