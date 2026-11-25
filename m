Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567894;
	b=eh3PyFUzx4wM9a8yIF4TijVIAp5vrOFypQ/v3q3BAU0099UN8QATae8Tx37djCPcVxF4
	 UBzuLsDQ6h0w/OhLxV3Yih+x03OFxmQa/bnEbZ/TEUmpgHRogER8KHg9uXfOQlbzACyO2
	 fk0ENLmTj/g+n5XFXhnsML2WVrbFBTOC/JzyfSk/TQJyEiKsZEEki9wWcwOojk8BwFBW0
	 R/gj7/IIlxwLv7Wxh4NEfOGzYLV7XFm48Whau6cYPwxEJ0/FSZj3YmtPlL3EVzqc9+Ydo
	 sk3QOUqep+9SqiKK1NYsyJltr/Lywg4uclKocPobiU9MBa/jVArMlQfFapaZlmaIgAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iJ+wF794p2A/EGvImxHKERFFUlDWeMP8TVysWdw6fAM=;
	b=r8deuJmgAf5P+yuoh4HPbbF5aR7bzCosKnDkartM2HcC7aYy8RuCf3HjRe2SKBei23UZ
	 SjAbqFDkTQ3ru7JRpqv/nKmz5iWn1kmKmdAvenBZRB5Qq+beVr8CahiixHNlHpQSngA4U
	 kymYR0CIq6Ldkv1XTgQqboV6F5trc3Nma6aBLM9oVDrUBMeBb5hWLHP/vCKToM1VRs/ON
	 16nN20rrToBg/z2X9HmTQpPhraJ1Xr1vWtK2YxaZ4V5ZNbWFi0R9MeK6ViqpsJlAxrwVw
	 L0IJUmmsqsq4abOm6K+arEpZqPmST16zY+5heZL4+GItDeqVjolamSbDEibBlPb9HnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="o13c0Q/w";
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48D3606A699
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A48D3606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o13c0Q/w
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b53bfc9534so1913712c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567893; x=1796172693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJ+wF794p2A/EGvImxHKERFFUlDWeMP8TVysWdw6fAM=;
        b=o13c0Q/wP4AEDZEuY1ydjCySi0UFjUjjEq7N/gjuhMbnJ/Hw/HDi0S8+wPtAT7OYsQ
         bOFyxdDr/puwFgN5d2Y4u1DL31Gu31eN6EX+O5pxQY8M7MNNOLWKg24YI0PzTwalCcjg
         yIPHCeTbXDh/vVDNN1J6wy2UzU8mWB6ocIIXmHgFHHzCgoNuMqoqxTTg1bGUvuWgWZvd
         KEPctde8lUxTYw1/CBQt95y3NoA/f+fCqCVm5ZPSdl83mWbvrl0fzh3eyi6pnUqVHk4k
         Fo1H+e0Vx7s59xxNqCmlYaXwGfzYNj+FPVMJYCOm5P6fWWqX1XwBl80FiJrmzU2eXrvz
         IbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567893; x=1796172693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJ+wF794p2A/EGvImxHKERFFUlDWeMP8TVysWdw6fAM=;
        b=gO+GTI0y7TucDGTsKpnp4MKblBxOS1eoNlqiOqW0j5QErLWZNVstHZxbNekqamSjrY
         VkUfEmKsttDqKI8oHOm3GBkL5dBcWG7+gLCgQkhHZVb7PdXjF41pbGb17rr8j9p/XivL
         xlgMl5yojNNGdTFp2HuKYufbIyJVAYFTMIVNrydd/7sybJZfmd/6vxixLu5CvRIkN2KP
         MZOTgASaMQ0Pcs9p1hVhZzwEa46JiwXmwSLnGmwYFX1pbSf4YyD6r1gHxq/Fw2sKIGH3
         mfcYB3MpVisuOSa0gHct9xR6HeMXnyXg3+iElwTc3qPG7eceniNPRF9PBdHEOOfSXE6T
         qC4Q==
X-Forwarded-Encrypted: i=1; AL+hErFOAFoQfMgkfw1MclD3hLgsq2jQlwNv5vC83u9/z5nnUxYC7r1nUcbnWnmyjMSnC7fmTHHsVatb2bHW5Z4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UrNnKxA12uEXTLQA86nTcTUK8CJS3cUVaimFBALS87mjigJVu
	QtX31P7xth/YLyLosWkOxOGzWoHjnXJwhjUclKaetsND7pgYW/JjeGz75crPfFEwarc1gPDEQSp
	0D1b5K1tnPQ==
