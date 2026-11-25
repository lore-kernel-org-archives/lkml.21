Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620866;
	b=UXRBa2/+60KQzh4a5yLaIcZ5kyLuG9hLTXzo9LdtK3ioulTgfPg+BZ5Iso+gHEPs3TAf
	 wGdpvDjRdFdtK4e2OWpEbocz4JF2aKeLxJxb5rBtdV1G5+mssNSCBhpLdQs5mK0or0CZR
	 rPQbGdelNE1e6/KcrgcauMO8QUi+QOHncE7YAZ9RIJS7ibaVhY9c6BrcBFWZ4S/YqLspM
	 ToK4mRMVyXSRLhs+qVTdxDloIYhTDDg4MVwIoP6Or+uY6xiR7ui8UKB8ibFyN8aKLCguv
	 kVK07iuD1dYiAg/IrTUvIqBXIkXFn7TVdpcVh1h+1v2JozVe0h0KjrpkViA2Notoyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8l9s48cBd/rt+ucRPW5523+jZ1OWhLcxRKhL/h7UiBA=;
	b=wJARo38J2doEfNYrhsSLSD4BSxdA2GsBTzc10uRspSBGw2Xv8VGcg0lPtT4YTD/Dz5Ck
	 9aGINfId74L9xjewmg/zzPGaFqZaEn8G0Gv0K4w+2uBr5So1wJtChlaTRoVX6VxH9OqR1
	 tBHkgBy3zeRBgxgl67xBjyZnMQ0ute44DYPnWWEmb3a2pnmC5oNtKI9L8dhWg8rrunlQN
	 qZTNeprfrsqe2t9YtxGtiUbg0jOp/Rq3f5r8HFx164ON4xba7TDxUvJUJvYRV0Z1NRlXf
	 EIt34nXDfMuohb/gf4gSlTxD47k41aKtvD4p9BroEHf7aDlFAokMicsLLHrlBZeA1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ND9q/I6B";
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662ED606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 662ED606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ND9q/I6B
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49337a224a8so3627769f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795620865; x=1796225665; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8l9s48cBd/rt+ucRPW5523+jZ1OWhLcxRKhL/h7UiBA=;
        b=ND9q/I6B0N7/YNO52/FYO9pzLfULE4Zaocpf4a6pFgfZEKf2O/n7N9gngq9Bho3Q4S
         s47zvAKd5wNCxvdis7B1lVMbhXLFp5PX/vj/CLS0S5TgVdgqQoPrMOpWBoUKBzdvDB/Z
         TvgCLr8yYkPuZk92cUtflBVH2vw2nwIADA+UpsIFbVr9C8HhoCasfUoq8GsN4lx2Idqe
         OWFyp1kwC0YDHCuLt1NNuGgg0ve6pguKEF4J4uxIbteApI+LQU2btqMrqGPwPOQYnTPM
         hndS83otf3Sk/RIMdtkduBhvbJRnBwyhowatowVaYJvu0DeycCnqjCy5wOKZy95kPKh0
         xi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620865; x=1796225665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8l9s48cBd/rt+ucRPW5523+jZ1OWhLcxRKhL/h7UiBA=;
        b=sQDz9xjOlHE2lX7FxwRUZiPqwlwiGCSTFXDweDfixIhnualJOIwz9wPHI3lNdoz5Py
         5t1YBuJK3i2IKDbir9f5W7sPgZqOX56nwYkFYp75Uako5Jr455qRyDxOEasKVBJbvD+h
         eB2I0LO1YZifBHUQJaBfpxZvurUBNNzM2z93jZlbvyQgwClIc87A5TszRFhHkH3hSLA1
         Jn1ZxJictuyR/I4FxlKi0k+Z05Jjcx2kT3Q/8cKfXzaAKP4FPk/WBgkiW3LgS2YN5btc
         kVaXQKXXR05OpgujN5Zj2FRRqVgIrPPTtVgGPN2/ZhSdm82xVjocZMZZeFKGEv4duwBb
         y47g==
