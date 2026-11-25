Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614379;
	b=y3a8dWiYzoHtfI2ouuD5Ha2aQsAnbiuaPhMt2I75U0U8NC8O53quZ1Me7dzq8ozMcmV+
	 bfuOOHygL603/Cxu3iq/WSeQiUbzbVI+u2TPwer2uuHAbYgc+zgcjGZvTHO8vhVu+3nKt
	 SPbCPa1qK+NNC7r3sSz20YBAYITSp3C7HmaWWjX2d97elBYHUTiAcpcI21onN0hyjz8cq
	 OOIldi4wKZYlM+6CZDx5eAIC3ZhyKmj6V8RK3G0U47iCh9m4ZHdG5dY3yf1Z5on2UuB20
	 hrXRzEzmaIqz3vkvQWwhVabxrxPvji2pzIJzRuLx5Hih6V6y6hF8W7InclUqHMh8sYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hkC7knUlQ5bvCCnLhIKdyMONWGi8riIRNrWMCj0qGvQ=;
	b=YdCIBwA/r5qFCddczjXeUbGIKxFdmwYO1K42AqGO3jbnoGG/oi7n23l2Ye/yZyYHaoi2
	 U7+teW4m9zDaVBY2KVwqqY01UhhFiiLUyBs/+BiKj9Ox7wyrx3slDh+ooUBRo2qBi0B7S
	 0VpKV9FDRZu9Df6tjK5qFGPoE4jvgewP/9nNeGfimtMbeqEn6ofqXgUBI/iEL5lbPUekt
	 A9y5h9Fxnp8dWeHEy+sFAEPE6fGaOQW1o7MTkt8d/H4yWP4d5xvqSpTc2eZCMX63Ac9aL
	 ojeXlA/pqxC8Cp0Pmk1hODgEU4OyPzWj9riuzSEe/EyhM2hcsjHTRA0HhU4j2pn+f5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZDhQP62j;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAF3606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFAF3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZDhQP62j
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so41966205e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795614377; x=1796219177; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkC7knUlQ5bvCCnLhIKdyMONWGi8riIRNrWMCj0qGvQ=;
        b=ZDhQP62jtCOk4l7aNG8WaBNp/pzufubi/wHj0w/HPcpin7qDUZyx/LA3GDjdRnCk34
         winwZUoaO0YK1CHJOxUZ0nYvmp7OSWQk1aB50W75pjk/PZV8PJHc6v1AwT3f3avuyt+C
         3wjLQxURd4yr4CKeUzWr/JzTVGTXZ7Cww6D4ybrcRIsG1GVg9iepMmCVWfGDqnavqQtw
         oiDCmLpm/+iVuVF77yQindIzEjYIzb4vXVVJ84g3jYESyvtxsu/E+bUrN5OK/Oj+vzvc
         rWJpQHEtV/oHFtuPPokAd4Pjq00Xk6wlaKBgOZbXId4RPsRbFcGY86QZ3KC50ubkibLF
         e54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614377; x=1796219177;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkC7knUlQ5bvCCnLhIKdyMONWGi8riIRNrWMCj0qGvQ=;
        b=cami7Yl/X1fOQjgxLF4JqPsI/0vP0B41ybnJ1+XGp+7CskaYW70DHuG5mdNh8ptd8h
         Cr2QVIG1HTFkIatHpNYoLM5TtX9d7ECHFK1yNPUBg8vBt6E7119K5KQgXJO4iKIjZGTt
         diuCKxuRH9eQ1tOVD+jThwPnm1oz6A1VlkxUrqDmvOcAcJwccwzTbq3TWXg2MBqyHyvs
         /eIB3ZX8zpPce+f0n+mi1i0hwgAHutMY49IQCRdaiaTB7iUUm99LyN/Hi7R+4rBdMBGF
         HqoKBs/m5RVhPNedde8gMBoh6kSgnqQjJWc3q2Wj9ljtUs/Ii7I7Pfz23Wi6Nnk7jhnT
         Brpw==
