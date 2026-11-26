Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698980;
	b=r7sFANC7tXR/wuch+J78ytoPGlpaHVBVlCZ8I9OmVf/akqVFzPZ8he0gW6z9hjgn1F5Z
	 GNXBdvzg9U65Oh6q1eqOU2bO0YSGhnYc4SVYWwGdWGdmG7jPcG9msGhfdSqcYsNTqMDgs
	 3IvcGJsNw/ObKgfigez4TKVPvgvBRj29/mSFSNd+P6mxaXwqlQR5KIShKggIv1pIocvqG
	 o1y/WQLTboOHdattjfrz6CF00Pw2/JL9YUuupRGm2aChBGe1HtEmM7+mzgpNyIE3mhNOF
	 JeEI7JDNPPw++rknFbwsO+fntX8phznELIO6j7XYugFzoVkVGUyiNglBcidSk3AxK4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698980;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7vMxn8cs6o/MxZq0DDy8EQsyxcWpTQpJsT6yJxc3BiY=;
	b=c81R9tWvp9w77EFBjxfUJTYPzYdKwtieucy8P8Lijawc5+AgXoqAC7bWCZLVvrzVJHRW
	 2/UEZY2xUi/Kt6IKSllSWMneiHRQs0/uRqtc2zbIRv24H9BfWhzkC21J385lyN9QYVmjE
	 LyEk+bfuQi4Oj0MGKV9GNBXd5KI+4MWvHZOHeeBLR/j6mRY1GQYR1NRQcJ5sXLEL9bO/e
	 p7gtcSBonMGNZxxTnV0n6MvN6RUbIOZTAMF/7VzyTyzFnFyyYyjZanOSb43MmxGCD66bX
	 /cyPxrntYBEWpJqUpMbgnwPdXbmVxk50+tjOhGhec31B+qt0+ykPOAFcitEo0D7ykPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=none smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.112
