Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941359;
	b=0882KWLCplkzZN2Zzyd4x5K8RAoRxDOyMu90zK/iODVY1Ar+L5QPAf8VOD91Zgj48LgP
	 O1MKrWlHCio33TBEMuXWuGaFZnBCo4rRgcV8nPAGxNO+jzbDN2uhgwypXp0VdomyLwtdQ
	 lEoAdBwXguZHhXIXCyQvhovyWGV917m4AlwLHa5jirCKAiVFgMQ2U4J0+De7zoMPXtqFg
	 7xPnFWFRj90d2ppeCn8i+933+BfnB7JDAr/pc5xWjKNwPfVmARVD+VFQ5tI4z0svCrbxi
	 W/Tv9bUkQm3IhuEUMG++aAZOj+4/LW7QScmCWkPuM7j6hJ52HwPlyv/fMwihoBruvHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=62z/VlGVHaKO8QRbOL3odF4Lg0oOU7m2/hlIIPvhmuA=;
	b=c4waHdSJRwyEQ4yOxJgY7n5ptydydtbs2eIDrDxY0cc4GPzxE6ikTaA/3gqp+U9nAZsS
	 JEJcuxgYhPxw0YGyB+3Qjad8UEUJ+UurF66if5iS+msycjvEmJ4fy0ORjmqiNOrWaw2LS
	 PpxPMxPCyJ7ScJ5VgG27KgbCgUo6ZuUtcoPEvN+7hERyHkaoCyi2G8tHEXvTKNhqmeQQW
	 vHtvwyVI+58LFm6oBey7+NMwXx8NWeb7O6Zs0RFKY+OFysiOUy82JTDJZPrckVl2IPZmW
	 BAiMAYcej6enge9bAjS7/Y65Eh5iqII5Hu/siq0bmh17Q5LJq4AzzBJrm7lyk7r9bjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pdHovzjC;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55496606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55496606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pdHovzjC
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so125192c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941358; x=1795546158; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62z/VlGVHaKO8QRbOL3odF4Lg0oOU7m2/hlIIPvhmuA=;
        b=pdHovzjCWcPU5nojlh3bzyZJVMleggRi4PDyNf4LgHrAb2jGlXoGp+tHTV69fLVRfG
         tASLIW3TCQZ9XxhVTEbN0Z3j8qOHZjbPMbqpHtnzchfeGEVqBCDYTh+uySNVuA1qpi0x
         AH9kmuDXQvpDmJd2GWq5E7wXHbakmQ5dZy+PNq8swML+tm/UdcrmhdVTwydv2gQgHjVw
         BK3vMjE1DUxbJCCh/Hn6TDunhRttRCCjZlU9zi5udT+QqDGq1DjvMdg8EzOaUC5JIop8
         YC+jV0n8JxyY84pZ9BsKgZpix9YeKMlTcKT2JsBU0F6IOTEnqWzhG1ObEEkMzexgDl7G
         Pjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941358; x=1795546158;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=62z/VlGVHaKO8QRbOL3odF4Lg0oOU7m2/hlIIPvhmuA=;
        b=YBeF1yLRG0IrMM91lZL1xoJPw5Y++eRZ29FdWNJWRHblhtuQetpq9+bXSDZ0nijXx6
         Hnhtf6Z/pcJVxs4OxcNSSRtVOQTZzjgwlc7IxzEpCyH8kSIrUlfEwnDjMjvF5Csp/76b
         i6HSY5DTnEhqenChK6Bve+YgB3BtnpqnFg9erMRzIn5oJ6XdnaAMpVmE8puYxl3Hjmd3
         mbeZlarlm85klZNo1rQJ1TA/OWx1AIZwHRII1FPdJeZ9KO+ONbg9Z/fBHtzEfsO50KY8
         bupmldUMON7xe9U4dzDSaC8lds4GXuVcFfAV1syP/SDLYcLzJeCD4qMDbKPVW9KJLEdO
         sb5A==
X-Forwarded-Encrypted: i=1; AL+hErERqQbbuLm1bZCDpOCHH5yW470TCYx3nnFLPSG8rAZdTjSw9Su9ZCaWaW7Mleea/FAEfWXtQxUGo/yX3gE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K9Zs+65Yr7JF1+e3XyqLWGdzxu7sfR3MWTWb6fSBXe3yiAUev
	M0g9lY9D7NnYpd3+1mBDeO8YUP0Cl0ExWUFq4hFp54y/A2FR3ZmD5tRypVbp7nfzTJDwshw31PE
	hXQd5nmElnA==
X-Received: from dlbur7-n2.prod.google.com ([2002:a05:7022:ea47:20b0:1b3:b4d2:9bba])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:455a:10b0:1a9:d04f:1b55
 with SMTP id a92af1059eb24-1b543cebbc1mr403105c88.26.1794941358056; Tue, 17
 Nov 2026 10:49:18 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:28 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-8-irogers@google.com>
Subject: [PATCH v14 07/23] perf vdso: Fix unlocked __dsos__add() and race in __machine__addnew_vdso()
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

__machine__addnew_vdso() called __dsos__add(&machine->dsos, dso) without
holding machine->dsos.lock, and machine__findnew_vdso() and
__machine__findnew_compat() initialized machine->vdso_info and created
temporary VDSO files without synchronization. Acquire
machine->dsos.lock in write mode across machine->vdso_info
initialization, duplicate checking via __dsos__find(), temporary file
creation, dso__set_long_name(), and __dsos__add().

