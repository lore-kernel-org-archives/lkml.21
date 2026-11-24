Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541961;
	b=lLIKna3L64dwsqnA+tHHCVdaNB/CCdphdWjmtR7UbLqbER11ur6AfprTRYFPVZ83vBiY
	 91ow6vcou+snCJenD+m9hk01QuyRvrKEoU66vvi7296mx7YqD3iok16d6a67L9DazYBQy
	 zdBSbnABYdaTRlzZpPT94NAhrzYANSIBD2eVOZRyrYEN5gxkHWWpztXbtqk4HdNDsOiNG
	 fZA69ZW+oXufIZ8fLi0/umhpd1zPUBGh+nEvvve3NFXhs4GdKzIGtJ8ILu50xYDOUAS08
	 s/9UxHbygW95eyNY/0QUKn/uMm4wjUAhg4v6my2z9NPfstbn1g7nkA8dZuElgUO53xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/5aXYZOiCfmZpepVU5XcntNHJrd4O0PtQpD5cOGvrlc=;
	b=LERSlspOUXbILJENcqNwbdb0Nepeu6LJy8nTvLXzzFY/AJtBAOtfg21hYfhl4wnpOhPb
	 cCy/jH8qRZGMuApNZnavYQGeBqCq8L0rJv7g9F0b0AHaMouu+E8mmbclc8QQQqw9vn/CK
	 /MVm9dIXIyJFdQwSx8gEYmDH8p925V8d938fu+2z0ewW2L1uRGB4SxK1VvY96xJUSSNMs
	 CKucl5I2c873091kyJhMbocxupOzk7LvWS0/2Uq8dGC8nX0wf824Sammg/6bqOpnWzV+W
	 NCj6Ax9YHJzEYbhzsZOH1W4rFTLLrDjKqIHGJRQTrvnKCO/IlyjwgF/4H4U+C4WloUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=g+CsQD8V;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5708B606A332
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5708B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=g+CsQD8V
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862df509d48so3780066a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1795541959; x=1796146759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5aXYZOiCfmZpepVU5XcntNHJrd4O0PtQpD5cOGvrlc=;
        b=g+CsQD8V54qVIAt0fMSF2JLjZB8Sc4FGlKFaOY5d7F2cewuRxg+oUU33m11Wik04mv
         fUdwoV7+IT54bov+7BscT4T32vEdrx469i6HpM5behQbrPVUtatpMt5d4eLCq2ATbe9j
         x+uSFvGL+C9r81egeAdaDvlG6cM+XdqG239n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541959; x=1796146759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5aXYZOiCfmZpepVU5XcntNHJrd4O0PtQpD5cOGvrlc=;
        b=BYt1a6gNP5dDYso4b5tAfHQaDm7yPUye6Ru/GSt03ajDpvj+wbs+L55hRPdbLRJ5OL
         OuzeQpR9PO0/jY4Oq1QK/V9muSbiTWWCNj/N8P2MXyr5skNUy1ReZiAraXHx7WpkN3Ni
         eqHHgChZtJGAFiwJPeMzR+CM/Md8EegmbUXhRwsr3m6kmSKej5sDCXi3HclXp7Jcedrt
         Mb/6bTquI0Jb7MO1qMtgNu8qTscHJWofhdHUOZM1M143J9Ry3AyMGPCEuerVJTzuy1Hs
         /TCvFLE6yYL0ySrPHs8gW920LHj7RhslqZTl/ofr5OY5OKZnxlTItI+ymW55D/kGA2+s
         Iqjg==
X-Forwarded-Encrypted: i=1; AL+hErGEWGptYwKF2z1ZaH+IwDSBIAobPFEbSvhCxODe9oGbEy0ZKxQBevB++BLFOB/o6nepOS8AiAcnzAN6HCA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VY1ZAnowe4bZI02iRtQt3E7wemDEiVuZobuoeRFb9t9UTyGQG
	alCe5epTbDIesvdHoKX3j1Jwf9vnKMS6EKOdAh0otHh0s+hfU7wW58nEag7CQDr9Z60=
