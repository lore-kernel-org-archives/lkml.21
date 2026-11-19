Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057169;
	b=JUxGPq0CevDRYi+aEuVWlj3rx0XkDnNIY/mDcVML8nZ8YEVnrEMoHH6Dbc3CKtQm0NYF
	 wMLiKTUFtW5RSqjvfp7DDbQlZYVjLVvzVw1SHAgHklZCE1XbYxTsQJhDDZDXA6DZymURo
	 E/IFvQkP2ddETShMjJw8d2HX2yTRyiFjsczCHGltvXVxzj7m1WYopC/wGjXJ5FFjS7a3h
	 kjYvOA34t9QjX8jlpzIkDwilPtERgzMgD7RN6t2PL4MeEXIfLuB5pYFP83ZnOH9ds4JGI
	 NMj8b83iN/0ABjI1ruSbXPhE0GoU1Wrch90IbHD0KwWtTMlrJQpdJ4Ysm95Nj36OuDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rNokoN6HdghsYU6dVyp7cUB7M2QVIQiYIgvqogABgJw=;
	b=DQ/MzeWzZcvr5rZCYTMofU65sokNFSsCvENUT1usf4yKWvSOk5mApxNFHITVk90Nm6sW
	 ZesPTOH9L4Rp5+YRDQ86wSMZUXBqevYxolBCkI/HaM83tFl0naQTANe8XMikg4XImDE/R
	 eH1/lo+BPRnDHvhmQ3icu3k3ZSbz/rB3vjglhaPq5zGl4kuCkHA2axCjQvfs3WfYwURct
	 FarZxVlJE+FL0QCzkmPIg+t+CiLNBA6W7Fym0RURAZziUh5kYwM6QKzlyl+Rrl550LisO
	 9+rK4eHHZOaIRIgVZ9Omvz96d1bwVu+YFkssKSqbH8Axe54zlS0U07uNOu73jSOHjMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axgTZIQK;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87154606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87154606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axgTZIQK
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380c28f9e35so457399eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795057168; x=1795661968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rNokoN6HdghsYU6dVyp7cUB7M2QVIQiYIgvqogABgJw=;
        b=axgTZIQKEhAPHXDYHKq1+wfR4V/qIS1rIsLPbsfJnSowkw8nIC3DNAk2Xr74NWN9z0
         iud+n1DYdMX74LSAUGTQww2wvW4r5yTW3RDXCe0p8GakQI7OeA9mf70PH+AZgxOZuvsl
         W27Z41LVX/Kcs54cejXFyppfDJjujs/UfGYupYVdgTb+peRiRGUH+qqEFlBIF2z385aQ
         xPR1PNKW2UzP1yHw2snJlU6tOVxf/NuwRFrRAyuJVGA0aoCjteV6x25OsVfdaGIcjq9n
         grwZ0Ak2h2N1JoS3xsr6aYuBHORUZMPIREyktY3C0IN94Iek0apIOrptnd5IVMpzZ5gR
         OpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795057168; x=1795661968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNokoN6HdghsYU6dVyp7cUB7M2QVIQiYIgvqogABgJw=;
        b=GChVJfSvKXrm848sPM0uV8bzo//XjmPMc4sElIpsKkcB1oJqDV0Qj2mAFnjRySBsQu
         xcP9gsQ1VcLez1l6/b11UYV5hOKXhwSA5MHmy8TpcDh2WQWG0vSLiqHy0AH0JLCOtPv6
         JCnLF0HqQBT6skElZqru/FBu3wtSnP8jcSeU7ybABcjyuYZpM7ZAc7L0njXBGBp25QGf
         KwN0PCKuvHNnXVtyO9fAapx31YcxVds/KnEsEKxP8Jmy3sWnDBLhYbGwjh82F/Mu+XS0
         QbBUNFE77Vo3ZmFWoOvs2f2eaB9eLrb88BQO4YHhUkj7EjP3ZlXBr+4x0dDPCGiCxFZd
         M7cw==
X-Forwarded-Encrypted: i=1; AL+hErGr4It0MOl/ost5VsOIVS6l6cbbG/1qDls8x0QcDEEnzMkE2Ft21GyGoatOddT14FsGGosxOFG99WpXums=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Tc1avhs/0Us6nApRhihTUJGyyrymiY2nudWwIrBK+OeQchXwO
	YosfARTyR4/BN4ByRbsG9iMcnmDL/LlYxWnfnwEuyQtU5a+sU1C2klVp
