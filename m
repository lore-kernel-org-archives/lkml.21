Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442130;
	b=QsHI2j1J2Cwzby8iIDgq44mkh0xy96gG/BR0O4YH+tthTZfWMAPa5kAqm18QC97DMyWX
	 kUhwo9+wYhtVIaXO8eBqCUkTatvt4anC3agywPEMgBUWo/eKG/xtyc9TjVPDtUFepLA/i
	 BUb0+aWECEPkT7D1MxWNUfdEnCFrIWOWIBWlG75mHkcYsULsD5DtwW2VvkH6HMJ6n+Gv0
	 blz6P5KiJcQJhiPRzCg1SrKjImsY0EKyiOLnjyVZcpgQnaM3jD+OPEwbo8JkW6ZvZzOsL
	 7HrnNx/ereEiBRo1x5ieC4RS3nqLnxdDWV42KcjiRRELtAOoVaJN67vM5waIMQJmW1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8rh+qdG1RYrieRVbs1iTPu01ZUDXAnPFVj3YoYaty8I=;
	b=aZXQ+66CUqfsw/1kdBD0x/HZg8O5d2S/KrR5FEd+eJA4x4RKMKWZWL0USBt0k8LKmUJL
	 3J7CtGyoqrrJd4boUZh51ruqoYlV8izhMH7n4fFl7cTXP0bl1Y5oL3iENXEn0a+mLEtn0
	 fY4oYMzUS3UfXGSaSArMRBzhw9C70oXv4ns8SltJmpi0lHOlmpIJ1ngGta6YMlmP8wtVD
	 aOe+Hb4ilOc0+1OQuLF18PVPwDkoVAGGyV4LpxuwtaM3PtAFaYpsizFyyP5CXgs2rTM+t
	 /kv6AIf+Y5TJxokVmo6DobP3x70lwZhKq+Z5+qZ+HZX0jPBRByWaom+w0C0u9+BmE1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBxonOTn;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89375606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89375606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YBxonOTn
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49034831bb3so2076984f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442129; x=1796046929; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8rh+qdG1RYrieRVbs1iTPu01ZUDXAnPFVj3YoYaty8I=;
        b=YBxonOTnOdfv0FYbTjXBf2hccvOwTCYKscZjDz7e6zDA0ab+sxTyiFimSimTCLQwdg
         kXWf9TfaSeCHC3vUoc/nuRzFLuZ2XwTI02zbRuuik9sk5OrgJz5N53vNKGwjP1wktL3s
         rZsmnKCob4RMxZRMIcZM+3z4y7GFqkoVJlD6RRttz6ZZaY3lZtKy6gJddk2SQVMf4CSK
         NNq3EMn1zPSkVSzehMAeql/jg/Wu3p/f/TeIp3iO6yvELROjm63ZjLbGAB485bse06lJ
         8xUDEvCi/mO8JFJEwlD1sOja8p4jxzZBuetrMfAaGXjziTf+O2EdrlwZlJJBgax+4hIQ
         0lXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442129; x=1796046929;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rh+qdG1RYrieRVbs1iTPu01ZUDXAnPFVj3YoYaty8I=;
        b=U/ME8ynNEygEceujPPOPuHFzyU3sMQghPTZVkYqgN+UL9Vk96mN+cQmiOS1AY+b6Ld
         3DDqq43HIWqKC9Zl1rFJ+w3ZTMJVt6sig7ZGtCA/n5pTiczUFayjcvcLsYIj63Hm8o9R
         ZOdwVHpVfii3KDIPLsS3dElLTj6hM8q1cByjJLSQUR88yd7Ag5pybxpbx8VlNOa4xjW9
         +98ONX/FjJzXiF5hqb7EOKzwND93PNo0XnZA+qH1v7lqzrdy3APEkG6yD3K8XocPMeX6
         5A/qd4H1osmOn1ZXmHLr6QqiVTzGES4yVatUWfRTYjjtVW/LNY2XQldEN9U5Dsb89gcd
         fRyg==
X-Forwarded-Encrypted: i=1; AL+hErGHoy5i/Hr7a0KYi13QnT0t2JFHIBhtCVupV9+E/pU7eNhNGCJ2ozcFCOqGIOVZtvudx8s7F8Ut4mxEZuA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TJMEk674sXAn6AA32q/fMCT9tAOBDjVeVGPAxxPapSqwo2dpa
	8tjwNbvraNofCERboXDPjDHxo0D7wzl490H9bPK69cRoNQBAGfr9psw33kylTdiJNTCIdWWCQdG
	PCAzQoMgMbvnHmQ==
X-Received: from wmdd26.prod.google.com ([2002:a05:600c:a21a:b0:4bb:5e69:8177])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8a:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb8880f0e0mr243689095e9.5.1795442128703;
 Mon, 23 Nov 2026 05:55:28 -0800 (PST)