X-Forwarded-Encrypted: i=1; AL+hErGpkrjg9jGgtiJj9oXt8RYEZGj7uwGRvv3upN0OuyqNRugXu90b1baDNBNbDxnIFg/8f4WAfah/nml5hPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I0oAFxiu0sCq/zwV7dP/1or//xgUbXksY+Vn70mWHQbM/9dk8
	2iCQMplZN915vuFhF7vvj68+c6UtK7DN+KDnQblBIO7LXi8EdFcMsHAtMHCjd1coPYaWsk+jPZI
	E9Cydwtbf3nEiJg==
X-Received: from wroe1.prod.google.com ([2002:adf:ef01:0:b0:48e:3465:b63e])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:288e:b0:49e:4ba2:a775 with SMTP id ffacd0b85a97d-4abb86e50eamr35228561f8f.56.1795620864367;
 Wed, 25 Nov 2026 07:34:24 -0800 (PST)
Date: Wed, 25 Nov 2026 15:34:21 +0000
In-Reply-To: <20261125153353.1364467-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125153353.1364467-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125153353.1364467-3-jpiecuch@google.com>
Subject: [RFC PATCH 2/2] selftests/sched_ext: Test that ops.sub_caps_updated()
 runs unlocked
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add sub_caps_ctx. A cid-form root grants and revokes caps to a child
sub-scheduler from ops.enqueue() (SCX_CAP_PERF) and ops.select_cid()
(SCX_CAP_PREEMPT). The child calls scx_bpf_cidperf_set() on every cid from
ops.sub_caps_updated(), which aborts the child if the callback inherits
the parent's rq lock. The test is skipped on a single cpu, where the only
cid is the parent's rq.

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 tools/testing/selftests/sched_ext/Makefile    |   1 +
 .../selftests/sched_ext/sub_caps_ctx.bpf.c    | 136 +++++++++++++++
 .../selftests/sched_ext/sub_caps_ctx.c        | 165 ++++++++++++++++++
 3 files changed, 302 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/sub_caps_ctx.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/sub_caps_ctx.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index 9a776a8a36ff..caedba9dcde9 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -196,6 +196,7 @@ auto-test-targets :=			\
 	select_cpu_dispatch_bad_dsq	\
 	select_cpu_dispatch_dbl_dsp	\
 	select_cpu_vtime		\
+	sub_caps_ctx			\
 	rt_stall			\
 	test_example			\
 	total_bw			\