X-Forwarded-Encrypted: i=1; AL+hErFvoKr7F8KjuyDQ94Yb6u2hrOTuU25wZB6ridpYXzs8QrTYLLS5LnqEWO3CjuiqfCPcsi5st0FzD9P73Ow=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VkW+5kIKKg/ONSHCZJZCapUQ9NAi2PC2NM1sVlyZnJmUW8ZOX
	D2w1c/qM/L6euu3mLtr5j9hVge6sGwg5iUK/io8nT5UQn4tPvr3/KNj4BU0MpQthehU9WkanuP5
	HujYjX6Iad78aTQ==
X-Received: from wmcn22.prod.google.com ([2002:a05:600c:c0d6:b0:4a1:f1e1:c6d6])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr368724395e9.26.1795614376787;
 Wed, 25 Nov 2026 05:46:16 -0800 (PST)
Date: Wed, 25 Nov 2026 13:46:16 +0000
In-Reply-To: <2026112535-handcraft-glance-0edb@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <2026112535-handcraft-glance-0edb@gregkh>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125134541.3432982-1-jpiecuch@google.com>
Subject: [PATCH 6.18.y] sched_ext: Read exit_kind before flushing in scx_flush_disable_work()
From: Kuba Piecuch <jpiecuch@google.com>
To: stable@vger.kernel.org
Cc: Kuba Piecuch <jpiecuch@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>, Sashiko <sashiko-bot@kernel.org>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_disable_workfn() sets exit_kind to SCX_EXIT_DONE before it tears the
scheduler down. scx_flush_disable_work() reads exit_kind after syncing
disable_irq_work and flushing disable_work, so it can observe DONE from
a disable_work that was queued after its flush and return while the
teardown is still running:

  CPU A                          CPU B
  -----                          -----
  scx_vexit()
    scx_claim_exit() -> true
                                 bpf_struct_ops_map_link_detach()
                                   bpf_scx_unreg()
                                     scx_disable()
                                       scx_claim_exit() -> false
                                     scx_flush_disable_work()
                                       irq_work_sync()      // not queued
                                       kthread_flush_work() // not queued
    irq_work_queue()
  scx_disable_irq_workfn()
    kthread_queue_work()
  scx_disable_workfn()
    exit_kind = SCX_EXIT_DONE
    scx_root_disable()
                                       atomic_read() -> SCX_EXIT_DONE
                                   bpf_map_put()

Once bpf_scx_unreg() returns, its caller drops the struct_ops map
reference, and the struct_ops trampolines can be freed while
scx_root_disable() is still running and can still call into the BPF
scheduler, e.g. ops.exit().

Read exit_kind before syncing and flushing, with acquire ordering paired
with the atomic_try_cmpxchg() in scx_disable_workfn(). DONE is only set
from disable_work, so once it is observed, the following
kthread_flush_work() sees the queued work and waits for the teardown to
finish.

This patch was created with the help of an AI coding assistant.

Fixes: d99f7a32f09d ("sched_ext: Fix scx_flush_disable_work() UAF race")
Cc: stable@vger.kernel.org # v7.1+
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-195908@kernel.org/
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
Reviewed-by: Andrea Righi <arighi@nvidia.com>
Signed-off-by: Tejun Heo <tj@kernel.org>
(cherry picked from commit 3133107d98057595c0af39ff907c852134926912)
[ jpiecuch: applied kernel/sched/ext/ext.c hunk to kernel/sched/ext.c;
  kept error_irq_work instead of disable_irq_work. ]

Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index af5828f09304..882e06a76a16 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4247,10 +4247,17 @@ static void scx_flush_disable_work(struct scx_sched *sch)
 {
 	int kind;
 
+	/*
+	 * scx_disable_workfn() sets SCX_EXIT_DONE before tearing down. Read
+	 * exit_kind with acquire ordering (paired with atomic_try_cmpxchg() in
+	 * scx_disable_workfn()) before syncing and flushing so that, once DONE
+	 * is seen, the following flush observes the queued work and waits for
+	 * the teardown to finish.
+	 */
 	do {
+		kind = atomic_read_acquire(&sch->exit_kind);
 		irq_work_sync(&sch->error_irq_work);
 		kthread_flush_work(&sch->disable_work);
-		kind = atomic_read(&sch->exit_kind);
 	} while (kind != SCX_EXIT_NONE && kind != SCX_EXIT_DONE);
 }
 

base-commit: 4700e3adf3b24b39dd4929e9c6d62811ba3ccea8
-- 
2.56.1.839.g22a8290db9-goog