Fixes: f649ed80f3ca ("perf dsos: Tidy reference counting and locking")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dsos.c |  8 ++++++-
 tools/perf/util/dsos.h |  2 ++
 tools/perf/util/vdso.c | 52 +++++++++++++++++++++++++++---------------
 3 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/tools/perf/util/dsos.c b/tools/perf/util/dsos.c
index a2cd37bd1660..1574c8885d78 100644
--- a/tools/perf/util/dsos.c
+++ b/tools/perf/util/dsos.c
@@ -284,12 +284,18 @@ static struct dso *__dsos__find_id(struct dsos *dsos, const char *name, const st
 	return res;
 }
 
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock)
+{
+	return __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, write_locked);
+}
+
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short)
 {
 	struct dso *res;
 
 	down_read(&dsos->lock);
-	res = __dsos__find_id(dsos, name, &dso_id_empty, cmp_short, /*write_locked=*/false);
+	res = __dsos__find(dsos, name, cmp_short, /*write_locked=*/false);
 	up_read(&dsos->lock);
 	return res;
 }
diff --git a/tools/perf/util/dsos.h b/tools/perf/util/dsos.h
index a26774950866..dbd06f420753 100644
--- a/tools/perf/util/dsos.h
+++ b/tools/perf/util/dsos.h
@@ -30,6 +30,8 @@ void dsos__exit(struct dsos *dsos);
 
 int __dsos__add(struct dsos *dsos, struct dso *dso);
 int dsos__add(struct dsos *dsos, struct dso *dso);
+struct dso *__dsos__find(struct dsos *dsos, const char *name, bool cmp_short, bool write_locked)
+	__must_hold_shared(&dsos->lock);
 struct dso *dsos__find(struct dsos *dsos, const char *name, bool cmp_short);
 
 struct dso *dsos__findnew_id(struct dsos *dsos, const char *name, const struct dso_id *id);
diff --git a/tools/perf/util/vdso.c b/tools/perf/util/vdso.c
index 7f2dde70f3e4..8bf81e2c9e78 100644
--- a/tools/perf/util/vdso.c
+++ b/tools/perf/util/vdso.c
@@ -131,8 +131,13 @@ static struct dso *__machine__addnew_vdso(struct machine *machine, const char *s
 
 	dso = dso__new(short_name);
 	if (dso != NULL) {
-		__dsos__add(&machine->dsos, dso);
+		/*
+		 * Set the long name before adding to machine->dsos so that
+		 * __dsos__add() inserts it in sorted order without needing to
+		 * re-take machine->dsos.lock.
+		 */
 		dso__set_long_name(dso, long_name, false);
+		__dsos__add(&machine->dsos, dso);
 	}
 
 	return dso;
@@ -250,15 +255,19 @@ static struct dso *__machine__findnew_compat(struct machine *machine,
 	const char *file_name;
 	struct dso *dso;
 
-	dso = dsos__find(&machine->dsos, vdso_file->dso_name, true);
+	down_write(&machine->dsos.lock);
+	dso = __dsos__find(&machine->dsos, vdso_file->dso_name, true, /*write_locked=*/true);
 	if (dso)
-		return dso;
+		goto out_unlock;
 
 	file_name = vdso__get_compat_file(vdso_file);
 	if (!file_name)
-		return NULL;
+		goto out_unlock;
 
-	return __machine__addnew_vdso(machine, vdso_file->dso_name, file_name);
+	dso = __machine__addnew_vdso(machine, vdso_file->dso_name, file_name);
+out_unlock:
+	up_write(&machine->dsos.lock);
+	return dso;
 }
 
 static int __machine__findnew_vdso_compat(struct machine *machine,
@@ -332,33 +341,38 @@ struct dso *machine__findnew_vdso(struct machine *machine,
 {
 	struct vdso_info *vdso_info;
 	struct dso *dso = NULL;
-	char *file;
+	const char *file;
 
+	dso = machine__find_vdso(machine, thread);
+	if (dso)
+		return dso;
+
+	down_write(&machine->dsos.lock);
 	if (!machine->vdso_info)
 		machine->vdso_info = vdso_info__new();
 
 	vdso_info = machine->vdso_info;
-	if (!vdso_info)
+	if (!vdso_info) {
+		up_write(&machine->dsos.lock);
 		return NULL;
-
-	dso = machine__find_vdso(machine, thread);
-	if (dso)
-		return dso;
+	}
 
 #if BITS_PER_LONG == 64
+	up_write(&machine->dsos.lock);
 	if (__machine__findnew_vdso_compat(machine, thread, vdso_info, &dso))
 		return dso;
+	down_write(&machine->dsos.lock);
 #endif
 
-	dso = dsos__find(&machine->dsos, DSO__NAME_VDSO, true);
-	if (dso)
-		return dso;
-
-	file = get_file(&vdso_info->vdso);
-	if (!file)
-		return NULL;
+	dso = __dsos__find(&machine->dsos, DSO__NAME_VDSO, true, /*write_locked=*/true);
+	if (!dso) {
+		file = get_file(&vdso_info->vdso);
+		if (file)
+			dso = __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
+	}
+	up_write(&machine->dsos.lock);
 
-	return __machine__addnew_vdso(machine, DSO__NAME_VDSO, file);
+	return dso;
 }
 
 bool dso__is_vdso(const struct dso *dso)
-- 
2.56.1.703.gf848ed807c-goog

