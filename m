Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516277;
	b=AuNwMrAWoXN7/cj37ICwARA0kxZ6IbxS3ZuCfT6ySmVD6Vu5zccfgUGVW5KzUi/r6mY3
	 U/OjT4NfuOzbTT1i6d/P3FOTpEXPEhFIjnwnGgDZT+Cw7nKWyI6LFc6+ZZ0jl1mG+ocoi
	 3q/bNJ/XX/Yd2sWik8a9qeji0mlatnq+rnW6BoeOFM80ayPwqYv5Xk/7iEa1KA35vVW49
	 4U+5OfW04uN7hVOBCHc9NTpmzU7PI5Dpaul1GcRQxz3rWDHVc36vBcUPsblwiy8KhCOkD
	 98VLltKjJaLU2+XLlqLgtEpbitqy1Hex80/yIOJ8wCpr4ZO2ik9iePvlmzmZctZ1QHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=1Sf68OIIcuaTDE9RTPGfqBeJ0BZYyHQM20HV27OG4qo=;
	b=h3FnT5ckUyf/cGVoLu4Sypiv/UYTOPVPaXqK2jFi1dQ22JO4qVtngv4RdBLGqhKekpz/
	 mlKIZ+Qa3tpYFM1b6YZtEuJXB0q9enEm06ntpw2cNdGofvs50CKZpBGMk+I9k6yBIdRRg
	 /SyjQM74gKXBDq2bojHcI//oyH2OpF1z1jg2w/X0TR1AiabmVzmrrg/E2fC6Wht66ufmd
	 QIwDvPXYdpCAfvJIyPfVJqyLdW+3QG7zcUgBlt8p/DYnmLupOLqRWek61SRwp3taefiTa
	 2ImX9TmjBTwPEpnIFHCY4FoEulopbTjeV3gB0+A+s+5xyHw+wJ70rxfKrrVkqaWN3HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBHDm+nB;
	arc=none smtp.remote-ip=209.85.208.69
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C76C606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C76C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZBHDm+nB
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6ba65981447so3092491a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795516276; x=1796121076; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Sf68OIIcuaTDE9RTPGfqBeJ0BZYyHQM20HV27OG4qo=;
        b=ZBHDm+nBnqWVt80YM/YaOjgTgTCHAQvvliH44IzdE4JDBSN3T3cx2BvjMU7GWIM82Q
         Llpwx/1mIpW+MrgW/j7cB65I0IsVLv6PrgqS2yU5BwksGCxKagai3fPlyLi/vudtX58T
         l788mpl2rkt8ghUvJBZGzAOaydnvDAoeMhqN62eSHEeHvZFHjIW9PSeGmNxUlbc3XOsS
         kkw1ITWUXqgWLY3aW/yx3aJuUHV/DcT/mD3HNblnr3oXohJhBKgwVwBkxhfsmWQJHvKl
         XUl//u2vIvH/hK59LgfCta6xgfuLeNdh2e65XtQ0gXQK/xXXyuVAN8d09nDQYr6KwjPr
         AxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516276; x=1796121076;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Sf68OIIcuaTDE9RTPGfqBeJ0BZYyHQM20HV27OG4qo=;
        b=ULt18w49UI+fFntvZgkPnKQ4K0fEMNDHLh0iHov6puZ/oaanWE9HG9pJihF9OmXjIe
         RXNW1pRs9Xg6VTTyXfNhkpHux5EhiLSaGkWL0Fdt1/rxCG5Ey0FJ4ZwPN6K9A0z1TYjq
         h+yX74EUpmllFRrpk0xqxW60DBXn6UQrlvpJLxw9+tP0JXR4f3NT4uDRtn8s3qaO1uCo
         37Q3wh3n983ibnbutCk7Dc4evULf8J79P7363cCfuOKkwr3MZk8kwbWunC4ePgelb6Wj
         LojiG+aetWCLVf880fhg6KOS/OoOx/AcBrgASlBGawyXKu8JGfXmslEbL4VPMh1DVxO1
         xG+A==
X-Forwarded-Encrypted: i=1; AL+hErE++Zk6MeBLogXKT4k4blbfAcbnGwfKiqIYD9nNyaxM7Kk5QH2joL7dWssjRO6nl3cUWZ88xOHb9AjNjDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e1+4wH/nqEbMpoC5lP1qs9GS6yRR8Vk1SoMI97FkpOFoGi0eZ
	KIPPn/ndn31DXboNUKRre/HTLvk/YpTqufAP5YnT8mpeU9jhjfZKv4GSzYXfvobPQ7XXVDLIt85
	jxrECG0KGPIK3HA==
