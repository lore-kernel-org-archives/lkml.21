Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246350;
	b=tEacXC0rY/VER6sNa4QZxxT45vv2GMb0lrcG/0WvBKPWfkDkGAU54BCoLDr3LZzHEKv3
	 JGdsuxjA1ZpFWIljEg+481bzv0qTijaOwylSvYHwDv43O8DcBae31U/+cpi4BW/fgnFq5
	 kjaD3cjYcDmcKu1W98Y9cQWtyVG+LRPTJKP3GwgkC1VLkiDWVWmMcliGOM8+8EciHdX+x
	 TPuegQ+MDj/49wk/0dYn5/YmdiwRXpmxo+IXt7M6KxeqN8KwYiKZKRC2wJJylyaNACvrb
	 zSaIqFzHOnB5WboinLC0fgXXrpzN+OGdsU5OQQIdIyrKOc0VVm8u3Awfu4hC0vRULjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vZXEIX5bRG+X47GzywXngypFAMMr6NGpMI+nKBGpwCc=;
	b=khFWW+20iYsqN8nDDYWWhxBmV7/byH2UpZDH0PP2aEZR2pKGvWfdrcnP/8q5i1drcKRC
	 oSve62g8fAdnIIZ/ByouiePmQZG68iM8Zi+Faeal3q0hk3+UB/Xyp2f4CbjwYShcjpDKg
	 eMEklfTre0HRmWKhSJC+Y7cNVBO4rLe1nehx5Ht3xuR0w/2iT/VY0pXzn4FKzrmRi5jS1
	 MjWMy1vhN+WdNBoN884w8mxxbev7LuG5tZDvS5AuCmQis2aWzyT7vq0JeVRJKqX1pieNM
	 vLKBL4il41KY6rx6wCOr6Ci99Iz2HfxPwi0JeHiT/U8ryom3Hf37KRCDFPFgR9hJMGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qI5s+qRP;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A5606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631A5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qI5s+qRP
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04244c3d0so13939485ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795246350; x=1795851150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZXEIX5bRG+X47GzywXngypFAMMr6NGpMI+nKBGpwCc=;
        b=qI5s+qRPc8lOrId2pgvo/2iBSN/HidJP3kKtKe5Ref0DOKJB8y9o6Sl6ruSIUVdTxu
         luFddQp1/bbZokmYJs5Y4+QmshC+0KoM4JuTA/6kZ+qDbBUm5jLZlgeEJ71FuwES4Nre
         bCnX1om5e4PhAUnuMy8IzexWQej5EpbWDk2rjFiMVnRsoKqQghq7LIPSG3QAW5t6SILv
         cPTTgx8pC1Opcp2W4FJQbsFgdYRaB4I6nv8FwC1NPsKsy7SDwIiVTVISZRFpRzNJqBRl
         fCfFi8vA55yD8RrU4uEeMRWOANIWukzcbubMKu9nKBFhAavfQH8i18W5yICVfo/PZwcV
         91Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795246350; x=1795851150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZXEIX5bRG+X47GzywXngypFAMMr6NGpMI+nKBGpwCc=;
        b=lW/kNREUF+QUSG7rHVjTUELPmKgkAHS86PcbO4LZg4Ud1Y+YZQ8akw9Z3pZSNJwMD0
         NLKPqhVzS+EP/6rG7+0arKYEX/zJMIKB7SSMSRvnMsGsc84QBip+rvIBJjeOmTG2jbJj
         9gTIMSnxpn55bQAoCZEQ4FTWQLhmlmdqcOixTne/n8gEVh63jXaqzgTkjIwJjCkYoaIK
         ZFVc9V7NEOXsu2jHo+ICl5utZUbsWXv0UpXGfuyJ6OGfGEiKZ/TdxQTmJTg8pYzcFpn/
         QcYcuvHyZmqXDJ4bFfiKYzXF0pQN9Zax34xIHnBWxCxataByajEuKTunLy7eQppPEh9O
         8sUg==