X-Gm-Gg: AZFdTZcwGaGRNGAo1CW4oyEAcPv6IS1tupFXDIF0JISwJT2VAmIEufoetq6p7VPSeYL
	4quSZLNyOXwoeS65XtU/fXKqRrmAUAbAPWktTr2KbhoNbs8DCs0Pp2Q2kdjlwsry0viLWyaWLAL
	77hFqhq1ZKTVs8+oYcLHjYa0hSlp1lao0PO3P10zwpZemfMPCpP/WvZshZpG61JGT18U3DSseSk
	2g25ERXMxpfsucn5eEUe/qSEm7Oc9Dz2oveoYWYpYXm4wDbVNaoYYb7LTU6+hdIz53WKXa4MzqQ
	bKYjnytg20fAhS8H/M2RJ/AV7qKqfQTwtCOPNjpg2KRq8uKpQeJ7zoFpRRAddGyQATV51/Ze5MO
	gWE/RufF06vx28l0ntd72HTGbEz/mrOyOnr5C3WL+uXMCo5yj0Htd4P887hTfsy1pvF/ye1bXup
	MAEeKFbC4WRPzzbRjKwD5+3nYg/tk39zLDA/bBXQMuuwuIReFsKOlTYIF9VTzJr4S2mEGdFvzve
	yqfculx6WdwZbkkBxb20AMtr6akvG176Je0ybnk0CpiYCPZUZ/cn/4PEl/mCiQCHUaF3c2FpSHl
	THOfIuo3EEFNwn2hxN1APJpYmcqAA5xFKjQIJ/0sPfFZ//XoOhGzn4KoQYvgKCQz4lfh3f0oqLV
	cnPL+FSGv0qW3w21IqADgM6lWlvJdFg==
X-Received: by 2002:a05:6830:82ee:b0:85b:895:a015 with SMTP id 46e09a7af769-86309065b5amr12447788a34.4.1795541959275;
        Tue, 24 Nov 2026 09:39:19 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168bdaf7sm11667094a34.5.2026.11.24.09.39.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:39:19 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	kuba@kernel.org,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v3 2/2] net/sched: sfq: perturb the hash from the enqueue path
Date: Tue, 24 Nov 2026 09:38:14 -0800
Message-ID: <f2f59b9b0f7391a3b4c366cb0b04252af8e94eaa.1795540952.git.kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795540952.git.kylebot@openai.com>
References: <20261110044450.51921-1-kylebot@openai.com> <cover.1795540952.git.kylebot@openai.com>
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

A backlogged SFQ can remain alive after its root is unpublished. Its
perturbation timer takes the current sleeping-root lock, but rehashing
can still resolve the old parent handles through the live device. A
missing parent triggers a warning; a reused handle can make
qdisc_tree_reduce_backlog() subtract packets from a replacement tree.

Perform a due perturbation before classifying the next enqueued packet.
The packet path holds the queue's lock, so the key change and rehash
happen together without an autonomous callback. Preserve the initial
perturbation interval and pass dropped skbs through enqueue's
deferred-free list. Idle queues keep their key until another packet
arrives.

An AI review found this path.

Fixes: 18cb809850fb ("net_sched: sfq: extend limits")
Fixes: 47e8dbb6e763 ("net/sched: do not reset queues in graft operations")
Cc: <stable@vger.kernel.org> # d6f81fd6abe2: net: sched: prevent scheduling deactivated qdiscs
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 net/sched/sch_sfq.c | 49 ++++++++++++++-------------------------------
 1 file changed, 15 insertions(+), 34 deletions(-)

diff --git a/net/sched/sch_sfq.c b/net/sched/sch_sfq.c
index 2bd3fc65053a..5810c458586e 100644
--- a/net/sched/sch_sfq.c
+++ b/net/sched/sch_sfq.c
@@ -130,11 +130,10 @@ struct sfq_sched_data {
 					 * dep[X] : list of flows with X packets
 					 */
 
+	unsigned long	perturb_time;	/* next hash perturbation */
 	unsigned int	maxflows;	/* number of flows in flows array */
 	int		perturb_period;
 	unsigned int	quantum;	/* Allotment per round: MUST BE >= MTU */
-	struct timer_list perturb_timer;
-	struct Qdisc	*sch;
 };
 
 /*
@@ -340,6 +339,8 @@ static int sfq_headdrop(const struct sfq_sched_data *q)
 	return q->headdrop;
 }
 
+static void sfq_perturbation(struct Qdisc *sch, struct sk_buff **to_free);
+
 static int
 sfq_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 {
@@ -351,6 +352,10 @@ sfq_enqueue(struct sk_buff *skb, struct Qdisc *sch, struct sk_buff **to_free)
 	struct sk_buff *head;
 	int delta;
 
+	if (q->perturb_period &&
+	    unlikely(time_after_eq(jiffies, q->perturb_time)))
+		sfq_perturbation(sch, to_free);
+
 	hash = sfq_classify(skb, sch, &ret);
 	if (hash == 0) {
 		if (ret & __NET_XMIT_BYPASS)
@@ -531,7 +536,7 @@ sfq_reset(struct Qdisc *sch)
  * We dont use sfq_dequeue()/sfq_enqueue() because we dont want to change
  * counters.
  */