X-Received: from edcns3-n2.prod.google.com ([2002:a05:6402:c6c3:20b0:6b8:9a3c:9b74])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:42c8:b0:6ba:c8d4:1cad with SMTP id 4fb4d7f45d1cf-6bac8d41d4fmr3349102a12.15.1795516275588;
 Tue, 24 Nov 2026 02:31:15 -0800 (PST)
Date: Tue, 24 Nov 2026 10:31:14 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124103043.339553-1-jpiecuch@google.com>
Subject: [PATCH v2 sched_ext/for-7.4-fixes] sched_ext: Fix suspicious RCU
 usage in KF_RCU_PROTECTED kfuncs
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

Every context accepted by KF_RCU_PROTECTED satisfies
rcu_read_lock_any_held(). Use rcu_dereference_all() in both kfuncs,
matching scx_prog_sched() and rhashtable_lookup(), and convert
scx_bpf_cpu_curr() and scx_bpf_cid_curr() from guard(rcu)() +
rcu_dereference() to rcu_dereference_all() as well to avoid redundant
per-call RCU read-side lock/unlock overhead.

This patch was written with the help of an AI coding assistant.

Fixes: 44f5c8ec5b9a ("sched_ext: Add lockless peek operation for DSQs")
Fixes: 41e3312861ea ("sched_ext: add p->scx.tid and SCX_OPS_TID_TO_TASK lookup")
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
Changes in v2:
- Use rcu_dereference_all() instead of guard(rcu)() in
  scx_bpf_dsq_peek() and scx_bpf_tid_to_task(), and convert
  scx_bpf_cpu_curr() and scx_bpf_cid_curr() to match (Andrea).
- Drop patch 2 ("sched_ext: Take rcu_read_lock() explicitly in sub-cap
  kfuncs") (Andrea).

v1: https://lore.kernel.org/all/20261123145927.577162-1-jpiecuch@google.com/

 kernel/sched/ext/ext.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index e8c30a21e03e..b8702b81782a 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -11167,7 +11167,7 @@ __bpf_kfunc struct task_struct *scx_bpf_dsq_peek(u64 dsq_id,
 		return NULL;
 	}
 
-	return rcu_dereference(dsq->first_task);
+	return rcu_dereference_all(dsq->first_task);
 }
 
 /**
@@ -11908,8 +11908,6 @@ __bpf_kfunc struct task_struct *scx_bpf_cpu_curr(s32 cpu, const struct bpf_prog_
 {
 	struct scx_sched *sch;
 
-	guard(rcu)();
-
 	sch = scx_prog_sched(aux);
 	if (unlikely(!sch))
 		return NULL;
@@ -11917,7 +11915,7 @@ __bpf_kfunc struct task_struct *scx_bpf_cpu_curr(s32 cpu, const struct bpf_prog_
 	if (!scx_cpu_valid(sch, cpu, NULL))
 		return NULL;
 
-	return rcu_dereference(cpu_rq(cpu)->donor);
+	return rcu_dereference_all(cpu_rq(cpu)->donor);
 }
 
 /**
@@ -11933,15 +11931,13 @@ __bpf_kfunc struct task_struct *scx_bpf_cid_curr(s32 cid, const struct bpf_prog_
 	struct scx_sched *sch;
 	s32 cpu;
 
-	guard(rcu)();
-
 	sch = scx_prog_sched(aux);
 	if (unlikely(!sch))
 		return NULL;
 	cpu = scx_cid_to_cpu(sch, cid);
 	if (cpu < 0)
 		return NULL;
-	return rcu_dereference(cpu_rq(cpu)->donor);
+	return rcu_dereference_all(cpu_rq(cpu)->donor);
 }
 
 /**
@@ -11958,7 +11954,7 @@ __bpf_kfunc struct task_struct *scx_bpf_tid_to_task(u64 tid)
 	struct sched_ext_entity *scx;
 
 	if (!scx_tid_to_task_enabled()) {
-		struct scx_sched *sch = rcu_dereference(scx_root);
+		struct scx_sched *sch = rcu_dereference_all(scx_root);
 
 		if (sch)
 			scx_error(sch, "scx_bpf_tid_to_task() called without SCX_OPS_TID_TO_TASK");

base-commit: 2f7928516314f37d7cb334675656b4412edc8be3
-- 
2.56.1.831.g720f3f5937-goog