X-Gm-Gg: AYBFou1mArjBhcQJo9pzcuufagUtUF3OsC74eSDFXT/YDH1J+kZ2dCEm/ookBJfBMuI
	c97GKHyf+wJZ5pti4PFi6yxz0n9LOSJCX10JV+jfwC3vBD7UgSt+UlUXTJGLAX5ZOU+esUKfpCe
	Ea3cPS+gb6hWUJKBdWOMVhi7WBxu3U8H3vEUcMmWn16lEGuGvVy4Ba4fSP5Zns0bFFvxm70/xxA
	Ej1MS0P/r8l/B7t12yy8JfYxNdgS7rAD8jwwOHcQXjCH2WIFqokB7Q0zlPHSyJ0Cr0zR5WskmJQ
	msLAcVaz+nYD+IXYfyH7DAMfmDbhyNGQV3gr3sfPWmaLQmTRFJvH05oegj6OfLSnbHHBB44gJz0
	Ix3aJyDARDmb/+2FLcYLTW+JVSlhcPcr1h50liHIbAzrEZM22l0fglE4v0G0WDyDzKUfzXSBYZc
	LnK2UVpCPzlRP+7Nf3dDJpMSOy5xhyXYUhlwEJ2N9qeIvlBzYxN78/SVx7MXZ4sJSEC3MimIMWC
	Phd3fuFRsu7mbDKqeiJ2R8yyLiTSMBx99DlVDizuZM32LoGkGmVAE3cbqg/dZKf7kSrsm3WoDbC
	zf7WU6dVMTBwkqa7puUp5UOnJlpGiEk7EK5XHvuFC99T8nVssSk0fUqh
X-Received: by 2002:a05:701b:4194:10b0:1b5:32d6:6784 with SMTP id a92af1059eb24-1b54ea45c5dmr694260c88.20.1795057168289;
        Wed, 18 Nov 2026 18:59:28 -0800 (PST)
