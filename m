Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244351;
	b=jYO4JPaNc/zfjhUKJui8QOaw05XHnCrKpNPudWXpUfHerB24cymaPkL0C8akimNSLtcR
	 D1q26+1a3DRdEqSMVPY2EjyqTWQrMZF7cBE9+v0a5PRuHqB7/TFaFbnrY1lqR4QChhpah
	 jt/1pqqZtVLGmueeaWxE3GJnq2SdWAok1z2+fK0GW+PvnadMlO0eedSv82P+ojrGfV6H/
	 XfXC4fsFI+t1Jf5R7GjN9O57EIpFEyUOOk0eYUDzlHLsNtJicPNPTdJM7qJSzJTBSl8K2
	 uGEc3pC62IQGIiW/rfIw1XxouYHbznhqq3Ohmb5YsljeNpC4QsHEvhBGiwIfircoRCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=P9WzhWBRrWQrIcjhCHBoP+WxUKv4PUHF+mxNCkzIjdk=;
	b=jXAMjxcT10EFXqpkLa4L83O6F5vQYPYOfzlWRrGRxa+2yp4kHX7/gW5O9fS79ED89xD4
	 OCzEF8mhdNJawPUkW+DpetlXb/NuHU03euzStVZHYl/ZWFf7pR/ZtYXMHc+V2YrKQDARS
	 6zn/ybnDcgGlJGytT1HZcb1Vn9ZTK9MnOcncCHEI4k+Rf8tc2MJiiSoTrZIfH13YVSOZX
	 o+9jCJPekymtuZVCrApVGNkvwKJGmGYyipgnDdJUrewWbEDP/jpQIaCv5QN7XFa+lrVCU
	 PJxH00zc5/wmridyLeAL515tanRAUr/Qft5OuiwydC6xKdWi/daFugIu5Ejd6e+OROw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMFaAJ9U;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED2F606A33E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED2F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMFaAJ9U
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so4490240c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244350; x=1795849150; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9WzhWBRrWQrIcjhCHBoP+WxUKv4PUHF+mxNCkzIjdk=;
        b=JMFaAJ9UDdrFu7kK3ifn7SvkIur/tvz54q/5r7LPgFg30ME+IRMKlljUS6KRFlkIWm
         uchbq1xK0IUMiEVjvvColqrHuhnymmR0wNrBzpGkiwg7iWWXGayH+2rdrhDtiLwmw/Yf
         MwOwjbhbSIzAF6fVQAlZyHNHFe2wihb+lV2lxw4NV6x0dIHGbz/Cw7PTEKip7piqScv4
         OkV58ZQHyEepmgQrPqLf7SxjcHxZnl4a4zbRg8qu9vPlRYWJ9AmuYNtL7tr+ugCMV55u
         OblrAoU+eowRLb5kAxEa38bK82CuahvDBnxU7QZppQ/HqRlzmRdbJ8LpX4aBzvxw1r7m
         3W/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244350; x=1795849150;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9WzhWBRrWQrIcjhCHBoP+WxUKv4PUHF+mxNCkzIjdk=;
        b=djraRIkRRH98nPJO8M+nagPvqsgoSqmMugxVWllWyMZ2oizfpl+lwJ/VbBkCAlb1rV
         dQXTJDJGZAuKrEooqjPK/dpQoHPyFMfl/VK8lIBCpBAypCbF/U8oOrih0vvKUpC6FdUa
         ePt2cwaKHqBgUJ8tdSUZdroS79TQlLL85VSmQR3z9q18pbxVt9Qwo66e+uA6wdJKv5ow
         SmziL5ofbJcPVrRRztCDEWSryXvF5fFg+QcRJv6R49vZuK0otfE+R4yzl+Gj3HUi2kmz
         93T9KmJXGNN+iXo6qt4ZO7Z3b2cxVOFI6rRYVmyq79v9pBDZUAApFAFb8Z0hTK75c71F
         Twcw==
X-Forwarded-Encrypted: i=1; AL+hErFi0ilN+qmX2LUEqD4gXy3Aeq+Gi3/OdGf29fBfze99hA66CzQW9DEiOCKk3h4gNoiPAOfpRWZ1toHFAks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LBajfxIAEPG4vwkM47rbzMglksq/uJ5sApyG18c8/fdz2nWoh
	fYOvFm1Dw1c5rYKNnbWaaexkLGf5KyNUnRMlWgtL2GEEhkboONfHy48l8tKf3ZCj1rOii+K94z/
	oV6F1tRk+JA==