X-Forwarded-Encrypted: i=1; AL+hErFwsYW9RDrwgXdINKgW3oc0Hn+oDnW+yUT2NQKgncraj5XyIEa0BWHHrJ3rKCSXWJh/5QxKrb00+Y3owlY=@vger.kernel.org
X-Gm-Message-State: APuU4Z96JmrIt6YhAUBrmGZ9r/L+984VeVL0Imsd+dN7XQ/eU16BhRrq
	9wom+n72OMuVohOC+1guNblEzrdI/0xmwjr3HqppFbaBdi4P0XF3wREq
X-Gm-Gg: AZFdTZc6FiXwSnH1mM4fMowRyYsHaHGqvBE7l8YpdnSOavAdEv4CbP2xrtV6VUBxk66
	lY05wcuAoNm1FjgutnDHKdjLjQR7NHIZGIW6rTJ7WkVeiV1dOpLKLRJY7NheYVPBmLEMnUKRIrd
	xKhCfJVS5Kamf1qxmNJ55mgxsLWXp8Kp3mCEBm2cgsPfduOX1FHl1Tt6DJjphTDHHT0qllIpv5y
	HctEu6CRu18qGAIukO1yc/K+yKmpK75TNRYomwC2qt1M4i7b6oX0XRzfrg7tWFVDRGni3R2UIVw
	xnkAjSRzISI9f7W0aI80FNjIyYphadvJXxovpaO4mdXTTruSuPFY4/oFm4+nGXfmTaShfyqOSbz
	pi4CGfqHQNnOG3aNN54DK7r/MYZBDrtAeqU/yAl577bqjKgt9F8kqKTQILiGXE5IFMOBUvdDHMD
	nFvo79DFlh9CCY3NbtGLenKzwqlXYULqYKs8xgOu1GU4ouB8U4X5U3Fah00UKQb7Osacq2QW6Qh
	JMq3OEkYWduOIKeY3prNp5Qk8deb+qAZCG/RUet4CzVbpGp8dFWTj19wcy5vNXbkF4HmK6F9uY7
	y79KpAFXOm1YJYIUy7bgqXt/PZakiy/MUY6aXsCxpgQ9ow==
X-Received: by 2002:a17:902:dacc:b0:2ef:d54b:fb64 with SMTP id d9443c01a7336-2f03f16ca9amr57805835ad.47.1795246349410;
        Fri, 20 Nov 2026 23:32:29 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0ddf40sm23423465ad.37.2026.11.20.23.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 23:32:28 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp,
	tj@kernel.org,
	mkoutny@suse.com,
	chris@chrisdown.name,
	cui.tao@linux.dev,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v3] mm: memcontrol: don't miss processes whose leader has exited in OOM scans
Date: Sat, 21 Nov 2026 15:32:22 +0800
Message-ID: <20261121073222.834282-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

mem_cgroup_scan_tasks() walks with CSS_TASK_ITER_PROCS, so it sees only
thread group leaders, plus a dying leader that still has live threads.
Moving a process whose leader has exited, by writing its PID to
cgroup.procs, moves the live threads but leaves the leader behind, as
cgroup_migrate_add_task() skips exiting tasks.

The destination's OOM killer then cannot see the process.  If it is
alone there, every attempt ends with "Out of memory and no killable
processes..." and the charge is retried indefinitely, and
memory.oom.group kills nothing; otherwise another process is killed in
its place.  The source's OOM killer still finds the leader, reaches the
moved threads' mm through find_lock_task_mm(), and kills a process that
has left the memcg.

Walk all tasks and let one task of each thread group in the memcg stand
for it: the first one that is not exiting, the first one that has not
exited yet once the whole group is exiting, or the leader once every
thread has exited, so that an OOM victim stays visible until it is gone,
as the leader does today.  Exiting threads left behind do not count
while the group has live threads elsewhere.

Tested in a VM with memory.max=64M: in each case above the process using
the memory is now killed, and a process whose exited leader was not
moved, or whose leader is alive, is killed as before, with and without
memory.oom.group.

