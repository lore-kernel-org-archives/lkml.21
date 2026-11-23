Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446042;
	b=Tqaexu/OXPIIuJLTtL9rWNbS0Yh5sgbgk7eKpcR02yf0R9tVg9UTl47a63lMUxVj2jw6
	 reuG5nAvxAIdi10DIe1UZuo3CPnXloaTh67s/ZBZAzuNK4U/4wmwOqX5+BlhiFTSWodhf
	 ngJAQ4YRXwEQ7X2OESNdnpU8ghLvKZUq/kD2Jlz2CubVnLuDq6Tr3JXk6B/E1M5xgIejN
	 gBqhNladeb0orw56XxekxnfI3UQWulwhbvbcYxJY0OkMtva3YJBlsjZJ7Oj8e0c+HXXa+
	 ZQrewPS8SJIitlPdUBnsTu354UYn+PP9l7pprpDcfDu8sBXcPDWMX2Zmxil8nNDWtcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wYsSj+F+ggyOBUh2k7k7pI4pn0YJNbWaH8Y6XcKAqGY=;
	b=XWyNP8iNCqjyFMsC4lsL2RYe45cE0fGJYNpnWBy+e37+X9um/Srt7i7asEuUemaMQQO5
	 Ttv83VUe1MOEEGZZ+RK1sNQEQstw2eT7tZv1pd7WCBcOYcp49+F3e/7RXR+i2N87yoA9C
	 apWCAX+1loRkWytzxKXA6yg1r7Sd6GWeqFEPs1zgSPEqJnSakU6PNNGNUeGoRynTLMXVk
	 EqMNABAPpuQkbkNm71G6uvrTrJfABpf50kG7I+f4FX9W51Bfe0stuWeGF+mSWRZoBKl+4
	 4TC+YEqQYGEb+LfC7dUsjyASVpuSTkbdUg8ODIujSN3vd91WmSUnax+zX/pDBSRsPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FSEfgnJh;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBE606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CBE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FSEfgnJh
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50547b4992so239984666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795446040; x=1796050840; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYsSj+F+ggyOBUh2k7k7pI4pn0YJNbWaH8Y6XcKAqGY=;
        b=FSEfgnJheo9ekX+egCA0XVth03JHhLhc5HjNClkRZmtZBkocWa29x+4YxHPPNZmNs1
         QITHElokdqszkN4X4/lOFLfBOg/kDFcwRIP1linxO61F44uOdqLj2N8rCI9nROn0I9QR
         SuqNkO2ghO6K1y+u3vg2ZYFSZasVlExztjIX2Od1GeI07LyqzMyHLW77EdP4xdUKeuEc
         +pPLUEmcyAgxIUYXfQVjBDn19afeQhDUvwsXtkuQApYLUeN4QjBPI4wEOe7GIFg71KnT
         gAX4hjwhpeUnhH+bnAiCtoTktp5XmhviokBzUwuii1Mt6gzJoHrdMCcQIMIeAbXmg3K3
         bpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446040; x=1796050840;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYsSj+F+ggyOBUh2k7k7pI4pn0YJNbWaH8Y6XcKAqGY=;
        b=M/oUyFJpNVXVMdJI0jr8PPMX21y5B6MXpIhzdGbFJvjNwFBp0WNAX1siZ+YW6zKvJ8
         k88X27tyalSGkMz0Ot2Lsn02Q+YCE/pqzzIV8AZgrsEGUqVK2UO4jat01Z3ccLoP15km
         Z3ee9/Yt8qHVPSgco8jKvCJK1kMhfYE27Gt6SspccrVmH/TlKAXUViFFXYEjRgXlCh7M
         Txn4MrvAdVXHMSQooTpfkTiMpaMTStHgen3vPtYH5g763Z9FPPQlJhWreAWqipMq+Ybu
         hCYnL9gzkzo/a/OXEI7eznFJ/5ZDubQd8BquA+B2NxUtY83P/LhqPsQyDHiV4LK6H1XO
         c9vg==
X-Forwarded-Encrypted: i=1; AL+hErEMLTyZI/SJrnISU8zvN1B41ySIUanir/PmRRss+1vZvHBJxKHuBQwczcCHdkHRSYuzqydeXXux4Mw/qAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c7T5J+uOSu6ospH9Wjb3TGstl32rYq23tso/fCXM5JQxsYkwR
	jSyZjqDuOrPmaf3f1viM9ei7wtaPWaiaNZ5u1tzWluwkfbdeoYZb+tcb2LtKCjL1qKUiZkrV9Hh
	HTsxeu0PBjuK6aA==
X-Received: from edgd8-n1.prod.google.com ([2002:a05:6402:a508:10b0:6b8:96de:7abc])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:274d:b0:6ba:92c3:ff04 with SMTP id 4fb4d7f45d1cf-6ba92c40932mr3334073a12.26.1795446040104;
 Mon, 23 Nov 2026 07:00:40 -0800 (PST)
Date: Mon, 23 Nov 2026 15:00:37 +0000
In-Reply-To: <20261123145927.577162-1-jpiecuch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123145927.577162-1-jpiecuch@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123145927.577162-2-jpiecuch@google.com>
Subject: [PATCH 1/2] sched_ext: Fix suspicious RCU usage in KF_RCU_PROTECTED kfuncs
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Ryan Newton <newton@meta.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_bpf_dsq_peek() and scx_bpf_tid_to_task() call rcu_dereference()
without taking rcu_read_lock() and rely on KF_RCU_PROTECTED instead.
However, the verifier treats every non-sleepable program as being in an
RCU read-side section, including bpf_timer callbacks. bpf_timer_cb()
runs those from hrtimer softirq without rcu_read_lock(), so calling
either kfunc from a bpf_timer callback triggers:

  WARNING: suspicious RCU usage
  kernel/sched/ext/ext.c:11170 suspicious rcu_dereference_check() usage!
  ...
   scx_bpf_dsq_peek+0x7d/0xd0
   bpf_timer_cb+0xf9/0x130

The same happens from a sleepable program inside bpf_preempt_disable().
Both contexts are RCU readers, so this is a lockdep false positive, not
a use-after-free.

Take guard(rcu)() as scx_bpf_cpu_curr() and scx_bpf_cid_curr() already
do.

Fixes: 44f5c8ec5b9a ("sched_ext: Add lockless peek operation for DSQs")
Fixes: 41e3312861ea ("sched_ext: add p->scx.tid and SCX_OPS_TID_TO_TASK lookup")
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index e8c30a21e03e..2b9324c31de9 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -11152,6 +11152,8 @@ __bpf_kfunc struct task_struct *scx_bpf_dsq_peek(u64 dsq_id,
 	struct scx_sched *sch;
 	struct scx_dispatch_q *dsq;
 
+	guard(rcu)();
+
 	sch = scx_prog_sched(aux);
 	if (unlikely(!sch))
 		return NULL;
@@ -11957,6 +11959,8 @@ __bpf_kfunc struct task_struct *scx_bpf_tid_to_task(u64 tid)
 {
 	struct sched_ext_entity *scx;
 
+	guard(rcu)();
+
 	if (!scx_tid_to_task_enabled()) {
 		struct scx_sched *sch = rcu_dereference(scx_root);
 
-- 
2.56.1.750.gf70dc682cf-goog