Date: Mon, 23 Nov 2026 13:55:25 +0000
In-Reply-To: <20261123135343.4131146-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123135343.4131146-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123135343.4131146-3-jpiecuch@google.com>
Subject: [PATCH 2/2] selftests/sched_ext: Add unlocked_kfunc test
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add the unlocked_kfunc test to verify verifier-time restrictions on the
SCX_KF_ALLOW_UNLOCKED kfuncs.

The valid cpu-form and cid-form schedulers verify that ops.init() and
ops.exit() can call scx_bpf_create_dsq(), scx_bpf_dsq_move(),
scx_bpf_dsq_reenq_task(), and scx_bpf_select_cpu_dfl(). They also verify
that ops.dump() can call scx_bpf_dump() and that ops.init_cids() can
call scx_bpf_cid_override().

The two negative schedulers verify that the verifier rejects
scx_bpf_dsq_move() from ops.dump() and scx_bpf_create_dsq() from
ops.init_cids() with -EACCES.

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 tools/testing/selftests/sched_ext/Makefile    |  1 +
 .../selftests/sched_ext/unlocked_kfunc.bpf.c  | 69 ++++++++++++++++++
 .../selftests/sched_ext/unlocked_kfunc.c      | 73 +++++++++++++++++++
 .../sched_ext/unlocked_kfunc_cid.bpf.c        | 67 +++++++++++++++++
 .../sched_ext/unlocked_kfunc_fail_dump.bpf.c  | 26 +++++++
 .../unlocked_kfunc_fail_init_cids.bpf.c       | 22 ++++++
 6 files changed, 258 insertions(+)
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc_cid.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc_fail_dump.bpf.c
 create mode 100644 tools/testing/selftests/sched_ext/unlocked_kfunc_fail_init_cids.bpf.c

diff --git a/tools/testing/selftests/sched_ext/Makefile b/tools/testing/selftests/sched_ext/Makefile
index c5d3a2eaea7d..9a776a8a36ff 100644
--- a/tools/testing/selftests/sched_ext/Makefile
+++ b/tools/testing/selftests/sched_ext/Makefile
@@ -199,6 +199,7 @@ auto-test-targets :=			\
 	rt_stall			\
 	test_example			\
 	total_bw			\
+	unlocked_kfunc			\
 	cyclic_kick_wait		\
 
 testcase-targets := $(addsuffix .o,$(addprefix $(SCXOBJ_DIR)/,$(auto-test-targets)))
