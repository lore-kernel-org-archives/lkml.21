Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794977533;
	b=HUrwcukuD0x6fnQLja+bK6iSgrLiYLN1ZZ8c2j6vBKrnkY/z/rD+W7UlsYSK5LeDyLf9
	 4oBifoMU9132MM/Lm5qDxsmTYbjUIKgmvBkYe3i2PAaIe6eAbtlWBcMJ0tb9kljyJdX9n
	 Yj+euL8AoNQ/7Tbny2pSI1fx5+2ADaVTJ5EY3v1bzjJghsY/KJJCS2GXVpkVcEwkPc8NC
	 KbaJsXo/pkVGh2YIHDCSMe1wTxt+3G5A/SjTTE/YRCIWbwQcTK+KbrV2qFQ6gL36qh4ZD
	 QBMRRXPPPWn/RdW8K4dltprL5ZhtEC/pmOC7cT+SXS0UgEDHiEmuuOTpfTM04togDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794977533;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D4Glb/phafOO2J4NO7289AZtRKHSGknHG2wh1OwjCi4=;
	b=ZYFhvY57+ESdFt5n6Y3nBwKbW+FQV4gSWd/KDmsM+6v/cwKkFL0927YBOqhRvF5tROYm
	 Irq4szgpgliBloTT9b9lFkWZ1YzJAHVL05JCg90Yws2sCGKk3WXx9khyLHmGA/BahLDjQ
	 bs1tDPezQrlTBfATqLgrcUdxBdyWaqOpziMQxhSBCWerXQ30nLs1Ir8QmL3T9m3gtHkrQ
	 n5kA7k3FTmPt/Xc3lMW525P/A4Jl61t/Zeu8dfCtPlG3Tzaq7W+38qMv8nNbtnG+ecOPb
	 k+XIAACOXKZ4dE15SUC5b/Uyj5MTIb92uTfXRVj+TOQloLz3BpYvlSqKWB9IjQ5YM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I2i14tZe;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D29606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=I2i14tZe
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=D3DeV3YkG5u10TKSbuUfjvJgZyIgkf+zdkPJkso3qVI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794977530; v=1; x=1795582330;
 b=I2i14tZeX//YYpRYQSgx7wKKMaEVr6+DK68Xoi2YrhHDUUna31vAn8BzuauD5cZaE/XbtZNt
 tRRxZVBSU/ZiHrAqxtKL4WtOiKhqMQruhmVs5C5+B0ShFdH3ZD5Wy45sisg2vuw4E3D9pFyX8jC
 4CTyl4LkacZFW2ME7dG+9rqo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9116fc7c9e291cd0;
	Wed, 18 Nov 2026 04:52:10 +0000
X-Mizu-Trace-ID: 9116fc7c9e291cd0
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"D. Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	linux-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-s390@vger.kernel.org
Subject: [PATCH net-next v2 1/5] inet: frags: annotate data-races around fqdir->timeout and fqdir->max_dist
Date: Wed, 18 Nov 2026 12:51:16 +0800
Message-ID: <20261118045137.174026-2-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118045137.174026-1-jiayuan.chen@linux.dev>
References: <20261118045137.174026-1-jiayuan.chen@linux.dev>
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

fqdir->timeout and fqdir->max_dist are read without any lock while their
sysctl handlers update them with WRITE_ONCE(). Add READ_ONCE() to the
readers.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 net/ipv4/inet_fragment.c | 2 +-
 net/ipv4/ip_fragment.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/inet_fragment.c b/net/ipv4/inet_fragment.c
index f330d0a398233..8143162eb9f53 100644
--- a/net/ipv4/inet_fragment.c
+++ b/net/ipv4/inet_fragment.c
@@ -416,7 +416,7 @@ static struct inet_frag_queue *inet_frag_create(struct fqdir *fqdir,
 		inet_frag_putn(q, 2);
 		return NULL;
 	}
-	mod_timer(&q->timer, jiffies + fqdir->timeout);
+	mod_timer(&q->timer, jiffies + READ_ONCE(fqdir->timeout));
 	spin_unlock_bh(&q->lock);
 	return q;
 }
diff --git a/net/ipv4/ip_fragment.c b/net/ipv4/ip_fragment.c
index ef7fd61284a3f..5ac69d716da2a 100644
--- a/net/ipv4/ip_fragment.c
+++ b/net/ipv4/ip_fragment.c
@@ -89,7 +89,7 @@ static void ip4_frag_init(struct inet_frag_queue *q, const void *a)
 
 	q->key.v4 = *key;
 	qp->ecn = 0;
-	if (q->fqdir->max_dist) {
+	if (READ_ONCE(q->fqdir->max_dist)) {
 		rcu_read_lock();
 		p = inet_getpeer_v4(net->ipv4.peers, key->saddr, key->vif);
 		if (p && !refcount_inc_not_zero(&p->refcnt))
@@ -220,7 +220,7 @@ static struct ipq *ip_find(struct net *net, struct iphdr *iph,
 static int ip_frag_too_far(struct ipq *qp)
 {
 	struct inet_peer *peer = qp->peer;
-	unsigned int max = qp->q.fqdir->max_dist;
+	unsigned int max = READ_ONCE(qp->q.fqdir->max_dist);
 	unsigned int start, end;
 
 	int rc;
@@ -242,7 +242,7 @@ static int ip_frag_too_far(struct ipq *qp)
 
 static int ip_frag_reinit(struct ipq *qp)
 {
-	if (!mod_timer_pending(&qp->q.timer, jiffies + qp->q.fqdir->timeout))
+	if (!mod_timer_pending(&qp->q.timer, jiffies + READ_ONCE(qp->q.fqdir->timeout)))
 		return -ETIMEDOUT;
 
 	inet_frag_queue_flush(&qp->q, SKB_DROP_REASON_FRAG_TOO_FAR);
-- 
2.43.0