diff --git a/tools/testing/selftests/sched_ext/sub_caps_ctx.bpf.c b/tools/testing/selftests/sched_ext/sub_caps_ctx.bpf.c
new file mode 100644
index 000000000000..e6613fc23d15
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/sub_caps_ctx.bpf.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A cid-form root scheduler which grants and revokes caps to a child
+ * sub-scheduler from its rq-locked ops.enqueue() and from ops.select_cid(), and
+ * a child which calls scx_bpf_cidperf_set() on every cid from
+ * ops.sub_caps_updated().
+ *
+ * ops.sub_caps_updated() must not inherit the parent's rq lock context. If it
+ * did, scx_bpf_cidperf_set() on any cid other than the parent's locked rq's
+ * would fail with "Invalid target CPU" and abort the child.
+ */
+#include <scx/common.bpf.h>
+
+char _license[] SEC("license") = "GPL";
+
+#define MAX_CIDS	1024
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARENA);
+	__uint(map_flags, BPF_F_MMAPABLE);
+	__uint(max_entries, 1 << 8);
+#if defined(__TARGET_ARCH_arm64) || defined(__aarch64__)
+	__ulong(map_extra, 0x1ull << 32);
+#else
+	__ulong(map_extra, 0x1ull << 44);
+#endif
+} arena SEC(".maps");
+
+struct sub_caps_ctx_cmask {
+	union {
+		struct scx_cmask mask;
+		u64 words[CMASK_NR_WORDS(MAX_CIDS) + 2];
+	};
+};
+
+struct sub_caps_ctx_cmask __arena_global all_cids;
+
+u64 child_cgid;
+u64 nr_enqueued, nr_selected, nr_grants, nr_revokes, nr_caps_updated, nr_perf_set;
+
+UEI_DEFINE(uei);
+
+/*
+ * Toggle @cap on all cids of the child every 8th call. ops.select_cid() and
+ * ops.enqueue() toggle different caps so that neither turns the other's grant
+ * or revoke into a no-op.
+ */
+static void toggle_child_cap(u64 cap, u64 seq)
+{
+	u64 cgid = child_cgid;
+
+	if (!cgid || (seq & 7) || nr_grants + nr_revokes >= 4096)
+		return;
+
+	if ((seq >> 3) & 1) {
+		scx_bpf_sub_revoke(cgid, cap, &all_cids.mask);
+		__sync_fetch_and_add(&nr_revokes, 1);
+	} else {
+		scx_bpf_sub_grant(cgid, cap, &all_cids.mask, NULL);
+		__sync_fetch_and_add(&nr_grants, 1);
+	}
+}
+
+/* grant / revoke from the ops.select_cid() context */
+s32 BPF_STRUCT_OPS(sub_caps_ctx_select_cid, struct task_struct *p, s32 prev_cid, u64 wake_flags)
+{
+	toggle_child_cap(SCX_CAP_PREEMPT, __sync_fetch_and_add(&nr_selected, 1));
+	return prev_cid;
+}
+
+/* grant / revoke while holding the enqueue rq lock */
+void BPF_STRUCT_OPS(sub_caps_ctx_enqueue, struct task_struct *p, u64 enq_flags)
+{
+	scx_bpf_dsq_insert(p, SCX_DSQ_GLOBAL, SCX_SLICE_DFL, enq_flags);
+	toggle_child_cap(SCX_CAP_PERF, __sync_fetch_and_add(&nr_enqueued, 1));
+}
+
+void BPF_STRUCT_OPS(sub_caps_ctx_sub_caps_updated, const struct scx_cmask *cmask, u64 caps)
+{
+	u32 nr_cids = scx_bpf_nr_cids();
+	s32 cid;
+
+	/* @cmask is an arena pointer, associate the arena */
+	asm volatile("" :: "r"(&arena));
+
+	__sync_fetch_and_add(&nr_caps_updated, 1);
+
+	/* any cid must be accepted when no rq lock is held */
+	bpf_for(cid, 0, nr_cids) {
+		if (!scx_bpf_cidperf_set(cid, SCX_CPUPERF_ONE))
+			__sync_fetch_and_add(&nr_perf_set, 1);
+	}
+}
+
+s32 BPF_STRUCT_OPS(sub_caps_ctx_sub_attach, struct scx_sub_attach_args *args)
+{
+	child_cgid = args->ops->sub_cgroup_id;
+	return 0;
+}
+
+void BPF_STRUCT_OPS(sub_caps_ctx_sub_detach, struct scx_sub_detach_args *args)
+{
+	child_cgid = 0;
+}
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(sub_caps_ctx_init)
+{
+	u32 nr_cids = scx_bpf_nr_cids();
+	s32 cid;
+
+	if (nr_cids > MAX_CIDS) {
+		scx_bpf_error("nr_cids=%u exceeds MAX_CIDS=%d", nr_cids, MAX_CIDS);
+		return -EINVAL;
+	}
+
+	cmask_init(&all_cids.mask, 0, nr_cids);
+	bpf_for(cid, 0, nr_cids)
+		cmask_set(cid, &all_cids.mask);
+
+	return 0;
+}
+
+void BPF_STRUCT_OPS(sub_caps_ctx_exit, struct scx_exit_info *ei)
+{
+	UEI_RECORD(uei, ei);
+}
+
+SCX_OPS_CID_DEFINE(sub_caps_ctx_ops,
+		   .select_cid		= (void *)sub_caps_ctx_select_cid,
+		   .enqueue		= (void *)sub_caps_ctx_enqueue,
+		   .sub_caps_updated	= (void *)sub_caps_ctx_sub_caps_updated,
+		   .sub_attach		= (void *)sub_caps_ctx_sub_attach,
+		   .sub_detach		= (void *)sub_caps_ctx_sub_detach,
+		   .init		= (void *)sub_caps_ctx_init,
+		   .exit		= (void *)sub_caps_ctx_exit,
+		   .name		= "sub_caps_ctx");
diff --git a/tools/testing/selftests/sched_ext/sub_caps_ctx.c b/tools/testing/selftests/sched_ext/sub_caps_ctx.c
new file mode 100644
index 000000000000..5881a6312cb6
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/sub_caps_ctx.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Grant and revoke caps to a sub-scheduler from the parent's rq-locked
+ * ops.enqueue() and verify that the child's ops.sub_caps_updated() runs in an
+ * unlocked context.
+ */
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
+#include <bpf/bpf.h>
+#include <scx/common.h>
+
+/* opaque to userspace, must match the size in sub_caps_ctx.bpf.c */
+#define MAX_CIDS	1024
+struct sub_caps_ctx_cmask {
+	__u64 words[(MAX_CIDS + 63) / 64 + 1 + 2];
+};
+
+#include "sub_caps_ctx.bpf.skel.h"
+#include "scx_test.h"
+
+#define CGRP_ROOT	"/sys/fs/cgroup"
+#define CGRP_PATH	CGRP_ROOT "/sub_caps_ctx"
+#define NR_WORKERS	8
+
+struct ctx {
+	struct sub_caps_ctx *parent;
+	struct sub_caps_ctx *child;
+	struct bpf_link *parent_link;
+	struct bpf_link *child_link;
+};
+
+static struct ctx test_ctx;
+
+static void write_file(const char *path, const char *buf)
+{
+	FILE *f = fopen(path, "w");
+
+	if (!f)
+		return;
+	fputs(buf, f);
+	fclose(f);
+}
+
+static enum scx_test_status setup(void **ctx)
+{
+	struct sub_caps_ctx *skel;
+	struct stat st;
+
+	if (!__COMPAT_struct_has_field("sched_ext_ops_cid", "sub_caps_updated"))
+		return SCX_TEST_SKIP;
+
+	/* a single cid is always the parent's rq, which scx_bpf_cidperf_set() accepts */
+	if (sysconf(_SC_NPROCESSORS_ONLN) < 2)
+		return SCX_TEST_SKIP;
+
+	write_file(CGRP_ROOT "/cgroup.subtree_control", "+cpu");
+	if (mkdir(CGRP_PATH, 0755) && errno != EEXIST) {
+		fprintf(stderr, "Failed to create %s (%s)\n", CGRP_PATH, strerror(errno));
+		return SCX_TEST_SKIP;
+	}
+	SCX_FAIL_IF(stat(CGRP_PATH, &st), "Failed to stat %s", CGRP_PATH);
+
+	skel = SCX_OPS_CID_OPEN(sub_caps_ctx_ops, sub_caps_ctx);
+	SCX_OPS_LOAD(skel, sub_caps_ctx_ops, sub_caps_ctx, uei);
+	test_ctx.parent = skel;
+
+	skel = SCX_OPS_CID_OPEN(sub_caps_ctx_ops, sub_caps_ctx);
+	skel->struct_ops.sub_caps_ctx_ops->sub_cgroup_id = st.st_ino;
+	SCX_OPS_LOAD(skel, sub_caps_ctx_ops, sub_caps_ctx, uei);
+	test_ctx.child = skel;
+
+	*ctx = &test_ctx;
+	return SCX_TEST_PASS;
+}
+
+/* sleep and wake repeatedly to drive the parent's ops.enqueue() */
+static void worker(void)
+{
+	struct timespec ts = { .tv_nsec = 100 * 1000 };
+	int i;
+
+	for (i = 0; i < 2000; i++)
+		nanosleep(&ts, NULL);
+	exit(0);
+}
+
+static enum scx_test_status run(void *arg)
+{
+	struct ctx *ctx = arg;
+	pid_t pids[NR_WORKERS];
+	int i, status;
+
+	ctx->parent_link = bpf_map__attach_struct_ops(ctx->parent->maps.sub_caps_ctx_ops);
+	SCX_FAIL_IF(!ctx->parent_link, "Failed to attach parent");
+
+	ctx->child_link = bpf_map__attach_struct_ops(ctx->child->maps.sub_caps_ctx_ops);
+	SCX_FAIL_IF(!ctx->child_link, "Failed to attach child");
+	SCX_GT(ctx->parent->bss->child_cgid, 0);
+
+	for (i = 0; i < NR_WORKERS; i++) {
+		pids[i] = fork();
+		SCX_FAIL_IF(pids[i] < 0, "Failed to fork");
+		if (!pids[i])
+			worker();
+	}
+	for (i = 0; i < NR_WORKERS; i++)
+		SCX_FAIL_IF(waitpid(pids[i], &status, 0) != pids[i] || status,
+			    "Worker %d failed", i);
+
+	/* let deferred notifications drain */
+	usleep(100 * 1000);
+
+	printf("enqueued=%lu selected=%lu grants=%lu revokes=%lu caps_updated=%lu perf_set=%lu\n",
+	       (unsigned long)ctx->parent->bss->nr_enqueued,
+	       (unsigned long)ctx->parent->bss->nr_selected,
+	       (unsigned long)ctx->parent->bss->nr_grants,
+	       (unsigned long)ctx->parent->bss->nr_revokes,
+	       (unsigned long)ctx->child->bss->nr_caps_updated,
+	       (unsigned long)ctx->child->bss->nr_perf_set);
+
+	SCX_ASSERT_ALIVE(ctx->child, uei);
+	SCX_ASSERT_ALIVE(ctx->parent, uei);
+	SCX_GT(ctx->parent->bss->nr_grants, 0);
+	SCX_GT(ctx->parent->bss->nr_revokes, 0);
+	SCX_GT(ctx->child->bss->nr_caps_updated, 0);
+
+	bpf_link__destroy(ctx->child_link);
+	ctx->child_link = NULL;
+	bpf_link__destroy(ctx->parent_link);
+	ctx->parent_link = NULL;
+
+	SCX_EQ(ctx->child->data->uei.kind, EXIT_KIND(SCX_EXIT_UNREG));
+	SCX_EQ(ctx->parent->data->uei.kind, EXIT_KIND(SCX_EXIT_UNREG));
+
+	return SCX_TEST_PASS;
+}
+
+static void cleanup(void *arg)
+{
+	struct ctx *ctx = arg;
+
+	if (ctx->child_link)
+		bpf_link__destroy(ctx->child_link);
+	if (ctx->parent_link)
+		bpf_link__destroy(ctx->parent_link);
+	sub_caps_ctx__destroy(ctx->child);
+	sub_caps_ctx__destroy(ctx->parent);
+	rmdir(CGRP_PATH);
+}
+
+struct scx_test sub_caps_ctx = {
+	.name = "sub_caps_ctx",
+	.description = "Check ops.sub_caps_updated() runs unlocked after a locked grant",
+	.setup = setup,
+	.run = run,
+	.cleanup = cleanup,
+};
+
+REGISTER_SCX_TEST(&sub_caps_ctx)
-- 
2.56.1.839.g22a8290db9-goog