X-Received: from dlbek14.prod.google.com ([2002:a05:7022:c8e:b0:1b3:ba1e:2c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:450f:10b0:1b5:22fb:848d
 with SMTP id a92af1059eb24-1b56f87ae7cmr9060530c88.16.1795567892501; Tue, 24
 Nov 2026 16:51:32 -0800 (PST)
Date: Tue, 24 Nov 2026 16:50:55 -0800
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
Message-ID: <20261125005108.1020003-7-irogers@google.com>
Subject: [PATCH v4 06/19] perf/core: Support deferred unwinding for
 BUILD_ID_OFFSET sample types
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

When attr.defer_callchain is set on events using
PERF_SAMPLE_BUILD_ID_OFFSET or PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET,
request a deferred user-space unwind via unwind_deferred_request() and
emit a PERF_CONTEXT_USER_DEFERRED marker and cookie in the sample.

In the faultable task_work callback (perf_unwind_deferred_callback()),
resolve the unwound user IPs to build IDs and file offsets using
stack_map_get_build_id_offset(..., may_fault=true), encode them into the
compressed build ID + offset format, and emit
PERF_RECORD_CALLCHAIN_DEFERRED with PERF_RECORD_MISC_MMAP_BUILD_ID set.

Suggested-by: Namhyung Kim <namhyung@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/events/core.c | 175 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 164 insertions(+), 11 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2a6ab82d617e..c519b46a1a2f 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -460,6 +460,8 @@ static atomic_t nr_bpf_events __read_mostly;
 static atomic_t nr_cgroup_events __read_mostly;
 static atomic_t nr_text_poke_events __read_mostly;
 static atomic_t nr_build_id_events __read_mostly;
+static atomic_t nr_defer_output_build_id_events __read_mostly;
+static atomic_t nr_defer_output_callchain_build_id_events __read_mostly;
 
 static LIST_HEAD(pmus);
 static DEFINE_MUTEX(pmus_lock);
@@ -5637,6 +5639,25 @@ static void detach_perf_ctx_data(struct perf_event *event)
 	}
 }
 