Received: from dggmsgout12.his.huawei.com (dggmsgout12.his.huawei.com [124.71.93.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAE6606A330
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAE6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggmsgout12.his.huawei.com (SkyGuard) with ESMTP id 4jZxrV1dQDz20dJ
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id A261F40574
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:16:15 +0800 (CST)
Received: from huawei.com (unknown [10.67.174.193])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgAHDgEOMQhrq143Fw--.33284S9;
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
Subject: [RFC PATCH 7/7] samples/bpf: Add pipe-based cache hint example
Date: Thu, 26 Nov 2026 13:48:28 +0000
Message-Id: <6c3450d84aa6eb91ab6f22a04d7f724a77824ca1.1795691926.git.luogengkun2@huawei.com>
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
X-CM-TRANSID:_Ch0CgAHDgEOMQhrq143Fw--.33284S9
X-Coremail-Antispam: 1UD129KBjvAXoW3Zw45XFW3Kw13Zw17Ar1xuFg_yoW8CrW8Ko
	WfZws8AF48GFyUu3yDCrn5Cr43Z3yvg3sxAr4Ygr4fZa4xGry5Wr4xGrZ5J3W2vr4Ykwsr
	Za40va1fXF4fZFn5n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOY7kC6x804xWl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK
	8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF
	0E3s1l82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x02
	67AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I
	80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCj
	c4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4
	kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
	AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU1aLvJUUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

Two BPF objects attach to the same pair of pipe hooks: a detector that
learns who talks to whom and asks the kernel to account those tasks
together, and an empty one that prices the hook itself.  Run them under
the same workload and the difference is the cost of the policy.

 scg_pipe_hint.bpf.c
 -------------------
The detector.  fentry on anon_pipe_read and anon_pipe_write, keyed by the
pipe_inode_info the two ends share.  Every task that touches a pipe takes
a slot on its own side and is counted there; it is admitted once its own
traffic on that pipe passes 100 writes or reads, so a shell pipeline or a
one-shot hand-off never counts, and a task that arrives when its side is
full (16 slots) is dropped.

 scg_pipe_noop.bpf.c
 -------------------
The same two hooks with an empty body.  It prices the fentry trampoline
with the policy removed, so the two objects can be compared under one
workload without guessing how much of a regression is the hook and how
much is the hints.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 samples/bpf/Makefile             |   4 +
 samples/bpf/scg_pipe_hint.bpf.c  | 361 +++++++++++++++++++++++++++++++
 samples/bpf/scg_pipe_hint_user.c | 210 ++++++++++++++++++
 samples/bpf/scg_pipe_noop.bpf.c  |  24 ++
 4 files changed, 599 insertions(+)
 create mode 100644 samples/bpf/scg_pipe_hint.bpf.c
 create mode 100644 samples/bpf/scg_pipe_hint_user.c
 create mode 100644 samples/bpf/scg_pipe_noop.bpf.c

diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 95a4fa1f1e44..90e166f5b129 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -32,6 +32,7 @@ tprogs-y += test_map_in_map
 tprogs-y += per_socket_stats_example
 tprogs-y += syscall_tp
 tprogs-y += cpustat
+tprogs-y += scg_pipe_hint
 tprogs-y += xdp_adjust_tail
 tprogs-y += xdp_fwd
 tprogs-y += task_fd_query
@@ -73,6 +74,7 @@ test_map_in_map-objs := test_map_in_map_user.o
 per_socket_stats_example-objs := cookie_uid_helper_example.o
 syscall_tp-objs := syscall_tp_user.o
 cpustat-objs := cpustat_user.o
+scg_pipe_hint-objs := scg_pipe_hint_user.o
 xdp_adjust_tail-objs := xdp_adjust_tail_user.o
 xdp_fwd-objs := xdp_fwd_user.o
 task_fd_query-objs := task_fd_query_user.o $(TRACE_HELPERS)
@@ -116,6 +118,8 @@ always-y += tcp_dumpstats_kern.o
 always-y += xdp2skb_meta_kern.o
 always-y += syscall_tp_kern.o
 always-y += cpustat_kern.o
+always-y += scg_pipe_hint.bpf.o
+always-y += scg_pipe_noop.bpf.o
 always-y += xdp_adjust_tail_kern.o
 always-y += xdp_fwd_kern.o
 always-y += task_fd_query_kern.o
diff --git a/samples/bpf/scg_pipe_hint.bpf.c b/samples/bpf/scg_pipe_hint.bpf.c
new file mode 100644
index 000000000000..81f386572d06
--- /dev/null
+++ b/samples/bpf/scg_pipe_hint.bpf.c
@@ -0,0 +1,361 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * scg_pipe_hint.bpf.c -- hint a cache group for tasks exchanging pipe data.
+ *
+ * One LRU hash entry per anonymous pipe, keyed by the pipe_inode_info
+ * address, holds the tasks seen on each side of it:
+ *
+ *	nwriters, writers[], wcnt[]	the writers and their write counts
+ *	nreaders, readers[], rcnt[]	the readers and their read counts
+ *	anchor				the first member to pass its
+ *					threshold
+ *	pending				bit i: writers[i] not linked
+ *					yet, bit MAX_WRITERS + j:
+ *					readers[j] not linked yet
+ *
+ * Every task that touches the pipe takes a slot on its own side and is
+ * counted there.  It is admitted once its own traffic on this pipe passes
+ * HINT_THRESHOLD, and dropped if it arrives when its side is full.
+ *
+ * Either hook may submit, so neither side waits for the other.  A pending
+ * member is hinted once, against the anchor, never as a pair: hints merge
+ * transitively, so N members need at most N-1 hints, and a reader switch
+ * cannot resubmit the set the way a per-reader bitmap would.  A member that
+ * has already exited is skipped; a hint is advisory, so a lost one is not
+ * worth retrying.
+ *
+ * Cost.  A call below the threshold costs one slot scan and one saturated
+ * counter bump; a member already linked costs the same scan plus two
+ * compares.  No task is resolved in either case.  The metrics map is looked
+ * up on every call and exists only to price this program.
+ */
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+/* kernel kfuncs: connect two tasks in one accounting group */
+extern s32 scg_bpf_submit_hint(u32 tid1, u32 tid2) __ksym;
+extern s32 scg_bpf_submit_hint_tsk(struct task_struct *t1,
+				   struct task_struct *t2) __ksym;
+
+#define MAX_PIPES	4096
+/* Writes or reads one task needs on a pipe before it is admitted. */
+#define HINT_THRESHOLD	100
+/* Slots per pipe, each side.  A task that arrives when its side is full is
+ * dropped, never displacing a member already there.
+ */
+#define MAX_WRITERS	16
+#define MAX_READERS	16
+#define MAX_MEMBERS	(MAX_WRITERS + MAX_READERS)
+/* Per-slot counters saturate; past the threshold only "hot" matters. */
+#define COUNT_MAX	255
+
+struct pipe_state {
+	u32 nwriters;			/* used slots in writers[] */
+	u32 nreaders;			/* used slots in readers[] */
+	u32 anchor;			/* first member; the star's centre */
+	u32 pending;			/* bit i: writers[i] not linked yet,
+					 * bit MAX_WRITERS + j: readers[j]
+					 */
+	u32 writers[MAX_WRITERS];	/* admitted writers, in arrival order */
+	u32 readers[MAX_READERS];	/* admitted readers, in arrival order */
+	u8 wcnt[MAX_WRITERS];		/* writes seen from writers[i] */
+	u8 rcnt[MAX_READERS];		/* reads seen from readers[j] */
+};
+
+struct hint_stats {
+	u64 accepted;
+	u64 skipped;
+	u64 slots_full;			/* task dropped, its side was full */
+	u64 new_pipes;			/* write hook created the entry */
+};
+
+/* Per CPU: a shared element would be written from every CPU and cost more
+ * than the work it measures.
+ */
+struct hint_metrics {
+	u64 write_calls;
+	u64 read_calls;
+	u64 read_noop;			/* read returned without submitting */
+	u64 submits;			/* hint attempts actually made */
+};
+
+struct {
+	__uint(type, BPF_MAP_TYPE_LRU_HASH);
+	__uint(max_entries, MAX_PIPES);
+	__type(key, u64);
+	__type(value, struct pipe_state);
+} pipes SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_ARRAY);
+	__uint(max_entries, 1);
+	__type(key, u32);
+	__type(value, struct hint_stats);
+} stats SEC(".maps");
+
+struct {
+	__uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
+	__uint(max_entries, 1);
+	__type(key, u32);
+	__type(value, struct hint_metrics);
+} metrics SEC(".maps");
+
+/* The pipe_inode_info shared by both ends; identity only, never dereferenced. */
+static __always_inline u64 pipe_id(struct kiocb *iocb)
+{
+	const struct file *filp = iocb->ki_filp;
+
+	if (!filp)
+		return 0;
+	return (u64)(unsigned long)filp->private_data;
+}
+
+/* Index of @tid in p->writers[], or -1. */
+static __always_inline int writer_slot(struct pipe_state *p, u32 tid)
+{
+	int i;
+
+	for (i = 0; i < MAX_WRITERS; i++) {
+		if (i >= p->nwriters)
+			break;
+		if (p->writers[i] == tid)
+			return i;
+	}
+	return -1;
+}
+
+/* Index of @tid in p->readers[], or -1. */
+static __always_inline int reader_slot(struct pipe_state *p, u32 tid)
+{
+	int i;
+
+	for (i = 0; i < MAX_READERS; i++) {
+		if (i >= p->nreaders)
+			break;
+		if (p->readers[i] == tid)
+			return i;
+	}
+	return -1;
+}
+
+/* Bump @cnt and report whether this call admitted the task.  A task is
+ * admitted exactly once, so the caller sets the pending bit on the true
+ * return only.
+ */
+static __always_inline bool just_admitted(u8 *cnt)
+{
+	if (*cnt > HINT_THRESHOLD)
+		return false;
+	if (*cnt < COUNT_MAX)
+		*cnt = *cnt + 1;
+	return *cnt > HINT_THRESHOLD;
+}
+
+/* Hint @tid against @anchor_task; clear its pending bit either way. */
+static __always_inline void link_member(struct pipe_state *p, u32 bit, u32 tid,
+					struct task_struct *anchor_task,
+					struct hint_stats *s,
+					struct hint_metrics *m)
+{
+	struct task_struct *t;
+
+	p->pending = p->pending & ~bit;
+
+	t = bpf_task_from_pid(tid);
+	if (!t) {
+		if (s)
+			s->skipped++;
+		return;
+	}
+
+	if (m)
+		m->submits++;
+	if (scg_bpf_submit_hint_tsk(anchor_task, t) == 0) {
+		if (s)
+			s->accepted++;
+	}
+	bpf_task_release(t);
+}
+
+/* Link every admitted member that is not linked yet.  The first pending one
+ * becomes the anchor if there is none; it is a member by definition, so its
+ * own bit is cleared rather than linked to itself.
+ */
+static __always_inline void link_pending(struct pipe_state *p,
+					 struct hint_stats *s,
+					 struct hint_metrics *m)
+{
+	struct task_struct *anchor_task;
+	int i;
+
+	if (!p->pending)
+		return;
+
+	if (!p->anchor) {
+		for (i = 0; i < MAX_MEMBERS; i++) {
+			if (p->pending & (1u << i))
+				break;
+		}
+		if (i >= MAX_MEMBERS) {
+			p->pending = 0;
+			return;
+		}
+		p->anchor = (i < MAX_WRITERS) ? p->writers[i] :
+					       p->readers[i - MAX_WRITERS];
+		p->pending = p->pending & ~(1u << i);
+		if (!p->pending)
+			return;
+	}
+
+	anchor_task = bpf_task_from_pid(p->anchor);
+	if (!anchor_task) {
+		/* The anchor is gone; forget it and pick a new one next time. */
+		p->anchor = 0;
+		return;
+	}
+
+	for (i = 0; i < MAX_MEMBERS; i++) {
+		u32 bit = 1u << i;
+		u32 tid;
+
+		if (!p->pending)
+			break;
+		if (!(p->pending & bit))
+			continue;
+		if (i < MAX_WRITERS) {
+			if (i >= p->nwriters)
+				continue;
+			tid = p->writers[i];
+		} else {
+			if (i - MAX_WRITERS >= p->nreaders)
+				continue;
+			tid = p->readers[i - MAX_WRITERS];
+		}
+		if (tid == p->anchor) {
+			p->pending = p->pending & ~bit;
+			continue;
+		}
+		link_member(p, bit, tid, anchor_task, s, m);
+	}
+
+	bpf_task_release(anchor_task);
+}
+
+SEC("fentry/anon_pipe_write")
+int BPF_PROG(pipe_write, struct kiocb *iocb, struct iov_iter *from)
+{
+	struct hint_metrics *m;
+	struct pipe_state *p;
+	u64 id = pipe_id(iocb);
+	u32 zero = 0;
+	u32 me;
+	int i;
+
+	m = bpf_map_lookup_elem(&metrics, &zero);
+	if (m)
+		m->write_calls++;
+
+	if (!id)
+		return 0;
+
+	me = (u32)bpf_get_current_pid_tgid();	/* low half: the tid */
+	p = bpf_map_lookup_elem(&pipes, &id);
+	if (!p) {
+		struct hint_stats *s;
+		struct pipe_state fresh = {};
+
+		fresh.writers[0] = me;
+		fresh.nwriters = 1;
+		fresh.wcnt[0] = 1;
+		bpf_map_update_elem(&pipes, &id, &fresh, BPF_NOEXIST);
+		s = bpf_map_lookup_elem(&stats, &zero);
+		if (s)
+			s->new_pipes++;
+		return 0;
+	}
+
+	i = writer_slot(p, me);
+	if (i < 0) {
+		/* writers[] full: drop this task rather than track it. */
+		if (p->nwriters >= MAX_WRITERS) {
+			struct hint_stats *s = bpf_map_lookup_elem(&stats, &zero);
+
+			if (s)
+				s->slots_full++;
+			return 0;
+		}
+		i = p->nwriters;
+		p->writers[i] = me;
+		p->wcnt[i] = 1;
+		p->nwriters = p->nwriters + 1;
+		return 0;
+	}
+
+	if (just_admitted(&p->wcnt[i]))
+		p->pending = p->pending | (1u << i);
+
+	if (p->pending) {
+		struct hint_stats *s = bpf_map_lookup_elem(&stats, &zero);
+
+		link_pending(p, s, m);
+	}
+	return 0;
+}
+
+SEC("fentry/anon_pipe_read")
+int BPF_PROG(pipe_read, struct kiocb *iocb, struct iov_iter *to)
+{
+	struct hint_metrics *m;
+	struct pipe_state *p;
+	u64 id = pipe_id(iocb);
+	u32 zero = 0;
+	u32 me_pid;
+	int j;
+
+	m = bpf_map_lookup_elem(&metrics, &zero);
+	if (m)
+		m->read_calls++;
+
+	if (!id)
+		return 0;
+
+	p = bpf_map_lookup_elem(&pipes, &id);
+	me_pid = (u32)bpf_get_current_pid_tgid();
+	if (!p) {
+		if (m)
+			m->read_noop++;
+		return 0;
+	}
+
+	j = reader_slot(p, me_pid);
+	if (j < 0) {
+		/* readers[] full: drop this task rather than track it. */
+		if (p->nreaders >= MAX_READERS) {
+			if (m)
+				m->read_noop++;
+			return 0;
+		}
+		j = p->nreaders;
+		p->readers[j] = me_pid;
+		p->rcnt[j] = 1;
+		p->nreaders = p->nreaders + 1;
+		if (m)
+			m->read_noop++;
+		return 0;
+	}
+
+	if (just_admitted(&p->rcnt[j]))
+		p->pending = p->pending | (1u << (MAX_WRITERS + j));
+
+	if (p->pending) {
+		struct hint_stats *s = bpf_map_lookup_elem(&stats, &zero);
+
+		link_pending(p, s, m);
+	} else if (m) {
+		m->read_noop++;
+	}
+	return 0;
+}
+
+char LICENSE[] SEC("license") = "GPL";
diff --git a/samples/bpf/scg_pipe_hint_user.c b/samples/bpf/scg_pipe_hint_user.c
new file mode 100644
index 000000000000..35c6eb2c3719
--- /dev/null
+++ b/samples/bpf/scg_pipe_hint_user.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * scg_pipe_hint_user.c -- load, attach and report the pipe-hint policy
+ *
+ * usage: scg_pipe_hint [seconds] [object]
+ *
+ * Attaches every program in the object, keeps it loaded for the given number
+ * of seconds or until SIGINT/SIGTERM, and prints the counters once a second.
+ * A final line is printed on the way out so a harness can read the totals
+ * from the log without parsing the per-second samples.
+ */
+#include <errno.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <bpf/bpf.h>
+#include <bpf/libbpf.h>
+
+/* Must match struct hint_stats in scg_pipe_hint.bpf.c. */
+struct hint_stats {
+	__u64 accepted;
+	__u64 skipped;
+	__u64 slots_full;
+	__u64 new_pipes;
+};
+
+/* Must match struct hint_metrics in scg_pipe_hint.bpf.c. */
+struct hint_metrics {
+	__u64 write_calls;
+	__u64 read_calls;
+	__u64 read_noop;
+	__u64 submits;
+};
+
+static volatile sig_atomic_t stop;
+
+static void on_signal(int sig)
+{
+	(void)sig;
+	stop = 1;
+}
+
+static int ncpus;
+
+/* Per-CPU array values are padded to 8 bytes each. */
+#define PERCPU_STRIDE	((sizeof(struct hint_metrics) + 7) & ~7UL)
+
+/* Sum a per-CPU array's single element across all CPUs. */
+static int sum_percpu(int fd, struct hint_metrics *out)
+{
+	size_t sz = PERCPU_STRIDE * (size_t)ncpus;
+	void *buf = calloc(1, sz);
+	__u32 zero = 0;
+	int cpu;
+
+	if (!buf)
+		return -1;
+	if (bpf_map_lookup_elem(fd, &zero, buf)) {
+		free(buf);
+		return -1;
+	}
+	memset(out, 0, sizeof(*out));
+	for (cpu = 0; cpu < ncpus; cpu++) {
+		struct hint_metrics *m =
+			(void *)((char *)buf + (size_t)cpu * PERCPU_STRIDE);
+
+		out->write_calls += m->write_calls;
+		out->read_calls  += m->read_calls;
+		out->read_noop   += m->read_noop;
+		out->submits     += m->submits;
+	}
+	free(buf);
+	return 0;
+}
+
+static void report(int stats_fd, int metrics_fd, __u32 stats_val_sz)
+{
+	struct hint_metrics mt;
+	struct hint_stats st;
+	__u32 zero = 0;
+
+	memset(&st, 0, sizeof(st));
+	if (stats_fd >= 0 && stats_val_sz &&
+	    !bpf_map_lookup_elem(stats_fd, &zero, &st))
+		printf("hints accepted=%llu skipped=%llu "
+		       "slots_full=%llu new_pipes=%llu\n",
+		       (unsigned long long)st.accepted,
+		       (unsigned long long)st.skipped,
+		       (unsigned long long)(stats_val_sz > 2 * sizeof(__u64) ?
+					    st.slots_full : 0),
+		       (unsigned long long)(stats_val_sz > 3 * sizeof(__u64) ?
+					    st.new_pipes : 0));
+	fflush(stdout);
+
+	if (metrics_fd >= 0 && !sum_percpu(metrics_fd, &mt))
+		printf("calls write=%llu read=%llu noop=%llu submits=%llu\n",
+		       (unsigned long long)mt.write_calls,
+		       (unsigned long long)mt.read_calls,
+		       (unsigned long long)mt.read_noop,
+		       (unsigned long long)mt.submits);
+	fflush(stdout);
+}
+
+int main(int argc, char **argv)
+{
+	const char *file = argc > 2 ? argv[2] : "scg_pipe_hint.bpf.o";
+	int seconds = argc > 1 ? atoi(argv[1]) : 30;
+	struct bpf_object *obj;
+	struct bpf_program *prog;
+	struct bpf_link **links;
+	int nlinks, i, attached = 0;
+	struct bpf_map *stats, *metrics;
+	int stats_fd = -1, metrics_fd = -1;
+	__u32 stats_val_sz = 0;
+	long err;
+
+	ncpus = libbpf_num_possible_cpus();
+	if (ncpus < 1) {
+		fprintf(stderr, "scg_pipe_hint: cannot count CPUs: %d\n", ncpus);
+		return 1;
+	}
+
+	obj = bpf_object__open_file(file, NULL);
+	err = libbpf_get_error(obj);
+	if (err) {
+		fprintf(stderr, "scg_pipe_hint: cannot open %s: %ld\n", file, err);
+		return 1;
+	}
+	err = bpf_object__load(obj);
+	if (err) {
+		fprintf(stderr, "scg_pipe_hint: verifier rejected the object: %ld\n",
+			err);
+		bpf_object__close(obj);
+		return 1;
+	}
+
+	/* Links are owned by the loader, not by the object. */
+	nlinks = 0;
+	bpf_object__for_each_program(prog, obj)
+		nlinks++;
+	if (!nlinks) {
+		fprintf(stderr, "scg_pipe_hint: %s has no programs\n", file);
+		bpf_object__close(obj);
+		return 1;
+	}
+
+	links = calloc(nlinks, sizeof(*links));
+	if (!links) {
+		fprintf(stderr, "scg_pipe_hint: out of memory\n");
+		bpf_object__close(obj);
+		return 1;
+	}
+
+	bpf_object__for_each_program(prog, obj) {
+		struct bpf_link *link = bpf_program__attach(prog);
+
+		err = libbpf_get_error(link);
+		if (err) {
+			fprintf(stderr, "scg_pipe_hint: cannot attach %s: %ld\n",
+				bpf_program__name(prog), err);
+			goto out_destroy;
+		}
+		links[attached++] = link;
+		fprintf(stderr, "scg_pipe_hint: attached %s\n",
+			bpf_program__name(prog));
+	}
+
+	stats = bpf_object__find_map_by_name(obj, "stats");
+	metrics = bpf_object__find_map_by_name(obj, "metrics");
+	if (stats) {
+		stats_fd = bpf_map__fd(stats);
+		stats_val_sz = bpf_map__value_size(stats);
+	}
+	if (metrics)
+		metrics_fd = bpf_map__fd(metrics);
+	if (stats_fd < 0)
+		fprintf(stderr, "scg_pipe_hint: no stats map, running blind\n");
+
+	signal(SIGINT, on_signal);
+	signal(SIGTERM, on_signal);
+	signal(SIGHUP, on_signal);
+
+	if (seconds > 0)
+		fprintf(stderr, "scg_pipe_hint: running for %ds\n", seconds);
+	else if (seconds == 0)
+		fprintf(stderr, "scg_pipe_hint: running\n");
+
+	for (i = 0; (i < seconds || seconds <= 0) && !stop; i++) {
+		report(stats_fd, metrics_fd, stats_val_sz);
+		sleep(1);
+	}
+
+	printf("FINAL ");
+	report(stats_fd, metrics_fd, stats_val_sz);
+
+	for (i = 0; i < attached; i++)
+		bpf_link__destroy(links[i]);
+	free(links);
+	bpf_object__close(obj);
+	return 0;
+
+out_destroy:
+	for (i = 0; i < attached; i++)
+		bpf_link__destroy(links[i]);
+	free(links);
+	bpf_object__close(obj);
+	return 1;
+}
diff --git a/samples/bpf/scg_pipe_noop.bpf.c b/samples/bpf/scg_pipe_noop.bpf.c
new file mode 100644
index 000000000000..c14a5ab4778c
--- /dev/null
+++ b/samples/bpf/scg_pipe_noop.bpf.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * scg_pipe_noop.bpf.c -- the same two hooks as scg_pipe_hint.bpf.c, empty.
+ *
+ * Prices the fentry trampoline alone, so running both objects under the same
+ * workload separates the cost of the hook from the cost of the policy.
+ */
+#include "vmlinux.h"
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+SEC("fentry/anon_pipe_write")
+int BPF_PROG(noop_pipe_write, struct kiocb *iocb, struct iov_iter *from)
+{
+	return 0;
+}
+
+SEC("fentry/anon_pipe_read")
+int BPF_PROG(noop_pipe_read, struct kiocb *iocb, struct iov_iter *to)
+{
+	return 0;
+}
+
+char LICENSE[] SEC("license") = "GPL";
-- 
2.34.1

