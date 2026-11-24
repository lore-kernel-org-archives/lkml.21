Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491365;
	b=i+9uVcI03sfx68BPDsc0Zask532uHtXb1qlG4VFyOQ1+8i8ppY2Ch98wuP0/i6kT0OSO
	 UxCjZkeXtzX0sqyS5UtH0Mo2uZw8/sM4E8P8HLjr31OLByLdk9rthHiBWETuVcvZFkUd3
	 uxa3Xpi8zMgCIjwJ9WTZVPkks6yAlJLUBexJ2B3nIe4AEcCUyHwyXSRJnUIBlKKofQuO5
	 0K0OorlweMO8OFPqLCWKfWkNajT6ejiADD7KK/aH4o/au278j+VSxPGYz2syR/VkBlPHc
	 Lkm/OAYBCOrQqfc86VuC4H0eElvdYjP12bk/WaSkq68AMPaMasHffV8+BD/N8Vf2dCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tPwzcSn9YCtkUcYX05pvK2PhOcLN5eFatEAbk1VC3Ao=;
	b=l7KkyRGbWag7o/VBI+HMiqxsNgMJnze0D8knSdLcdYmVPyQORDBMMtaS6HYc7tVzvEJM
	 GTK3b4CVDJB/VNfJtOcW0b8OwjNW8yyL4P7a1FBJFChWRA1nfKwq0PN4KGfNfQVoyZF4H
	 VvXHHbp1JKG26ZMBM+o+cLegTkm3uXXqeh3nsM3JNlZUL8hrc3KcW5FxuYjDmqoa38VSH
	 T1FYKBO4Ym+uFM4F+OMkRLYCK7Ou/CMnmS85afuQ4CdaUbUUsXcqiNWM24Wxj3mXtreb3
	 7nnifXfhvo4mKra9T8xAWbz+crBTOeAj33jy21dd4aN7BpMjfppTA6kt4Pr1VDTC8HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tds5q10B;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C20A606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C20A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tds5q10B
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso2263703a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491364; x=1796096164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tPwzcSn9YCtkUcYX05pvK2PhOcLN5eFatEAbk1VC3Ao=;
        b=tds5q10Bethl0FfyiXZva4IzMwY9rSAd99cHIo9BJ0aalRiX9U199zumfts2SrIOcP
         M0ElpB8TXNN+39CQJ/83sq3CBLLGn5Ts47U54hAGmtOqpBauy4iNOuJ0zL6BvMJeOOJG
         mk0BSbVFmNWFvBJjC74WWVmAb0XCaBVDyWMM4pN1EOv/IM1LWFzAVR6v68kxSkdx7RBG
         Q+ud+KfixiNbOgFhe6FJxy2Bgg3mDDp5+wyH9SOaGfi3gBy0Ev3p1ITaOeDDaLJ1tfa7
         uWb6+oNWIWG8qgpagiTR2xyzzgFWy3E1JjyaCGNNqzHjt3erllK/GrYLo9qfXfCJaadi
         F5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491364; x=1796096164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tPwzcSn9YCtkUcYX05pvK2PhOcLN5eFatEAbk1VC3Ao=;
        b=DIpLV4Dv36EC0qY6HtItk4MAbO+hza5fzZbUjgmZKzxTRRoZMRMnMEDVD9giKm6LTL
         jnl6eGZyYLK6uDi7eXl3eIq5rDaqTlOmPl715oXgIQAJvItDrbuwoFSXj7V52CwVwHJO
         rBfa13QB8XrR4Pin2ETUvJfy14K2/ZWWKgxEOGztkrF/MTEx17VDyk0v+4oA/u77IbWz
         t2N0keDAUno3edQFGIdnjwhyZZDTwaWYAzUcm9s3VF4JjzkUfRasKdWs0rB9xHxoIeUd
         IwS+y767NHlDDrtXdkwRrZOntvgpYJ5Y3qyuomXPiRRBOVhZ16oseLZj4vLqP7mjQaJl
         IbTw==
X-Forwarded-Encrypted: i=1; AL+hErFagSIEntTs6h2inpuQhNWgv/wx164ANilPtbfwrlpiUvIBgDjgQPPQIIqTPAXXlhGb+jpA0Vy7gcJKff8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pVR+2ZwKp4sbUN0p45kwFldpFY8lXMlXS1Tj7ZOrOLvQynSir
	NJW9yJLQNiy49IK89+pKIVT6ZpM9GilFSt/Cd8TU2NiZPOsjWOaf03oB
