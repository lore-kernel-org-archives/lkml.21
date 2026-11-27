Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770742;
	b=RqDGgb79pjixMS04xTa2JKtO8hHDA1c4Tccicm2diBYZ4tJwDeOFlO80TAqE2n1UOefr
	 268tzJnsQsLEcNZgxjXiimS6l6h/qXv1E4cLUCjHRs/tOLXCiwQxzBo/iqUJhOcoSYtQ2
	 6ccxzW8f4f9+/Er4EzNn8K+wXvg1JRNtzmroiFsRyVsc76Pu9xNPTe4iobf3jy6UhoPVw
	 ysoXmR5g8eRHj2BSnybq2dyDHnQNT6g4mzNvrs5i/zBJQ6jtmpVNBnWcJEXC2OYOnA1ZM
	 iZE2F0i8Yz7ojDvqw1NNrjwSII9yskDqp8E+EX0l5+67PTM5NkXd4iLtv7HsXbKST3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770742;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Uv4JYfKXo+hZBgW8lH6SGUe0HEbBV8htYjsOfUV5QAI=;
	b=K1jrMlbvXtJLdCVbde4JxQcKYGr2xIxCihiLjF4khLW4/G+aMZCj5Xx3at3gdbCZjoDU
	 qghoOLxBqjlvY+WwpRlxM+39S5IQjCpZyBu4AxWgZVZwwE77L7dIb4NlMs3U+0bQzcwEX
	 LMmuMHqViAUm5QpZb+XXQH8Pz1SVH2/pbNOYxroAaPAF3xvj/fZRL68sL7Nj6T3LtyAS7
	 4WoQzPTFAokuBJWRj6ZIVXOiXCIokwivoDstwn9EWhM47f7jyNrslSFnp/TqWoQ2kqi53
	 ldFQ3aoNV1zdBDFLvvV1gw2KkMFWsVvzs69Tuwv+UVI97ppFO4kci0pvuG4rIIsN4rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.100
Received: from out28-100.mail.aliyun.com (out28-100.mail.aliyun.com [115.124.28.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8DF606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2181654|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00256357-0.000611944-0.996824;FP=13223866198036060666|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034254;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.kBRXc62_1795770729;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.kBRXc62_1795770729 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 27 Nov 2026 17:12:10 +0800
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
Subject: [PATCH] sched/fair: Simplify pref_llc_queued handling in account_llc_enqueue()
Date: Fri, 27 Nov 2026 17:11:46 +0800
Message-ID: <20261127091146.3504-1-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
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

Suggested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Link: https://lore.kernel.org/all/awhlwJTOLPeNqFW8@scheduler.schedules/
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
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

