Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491359;
	b=zzjEXgsdXuHoMRebBA5yVFYZgsza7SY4fj7YjyL0a2opDU6C1xVxpvIGY3xNsPJVzr7c
	 aIOHWQA+2YYQZaFXMkHR3knwzJtyH+zUs0L3PR3/kzObf6B/LzaVP/fSlJuJe6UyE54Gz
	 ZjZveVM2aObywLmv/dAJpVA4yzrfOHlCW7vkA5l6JEesxgPELm+1UcxDiYno2Vu/kfQr3
	 WSpUHQqaBy0fREF6r8+8G3TX4eEnIujs+8F9Q7hIijjUsWI7s2ozvCuJq2h7ntUnindUt
	 Lcw6wHvp9ts0NdkLrF01RtKiM8sya24tV+uBLWCC/YLZl4HjjqmXThfvkvvtVvetRcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gjs/pNnX4PrWhE30CjXJcWso+ZUlIS9eqBqYEHwKrqU=;
	b=lDZr87o6T5EIDV7pSfr9otXoieigKKGtfHIhN8NZyh2x7ITwPyiKPwDnqqGlByuGMxTy
	 yV2tZaNRcbx2MC6cd/PzVkAuXuI+AEXp+UbWNhCPpb6x1EFtlHEFEFoADQcHI5AXEVoYF
	 qbsVruq+l/AybawNRUBzXXYXnxa5Rq1PI7l0S8imTKubRFAZ2uRlb3R+ZyRVlm/8do7Dc
	 XdgZB7hiBND2Bg3B8+HeAKtI0SIRv38yDFRk16NDayu119AqXu50yV1cdjl6UaiMBKlyX
	 YHzZYGNCsEmqBrk0HN/6UmI5U3telSoPmdj8LvGYkJ6KslFoLnr6bNejhPzXvDVlxuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAbppxPm;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCA1606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DCA1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BAbppxPm
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cddc597d062so2380295a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491359; x=1796096159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gjs/pNnX4PrWhE30CjXJcWso+ZUlIS9eqBqYEHwKrqU=;
        b=BAbppxPmbgkvuMRJL72o9Hh3xTxFzFmNryRvB8oloSHfARd4zvDBTd4o9V/Ilw/1aQ
         /3LBAAZZ/gyqT7DV5P/Yg7ZY2M/24jGz0pTlY9QrDXcbOEvJOlEM+KJm5irlLVEV98dv
         v52AFIzaNDkOO2qqQkTkGFgMhDqvJH4LXtGU3p2Bokn7yvjF3HrY9ezxI79PlM653vQs
         oH2l97N55966CZkriyyRcV6B1ZLazoBN9KnhoJHlzgjFhFen2ZTcALum58pe7ACEvPtc
         H3kgaDNi2WeidPeiiCNaSbjsB1uEYmiKtSGAEs+BNaGMftsv/IgdZ8ZpOIRxTBul+dNy
         qpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491359; x=1796096159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gjs/pNnX4PrWhE30CjXJcWso+ZUlIS9eqBqYEHwKrqU=;
        b=xBKLwkNaFWcwOwTmDraaT2ZQp7U7j8WG8zL52cXIA6np9sYd/ome/cKtuuuABExOel
         SY0r26r/U8/6Y2yqeo+Yhs9bEynu5gh3vWSdqAV7YE2+soUO6eZj4aCyNzXiNhAf4NK+
         9maLULO9ECFI/WN6K02JJUxcDNuzxYgmN0PPGyIcCLdeTnuvzuIzTW0vJR4AuiUfThkZ
         2JE2XSnp8ceX32l95m6qfIbne7XWvL9YbWI913NgOyebXHLubplJjRilYXDUoPsWprE6
         wa0sfolKLD2VQU8XWfKC1RROdngS4kOXA6FncKLK+q7zjDDjGMUZzHbwc40QfdUtRa9R
         8wgw==
X-Forwarded-Encrypted: i=1; AL+hErHzTdzRRgmtsfSmfcgyERnrW446jsN0dZv1s57cKffsDNHrXykRzubioz25rU1488tQtauRPNd8DvA+8Oo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IRTNrTIqs++RYTkFwXnrcz9lLdsTXEhi/2CoPbOwHevowX0eL
	Mu/NLhz27OEY1CVmLuhe61c4NZHM75UrVz5+iMj26nalQrlDQ5rnOze5
