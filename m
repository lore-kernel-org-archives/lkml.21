Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982668;
	b=JNEd9M4H0DCWfpT3QOegnUbDqKY38xI7Nzri+IfPWZfqFpn+CZyQ1wzp6V8AapZWwPJo
	 IWRSfQMhrR7LxGedQTYFwvDtBkRBo2iECFklL0auteEUlZ6JblEatb7DZIeXtSVvzJbZ2
	 E2W4OVkR7YdAbDIq1hpAW1y23cfYcjC25onp2Kx5NO/4oN7s/gKLom2JMnu96P5rShsKX
	 0IJdUS727z5MQ04igRYjtCEN6Ro+0PVI9dk8Vj8zb9HTJA7jRpg8DKu8v381MG5r0bzzf
	 wt6zvWzAQ8msAdfnbA2S4nlFGEIl0yatxY12tGhf4UK5NDTg/q4Qs9zLilUQfhcWZow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982668;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fckA3DKXrs9Uw6LV7Il/0uk/nh2afhWPXRFjaKb8A+s=;
	b=rWPjfxMJdHe2HeV7bs4zIri08mpZ79+twLbclslNbN6TYXQn1Rnj0p/OUIC60zIIDJgf
	 QM2vO02tIbgdrKsdPEMfGEbozT+bY5znSICjejP/MtmfttOn2A4Quiqw2MPY0j5GIRJun
	 96dgtN11+jIcLvMQH1O9xe2PZA295j2CSW2IVRzuCNk14wuO3X3ygOrDmTqYXa9keL0dU
	 zsaFIeSlx9sX8CmAyRri1ZKQGXhPNIUkEjCKFKGXfn8YpqswbJAf0VhdsMuK8tegcIRs7
	 o95+LURRGlx1ebVJatDag7NM5z7uAe3XVY6bmXBXajKbcA7iH01TKycEi8xL0vnNp6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.123
Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com [115.124.28.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004AC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08028008|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0405672-0.00122434-0.958209;FP=13818829576831189238|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037033194;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k4eF9Qh_1794982647;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.k4eF9Qh_1794982647 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 14:17:44 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>
Subject: [PATCH 2/2] sched/fair: Convert rq_lock_irq() to guard()
Date: Wed, 18 Nov 2026 14:17:12 +0800
Message-ID: <20261118061712.14503-2-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118061712.14503-1-likunyu@open-hieco.net>
References: <20261118061712.14503-1-likunyu@open-hieco.net>
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

In fair.c, convert the rq_lock_irq()/rq_unlock_irq() pair in
online_fair_sched_group() to guard(rq_lock_irq)(rq). This removes the
now-unnecessary rq_flags local, as the guard helper manages the rq_flags
storage automatically.

In __active_load_balance_cpu_stop(), the rq_lock_irq() call is left as
open-coded, since its unlock path is interleaved with IRQ state
management and does not align cleanly with a scoped guard.

Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1e128214f2e9..2d9927ef8479 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15671,18 +15671,16 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
 void online_fair_sched_group(struct task_group *tg)
 {
 	struct sched_entity *se;
-	struct rq_flags rf;
 	struct rq *rq;
 	int i;
 
 	for_each_possible_cpu(i) {
 		rq = cpu_rq(i);
 		se = tg_se(tg, i);
-		rq_lock_irq(rq, &rf);
+		guard(rq_lock_irq)(rq);
 		update_rq_clock(rq);
 		attach_entity_cfs_rq(se);
 		sync_throttle(tg, i);
-		rq_unlock_irq(rq, &rf);
 	}
 }
 
-- 
2.47.3