X-Gm-Gg: AZFdTZfQgC2wTYQJ0sGReijvh2ldP3ZhaLs2t8MhQZlnnrQ+4hxmNw6TcUMzNS/JTVO
	8aGHfIXKA3+za/hAybaTBPij2tO/fvyeQx2RrsEPEU5fMZDgt+dKUJmpkiTb8NMXv6fIhx6gvRg
	8u89bJ536JXK9MhcblItV9V25j7S3WPUAn8DHRhmEQjhr/PIlYOMmhDbNMvt2/goyy4/OFpvYBi
	atf05nn+dBhJP9TbFUl6Y7GCpeBRAk/FgbgS/kPf+m9GUf1B+l3peDtgkbYzB1/eKi/mfrnxPfD
	f7LJ76wZ8J53JFl/iyyjqo5BoquleU26HEP4iSClyFfCdrl4dqlV45+Y0ogwO8baszf7fbqT4uZ
	U2I6WhYE1aBAr0WAuqLatf0fo+kYIwDhBiNBRxmRc+hFipcbTVwecVdw4FZYrDc+qjHe054cieN
	GkuZp7kHja/KKovMkFBF37yFXt1ixotLsaj8uhcaQAgpDDpMZz4ggaPgjaV7VJ9d/tG0lP2x61U
	iopcEjhGEOZnskmVQzceRaEw73r8BxQZMhZbizAB4wV8n3E/eWOse3aV/iWX4nXEcyYplNy2Njs
	9Mc91iM2wNt/FC3w+J8/Ck95EIqis+5W74H2FA+SkHczaOSX7VX0R8cvwYqrIJFGzcA=
X-Received: by 2002:a17:90b:4a92:b0:3b3:fd13:683a with SMTP id 98e67ed59e1d1-3b41c995b82mr12834105a91.59.1795491363557;
        Mon, 23 Nov 2026 19:36:03 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm23397939a91.16.2026.11.23.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:36:03 -0800 (PST)
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
Subject: [PATCH 2/2] mm: memcontrol: find the OOM group of a process where its threads are
Date: Tue, 24 Nov 2026 11:35:47 +0800
Message-ID: <20261124033547.2373352-3-zhanxusheng1024@gmail.com>
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

When a cgroup.procs migration leaves an exited leader behind, a
CSS_TASK_ITER_PROCS walk visits the leader at the first live thread of
its process.  A memcg OOM walk of the cgroup the threads were moved to
can then return that leader as the victim.  mem_cgroup_get_oom_group()
takes the memcg from the leader, which is still the old one, so
memory.oom.group of the cgroup the process is in has no effect.  With
memory.oom.group set in dst and a second process in dst, an OOM in dst
killed only the moved process.

Add task_procs_css(), which gives the css of the process a PROCS walk
returned, and use it to look up the memcg.

Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/linux/cgroup.h | 18 ++++++++++++++++++
 kernel/cgroup/cgroup.c | 11 +++++++++++
 mm/memcontrol.c        |  2 +-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 5dfa915a630e..cb05808f2172 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -548,6 +548,24 @@ static inline struct cgroup_subsys_state *task_css(struct task_struct *task,
 	return task_css_check(task, subsys_id, false);
 }
 
+struct css_set *task_procs_css_set(struct task_struct *task);
+
+/**
+ * task_procs_css - css of the process a CSS_TASK_ITER_PROCS walk returned
+ * @task: the task returned by the walk
+ * @subsys_id: the subsystem ID of interest
+ *
+ * The walk can return an exiting thread group leader that a cgroup.procs
+ * migration left behind for where the rest of its process is.  Use this
+ * instead of task_css() to find the css of the process.  Must be called
+ * under rcu_read_lock().
+ */
+static inline struct cgroup_subsys_state *task_procs_css(struct task_struct *task,
+							 int subsys_id)
+{
+	return task_procs_css_set(task)->subsys[subsys_id];
+}
+
 /**
  * task_get_css - find and get the css for (task, subsys)
  * @task: the target task
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index ab442f94e29d..0be7f96ce074 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -5237,6 +5237,17 @@ static bool procs_stand_in(struct task_struct *task)
 	return leader != task && procs_live_thread(leader) == task;
 }
 
+/**
+ * task_procs_css_set - css_set of the process a PROCS walk returned
+ * @task: the task returned by the walk
+ *
+ * See task_procs_css().
+ */
+struct css_set *task_procs_css_set(struct task_struct *task)
+{
+	return task_css_set(procs_live_thread(task));
+}
+
 static void css_task_iter_advance(struct css_task_iter *it)
 {
 	struct task_struct *task;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 1271d390b617..5704e4415a16 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -2003,7 +2003,7 @@ struct mem_cgroup *mem_cgroup_get_oom_group(struct task_struct *victim,
 
 	rcu_read_lock();
 
-	memcg = mem_cgroup_from_task(victim);
+	memcg = mem_cgroup_from_css(task_procs_css(victim, memory_cgrp_id));
 	if (mem_cgroup_is_root(memcg))
 		goto out;
 
-- 
2.43.0

