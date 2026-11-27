Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777228;
	b=MJv349DUnTgfwXn68w9ZD69/w3Ps+R8YJW3JtUb1E8X/rqI4jWg7yu/dteG6axwAXZDU
	 +s4rXKqsDbI5GZBjHPRZmkp9xkiQJ2KaSNHZ2TKe/hy8EW7rtQl8x+84ByuPZlLQGyeZc
	 mfuEXBdW3ra7KiJnZZ391w9H5uuJT0zZHSD55P46ZahqUZ3yOFaUak90KzNQxJPElM6bI
	 PVKyegSj5SIAob/wWnJFoVTq6x7V9kqPb7auz9c14KYLe1KHNc6FOeyEAUpzh+igryisS
	 MygKBS4WiqwqGdlIkbi6WAjCbCoSt7j92fNmyXhZj/HhqYpNw8Ccae66X1Il6neyjiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777228;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5if+ejGaV2npE++YEhwIfHjZ4yxffgUizp9rCbGXVNg=;
	b=bN+aac1zemi3NgWE6iS+AMbiu/0U+OuCPOOr5OgU0FncyFpr/BQi1pTJ80B77XWzePyV
	 XV5SQISNFOX9BEi3xVHTxQ09wZdkKBcV6bTPxNfeQuq3yq+eg54uAV00ldujE9jHYu7Dv
	 35IHHxd2A6uzW1hlHxEfu3pXb5cZ4tVAiCTSyxIjVVrNAmT1DrCvX3Ij/oR9lU7l+UG9J
	 gLUogwoDXoOIz4V+1z/3O5NFZWstCgzmPEmbGbsw0VJR13zkZllaZCYfv/c+lxrNhGmuj
	 62wFCXEBV1prQpzqUaTdLn2VELvv3dHnXqPX1NIG1FaT8o10k+NrzWiKUpcEYJZkM8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.146
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com [115.124.28.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3D606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE3D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2250661|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00256755-0.000403942-0.997028;FP=13241880589834721786|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083034076;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.kBWBemm_1795777215;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kBWBemm_1795777215 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 19:00:16 +0800
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
	kprateek.nayak@amd.com,
	kayracizmeci@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>
Subject: [PATCH v2] sched/fair: Simplify pref_llc_queued handling in account_llc_enqueue()
Date: Fri, 27 Nov 2026 19:00:06 +0800
Message-ID: <20261127110006.4507-1-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127091146.3504-1-likunyu@open-hieco.net>
References: <20261127091146.3504-1-likunyu@open-hieco.net>
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

pref_llc_queued is only used once. Assign p->pref_llc_queued directly
at the original sampling point instead of caching the value in a local
variable.

Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
Changes in v2:
- Remove the Suggested-by tag and the related reference information.
---
 kernel/sched/fair.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..4efc5ed5e79f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1521,16 +1521,13 @@ static void pref_llc_running_dec(struct rq *rq, struct task_struct *p)
 
 static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
 {
-	int pref_llc, pref_llc_queued;
+	int pref_llc;
 	struct sched_domain *sd;
 
 	pref_llc = p->preferred_llc;
 	if (pref_llc < 0)
 		return;
 
-	pref_llc_queued = (pref_llc == task_llc(p));
-	rq->nr_llc_running++;
-
 	/*
 	 * Record whether p is enqueued on its preferred
 	 * LLC, in order to pair with account_llc_dequeue()
@@ -1545,7 +1542,8 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
 	 * p->pref_llc_queued in account_llc_dequeue() would
 	 * be reliable.
 	 */
-	p->pref_llc_queued = pref_llc_queued;
+	p->pref_llc_queued = (pref_llc == task_llc(p));
+	rq->nr_llc_running++;
 
 	/* Skipped while delayed; clear_delayed() adds it back on wake. */
 	pref_llc_running_inc(rq, p);
-- 
2.47.3

