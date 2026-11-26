Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706710;
	b=ocYOl02wYJNGLHsDApKq55M84RlY6wWwtGisJuj1D9WLb7d8N2inTgCVe2N9XWZCrJ4c
	 yKgyuFhYDaXkh77Da7vMAXpWCs6ajUzDbuVDjPLlxEX0ccI1SeEEl9a1Vhv184aAEAldi
	 LZzshyC/e+XTuyeGqspsyxmMyjyt2OluCMn4ZTj70pMnLps6Ycjwkt4zsUL34xZuBRwEF
	 DOE0muYnfWJPoPPt9Jrtz6+yYA9n++IbOD4Nx/x5ENrAuGyVl+PDmNTj2J0bDrE25fnqs
	 pwElT8VCIsMXn/KtP9Fj81n+fHsHw2cBMNYIdMyTl4yBk6U4PmsgMagUcGMd9tYOZMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C58o5TL9W8xmOKco1dxl6+wp8Jy59K9XLL0FCHsaETs=;
	b=cDV5rorNOktg/w20nM9qKCNYOOXtNd0IAjRVKZl9y/MC7RPb+Lx7bY3CUXPh+ljtm79y
	 Kr/79TiWqm84z1SLp/QtDnGOHS08o0ZCY8GelYdABVn85+H0JHAhY/MEWnh04Omih6h3h
	 wIWUSGqdZ/D5ypsQZeTnj3HUJvQ6sAB7citJYVzCKx9eCAEu0b1Rq2O/EYflif0VEYHxC
	 wU8tcmxMD9A7SdgoqfXMAWLkY+5ZkFH2Zx9L1X2D/oye9aECX+gUhLIf7euBmr7iYIBaF
	 ItSRrT2hqijAfk2ZUWb3h9/rOvYzCHdRo9L/szAaJ61tYLNkbcvQudwK6yguTifEvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bcJkEjgo;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DEC606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71DEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bcJkEjgo
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so5991295f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795706709; x=1796311509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C58o5TL9W8xmOKco1dxl6+wp8Jy59K9XLL0FCHsaETs=;
        b=bcJkEjgocFZk7PdHtT45nvZw/msIcAC/Z2vWbQX5v70NhqzE4aatI7RWjtQS9mZp5s
         as0loQfClyQniAcTTl/6/OtRXP7aPVCXAjgvSrTP+ABX5TRHQv4oR6BYv3eo8QvwjYup
         DD5JxGEKbH/l3HhBjKBnsNGDR1ps/8uC2VXkYUoU4GXueUExQ0X5JNPGdc9yBCfVu1gK
         X4X3FtZg4Zks9DIIXiUxtab6riXstxgBSj9rSq16FJnWo581kno95dj3OeV9PoV24+BU
         FCVGsqtBCBKJNuGKeL7FtvVyRXHKAmfkXjzkJ9jR1PTOaXjEz8UXEbOalnvQteEyUZsS
         AHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706709; x=1796311509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C58o5TL9W8xmOKco1dxl6+wp8Jy59K9XLL0FCHsaETs=;
        b=IOLS6Uk6i5Gj9bX8btrer6ASNRKsy8vYa6/A5GaO8ll+KYH8evSjxChGISaIPlAiSL
         BpFbh8TpWPj2UtvVikfUe/pQ7aHKhTLWJHGIBkGKzD+27RO9tEeabALK1weYeP6G+QrG
         V4RL1bC8Mr1UmRvCE7oo2Diuii7pQKd21jUjMS+2yOD8KxdWqkcnDQN4MpTBoYVxQ/bQ
         Tg8o9jP5wOBOrbKQAiWRSQX3rgRJCJKkvZj9dAkkzBk/W7WysRgAA0y0F3dUWMxS44Y3
         V+8LLtjm2mvSAm5TYnLepMPe6ECgxohQdnmqRxuNpi3cOouIyI1Qj+5E46hh0KULdFsY
         NiQw==
X-Gm-Message-State: APuU4Z9OjQOeV3b6FOP/5g2tknrX6FWXnfVW+/MxGePtxl4WB24La9n4
	v7p8SWw3bgQ3ykD5FSrk3Q8siCybQPmIp4hk2kdnCIMhd3oLLd2Bi+yghwMkGJ5zWmuvaF5FQEe
	FSxSLDDM=
X-Gm-Gg: AZFdTZcNFSiTxChFRTs7kHazPBrll+gZf+3wbq2MxQP7+zNdZnmLRYnEJZFGGGI1bdz
	onIBOXN5w+i6+jj9Ba19KFX0myigIGklAFabaoE2U/xRsC1SzDiOj8IIDIa9dlMaeUXU2DmYs/N
	raQ3ukj0R+COpSZwg6NmiE+uNseoiU/TJv/D0MgGVYi7v7MXxdY07bub8MMfbMdK91daIT04C0b
	rPyoVDd8EzbHmvocWNTbzycozJbzMNwgmESvIABmluvQeaJnsz1CUpmVZPEOb3QiILdrpNqzvbc
	SEaGa+tyeS/5bWZFQIOHCu9Stnm7zAAiWoNFfc1EqqGvmzFHl4sVu2nf0EP9Ncmi5ZsonRVmT+5
	L2lrub/lUYlp+10R7o320yv3b+7QV8KR8iHnni7pQy2qziyyEuz2zjwUVr5k4hMavRthdjk1Zt9
	+BZm30ICnFPrvbajlUpDmr/ccC/U7jwr5SjApSbmjqPSyTEuZNfj1h+9GOShVfNAFFsSj/bQHxG
	tqRl0wrc4TiSPN+LMkbyOHAHGWvNIceIZ18EUdNt+viUkQt8SSVxB6jPxXxgSHM6WH/lo3uIzU7
	tXiEhVL+YW+V+q13+C3IKqKRaNKf+rNlpwFj6cHTkx6WgfInLMD9
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr461960245e9.7.1795706708066;
        Thu, 26 Nov 2026 07:25:08 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm569944295e9.2.2026.11.26.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:25:07 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH RFC 1/3] workqueue: Add WQ_PREFER_PERCPU and system_prefer_percpu_wq
