Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567902;
	b=ZT51eqskeboWsisi5ezKFfTCRDRwv0wE2kjuYzWiPTX7jOv22ALxjOYdWDWwwGSzs0Pk
	 oZAwJO/Xdzu0Xj8iz2sgR/vxm2+/iDSL6qehZS5Oplh+AvCysiqoDG/XgrkwaBIwlkbAh
	 ZX3bMtcmhL4FpeRgaie8vwnUkG21D2m4mIBP/KaU35GwXTInNY3bAgWB6bnyseMEd3YC6
	 o42P0bead6c5bJjQF7SruNTQJMeKG7lGKNdxu1o5EHGcBFOPj4UYixMuax5JA5T4pnbcq
	 ECJS09ArGk0yBifXi56wtzV5VDKVjyFMR3fjuWrPwtK4xvvEXxauEVTefUIUjFuAADg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=qfsIYHAqk55zSrPvzRyd2f2ebss7g95Wn/O2retNfX4=;
	b=ftuS2gNSdFnrPXLG/Ap7U4B8ghISna2nQyGfWkKQSIN9lx3u+lxnmQw8gj9snFQkWqrn
	 6TWbsefcN51Wys5ekfc0u9UgalWxSFRylFTrAnysgmCOhyzw9+YCNw0dQpHWP53skTUJO
	 Ht3eUaJ7aZrhEItOx/cOHCVyY706AKUmfnqzRNPuBQuAoyYIhtLgvlYgb7e3f9YKDjAoF
	 Lf609aS9wixgZ5UMdKTyGhO+2XgbJ33T5nkfJSm4EDOh7F6SUMMl2RjlMLUc0BSepXOFE
	 v7xq3OdZpGTiiR8AJxgT0ZYo8AVvZ/0VKyjsAZc0w9x8GO5rxIcxRPiKZE17JAYG70Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nx+h+i7m;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3688E606A68E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3688E606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nx+h+i7m
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b588e4bd7fso209984c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567901; x=1796172701; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfsIYHAqk55zSrPvzRyd2f2ebss7g95Wn/O2retNfX4=;
        b=Nx+h+i7mQBhiYn/UPejQzYsaGDx05XKTH6RK/3QSpzj2H5MH0W+YjqrZLjYHtuWhzZ
         a1ojG8TQQx7RZDwZ2ml5hAb0um9XMHFXxuT4oWz95reUJdvwmGlRJ3R9Iazhyrv19861
         FPNzvHcdDvgVIJOBClAoQIraB69RY4h24jnAaQfz86mfIOC0+wefoUabKLcg9pXdqE2Q
         06eNfdY3NPhaqsw6sunp6l11ZrJvMOx0azxaORI997lihJA7CqqmBF0FlB+D4jXwOiX8
         PXcCJEwzLreqWdQJTPQmQ+HOuL/fltCRsu+7/uds5l4KYyCZDLYjINJYryJ7enqIlzoU
         RRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567901; x=1796172701;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qfsIYHAqk55zSrPvzRyd2f2ebss7g95Wn/O2retNfX4=;
        b=NX+cysiS5XmyFZrnV3jYfz1j8PzGQPlHtqHI6kHumPsDlr/1LoMEV+V3KUl1Qsucel
         B/1ViZ3pUHIsW9NRi1+KGMPUbOC62P0vMCtiwA5lk01yI1wiA/m7hRYv2FxXOSVEUIfc
         TisW82X1DfdZ9cnwRboWqpiuFM450GZEfoEPrjENc/K2R4qy8iqSi+ZzmhRhuOpcjC/b
         YoKnIIjpvQmolD0LhfvoX9WHZ4nkvvgowGKcd1cfffi4a9vt1Tv390bcxOhnUnEIRq1E
         55mMTMkdd6+zKD+dYtv/L29EkuLCpgl4d+eWPThZiTW7h2l7+SuaeeSU1/DBye29pTtN
         zS2Q==