diff --git a/tools/testing/selftests/sched_ext/unlocked_kfunc.bpf.c b/tools/testing/selftests/sched_ext/unlocked_kfunc.bpf.c
new file mode 100644
index 000000000000..194993a0ef07
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/unlocked_kfunc.bpf.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A cpu-form scheduler that calls SCX_KF_ALLOW_UNLOCKED kfuncs from ops.init()
+ * and ops.exit(). ops.dump() calls scx_bpf_dump().
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+
+#include <scx/common.bpf.h>
+
+#define SHARED_DSQ	0
+
+char _license[] SEC("license") = "GPL";
+
+static void drain_dsq(void)
+{
+	struct task_struct *p;
+
+	bpf_rcu_read_lock();
+	bpf_for_each(scx_dsq, p, SHARED_DSQ, 0) {
+		if (p->pid & 1)
+			scx_bpf_dsq_reenq_task(BPF_FOR_EACH_ITER, p);
+		else
+			scx_bpf_dsq_move(BPF_FOR_EACH_ITER, p, SCX_DSQ_GLOBAL, 0);
+	}
+	bpf_rcu_read_unlock();
+}
+
+static void select_cpu_for_current(void)
+{
+	struct task_struct *p = bpf_get_current_task_btf();
+	bool is_idle;
+
+	bpf_rcu_read_lock();
+	scx_bpf_select_cpu_dfl(p, bpf_get_smp_processor_id(), 0, &is_idle);
+	bpf_rcu_read_unlock();
+}
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(unlocked_kfunc_init)
+{
+	s32 ret;
+
+	ret = scx_bpf_create_dsq(SHARED_DSQ, -1);
+	if (ret)
+		return ret;
+
+	drain_dsq();
+	select_cpu_for_current();
+	return 0;
+}
+
+void BPF_STRUCT_OPS(unlocked_kfunc_exit, struct scx_exit_info *ei)
+{
+	drain_dsq();
+	select_cpu_for_current();
+}
+
+void BPF_STRUCT_OPS(unlocked_kfunc_dump, struct scx_dump_ctx *dctx)
+{
+	scx_bpf_dump("nr_cpu_ids=%u\n", scx_bpf_nr_cpu_ids());
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops unlocked_kfunc_ops = {
+	.init			= (void *)unlocked_kfunc_init,
+	.exit			= (void *)unlocked_kfunc_exit,
+	.dump			= (void *)unlocked_kfunc_dump,
+	.name			= "unlocked_kfunc",
+};
diff --git a/tools/testing/selftests/sched_ext/unlocked_kfunc.c b/tools/testing/selftests/sched_ext/unlocked_kfunc.c
new file mode 100644
index 000000000000..0052c608365d
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/unlocked_kfunc.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that the BPF verifier rejects SCX_KF_ALLOW_UNLOCKED kfuncs from
+ * ops.dump() and ops.init_cids(). Unlocked ops such as ops.init() and
+ * ops.exit() must still be allowed to call them.
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+#include <bpf/bpf.h>
+#include <errno.h>
+#include <scx/common.h>
+#include "scx_test.h"
+#include "unlocked_kfunc.bpf.skel.h"
+#include "unlocked_kfunc_cid.bpf.skel.h"
+#include "unlocked_kfunc_fail_dump.bpf.skel.h"
+#include "unlocked_kfunc_fail_init_cids.bpf.skel.h"
+
+static enum scx_test_status run(void *ctx)
+{
+	struct unlocked_kfunc *skel;
+	struct unlocked_kfunc_cid *cid_skel;
+	struct unlocked_kfunc_fail_dump *fail_dump;
+	struct unlocked_kfunc_fail_init_cids *fail_init_cids;
+	int err;
+
+	if (!__COMPAT_struct_has_field("sched_ext_ops_cid", "init_cids") ||
+	    !__COMPAT_has_ksym("scx_bpf_dsq_reenq_task"))
+		return SCX_TEST_SKIP;
+
+	skel = unlocked_kfunc__open();
+	SCX_FAIL_IF(!skel, "Failed to open unlocked_kfunc");
+	SCX_ENUM_INIT(skel);
+	err = unlocked_kfunc__load(skel);
+	unlocked_kfunc__destroy(skel);
+	SCX_FAIL_IF(err, "Failed to load unlocked_kfunc (%d)", err);
+
+	cid_skel = unlocked_kfunc_cid__open();
+	SCX_FAIL_IF(!cid_skel, "Failed to open unlocked_kfunc_cid");
+	SCX_ENUM_INIT(cid_skel);
+	err = unlocked_kfunc_cid__load(cid_skel);
+	unlocked_kfunc_cid__destroy(cid_skel);
+	SCX_FAIL_IF(err, "Failed to load unlocked_kfunc_cid (%d)", err);
+
+	fail_dump = unlocked_kfunc_fail_dump__open();
+	SCX_FAIL_IF(!fail_dump, "Failed to open unlocked_kfunc_fail_dump");
+	SCX_ENUM_INIT(fail_dump);
+	err = unlocked_kfunc_fail_dump__load(fail_dump);
+	unlocked_kfunc_fail_dump__destroy(fail_dump);
+	SCX_FAIL_IF(!err,
+		    "unlocked_kfunc_fail_dump loaded when it should have been rejected");
+	SCX_FAIL_IF(err != -EACCES,
+		    "Expected -EACCES loading unlocked_kfunc_fail_dump, got %d", err);
+
+	fail_init_cids = unlocked_kfunc_fail_init_cids__open();
+	SCX_FAIL_IF(!fail_init_cids, "Failed to open unlocked_kfunc_fail_init_cids");
+	SCX_ENUM_INIT(fail_init_cids);
+	err = unlocked_kfunc_fail_init_cids__load(fail_init_cids);
+	unlocked_kfunc_fail_init_cids__destroy(fail_init_cids);
+	SCX_FAIL_IF(!err,
+		    "unlocked_kfunc_fail_init_cids loaded when it should have been rejected");
+	SCX_FAIL_IF(err != -EACCES,
+		    "Expected -EACCES loading unlocked_kfunc_fail_init_cids, got %d", err);
+
+	return SCX_TEST_PASS;
+}
+
+struct scx_test unlocked_kfunc = {
+	.name = "unlocked_kfunc",
+	.description = "Verify verifier kfunc restrictions on ops.dump() and ops.init_cids()",
+	.run = run,
+};
+
+REGISTER_SCX_TEST(&unlocked_kfunc)
diff --git a/tools/testing/selftests/sched_ext/unlocked_kfunc_cid.bpf.c b/tools/testing/selftests/sched_ext/unlocked_kfunc_cid.bpf.c
new file mode 100644
index 000000000000..ffe2f03c42e3
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/unlocked_kfunc_cid.bpf.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A cid-form scheduler that calls scx_bpf_cid_override() from ops.init_cids()
+ * and SCX_KF_ALLOW_UNLOCKED kfuncs from ops.init(). ops.dump() calls
+ * scx_bpf_dump().
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+
+#include <scx/common.bpf.h>
+
+#define SHARED_DSQ	0
+#define MAX_CPUS	512
+
+char _license[] SEC("license") = "GPL";
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARENA);
+	__uint(map_flags, BPF_F_MMAPABLE);
+	__uint(max_entries, 1 << 4);
+} arena SEC(".maps");
+
+s32 __arena_global cpu_to_cid[MAX_CPUS];
+s32 __arena_global shard_start[MAX_CPUS];
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(unlocked_kfunc_cid_init_cids)
+{
+	u32 nr_cpu_ids = scx_bpf_nr_cpu_ids();
+
+	if (nr_cpu_ids > MAX_CPUS)
+		return -E2BIG;
+
+	scx_bpf_cid_override(cpu_to_cid, nr_cpu_ids, shard_start, 1);
+	return 0;
+}
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(unlocked_kfunc_cid_init)
+{
+	struct task_struct *p;
+	s32 ret;
+
+	ret = scx_bpf_create_dsq(SHARED_DSQ, -1);
+	if (ret)
+		return ret;
+
+	bpf_rcu_read_lock();
+	bpf_for_each(scx_dsq, p, SHARED_DSQ, 0) {
+		if (p->pid & 1)
+			scx_bpf_dsq_reenq_task(BPF_FOR_EACH_ITER, p);
+		else
+			scx_bpf_dsq_move(BPF_FOR_EACH_ITER, p, SCX_DSQ_GLOBAL, 0);
+	}
+	bpf_rcu_read_unlock();
+
+	return 0;
+}
+
+void BPF_STRUCT_OPS(unlocked_kfunc_cid_dump, struct scx_dump_ctx *dctx)
+{
+	scx_bpf_dump("nr_cids=%u\n", scx_bpf_nr_cids());
+}
+
+SCX_OPS_CID_DEFINE(unlocked_kfunc_cid_ops,
+		   .init_cids		= (void *)unlocked_kfunc_cid_init_cids,
+		   .init		= (void *)unlocked_kfunc_cid_init,
+		   .dump		= (void *)unlocked_kfunc_cid_dump,
+		   .name		= "unlocked_kfunc_cid");
diff --git a/tools/testing/selftests/sched_ext/unlocked_kfunc_fail_dump.bpf.c b/tools/testing/selftests/sched_ext/unlocked_kfunc_fail_dump.bpf.c
new file mode 100644
index 000000000000..70218f48e93a
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/unlocked_kfunc_fail_dump.bpf.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that the BPF verifier rejects scx_bpf_dsq_move() from ops.dump().
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+
+#include <scx/common.bpf.h>
+
+#define SHARED_DSQ	0
+
+char _license[] SEC("license") = "GPL";
+
+void BPF_STRUCT_OPS(unlocked_kfunc_fail_dump_cb, struct scx_dump_ctx *dctx)
+{
+	struct task_struct *p;
+
+	bpf_for_each(scx_dsq, p, SHARED_DSQ, 0)
+		scx_bpf_dsq_move(BPF_FOR_EACH_ITER, p, SCX_DSQ_GLOBAL, 0);
+}
+
+SEC(".struct_ops.link")
+struct sched_ext_ops unlocked_kfunc_fail_dump_ops = {
+	.dump			= (void *)unlocked_kfunc_fail_dump_cb,
+	.name			= "unlocked_kfunc_fail_dump",
+};
diff --git a/tools/testing/selftests/sched_ext/unlocked_kfunc_fail_init_cids.bpf.c b/tools/testing/selftests/sched_ext/unlocked_kfunc_fail_init_cids.bpf.c
new file mode 100644
index 000000000000..2f2d277aa54f
--- /dev/null
+++ b/tools/testing/selftests/sched_ext/unlocked_kfunc_fail_init_cids.bpf.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Verify that the BPF verifier rejects scx_bpf_create_dsq() from
+ * ops.init_cids().
+ *
+ * Copyright (c) 2026 Google LLC.
+ */
+
+#include <scx/common.bpf.h>
+
+#define SHARED_DSQ	0
+
+char _license[] SEC("license") = "GPL";
+
+s32 BPF_STRUCT_OPS_SLEEPABLE(unlocked_kfunc_fail_init_cids_cb)
+{
+	return scx_bpf_create_dsq(SHARED_DSQ, -1);
+}
+
+SCX_OPS_CID_DEFINE(unlocked_kfunc_fail_init_cids_ops,
+		   .init_cids		= (void *)unlocked_kfunc_fail_init_cids_cb,
+		   .name		= "unlocked_kfunc_fail_init_cids");
-- 
2.56.1.750.gf70dc682cf-goog