-static void sfq_rehash(struct Qdisc *sch)
+static void sfq_rehash(struct Qdisc *sch, struct sk_buff **to_free)
 {
 	struct sfq_sched_data *q = qdisc_priv(sch);
 	struct sk_buff *skb;
@@ -569,7 +574,7 @@ static void sfq_rehash(struct Qdisc *sch)
 drop:
 				qdisc_qstats_backlog_dec(sch, skb);
 				drop_len += qdisc_pkt_len(skb);
-				kfree_skb(skb);
+				__qdisc_drop(skb, to_free);
 				dropped++;
 				continue;
 			}
@@ -601,29 +606,14 @@ static void sfq_rehash(struct Qdisc *sch)
 	qdisc_tree_reduce_backlog(sch, dropped, drop_len);
 }
 
-static void sfq_perturbation(struct timer_list *t)
+static void sfq_perturbation(struct Qdisc *sch, struct sk_buff **to_free)
 {
-	struct sfq_sched_data *q = timer_container_of(q, t, perturb_timer);
-	struct Qdisc *sch = q->sch;
-	spinlock_t *root_lock;
-	siphash_key_t nkey;
-	int period;
+	struct sfq_sched_data *q = qdisc_priv(sch);
 
-	get_random_bytes(&nkey, sizeof(nkey));
-	rcu_read_lock();
-	root_lock = qdisc_lock_root_sleeping(sch);
-	q->perturbation = nkey;
+	q->perturb_time = jiffies + q->perturb_period;
+	get_random_bytes(&q->perturbation, sizeof(q->perturbation));
 	if (!q->filter_list && q->tail)
-		sfq_rehash(sch);
-	spin_unlock(root_lock);
-
-	/* q->perturb_period can change under us from
-	 * sfq_change() and sfq_destroy().
-	 */
-	period = READ_ONCE(q->perturb_period);
-	if (period)
-		mod_timer(&q->perturb_timer, jiffies + period);
-	rcu_read_unlock();
+		sfq_rehash(sch, to_free);
 }
 
 static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
@@ -746,11 +736,7 @@ static int sfq_change(struct Qdisc *sch, struct nlattr *opt,
 	rtnl_kfree_skbs(to_free, tail);
 	qdisc_tree_reduce_backlog(sch, qlen - sch->q.qlen, dropped);
 
-	timer_delete(&q->perturb_timer);
-	if (q->perturb_period) {
-		mod_timer(&q->perturb_timer, jiffies + q->perturb_period);
-		get_random_bytes(&q->perturbation, sizeof(q->perturbation));
-	}
+	q->perturb_time = jiffies + q->perturb_period;
 	sch_tree_unlock(sch);
 	kfree(p);
 	return 0;
@@ -771,8 +757,6 @@ static void sfq_destroy(struct Qdisc *sch)
 	struct sfq_sched_data *q = qdisc_priv(sch);
 
 	tcf_block_put(q->block);
-	WRITE_ONCE(q->perturb_period, 0);
-	timer_delete_sync(&q->perturb_timer);
 	sfq_free(q->ht);
 	sfq_free(q->slots);
 	kfree(q->red_parms);
@@ -785,9 +769,6 @@ static int sfq_init(struct Qdisc *sch, struct nlattr *opt,
 	int i;
 	int err;
 
-	q->sch = sch;
-	timer_setup(&q->perturb_timer, sfq_perturbation, TIMER_DEFERRABLE);
-
 	err = tcf_block_get(&q->block, &q->filter_list, sch, extack);
 	if (err)
 		return err;
-- 
2.55.0.openai.911.g06873a30d2f3

