Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567884;
	b=PuEYfvxdJo93jom4Up7gEecLq8qxo3BCa6aCHTKW5r39lu+aWsd7a1HOrveMdb9Y3f3V
	 hs2v5rpMnUBbkwsFUmMg1gn2XpHcOeVhMS2PBPAy0/x1eiBX/GSO8PRiBFbLoEPVlDCMv
	 IlfHecmDxupUPOXML603i3pI7MmK9Fuh9gx8mAcmaQBmINoiSElUoL4rnRlTf2rrQLpMj
	 x4dnfrRcV343m1IBMgyNXQnaCftARsjLZp13T+jSJqr1YohIZ2v/xYyNrTjnIFizDlrXt
	 cjd1dtfI1pY/jlYtQsZ5EH21nQm8mWHUDXdsbi/NaNLE1zI6muZT3y168Q3HliVheeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=p2fy+DpqSZGCjXCmXOGO/oc1L9NBEimm7FRwFXyUqLA=;
	b=pWJg7ZsxTJpsC8j9c4OC2VdXazGNInSRJ8A9qi2uK9NXGtLjlERvQLKi1RBIaOc5imcU
	 VxrUNzQTC+iQJphYK3wJKNEep35M7qltAxGeviPZ5izsZEl2z5gWXJk6ZlItJIBQn6erJ
	 wdZhjuuJ3n7EotS2026qtI0eQvt18i3UREfD5J5BGkTHGvJKm47VxSXIqYScMt/VYJ9T9
	 CeS1NEoRPW9oqWnUI+oupxUcHDB7B61ZJa7MPxeHnTq3NAhzJxgFkTkoHaNI9eTBzAHny
	 vTyR9j2OIurhLwo80D2aMpc2YF/GhO4aKunERg/1djSUxwjm0144JL/lY7pu2ozU6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M559KEq3;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849B6606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849B6606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M559KEq3
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6898672eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567882; x=1796172682; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2fy+DpqSZGCjXCmXOGO/oc1L9NBEimm7FRwFXyUqLA=;
        b=M559KEq35UL7dLcUJdgX0WCQukl94u6Pygbe9su5VdmBMUqM/CE94tBZ1dL566Pvd2
         I5D7sxatrtEpP/ZWgDeqmlHRCUHIxpT/hr5RPGjPCHBeiJolLA/nxPCzLHbiW/4lPUc0
         kkE/N5U1uQSkQJ8kzcWBt3yjldGyqeMAiwFzlr4t8ngCIJnf+837y2oEVVz1IBYj9Bpf
         EBxK0NK18Kl/8IsKwSqC87OzbvkqAWmt1e5syNOjnMi6Rpo5DF2d4h8D66IKt1hN71qb
         6RJfL5putpe2J0YjOlQ6GyBwvOCFQSqTr9FEBmqU3xozRpK79w2cL1GYy19B5ZUZbmBd
         oZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567882; x=1796172682;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2fy+DpqSZGCjXCmXOGO/oc1L9NBEimm7FRwFXyUqLA=;
        b=mwLTUw/8+nSKTPFSwuufIw5CeR+mTJ9EnjKB+7dcXgemsMSNL/976jSBRnFGkr4+D3
         qA2cDtM9EZUHfzyFdpl4B9r2iYgsx/EU0A0RcB0BTdH/BWLwVVxMCcxBmZZDy7VxcAEE
         IeyspBWNDoDolGMXOHwbGLOHpc68awl5JrhTpzSO3q/wb5R6ZFlYQkpaAGyKGDTrP15J
         3ISGERxc60k67Q8rFggmt2BTNcSSyqhGxOzqCdBXn5JiwFY/IdjOvhLUbikXAwZ7Jq1z
         e4vCuP7leQXH6966U3qVexu5C/VWr9j63oLAUEq4b4IDiLVzZjfdIcNPI91BebfbvZ7K
         8P7g==
X-Forwarded-Encrypted: i=1; AL+hErFo15d/yZEr8JpRJMschOEg+moa8C6APElUasIqkLwsK0fw3oEyRD0TtvkWvnMN0pGiaLWDC2hGOULN52c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pbncIop+wAaP2BE8apk7T+vdH21eu8plz0DJARjNU0ECuardd
	tMPP8zC6AyySbJ7sMGWb0vHdnEG5MKpoj0VAi17GJQHqRRK2c/SSCwGTVXkVts1cGQv7sDODaEg
	mwFLQQDvVMQ==
X-Received: from dyad21.prod.google.com ([2002:a05:693c:8355:b0:35d:1771:4816])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:42cb:b0:386:b621:d8ec
 with SMTP id 5a478bee46e88-386b621dc16mr6503137eec.19.1795567882190; Tue, 24
 Nov 2026 16:51:22 -0800 (PST)
Date: Tue, 24 Nov 2026 16:50:50 -0800
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
Message-ID: <20261125005108.1020003-2-irogers@google.com>
Subject: [PATCH v4 01/19] perf/core: Protect per-CPU callchain buffer across bpf_overflow_handler()
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

In bpf_overflow_handler(), perf_prepare_sample() runs before bpf_prog_run()
and saves data->callchain pointing into the current CPU's callchain buffer
for the active interrupt_context_level(), after get_perf_callchain() has
already released its callchain_recursion slot.

If the attached BPF_PROG_TYPE_PERF_EVENT program invokes a helper at the
same interrupt_context_level() that calls get_callchain_entry() (such as
bpf_perf_event_output() on a PERF_COUNT_SW_BPF_OUTPUT event configured with
PERF_SAMPLE_CALLCHAIN and a larger stack, or bpf_get_task_stack()), it
re-acquires the same per-CPU callchain buffer and overwrites
data->callchain->nr in place. When bpf_prog_run() returns non-zero and
__perf_event_output() emits the outer event's sample, perf_output_begin()
reserves only the smaller dyn_size computed earlier while
perf_output_sample() copies the overwritten larger data->callchain->nr
entries, overflowing the ring-buffer reservation.

Hold the callchain recursion slot via get_callchain_entry() across
bpf_prog_run() when PERF_SAMPLE_CALLCHAIN has been prepared so nested
callers at the same context level cannot overwrite the active per-CPU
callchain buffer.

Fixes: 0eed28220598 ("perf/core: Call perf_prepare_sample() before running BPF")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 kernel/events/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 947f23973ed4..d67bb825c504 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10816,11 +10816,18 @@ static int bpf_overflow_handler(struct perf_event *event,
 	rcu_read_lock();
 	prog = READ_ONCE(event->prog);
 	if (prog) {
+		struct perf_callchain_entry *callchain = NULL;
+		int callchain_rctx;
+
 		perf_prepare_sample(data, event, regs);
 		/* bpf_perf_event_data::addr is readable without PERF_SAMPLE_ADDR */
 		if (!(data->sample_flags & PERF_SAMPLE_ADDR))
 			data->addr = 0;
+		if (data->sample_flags & PERF_SAMPLE_CALLCHAIN)
+			callchain = get_callchain_entry(&callchain_rctx);
 		ret = bpf_prog_run(prog, &ctx);
+		if (callchain)
+			put_callchain_entry(callchain_rctx);
 	}
 	rcu_read_unlock();
 out:
-- 
2.56.1.831.g720f3f5937-goog