Fixes: f168a9a54ec3 ("mm: memcontrol: use CSS_TASK_ITER_PROCS at mem_cgroup_scan_tasks()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
v3:
 - Rebase on "mm: memcontrol: don't lose track of exiting OOM victims"
   in mm-hotfixes-unstable and keep CSS_TASK_ITER_WITH_DEAD
 - Let the leader stand for the group once every thread has exited, so
   such a victim stays visible as it does with that patch alone

Moving the exited leader along with its threads came up on v1, and
there has been no answer from the cgroup side.  cgroup.kill had the
same case: da13e0e72a73 ("cgroup: fix cgroup.kill for exited thread
group leader") walks all threads instead of the leaders, and
5f4a3f743acc ("cgroup: don't kill migrated processes through their
exiting threads") then had to keep an exiting thread left behind from
standing for a process that has moved out.  This patch does the same
for the memcg scan; the second case is what the live_elsewhere check
covers.

Retested on mm-hotfixes-unstable 2ba4d2c9ae3c: the cases in the
changelog behave as described, and with the reproducer from the review
of Chris's patch, memory.max=400M, 10 runs, oom_kill is 1 in every run
with and without this patch.

v2: https://lore.kernel.org/all/20261027144016.2582880-1-zhanxusheng1024@gmail.com/
v1: https://lore.kernel.org/all/20261026120248.2188024-1-zhanxusheng1024@gmail.com/

 mm/memcontrol.c | 44 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index afbb638e7e1c..3355341666db 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1426,6 +1426,44 @@ static void invalidate_reclaim_iterators(struct mem_cgroup *dead_memcg)
 						dead_memcg);
 }
 
+/*
+ * Let one task of each thread group in @memcg stand for the group: the
+ * first one that is not exiting, or, once the whole group is exiting, the
+ * first one that has not exited yet, so that an OOM victim stays visible.
+ * The leader is not enough: a group whose leader has exited can be moved
+ * without it.  Exiting threads left behind in @memcg do not count while the
+ * group has live threads elsewhere.
+ */
+static bool mem_cgroup_scan_skip(struct mem_cgroup *memcg,
+				 struct task_struct *task)
+{
+	struct task_struct *t, *dying = NULL;
+	bool live_elsewhere = false;
+
+	guard(rcu)();
+	__for_each_thread(task->signal, t) {
+		bool here;
+
+		if (READ_ONCE(t->exit_state))
+			continue;
+		here = mem_cgroup_from_task(t) == memcg;
+		if (!(READ_ONCE(t->flags) & PF_EXITING)) {
+			if (here)
+				return t != task;
+			live_elsewhere = true;
+		} else if (here && !dying) {
+			dying = t;
+		}
+	}
+	/*
+	 * Once every thread has exited, the leader stands for the group until
+	 * it is gone, as with CSS_TASK_ITER_PROCS.
+	 */
+	if (!dying)
+		return live_elsewhere || !thread_group_leader(task);
+	return live_elsewhere || dying != task;
+}
+
 /**
  * mem_cgroup_scan_tasks - iterate over tasks of a memory cgroup hierarchy
  * @memcg: hierarchy root
@@ -1456,10 +1494,10 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
 		 * torn down. Keep it visible so oom_evaluate_task() can
 		 * back off while there's still memory to free.
 		 */
-		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS |
-				    CSS_TASK_ITER_WITH_DEAD, &it);
+		css_task_iter_start(&iter->css, CSS_TASK_ITER_WITH_DEAD, &it);
 		while (!ret && (task = css_task_iter_next(&it))) {
-			ret = fn(task, arg);
+			if (!mem_cgroup_scan_skip(iter, task))
+				ret = fn(task, arg);
 			/* Avoid potential softlockup warning */
 			cond_resched();
 		}

base-commit: 2ba4d2c9ae3cfdad96ee925c92b14d7acd886954
-- 
2.43.0

