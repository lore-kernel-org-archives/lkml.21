Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698980;
	b=IDPIQrawo+uocmmylJ+ROypIIY8H6PsXDJOV6eFvwvCKfrhI35Za4/vTsqFInx+AQs5S
	 dNu7Sq1Zs/+UT29U+pE2b8zRGOUIDKR5kMwleMN9eNBA02rZJR1zLhZrQF7l/UmPmRu+z
	 CQzaxhSl8+mNGu0xkV1IzjgDvYeyBkVmPheJ/tJGS9AIHaQJf0UA425Qkm5tUFsqZN6iv
	 IoFy6yW+myvuYBHtSi94FbAM+lYxdmjhrcj2y9rEYHWb9nSDMYqm/jpE6wi0olfCOsQKX
	 foq2HdwmH3/t9pwV+Er+d4myXI06kY78tSsh0FHCqqg1bDLVH5WrD4x5izxLIvWuQ1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698980;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=fmm7/pB68+gWxYmuwu0MR327OVctgRgVrInq3l7G9e0=;
	b=t31a5hi/IqHu6Evo0ACQG41acBaY18KmLwKKTLWvyGcUMwJtba47F/r2zBk0N5bU1IQE
	 1dMuMmYgbQDCkHUL+Ex3vQl1J03NuHg2VhQ6QaiXga0aAwvnXQwYf0O4CdlzsINnAvk4Y
	 YWyExfjoYgJgYPSLVY/lUZukbMkr388DrxjyRZZZZor/6/GG/dBZG1kNip2D1O6/7dctm
	 UNTKd6c+fAP6LPgFwYPmsWzyUK25+T1Q86/wpJE7/13j1wVTPkJ2CaLgj5bbnvAOFGf8d
	 pPAtmHd5hXoe7HIHmGFe12rqiAilLdxQRfOYDe2AbpySoBDG02aP09Wq/Nrc24V6Qgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.99