X-Received: from dlx1.prod.google.com ([2002:a05:7022:81:b0:1a7:450c:8b47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4502:10b0:1b2:539b:496c
 with SMTP id a92af1059eb24-1b5569050c8mr5961784c88.35.1795244349476; Fri, 20
 Nov 2026 22:59:09 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:59 -0800
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
Message-ID: <20261121065813.4143649-11-irogers@google.com>
Subject: [PATCH v15 10/23] perf dso: Pass dso_data to close_data_fd() and dso__list_del()
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

close_data_fd() and dso__list_del() only operate on struct dso_data
fields, while close_first_dso() retrieves a struct dso_data * from
dso__data_open. Pass struct dso_data * directly to close_data_fd() and
dso__list_del() so close_first_dso() does not need to recover a
struct dso * from struct dso_data *.

This removes the REFCNT_CHECKING dso pointer from struct dso_data and
avoids dropping _dso__data_open_lock in dso__list_del() to call
dso__put(), preventing lock-order inversions and races during EMFILE
eviction.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c | 44 ++++++++++++-------------------------------
 tools/perf/util/dso.h |  3 ---
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 3975b6c935a0..3d0ed7b0be54 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "dso.h"
 
+#include <assert.h>
 #include <errno.h>
 #include <stdlib.h>
 
@@ -544,22 +545,14 @@ static struct mutex *dso__data_open_lock(void) __returns_ctx_lock(&_dso__data_op
 static void dso__list_add(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
 	list_add_tail(&dso__data(dso)->open_entry, &dso__data_open);
-#ifdef REFCNT_CHECKING
-	dso__data(dso)->dso = dso__get(dso);
-#endif
-	/* Assume the dso is part of dsos, hence the optional reference count above. */
+	/* Assume the dso is part of dsos, holding it live while on dso__data_open. */
 	assert(dso__dsos(dso));
 	dso__data_open_cnt++;
 }
 
-static void dso__list_del(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void dso__list_del(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	list_del_init(&dso__data(dso)->open_entry);
-#ifdef REFCNT_CHECKING
-	mutex_unlock(dso__data_open_lock());
-	dso__put(dso__data(dso)->dso);
-	mutex_lock(dso__data_open_lock());
-#endif
+	list_del_init(&dso_data->open_entry);
 	WARN_ONCE(dso__data_open_cnt <= 0,
 		  "DSO data fd counter out of bounds.");
 	dso__data_open_cnt--;
@@ -729,13 +722,13 @@ static int open_dso(struct dso *dso, struct machine *machine)
 	return fd;
 }
 
-static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
+static void close_data_fd(struct dso_data *dso_data) __must_hold(&_dso__data_open_lock)
 {
-	if (dso__data(dso)->fd >= 0) {
-		close(dso__data(dso)->fd);
-		dso__data(dso)->fd = -1;
-		dso__data(dso)->file_size = 0;
-		dso__list_del(dso);
+	if (dso_data->fd >= 0) {
+		close(dso_data->fd);
+		dso_data->fd = -1;
+		dso_data->file_size = 0;
+		dso__list_del(dso_data);
 	}
 }
 
@@ -748,21 +741,15 @@ static void close_data_fd(struct dso *dso) __must_hold(&_dso__data_open_lock)
  */
 static void close_dso(struct dso *dso) __must_hold(&_dso__data_open_lock)
 {
-	close_data_fd(dso);
+	close_data_fd(dso__data(dso));
 }
 
 static void close_first_dso(void) __must_hold(&_dso__data_open_lock)
 {
 	struct dso_data *dso_data;
-	struct dso *dso;
 
 	dso_data = list_first_entry(&dso__data_open, struct dso_data, open_entry);
-#ifdef REFCNT_CHECKING
-	dso = dso_data->dso;
-#else
-	dso = container_of(dso_data, struct dso, data);
-#endif
-	close_dso(dso);
+	close_data_fd(dso_data);
 }
 
 static rlim_t get_fd_limit(void)
@@ -1858,9 +1845,6 @@ struct dso *dso__new_id(const char *name, const struct dso_id *id)
 		data->fd = -1;
 		data->status = DSO_DATA_STATUS_UNKNOWN;
 		INIT_LIST_HEAD(&data->open_entry);
-#ifdef REFCNT_CHECKING
-		data->dso = NULL; /* Set when on the open_entry list. */
-#endif
 	}
 	return res;
 }
@@ -1918,10 +1902,6 @@ struct dso *dso__get(struct dso *dso)
 
 void dso__put(struct dso *dso)
 {
-#ifdef REFCNT_CHECKING
-	if (dso && dso__data(dso) && refcount_read(&RC_CHK_ACCESS(dso)->refcnt) == 2)
-		dso__data_close(dso);
-#endif
 	if (dso && refcount_dec_and_test(&RC_CHK_ACCESS(dso)->refcnt))
 		dso__delete(dso);
 	else
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 009bd3001ace..a5e8d195f129 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -261,9 +261,6 @@ struct dso_cache {
 struct dso_data {
 	struct rb_root	 cache;
 	struct list_head open_entry;
-#ifdef REFCNT_CHECKING
-	struct dso	 *dso;
-#endif
 	int		 fd;
 	int		 status;
 	u32		 status_seen;
-- 
2.56.1.750.gf70dc682cf-goog

