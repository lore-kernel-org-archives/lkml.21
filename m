Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122778;
	b=v1F+BHUY0+cDBbA983jDhE9uvpD4uHRAQDTatiKO4vLvUjEy7SRaiKn+JVMy+493YXPw
	 UtLhi+DVYFJFzpTjGxEDhxPA9oGTfxlVLa+c/UYNtnRQnM01P9rGGOgfPCcu67AgPiXyV
	 WZ5oDfTdmwNRLORS5XjpW4mh9g+EBJw7+iWZoSk7b8/0tKSjSeskgPYQ3Sxzzsm6kzrnN
	 X5KzoG6X1VXMr8w+3i8k0cXww9WpseC2AUIFve0QFn0lOk8AK+ltnlyqi0Gm3AdfQ/va+
	 jfyAP9dCMew9fCrOcH27sy+KPpF52T2d3azRfMqqzgNAEMuDLaSCM3Ox6wCnp2/bGSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122778;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6eJYPTNK4h5PA9/a9GLQNb62PN8Jc9jx3Vl4D1FCI68=;
	b=H9tFxuUhXONSwJzufdRCG99v9wDaT+RxxUdRvoq9bZHcwjwAG2lzeEC6VFdMqmvhBGpX
	 SDAH7OT4eq2rd2aH7JBbEJPT7Clf3kYV5hPsNlbzkM0B4b6Lojnm9cYjKNWDR53MUKqV8
	 mRDdYaVA/ZZ52fhFIIEuwOWY4TWQih8X87+jdZeKiiC1sMyoxR7Q/cULdrrjdbXMYtniQ
	 FThP59cV8+B3JPqaq6BKC4iEiZZTXNrHRKR5VedvX3VcCDVsskAIQ6BT0oU5f77CjZI8R
	 C7c7ue6CfmqfxP9GqeqwYfq7sfICsNA+PAT28vjL85elS9420KA9PAg8edN91IfEsAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvLCeue5;
	arc=none smtp.remote-ip=95.215.58.153
Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0419606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0419606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KvLCeue5
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dwmocW0kYWF41nXHjEQPL6lIY+43EL+KJRdJH5ylj60=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795122776; v=1; x=1795727576;
 b=KvLCeue5aQE9K2TXZYzGUcG4gAh8KvmI+KvaYVGGUO+MiInUZe9tBmlERZkMwOQtJBoklJQP
 p6QGKxmae/4LAg4UJdd4rAwtZo9WSmfiU1+wJm8bbfdqFCszdl6KecRLlkPCNVy+fZpN0lVmJtd
 56aFvHAqVoImjtLrbIMEpXh0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 7548e2b2e281646e;
	Thu, 19 Nov 2026 21:12:55 +0000
X-Mizu-Trace-ID: 7548e2b2e281646e
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH 3/3] perf/core: Don't zero perf_sample_data in do_perf_sw_event()
Date: Thu, 19 Nov 2026 13:10:46 -0800
Message-ID: <20261119211235.99805-4-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261119211235.99805-1-usama.arif@linux.dev>
References: <20261119211235.99805-1-usama.arif@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernels built with CONFIG_INIT_STACK_ALL_ZERO, the default when the
compiler supports it, clear every local variable on function entry. For
the 256-byte struct perf_sample_data in do_perf_sw_event() that is a
memset, and it runs on every entry, before the list of events is even
looked up.

do_perf_sw_event() is entered for a software event, e.g. a context
switch, as soon as one event of that kind is open anywhere in the
system. Counting events add to event->count and never read the struct.
For every matching event, perf_sample_data_init() resets sample_flags,
period and dyn_size and stores the address if there is one; for a
sampling event, perf_prepare_sample() then fills in what its
sample_type asks for.

A single context-switch counter, e.g. one kept open by a monitoring
daemon, is enough for every context switch on the machine to pay for
the clearing. On hosts running many small VMs, ___perf_sw_event() is
0.3% of all kernel cycles, and the memset about a seventh of that.

Mark the struct __uninitialized, which is what kernels without stack
auto-initialization get anyway. Because its contents are copied into a
ring buffer that userspace maps, every field that is read must have
been written first. That holds for perf_output_sample(), and with the
previous patch also for what a BPF program can read through
bpf_perf_event_data.

In a KVM guest on AMD Zen 5 with software counters open on every CPU,
this cuts the time they add to a context switch from 54 ns to 44 ns
(sched_yield() between two threads on one CPU, with
spec_rstack_overflow=off).

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 57ea7e3c01a025..fa10ad7cfd99af 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11212,7 +11212,7 @@ static void do_perf_sw_event(enum perf_type_id type, u32 event_id,
 				    u64 nr, struct pt_regs *regs, u64 addr)
 {
 	struct swevent_htable *swhash = this_cpu_ptr(&swevent_htable);
-	struct perf_sample_data data;
+	struct perf_sample_data data __uninitialized;
 	struct perf_event *event;
 	struct hlist_head *head;
 
-- 
2.53.1-Meta