X-Gm-Gg: AZFdTZemWutThgnXhokicxceSlY+ZXCCH4JfryUGUXLnpj2N0IbkcTM3QGVBGB2+amM
	7w2GPM63eeBdFzswZhhJXWvu5vUgsvNFbo+iWYx5Ak3RH+yEf6EeOEkxU8g1kXvvgblsbaYQbpU
	bGrnRkDeRwDGLKGXvnePwC9QLv3lKqfhC6q3j7ocz9RMT91vezkCeEZnOUrqz74AxhNlHJJs7qs
	yeQe+ZwIBTeqNf/pbG8qkK06Hnp6Lt5uYEySqeq3ac/uHMf3CymJhrclnW3rIVD++qY4u4ppAui
	0ijxuPOgiisDh2jf/G/T0+qwW7Ds6A15RWuKUxwkc4RU0MVJyQznin1IIKy4GAEcBOOjacRIgaP
	NeqnA/YHJNfcFcqLWNsmvpK6G4c1v6mNgLuYQ7Fq+11wGVORpNomuOkeIenpVy+iODNuBka1LSP
	N6W9nuexLrl1n43kuXgRAaffiJJQRvniPfnTapHwQEDc5DCQ0lVdKxDZZqOUtHQzRcN3K3JtuS5
	XLR8CnhpDvNx/cISDg7B3+8x7lWDh6AxAoDjFEAsW2RPpCNhOC0gIjcHhr/DeYYQ5ir78MH2FAn
	+L4zXLpuCu2M+fD29E9c4df4Alp7G+RhGYFky34s683wtg==
X-Received: by 2002:a17:90a:e70c:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3b41c9234b2mr13368244a91.24.1795491358812;
        Mon, 23 Nov 2026 19:35:58 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm23397939a91.16.2026.11.23.19.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:35:58 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tj@kernel.org
Cc: hannes@cmpxchg.org,
	mkoutny@suse.com,
	mhocko@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	kolyshkin@gmail.com,
	chris@chrisdown.name,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] cgroup: list a process whose leader has exited where its threads are
Date: Tue, 24 Nov 2026 11:35:46 +0800
Message-ID: <20261124033547.2373352-2-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124033547.2373352-1-zhanxusheng1024@gmail.com>
References: <20261124033547.2373352-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

A cgroup.procs migration skips exiting tasks.  If the thread group
leader of a process has exited, writing the ID of one of its threads to
cgroup.procs moves the live threads and leaves the zombie leader behind.
CSS_TASK_ITER_PROCS walks only visit leaders, so the process stays in
the old cgroup's cgroup.procs and is missing from the new one's.

With a process whose main thread has called pthread_exit() and whose
other threads allocate memory:

  # echo $TID > dst/cgroup.procs
  # cat src/cgroup.procs
  $PID
  # cat dst/cgroup.procs
  #

When dst reaches memory.max, the memcg OOM killer finds no process in
dst and kills nothing: 5453 oom events and no oom_kill in 10 seconds.
An OOM in src picks the moved process instead.

Keep the leader on its css_set, and make PROCS walks visit it at the
first live thread of the process when that thread is on another
css_set.  Update test_cgkill_exited_leader_migrated, which expected
dst's cgroup.procs to be empty.

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/all/305c5803b904a57c188b505d6ed9e1e4@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/linux/sched.h                      |  2 +
 kernel/cgroup/cgroup.c                     | 55 +++++++++++++++++++++-
 tools/testing/selftests/cgroup/test_kill.c | 16 +++++--
 3 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..04fe82aea0e1 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1352,6 +1352,8 @@ struct task_struct {
 	struct css_set __rcu		*cgroups;
 	/* cg_list protected by css_set_lock and tsk->alloc_lock: */
 	struct list_head		cg_list;
+	/* exiting leader left behind by a cgroup.procs migration */
+	bool				cg_leader_left;
 #ifdef CONFIG_PREEMPT_RT
 	struct llist_node		cg_dead_lnode;
 #endif	/* CONFIG_PREEMPT_RT */
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index b3657e72db99..ab442f94e29d 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3081,6 +3081,9 @@ int cgroup_migrate(struct task_struct *leader, bool threadgroup,
 		if (!threadgroup)
 			break;
 	} while_each_thread(leader, task);
+	/* see procs_live_thread() */
+	if (threadgroup && (leader->flags & PF_EXITING))
+		WRITE_ONCE(leader->cg_leader_left, true);
 	spin_unlock_irq(&css_set_lock);
 
 	return cgroup_migrate_execute(mgctx);
@@ -5200,6 +5203,40 @@ static void css_task_iter_skip(struct css_task_iter *it,
 	}
 }
 