Date: Thu, 26 Nov 2026 16:24:56 +0100
Message-ID: <20261126152458.742942-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126152458.742942-1-marco.crivellari@suse.com>
References: <20261126152458.742942-1-marco.crivellari@suse.com>
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

There may be situations where local execution is not strictly needed
for correctness, but it is preferred for performance gains.

The Workqueue API currently does not distinguish between these two
instances.

So add WQ_PREFER_PERCPU and system_prefer_percpu_wq, so that it would
be the first choice for workloads that don't strictly need local
execution for correctness but only to maintain locality.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 include/linux/workqueue.h | 17 ++++++++++++++++-
 kernel/workqueue.c        |  7 ++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 1caacdb5bc8e..9c315f354b5a 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -403,6 +403,15 @@ enum wq_flags {
 	WQ_PERCPU		= 1 << 8, /* bound to a specific cpu */
 	WQ_RT			= 1 << 9, /* real-time priority, invalid with WQ_PERCPU */
 
+	/*
+	 * Like WQ_PERCPU, for work that only prefers the queueing CPU for
+	 * locality. While a CPU is isolated (isolcpus=domain or a cgroup v2
+	 * isolated partition), work queued on it runs on an unbound pool on
+	 * the housekeeping CPUs instead; once the CPU stops being isolated,
+	 * its per-cpu pool is used again. Implies WQ_PERCPU.
+	 */
+	WQ_PREFER_PERCPU	= 1 << 10,
+
 	__WQ_DESTROYING		= 1 << 15, /* internal: workqueue is destroying */
 	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
 	__WQ_ORDERED		= 1 << 17, /* internal: workqueue is ordered */
@@ -459,6 +468,9 @@ enum wq_consts {
  *
  * system_bh[_highpri]_wq are convenience interface to softirq. BH work items
  * are executed in the queueing CPU's BH context in the queueing order.
+ *
+ * system_prefer_percpu_wq is for work items which prefer to run on the
+ * queueing CPU for locality but don't require it; see WQ_PREFER_PERCPU.
  */
 extern struct workqueue_struct *system_wq; /* use system_percpu_wq, this will be removed */
 extern struct workqueue_struct *system_percpu_wq;
@@ -472,6 +484,7 @@ extern struct workqueue_struct *system_freezable_power_efficient_wq;
 extern struct workqueue_struct *system_bh_wq;
 extern struct workqueue_struct *system_bh_highpri_wq;
 extern struct workqueue_struct *system_dfl_long_wq;
+extern struct workqueue_struct *system_prefer_percpu_wq;
 
 void workqueue_softirq_action(bool highpri);
 void workqueue_softirq_dead(unsigned int cpu);
@@ -821,7 +834,9 @@ extern void __warn_flushing_systemwide_wq(void)
 	    (__builtin_constant_p(_wq == system_power_efficient_wq) &&	\
 	     _wq == system_power_efficient_wq) ||			\
 	    (__builtin_constant_p(_wq == system_freezable_power_efficient_wq) && \
-	     _wq == system_freezable_power_efficient_wq))		\
+	     _wq == system_freezable_power_efficient_wq) ||		\
+	    (__builtin_constant_p(_wq == system_prefer_percpu_wq) &&	\
+	     _wq == system_prefer_percpu_wq))				\
 		__warn_flushing_systemwide_wq();			\
 	__flush_workqueue(_wq);						\
 })
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 558049dbb894..73c61a55d4ce 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -566,6 +566,8 @@ struct workqueue_struct *system_bh_highpri_wq;
 EXPORT_SYMBOL_GPL(system_bh_highpri_wq);
 struct workqueue_struct *system_dfl_long_wq __ro_after_init;
 EXPORT_SYMBOL_GPL(system_dfl_long_wq);
+struct workqueue_struct *system_prefer_percpu_wq __ro_after_init;
+EXPORT_SYMBOL_GPL(system_prefer_percpu_wq);
 
 static int worker_thread(void *__worker);
 static void workqueue_sysfs_unregister(struct workqueue_struct *wq);
@@ -8483,11 +8485,14 @@ void __init workqueue_init_early(void)
 	system_bh_highpri_wq = alloc_workqueue("events_bh_highpri",
 					       WQ_BH | WQ_HIGHPRI | WQ_PERCPU, 0);
 	system_dfl_long_wq = alloc_workqueue("events_dfl_long", WQ_UNBOUND, WQ_MAX_ACTIVE);
+	system_prefer_percpu_wq = alloc_workqueue("events_prefer_percpu",
+						  WQ_PERCPU | WQ_PREFER_PERCPU, 0);
 	BUG_ON(!system_wq || !system_percpu_wq|| !system_highpri_wq || !system_long_wq ||
 	       !system_unbound_wq || !system_freezable_wq || !system_dfl_wq ||
 	       !system_power_efficient_wq ||
 	       !system_freezable_power_efficient_wq ||
-	       !system_bh_wq || !system_bh_highpri_wq || !system_dfl_long_wq);
+	       !system_bh_wq || !system_bh_highpri_wq || !system_dfl_long_wq ||
+	       !system_prefer_percpu_wq);
 }
 
 static void __init wq_cpu_intensive_thresh_init(void)
-- 
2.56.0