Received: from dggmsgout11.his.huawei.com (dggmsgout11.his.huawei.com [124.71.93.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B8606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D30B8606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggmsgout11.his.huawei.com (SkyGuard) with ESMTP id 4jZxrS4605z1c2B4
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 8199A4056D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:15 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S8;
	Thu, 26 Nov 2026 21:16:15 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 6/7] sched/cache: Add BPF-facing hint submitters
Date: Thu, 26 Nov 2026 13:48:27 +0000
Message-Id: <e01c1e6d627ceec97664ee5a0bb2c7a1d76dbe9d.1795691926.git.luogengkun2@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1795691926.git.luogengkun2@huawei.com>
References: <cover.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S8
X-Coremail-Antispam: 1UD129KBjvJXoWxurykWr48KF15ur15AFy7Jrb_yoWrAF4rpF
	ZIkws0yr4Dtan3WrWxAF4DAryfW3Z7A347u34xGFy2yr4Fqr40gw40q3W3Z3s3Kr18u3y2
	qF4xK3yakr1DJ3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAV
	Cq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0
	rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267
	AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7
	xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Y
	z7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2
	AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
	x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
	43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x
	07UZTmfUUUUU=
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Expose the hint queue to BPF programs as kfuncs:
- scg_bpf_submit_hint(tid1, tid2) submits by vpid.
- scg_bpf_submit_hint_tsk(t1, t2) submits by task pointer.

Both pin the two tasks before submitting: the queue owns the references
from there, and the worker drops what it consumes.  Register them for
the tracing, kprobe, tracepoint and syscall BPF program types.  The
queue machinery itself is in the previous commit.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 kernel/sched/build_utility.c |  3 ++
 kernel/sched/cache_sched.c   | 95 ++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/kernel/sched/build_utility.c b/kernel/sched/build_utility.c
index 5f63dbd43714..b4a72fd2311a 100644
--- a/kernel/sched/build_utility.c
+++ b/kernel/sched/build_utility.c
@@ -19,6 +19,9 @@
 #include <linux/sched/rseq_api.h>
 #include <linux/sched/task_stack.h>
 
+#include <linux/bpf.h>
+#include <linux/btf.h>
+#include <linux/btf_ids.h>
 #include <linux/cpufreq.h>
 #include <linux/cpumask_api.h>
 #include <linux/cpuset.h>
diff --git a/kernel/sched/cache_sched.c b/kernel/sched/cache_sched.c
index fafb04bcdfa9..045c21e90505 100644
--- a/kernel/sched/cache_sched.c
+++ b/kernel/sched/cache_sched.c
@@ -753,6 +753,77 @@ static inline s32 scg_submit_hint_pinned(struct task_struct *t1,
 	return ret;
 }
 
+__bpf_kfunc_start_defs();
+
+/*
+ * Submit a hint: two tasks, by vpid, are worth keeping in one cache group.
+ * The vpid is resolved in the caller's pid namespace here, because the
+ * worker consumes task pointers and the namespace context cannot shift
+ * between submit and flush.
+ */
+__bpf_kfunc s32 scg_bpf_submit_hint(u32 tid1, u32 tid2)
+{
+	struct task_struct *t1, *t2;
+
+	if (!sched_cache_enabled())
+		return -EOPNOTSUPP;
+
+	if (!tid1 || !tid2 || tid1 == tid2)
+		return 0;
+
+	t1 = find_get_task_by_vpid(tid1);
+	if (!t1)
+		return -ESRCH;
+
+	t2 = find_get_task_by_vpid(tid2);
+	if (!t2) {
+		put_task_struct(t1);
+		return -ESRCH;
+	}
+
+	return scg_submit_hint_pinned(t1, t2);
+}
+
+/*
+ * Submit a hint using two task pointers.  The caller passes pointers that
+ * are valid in its context (an fentry/fexit probe argument, or
+ * bpf_get_current_task_btf()); they are pinned with tryget_task_struct()
+ * here, so the asynchronous worker can use them safely.
+ */
+__bpf_kfunc s32 scg_bpf_submit_hint_tsk(struct task_struct *t1,
+					struct task_struct *t2)
+{
+	if (!sched_cache_enabled())
+		return -EOPNOTSUPP;
+
+	if (!t1 || !t2 || t1 == t2)
+		return 0;
+
+	t1 = tryget_task_struct(t1);
+	if (!t1)
+		return -ESRCH;
+
+	t2 = tryget_task_struct(t2);
+	if (!t2) {
+		put_task_struct(t1);
+		return -ESRCH;
+	}
+
+	return scg_submit_hint_pinned(t1, t2);
+}
+
+__bpf_kfunc_end_defs();
+
+BTF_KFUNCS_START(scg_kfunc_ids_hint)
+BTF_ID_FLAGS(func, scg_bpf_submit_hint)
+BTF_ID_FLAGS(func, scg_bpf_submit_hint_tsk)
+BTF_KFUNCS_END(scg_kfunc_ids_hint)
+
+static const struct btf_kfunc_id_set scg_kfunc_set_hint = {
+	.owner			= THIS_MODULE,
+	.set			= &scg_kfunc_ids_hint,
+};
+
 static int scg_hint_should_run(unsigned int cpu)
 {
 	return !llist_empty(&per_cpu_ptr(scg_hint_queues, cpu)->hints);
@@ -878,6 +949,30 @@ static int __init scg_hint_init(void)
 		return ret;
 	}
 
+	ret = register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACING,
+					&scg_kfunc_set_hint);
+	if (ret) {
+		/*
+		 * A registered kfunc set cannot be unregistered, so there is
+		 * nothing to unwind here either.
+		 */
+		pr_err("sched_cache: Failed to register the hint kfuncs (%d)\n",
+		       ret);
+		return ret;
+	}
+
+	/*
+	 * The remaining types are best-effort: keep the working queues and
+	 * carry on without the types that fail to register.
+	 */
+	if (register_btf_kfunc_id_set(BPF_PROG_TYPE_KPROBE,
+				      &scg_kfunc_set_hint) ||
+	    register_btf_kfunc_id_set(BPF_PROG_TYPE_TRACEPOINT,
+				      &scg_kfunc_set_hint) ||
+	    register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL,
+				      &scg_kfunc_set_hint))
+		pr_err("sched_cache: some hint kfunc registrations failed\n");
+
 	return 0;
 }
 late_initcall(scg_hint_init);
-- 
2.34.1