+/*
+ * A cgroup.procs migration skips a leader that is already exiting, as the
+ * controllers don't deal with exiting tasks, so the leader stays on its
+ * css_set while the rest of its process moves.  CSS_TASK_ITER_PROCS walks
+ * visit such a leader at the first live thread of the process instead, if
+ * that thread is on a different css_set.
+ *
+ * PF_EXITING isn't set under css_set_lock, so a walk that races with a
+ * thread starting to exit may visit the process twice or miss it.
+ */
+static struct task_struct *procs_live_thread(struct task_struct *leader)
+{
+	struct task_struct *t;
+
+	if (!READ_ONCE(leader->cg_leader_left))
+		return leader;
+
+	for_each_thread(leader, t) {
+		if (!(t->flags & PF_EXITING)) {
+			if (task_css_set(t) == task_css_set(leader))
+				return leader;
+			return t;
+		}
+	}
+	return leader;
+}
+
+static bool procs_stand_in(struct task_struct *task)
+{
+	struct task_struct *leader = task->group_leader;
+
+	return leader != task && procs_live_thread(leader) == task;
+}
+
 static void css_task_iter_advance(struct css_task_iter *it)
 {
 	struct task_struct *task;
@@ -5246,8 +5283,18 @@ static void css_task_iter_advance(struct css_task_iter *it)
 		goto repeat;
 
 	if (it->flags & CSS_TASK_ITER_PROCS) {
-		/* if PROCS, skip over tasks which aren't group leaders */
-		if (!thread_group_leader(task))
+		/*
+		 * If PROCS, skip over tasks which aren't group leaders, except
+		 * for the thread a left-behind leader is visited at.
+		 */
+		if (!thread_group_leader(task)) {
+			if (!procs_stand_in(task))
+				goto repeat;
+			return;
+		}
+
+		/* and leaders visited at another thread */
+		if (procs_live_thread(task) != task)
 			goto repeat;
 
 		/* and dying leaders w/o live member threads */
@@ -5322,6 +5369,9 @@ struct task_struct *css_task_iter_next(struct css_task_iter *it)
 	while (it->task_pos && !it->cur_task) {
 		it->cur_task = list_entry(it->task_pos, struct task_struct,
 					  cg_list);
+		/* a left-behind leader is visited at a live thread */
+		if (it->flags & CSS_TASK_ITER_PROCS)
+			it->cur_task = it->cur_task->group_leader;
 		/* a task on dying_tasks with zero refcount is only valid for
 		 * RCU readers, not even interesting for
 		 * CSS_TASK_ITER_WITH_DEAD, find another one */
@@ -6841,6 +6891,7 @@ void cgroup_fork(struct task_struct *child)
 {
 	RCU_INIT_POINTER(child->cgroups, &init_css_set);
 	INIT_LIST_HEAD(&child->cg_list);
+	child->cg_leader_left = false;
 }
 
 /**
diff --git a/tools/testing/selftests/cgroup/test_kill.c b/tools/testing/selftests/cgroup/test_kill.c
index 756bc7193d4b..102255b9559a 100644
--- a/tools/testing/selftests/cgroup/test_kill.c
+++ b/tools/testing/selftests/cgroup/test_kill.c
@@ -406,15 +406,16 @@ static int test_cgkill_exited_leader(const char *root)
 }
 
 /*
- * Test that cgroup.kill kills the threads of a process that were migrated
- * to the cgroup after their thread group leader had exited, and so are
- * not listed in its cgroup.procs.
+ * Test that a process whose thread group leader has exited is listed in the
+ * cgroup.procs of the cgroup its threads were migrated to, and that
+ * cgroup.kill there kills it.
  */
 static int test_cgkill_exited_leader_migrated(const char *root)
 {
 	char *parent = NULL, *src = NULL, *dst = NULL;
 	int ret = KSFT_FAIL;
 	pid_t pid = -ESRCH;
+	char buf[32];
 
 	parent = cg_name(root, "cg_test_exited_leader_migrated");
 	if (!parent)
@@ -438,12 +439,17 @@ static int test_cgkill_exited_leader_migrated(const char *root)
 	if (wait_for_zombie_leader(pid))
 		goto cleanup;
 
-	/* The exiting leader stays behind, only the live thread is moved. */
+	/*
+	 * Only the live thread is moved, but the process is listed where the
+	 * thread is.
+	 */
 	if (cg_enter(dst, pid))
 		goto cleanup;
 
+	snprintf(buf, sizeof(buf), "%d\n", pid);
 	if (cg_read_strcmp(dst, "cgroup.events", "populated 1\n") ||
-	    cg_read_strcmp(dst, "cgroup.procs", ""))
+	    cg_read_strcmp(dst, "cgroup.procs", buf) ||
+	    cg_read_strcmp(src, "cgroup.procs", ""))
 		goto cleanup;
 
 	if (cg_write(dst, "cgroup.kill", "1"))
-- 
2.43.0