X-Forwarded-Encrypted: i=1; AL+hErFtkT8tF6MtsAJGS0cbQSeyYyrRdUoJPV77Z335d9VD4DsE0NK+GOUsKm95L1XzZdfowMgz2jd1eZlejaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z83oC1/tiqb/tGzG754V0G4vOwdGT9XuInjSFLuUzJhOZ4UNECc
	zSaDK9+6UrKqe9I9WevDICd1cd+szHbwdhmPOsMntcBwg4LXKTrlK+hd8gsWGIWQReJXvh0p1OS
	BJdijBUab0Q==
X-Received: from dlbqe9.prod.google.com ([2002:a05:7023:b89:b0:1ac:2245:a27b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4196:b0:1b2:3b5b:b80b
 with SMTP id a92af1059eb24-1b55689ee3amr25778512c88.8.1795567900877; Tue, 24
 Nov 2026 16:51:40 -0800 (PST)
Date: Tue, 24 Nov 2026 16:50:59 -0800
In-Reply-To: <20261125005108.1020003-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125005108.1020003-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125005108.1020003-11-irogers@google.com>
Subject: [PATCH v4 10/19] tools headers UAPI: Sync linux/perf_event.h for
 struct perf_build_id
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>
Cc: Athira Rajeev <atrajeev@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Leo Yan <leo.yan@linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	"Steinar H . Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Synchronize tools/include/uapi/linux/perf_event.h, define struct
perf_build_id in tools/lib/perf/include/perf/event.h (keeping the
existing anonymous build_id_size/build_id fields in struct
perf_record_mmap2 for source compatibility), and update perf tools to
use struct perf_build_id.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/uapi/linux/perf_event.h | 13 ++++++++++
 tools/lib/perf/include/perf/event.h   | 14 +++++++++--
 tools/perf/builtin-inject.c           |  3 ++-
 tools/perf/util/event.c               |  4 +--
 tools/perf/util/machine.c             |  3 ++-
 tools/perf/util/python.c              |  8 +++---
 tools/perf/util/synthetic-events.c    | 36 ++++++++++++++-------------
 7 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index c49fc76292f7..deb7c42d109b 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1099,6 +1099,18 @@ enum perf_event_type {
 	 */
 	PERF_RECORD_SAMPLE			= 9,
 
+	/*
+	 * Build IDs may be present in a number of events. They have a
+	 * consistent encoding of:
+	 *
+	 * struct perf_build_id {
+	 *	u8		size;
+	 *	u8		__reserved_1;
+	 *	u16		__reserved_2;
+	 *	u8		data[20];
+	 * };
+	 */
+
 	/*
 	 * The MMAP2 records are an augmented version of MMAP, they add
 	 * maj, min, ino numbers to be used to uniquely identify each mapping
@@ -1123,6 +1135,7 @@ enum perf_event_type {
 	 *			u16		__reserved_2;
 	 *			u8		build_id[20];
 	 *		};
+	 *		struct perf_build_id	bid;
 	 *	};
 	 *	u32				prot, flags;
 	 *	char				filename[];
diff --git a/tools/lib/perf/include/perf/event.h b/tools/lib/perf/include/perf/event.h
index fdced574c889..867dd55f0969 100644
--- a/tools/lib/perf/include/perf/event.h
+++ b/tools/lib/perf/include/perf/event.h
@@ -26,6 +26,15 @@ struct perf_record_mmap {
 	char			 filename[PATH_MAX];
 };
 
+#define PERF_BUILD_ID_SIZE 20
+
+struct perf_build_id {
+	__u8	 size;
+	__u8	 __reserved_1;
+	__u16	 __reserved_2;
+	__u8	 data[PERF_BUILD_ID_SIZE];
+};
+
 struct perf_record_mmap2 {
 	struct perf_event_header header;
 	__u32			 pid, tid;
@@ -43,8 +52,9 @@ struct perf_record_mmap2 {
 			__u8	 build_id_size;
 			__u8	 __reserved_1;
 			__u16	 __reserved_2;
-			__u8	 build_id[20];
+			__u8	 build_id[PERF_BUILD_ID_SIZE];
 		};
+		struct perf_build_id bid;
 	};
 	__u32			 prot;
 	__u32			 flags;
@@ -321,7 +331,7 @@ struct perf_record_header_build_id {
 	union {
 		__u8		 build_id[24];
 		struct {
-			__u8	 data[20];
+			__u8	 data[PERF_BUILD_ID_SIZE];
 			__u8	 size;
 			__u8	 reserved1__;
 			__u16	 reserved2__;
diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index b887a4398f96..a278c360b058 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -811,7 +811,8 @@ static int perf_event__repipe_mmap2(const struct perf_tool *tool,
 	struct dso_id id = dso_id_empty;
 
 	if (event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) {
-		build_id__init(&id.build_id, event->mmap2.build_id, event->mmap2.build_id_size);
+		build_id__init(&id.build_id, event->mmap2.bid.data,
+			       event->mmap2.bid.size);
 	} else {
 		id.maj = event->mmap2.maj;
 		id.min = event->mmap2.min;
diff --git a/tools/perf/util/event.c b/tools/perf/util/event.c
index 2f80e364659f..cefb32833da8 100644
--- a/tools/perf/util/event.c
+++ b/tools/perf/util/event.c
@@ -335,8 +335,8 @@ size_t perf_event__fprintf_mmap2(union perf_event *event, FILE *fp)
 		char sbuild_id[SBUILD_ID_SIZE];
 		struct build_id bid;
 
-		build_id__init(&bid, event->mmap2.build_id,
-			       event->mmap2.build_id_size);
+		build_id__init(&bid, event->mmap2.bid.data,
+			       event->mmap2.bid.size);
 		build_id__snprintf(&bid, sbuild_id, sizeof(sbuild_id));
 
 		return fprintf(fp, " %d/%d: [%#" PRI_lx64 "(%#" PRI_lx64 ") @ %#" PRI_lx64
diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
index 3c206c26bd62..98c7d1c03cdc 100644
--- a/tools/perf/util/machine.c
+++ b/tools/perf/util/machine.c
@@ -1831,7 +1831,8 @@ int machine__process_mmap2_event(struct machine *machine,
 		perf_event__fprintf_mmap2(event, stdout);
 
 	if (event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) {
-		build_id__init(&dso_id.build_id, event->mmap2.build_id, event->mmap2.build_id_size);
+		build_id__init(&dso_id.build_id, event->mmap2.bid.data,
+			       event->mmap2.bid.size);
 	} else {
 		dso_id.maj = event->mmap2.maj;
 		dso_id.min = event->mmap2.min;
diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
index 18dfe21104f4..cf3b0ea237d5 100644
--- a/tools/perf/util/python.c
+++ b/tools/perf/util/python.c
@@ -302,12 +302,12 @@ static PyObject *pyrf_mmap2_event__get_build_id(PyObject *self, void *closure __
 	if (!(pevent->event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID))
 		Py_RETURN_NONE;
 
-	int size = pevent->event->mmap2.build_id_size;
+	size_t size = pevent->event->mmap2.bid.size;
 
-	if (size > 20)
-		size = 20;
+	if (size > sizeof(pevent->event->mmap2.bid.data))
+		size = sizeof(pevent->event->mmap2.bid.data);
 
-	return PyBytes_FromStringAndSize((const char *)pevent->event->mmap2.build_id, size);
+	return PyBytes_FromStringAndSize((const char *)pevent->event->mmap2.bid.data, size);
 }
 
 static PyGetSetDef pyrf_mmap2_event__getset[] = {
diff --git a/tools/perf/util/synthetic-events.c b/tools/perf/util/synthetic-events.c
index 3c8d29f27fd9..57d6efe9e5f5 100644
--- a/tools/perf/util/synthetic-events.c
+++ b/tools/perf/util/synthetic-events.c
@@ -452,7 +452,7 @@ static void perf_record_mmap2__read_build_id(struct perf_record_mmap2 *event,
 	}
 
 	if (event->header.misc & PERF_RECORD_MISC_MMAP_BUILD_ID) {
-		build_id__init(&dso_id.build_id, event->build_id, event->build_id_size);
+		build_id__init(&dso_id.build_id, event->bid.data, event->bid.size);
 	} else {
 		dso_id.maj = event->maj;
 		dso_id.min = event->min;
@@ -479,11 +479,11 @@ static void perf_record_mmap2__read_build_id(struct perf_record_mmap2 *event,
 
 out:
 	if (rc == 0) {
-		memcpy(event->build_id, bid.data, sizeof(bid.data));
-		event->build_id_size = (u8) bid.size;
+		memcpy(event->bid.data, bid.data, sizeof(bid.data));
+		event->bid.size = (u8) bid.size;
 		event->header.misc |= PERF_RECORD_MISC_MMAP_BUILD_ID;
-		event->__reserved_1 = 0;
-		event->__reserved_2 = 0;
+		event->bid.__reserved_1 = 0;
+		event->bid.__reserved_2 = 0;
 
 		if (dso && !dso__has_build_id(dso))
 			dso__set_build_id(dso, &bid);
@@ -611,8 +611,10 @@ int perf_event__synthesize_mmap_events(const struct perf_tool *tool,
 		event->mmap2.prot = prot;
 		event->mmap2.flags = flags;
 
-		if (!symbol_conf.no_buildid_mmap2)
-			perf_record_mmap2__read_build_id(&event->mmap2, machine, false);
+		if (!symbol_conf.no_buildid_mmap2) {
+			perf_record_mmap2__read_build_id(&event->mmap2, machine,
+							 /*is_kernel=*/false);
+		}
 
 		if (perf_tool__process_synth_event(tool, event, machine, process) != 0) {
 			rc = -1;
@@ -807,12 +809,12 @@ static int perf_event__synthesize_modules_maps_cb(struct map *map, void *data)
 
 		/* Clear stale build ID and entire union from previous module iteration */
 		event->mmap2.header.misc &= ~PERF_RECORD_MISC_MMAP_BUILD_ID;
-		memset(event->mmap2.build_id, 0, sizeof(event->mmap2.build_id));
-		event->mmap2.build_id_size = 0;
-		event->mmap2.__reserved_1 = 0;
-		event->mmap2.__reserved_2 = 0;
+		memset(event->mmap2.bid.data, 0, sizeof(event->mmap2.bid.data));
+		event->mmap2.bid.size = 0;
+		event->mmap2.bid.__reserved_1 = 0;
+		event->mmap2.bid.__reserved_2 = 0;
 
-		perf_record_mmap2__read_build_id(&event->mmap2, args->machine, false);
+		perf_record_mmap2__read_build_id(&event->mmap2, args->machine, /*is_kernel=*/false);
 	} else {
 		const char *long_name = dso__long_name(dso);
 
@@ -1299,7 +1301,7 @@ static int __perf_event__synthesize_kernel_mmap(const struct perf_tool *tool,
 		event->mmap2.len   = map__end(map) - event->mmap.start;
 		event->mmap2.pid   = machine->pid;
 
-		perf_record_mmap2__read_build_id(&event->mmap2, machine, true);
+		perf_record_mmap2__read_build_id(&event->mmap2, machine, /*is_kernel=*/true);
 	} else {
 		size = snprintf(event->mmap.filename, sizeof(event->mmap.filename),
 				"%s%s", machine->mmap_name, kmap->ref_reloc_sym->name) + 1;
@@ -2530,10 +2532,10 @@ int perf_event__synthesize_mmap2_build_id(const struct perf_tool *tool,
 	ev.mmap2.len = len;
 	ev.mmap2.pgoff = pgoff;
 
-	ev.mmap2.build_id_size = bid->size;
-	if (ev.mmap2.build_id_size > sizeof(ev.mmap2.build_id))
-		ev.mmap2.build_id_size = sizeof(ev.mmap2.build_id);
-	memcpy(ev.mmap2.build_id, bid->data, ev.mmap2.build_id_size);
+	ev.mmap2.bid.size = bid->size;
+	if (ev.mmap2.bid.size > sizeof(ev.mmap2.bid.data))
+		ev.mmap2.bid.size = sizeof(ev.mmap2.bid.data);
+	memcpy(ev.mmap2.bid.data, bid->data, ev.mmap2.bid.size);
 
 	ev.mmap2.prot = prot;
 	ev.mmap2.flags = flags;
-- 
2.56.1.831.g720f3f5937-goog