Received: from Desktop ([182.161.246.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447da7e0sm15918285c88.9.2026.11.18.18.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:59:26 -0800 (PST)
From: JunYoung Lee <ljyoung04@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] yama: hold the PR_SET_PTRACER tracer by its struct pid
Date: Thu, 19 Nov 2026 11:59:18 +0900
Message-ID: <20261119025918.86247-1-ljyoung04@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Hi Kees,

An unprivileged user can make Yama read a freed task_struct with the
default ptrace_scope=1. relation->tracer is stored without a reference,
and yama_task_free() marks the relation invalid only just before the
task is freed, so a concurrent ptracer_exception_found() can still
dereference it in task_is_descendant(). The KASAN report, the details
and the fix are in the patch below.

This is the problem Oleg Nesterov described on LKML on 2018-10-29
("yama: unsafe usage of ptrace_relation->tracer"). It was never fixed.

Affected (reproduced under KASAN as uid 65534):
- mainline 4405c18c95d2 (v7.4-rc3-230)
- stable 6.12.118

Conditions: CONFIG_SECURITY_YAMA, ptrace_scope=1 (default), no
capabilities or namespaces. The window is short; the reproducer hit it
7 times in 120 s on a 2-CPU VM.

Observed impact: a 4-byte read of a freed task_struct. The value only
affects Yama's allow/deny decision. No write was observed.

A C reproducer is available privately on request.

Testing of the patch on mainline with KASAN: the reproducer gives no
report (2.7M access checks). PR_SET_PTRACER behaviour is unchanged
(live and reaped tracer, ANY, clear, invalid pid, parent -> child: 13/13
checks). checkpatch --strict and W=1 are clean. A 6.12.y backport
(context changes only) is available.

Found with AI-assisted code analysis. All results come from test runs.

Thanks,
JunYoung Lee

-- >8 --
PR_SET_PTRACER records the allowed tracer as a raw task_struct pointer
in the relation list and takes no reference on it. The only thing that
retires that pointer is yama_task_free(), which runs from
__put_task_struct() just before free_task() and only sets
relation->invalid. Nothing separates that flag from the free with a
grace period.

ptracer_exception_found() walks the list under rcu_read_lock() alone.
If it has already passed the relation->invalid test when the tracer's
last reference is dropped (for example by the RCU callback queued by
release_task(), running from an interrupt on the same CPU),
task_is_descendant() then reads the freed task_struct:

  BUG: KASAN: slab-use-after-free in yama_ptrace_access_check+0x8b1/0x8e0
  Read of size 4 at addr ffff88800cdd2c78 by task yama_tracer_uaf/2865
  CPU: 0 UID: 65534 PID: 2865 Comm: yama_tracer_uaf Not tainted 7.4.0-rc3+ #1
  Call Trace:
   yama_ptrace_access_check+0x8b1/0x8e0
   security_ptrace_access_check+0xe6/0x200
   ptrace_may_access+0x31/0x50
   mm_access+0x12f/0x280
   process_vm_rw+0x2f5/0xa10
   __x64_sys_process_vm_readv+0xe5/0x100
  Freed by task 2865:
   kmem_cache_free+0x145/0x3d0
   rcu_core+0x7f4/0xe00
   handle_softirqs+0x1b8/0x590
   sysvec_apic_timer_interrupt+0x74/0x80
  Second to last potentially related work creation:
   call_rcu+0x44/0x220
   release_task+0xe46/0x1230
   wait_consider_task+0x18e6/0x2510

The faulting read is thread_group_leader(parent) in task_is_descendant()
(inlined), at offset 1528 of the 4616-byte task_struct (exit_signal).

Any unprivileged user can trigger this with the default ptrace_scope of
1: one process registers a short-lived child as its tracer and reaps it,
while an unrelated process runs PTRACE_MODE_ATTACH checks against the
first one. Before commit 93b69d437eff ("Yama: add RCU to drop read
locking") the reader held ptracer_relations_lock, which also excluded
the delete path.

Keep a reference on the tracer's struct pid instead, and resolve it
with pid_task() inside the reader's RCU section. A task found that way
stays valid until rcu_read_unlock(), since release_task() detaches the
pid before it queues the final put. Once the tracer has been reaped,
pid_task() returns NULL and the relation matches no tracer. That is
what an invalidated relation did before, so the tracer side of
yama_task_free() is no longer needed. The relation itself is still
removed when the tracee goes away or registers a new tracer. The pid
reference is dropped from an RCU callback after the relation is
unlinked.

The prctl() path looks the tracer up with find_get_pid() and
pid_has_task(). It keeps returning -EINVAL for a pid with no task, and
a tracer that is reaped right after the check leaves a pid that
resolves to nothing, never a NULL ("any tracer") relation.

Link: https://lore.kernel.org/all/0000000000004904df0578b7d3da@google.com/T/
Fixes: 93b69d437eff ("Yama: add RCU to drop read locking")
Cc: stable@vger.kernel.org
Signed-off-by: JunYoung Lee <ljyoung04@gmail.com>
---
 security/yama/yama_lsm.c | 59 ++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 21 deletions(-)

diff --git a/security/yama/yama_lsm.c b/security/yama/yama_lsm.c
index cef3776cf3b2..d23a5e658aa1 100644
--- a/security/yama/yama_lsm.c
+++ b/security/yama/yama_lsm.c
@@ -29,7 +29,7 @@ static int ptrace_scope = YAMA_SCOPE_RELATIONAL;
 
 /* describe a ptrace relationship for potential exception */
 struct ptrace_relation {
-	struct task_struct *tracer;
+	struct pid *tracer;
 	struct task_struct *tracee;
 	bool invalid;
 	struct list_head node;
@@ -107,6 +107,15 @@ static void report_access(const char *access, struct task_struct *target,
 	kfree(info);
 }
 
+static void yama_relation_free(struct rcu_head *head)
+{
+	struct ptrace_relation *relation =
+		container_of(head, struct ptrace_relation, rcu);
+
+	put_pid(relation->tracer);
+	kfree(relation);
+}
+
 /**
  * yama_relation_cleanup - remove invalid entries from the relation list
  * @work: unused
@@ -121,7 +130,7 @@ static void yama_relation_cleanup(struct work_struct *work)
 	list_for_each_entry_rcu(relation, &ptracer_relations, node) {
 		if (relation->invalid) {
 			list_del_rcu(&relation->node);
-			kfree_rcu(relation, rcu);
+			call_rcu(&relation->rcu, yama_relation_free);
 		}
 	}
 	rcu_read_unlock();
@@ -130,7 +139,7 @@ static void yama_relation_cleanup(struct work_struct *work)
 
 /**
  * yama_ptracer_add - add/replace an exception for this tracer/tracee pair
- * @tracer: the task_struct of the process doing the ptrace
+ * @tracer: the pid of the process doing the ptrace, NULL for any process
  * @tracee: the task_struct of the process to be ptraced
  *
  * Each tracee can have, at most, one tracer registered. Each time this
@@ -138,7 +147,7 @@ static void yama_relation_cleanup(struct work_struct *work)
  *
  * Returns 0 if relationship was added, -ve on error.
  */
-static int yama_ptracer_add(struct task_struct *tracer,
+static int yama_ptracer_add(struct pid *tracer,
 			    struct task_struct *tracee)
 {
 	struct ptrace_relation *relation, *added;
@@ -148,7 +157,7 @@ static int yama_ptracer_add(struct task_struct *tracer,
 		return -ENOMEM;
 
 	added->tracee = tracee;
-	added->tracer = tracer;
+	added->tracer = get_pid(tracer);
 	added->invalid = false;
 
 	spin_lock(&ptracer_relations_lock);
@@ -158,7 +167,7 @@ static int yama_ptracer_add(struct task_struct *tracer,
 			continue;
 		if (relation->tracee == tracee) {
 			list_replace_rcu(&relation->node, &added->node);
-			kfree_rcu(relation, rcu);
+			call_rcu(&relation->rcu, yama_relation_free);
 			goto out;
 		}
 	}
@@ -172,12 +181,14 @@ static int yama_ptracer_add(struct task_struct *tracer,
 }
 
 /**
- * yama_ptracer_del - remove exceptions related to the given tasks
- * @tracer: remove any relation where tracer task matches
+ * yama_ptracer_del - remove the exception registered for the given tracee
  * @tracee: remove any relation where tracee task matches
+ *
+ * A relation whose tracer has gone away is not removed here; its pid no
+ * longer resolves to a task, so it matches no tracer until it is replaced
+ * or the tracee goes away.
  */
-static void yama_ptracer_del(struct task_struct *tracer,
-			     struct task_struct *tracee)
+static void yama_ptracer_del(struct task_struct *tracee)
 {
 	struct ptrace_relation *relation;
 	bool marked = false;
@@ -186,8 +197,7 @@ static void yama_ptracer_del(struct task_struct *tracer,
 	list_for_each_entry_rcu(relation, &ptracer_relations, node) {
 		if (relation->invalid)
 			continue;
-		if (relation->tracee == tracee ||
-		    (tracer && relation->tracer == tracer)) {
+		if (relation->tracee == tracee) {
 			relation->invalid = true;
 			marked = true;
 		}
@@ -204,7 +214,7 @@ static void yama_ptracer_del(struct task_struct *tracer,
  */
 static void yama_task_free(struct task_struct *task)
 {
-	yama_ptracer_del(task, task);
+	yama_ptracer_del(task);
 }
 
 /**
@@ -235,20 +245,18 @@ static int yama_task_prctl(int option, unsigned long arg2, unsigned long arg3,
 		myself = current->group_leader;
 
 		if (arg2 == 0) {
-			yama_ptracer_del(NULL, myself);
+			yama_ptracer_del(myself);
 			rc = 0;
 		} else if (arg2 == PR_SET_PTRACER_ANY || (int)arg2 == -1) {
 			rc = yama_ptracer_add(NULL, myself);
 		} else {
-			struct task_struct *tracer;
+			struct pid *tracer = find_get_pid(arg2);
 
-			tracer = find_get_task_by_vpid(arg2);
-			if (!tracer) {
+			if (!tracer || !pid_has_task(tracer, PIDTYPE_PID))
 				rc = -EINVAL;
-			} else {
+			else
 				rc = yama_ptracer_add(tracer, myself);
-				put_task_struct(tracer);
-			}
+			put_pid(tracer);
 		}
 
 		break;
@@ -324,8 +332,17 @@ static int ptracer_exception_found(struct task_struct *tracer,
 		if (relation->invalid)
 			continue;
 		if (relation->tracee == tracee) {
-			parent = relation->tracer;
+			/*
+			 * The tracer is held by its pid: pid_task() only
+			 * returns a task that stays valid for this RCU
+			 * section, and NULL once the tracer has been reaped.
+			 */
+			parent = NULL;
 			found = true;
+			if (relation->tracer) {
+				parent = pid_task(relation->tracer, PIDTYPE_PID);
+				found = !!parent;
+			}
 			break;
 		}
 	}