+static bool has_defer_output_callchain_build_id_offset(const struct perf_event *event)
+{
+	return event->attr.defer_output &&
+	       (event->attr.sample_type & PERF_SAMPLE_CALLCHAIN_BUILD_ID_OFFSET) &&
+	       !(event->attr.sample_type & PERF_SAMPLE_CALLCHAIN) &&
+	       !event->attr.exclude_callchain_user;
+}
+
+static bool has_defer_output_build_id_offset(const struct perf_event *event)
+{
+	if (!event->attr.defer_output)
+		return false;
+	if (has_defer_output_callchain_build_id_offset(event))
+		return true;
+	return (event->attr.sample_type & PERF_SAMPLE_BUILD_ID_OFFSET) &&
+	       (!(event->attr.sample_type & PERF_SAMPLE_CALLCHAIN) ||
+		event->attr.exclude_callchain_user);
+}
+
 static void unaccount_event(struct perf_event *event)
 {
 	bool dec = false;
@@ -5650,6 +5671,10 @@ static void unaccount_event(struct perf_event *event)
 		atomic_dec(&nr_mmap_events);
 	if (event->attr.build_id)
 		atomic_dec(&nr_build_id_events);
+	if (has_defer_output_build_id_offset(event))
+		atomic_dec(&nr_defer_output_build_id_events);
+	if (has_defer_output_callchain_build_id_offset(event))
+		atomic_dec(&nr_defer_output_callchain_build_id_events);
 	if (event->attr.comm)
 		atomic_dec(&nr_comm_events);
 	if (event->attr.namespaces)
@@ -8400,6 +8425,8 @@ static void perf_output_read(struct perf_output_handle *handle,
 		perf_output_read_one(handle, event, enabled, running);
 }
 
+static struct unwind_work perf_unwind_work;
+
 static void perf_bpf_to_sample_bid_offset(struct bpf_stack_build_id *bpf_bid)
 {
 	struct perf_sample_build_id_offset *bid = (void *)bpf_bid;
@@ -8435,7 +8462,28 @@ static void perf_output_sample_build_id(struct perf_output_handle *handle,
 		       PERF_RECORD_MISC_USER;
 
 	if (sample_bid) {
-		if (is_user && has_user_ctx) {
+		u64 defer_cookie = 0;
+		bool defer_user = IS_ENABLED(CONFIG_UNWIND_USER) &&
+				  is_user && has_user_ctx &&
+				  event->attr.defer_callchain &&
+				  (!(sample_type & PERF_SAMPLE_CALLCHAIN) ||
+				   event->attr.exclude_callchain_user) &&
+				  data->ip == instruction_pointer(task_pt_regs(current));
+
+		if (defer_user &&
+		    unwind_deferred_request(&perf_unwind_work, &defer_cookie) < 0)
+			defer_cookie = 0;
+
+		if (defer_cookie) {
+			u64 deferred_bid[4] = {
+				0,
+				PERF_CONTEXT_USER_DEFERRED,
+				defer_cookie,
+				data->ip,
+			};
+
+			perf_output_put(handle, deferred_bid);
+		} else if (is_user && has_user_ctx) {
 			if (callchain_bid && data->callchain_build_id &&
 			    data->callchain_build_id->has_ip_bid) {
 				perf_output_put(handle,
@@ -8812,8 +8860,6 @@ static u64 perf_get_page_size(unsigned long addr)
 
 static struct perf_callchain_entry __empty_callchain = { .nr = 0, };
 
-static struct unwind_work perf_unwind_work;
-
 struct perf_callchain_entry *
 perf_callchain(struct perf_event *event, struct pt_regs *regs)
 {
@@ -10635,34 +10681,117 @@ void perf_event_bpf_event(struct bpf_prog *prog,
 
 struct perf_callchain_deferred_event {
 	struct unwind_stacktrace *trace;
+	struct perf_callchain_build_id_entry *bid_entry;
 	struct {
 		struct perf_event_header	header;
 		u64				cookie;
 	} event;
 };
 
+static struct perf_callchain_build_id_entry *
+perf_resolve_build_id_offsets(struct unwind_stacktrace *trace)
+{
+	struct perf_callchain_build_id_entry *entry;
+	struct bpf_stack_build_id *bpf_bids;
+	u16 nr = trace->nr;
+	u32 max_size;
+
+	if (!nr || !current->mm ||
+	    !atomic_read(&nr_defer_output_build_id_events))
+		return NULL;
+
+	if (!atomic_read(&nr_defer_output_callchain_build_id_events))
+		nr = 1;
+
+	entry = kzalloc(sizeof(*entry) + nr * sizeof(u64), GFP_KERNEL);
+	if (!entry)
+		return NULL;
+
+	bpf_bids = kcalloc(nr, sizeof(*bpf_bids), GFP_KERNEL);
+	if (!bpf_bids) {
+		kfree(entry);
+		return NULL;
+	}
+
+	for (u16 i = 0; i < nr; i++) {
+		entry->offsets[i] = trace->entries[i];
+		bpf_bids[i].ip = trace->entries[i];
+	}
+
+	stack_map_get_build_id_offset(bpf_bids, nr, true, true);
+
+	max_size = round_down(U16_MAX - sizeof(struct perf_event_header) -
+			      2 * sizeof(u64), sizeof(u64));
+	perf_callchain_encode_build_ids(entry, entry->offsets, nr, 0,
+					bpf_bids, nr, max_size);
+	kfree(bpf_bids);
+	return entry;
+}
+
 static void perf_callchain_deferred_output(struct perf_event *event, void *data)
 {
 	struct perf_callchain_deferred_event *deferred_event = data;
+	struct perf_callchain_build_id_entry *bid_entry = deferred_event->bid_entry;
 	struct perf_output_handle handle;
 	struct perf_sample_data sample __uninitialized; /* optimization */
 	u64 nr = deferred_event->trace->nr;
-	u16 size, id_size, max_payload;
+	u32 max_offsets = 0, nr_build_ids = 0, nr_offsets = 0;
+	u32 raw_bids_len = 0, aligned_bids_len = 0;
+	bool use_bid;
+	u16 size, misc, id_size, max_payload;
 	int ret;
 
 	if (!event->attr.defer_output)
 		return;
 
+	use_bid = has_defer_output_build_id_offset(event);
+	if (use_bid && bid_entry) {
+		if (has_defer_output_callchain_build_id_offset(event))
+			max_offsets = bid_entry->nr_offsets;
+		else
+			max_offsets = min_t(u32, bid_entry->nr_offsets, 1);
+	}
+
 	id_size = event->attr.sample_id_all ? event->id_header_size : 0;
 	max_payload = round_down(U16_MAX - sizeof(deferred_event->event) -
 				 sizeof(u64) - id_size, sizeof(u64));
-	nr = min_t(u64, nr, max_payload / sizeof(u64));
-	size = sizeof(deferred_event->event) + sizeof(u64) + nr * sizeof(u64);
+
+	if (use_bid) {
+		for (u32 i = 0; i < max_offsets; i++) {
+			u8 bid_idx = bid_entry->offsets[i] >> 56;
+			u32 next_nr_bids = nr_build_ids;
+			u32 next_raw_len = raw_bids_len;
+			u32 next_aligned_len;
+
+			if (bid_idx > 0 && bid_idx <= bid_entry->nr_build_ids &&
+			    bid_idx > next_nr_bids) {
+				next_nr_bids = bid_idx;
+				next_raw_len = next_nr_bids *
+					       (1 + BUILD_ID_SIZE_MAX);
+			}
+			next_aligned_len = ALIGN(next_raw_len, sizeof(u64));
+			if (next_aligned_len + (i + 1) * sizeof(u64) > max_payload)
+				break;
+			nr_build_ids = next_nr_bids;
+			raw_bids_len = next_raw_len;
+			aligned_bids_len = next_aligned_len;
+			nr_offsets = i + 1;
+		}
+		size = sizeof(deferred_event->event) + sizeof(u64) +
+		       aligned_bids_len + nr_offsets * sizeof(u64);
+	} else {
+		nr = min_t(u64, nr, max_payload / sizeof(u64));
+		size = sizeof(deferred_event->event) + sizeof(u64) +
+		       nr * sizeof(u64);
+	}
+
+	misc = PERF_RECORD_MISC_USER |
+	       (use_bid ? PERF_RECORD_MISC_MMAP_BUILD_ID : 0);
 
 	/* XXX do we really need sample_id_all for this ??? */
 	perf_event_header__init(&deferred_event->event.header, &sample,
 				PERF_RECORD_CALLCHAIN_DEFERRED,
-				PERF_RECORD_MISC_USER,
+				misc,
 				size,
 				event);
 
@@ -10672,11 +10801,27 @@ static void perf_callchain_deferred_output(struct perf_event *event, void *data)
 		return;
 
 	perf_output_put(&handle, deferred_event->event);
-	perf_output_put(&handle, nr);
-	for (u64 i = 0; i < nr; i++) {
-		u64 entry = deferred_event->trace->entries[i];
+	if (use_bid) {
+		u64 pad_zero = 0;
+		u32 pad = aligned_bids_len - raw_bids_len;
+
+		perf_output_put(&handle, nr_build_ids);
+		perf_output_put(&handle, nr_offsets);
+		if (raw_bids_len)
+			__output_copy(&handle, bid_entry->build_ids, raw_bids_len);
+		if (pad)
+			__output_copy(&handle, &pad_zero, pad);
+		if (nr_offsets) {
+			__output_copy(&handle, bid_entry->offsets,
+				      nr_offsets * sizeof(u64));
+		}
+	} else {
+		perf_output_put(&handle, nr);
+		for (u64 i = 0; i < nr; i++) {
+			u64 entry = deferred_event->trace->entries[i];
 
-		perf_output_put(&handle, entry);
+			perf_output_put(&handle, entry);
+		}
 	}
 	perf_event__output_id_sample(event, &handle, &sample);
 
@@ -10686,14 +10831,18 @@ static void perf_callchain_deferred_output(struct perf_event *event, void *data)
 static void perf_unwind_deferred_callback(struct unwind_work *work,
 					 struct unwind_stacktrace *trace, u64 cookie)
 {
+	struct perf_callchain_build_id_entry *bid_entry =
+		perf_resolve_build_id_offsets(trace);
 	struct perf_callchain_deferred_event deferred_event = {
 		.trace = trace,
+		.bid_entry = bid_entry,
 		.event = {
 			.cookie = cookie,
 		},
 	};
 
 	perf_iterate_sb(perf_callchain_deferred_output, &deferred_event, NULL);
+	kfree(bid_entry);
 }
 
 struct perf_text_poke_event {
@@ -13549,6 +13698,10 @@ static void account_event(struct perf_event *event)
 		atomic_inc(&nr_mmap_events);
 	if (event->attr.build_id)
 		atomic_inc(&nr_build_id_events);
+	if (has_defer_output_build_id_offset(event))
+		atomic_inc(&nr_defer_output_build_id_events);
+	if (has_defer_output_callchain_build_id_offset(event))
+		atomic_inc(&nr_defer_output_callchain_build_id_events);
 	if (event->attr.comm)
 		atomic_inc(&nr_comm_events);
 	if (event->attr.namespaces)
-- 
2.56.1.831.g720f3f5937-goog

