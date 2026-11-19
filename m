Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086325;
	b=2neJUBQt2/LRg+DRoCOqp92V2p+31bnFMHqa9GbCHWAOsOYVThrCxvqr2lcV37SogCaZ
	 VOgT2Sg/5KqKWVuXdLh2IPbV1O72wHSEu2Upfb7Punkn1uEg8wq97S+nnQPxtsU7ql2OR
	 QFcd77qCjZraWHYp8T3UpqwSflAtSOWKB9NH+poFpb1UT7KmexHIrkVRXsIkWJ+b2XFaW
	 ati367K3r5oUt6QJtotfe4X1q/Bj4d2qEI+iGW0pBdbyfQH8rERLPNGyRh2zAOcjxFu0K
	 0LamymcwAwPfp/x8zDf3DzO7aBQndO/orvD8g1dgMdTjE5POupCqArci1gfNqnIFZBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086325;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=1FBQNxs/R1DsmHIJkLhFZceckPD2xMCFOwYjxlGTdSg=;
	b=vVtSCMlXnBtcuptidHQE8dDhf9B/9blo9fMjbJWN+rWc5Cqb87f0G41nv5e0rmf5Yxy6
	 h+zHM1oB96bEDy5VfflYLvtpQ68yoAvArshW1HlPaFSbRDv4tAUxGZb6aSHkPylELy0QS
	 hfbTWwgvqoWohBDaAme2kl30DwEehs0OYhhGGLj7673Va06FTxiJJCmJ/+S5+8i+9WHyq
	 wXwD6zKPDWHfhcW/qrTUItdPVaomoEDE3JVOzs0OQtn8AkznAr9EkdapucF3cl2oxjWdE
	 J8Pwy+jJc8db/bvfvc0WWINKimSUdn15ntmrbQT+SFmO9ThdSNsuKnVqz74ateTKNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jFCDEtyx;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAD0606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FAD0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jFCDEtyx
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pwBEnk56dhZkjNV77x5nZMxFvZPU6WBrlZc8/rDRk0I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795086323; v=1; x=1795691123;
 b=jFCDEtyxgc8VInP/LJs4Svr55ucpOKf2N5yLW/22yERYzGaS694tCs7bPkRkJn0ObOGsr+xc
 3brOv0ruNpGK1bC5DuqNXOBJi21dgw/Vcq2WirtZhaIaYns8fNnJd6sWOGVqjc+bPc8VT9cYdL9
 PepKp+Wwnsl/CFLYbsI9w+Co=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de80de804197a131;
	Thu, 19 Nov 2026 11:05:22 +0000
X-Mizu-Trace-ID: de80de804197a131
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Thu, 19 Nov 2026 06:05:06 -0500
Subject: [PATCH v3 1/3] dm thin: drop the grace period from thin_ctr()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-bug-dm-thin-rcu-gp-v3-1-c80ecc475e1e@linux.dev>
References: <20261119-bug-dm-thin-rcu-gp-v3-0-c80ecc475e1e@linux.dev>
In-Reply-To: <20261119-bug-dm-thin-rcu-gp-v3-0-c80ecc475e1e@linux.dev>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

thin_ctr() adds the new thin to pool->active_thins with
list_add_tail_rcu() and then calls synchronize_rcu(), so that a
wake_worker() call can't miss the bios of a thin that isn't visible yet.

The grace period doesn't make the entry any more visible. A worker that
walks the list after list_add_tail_rcu() finds the thin, and the thin
gets no bios before its table is resumed. A walk already in progress may
miss it, but the wake_worker() for the first bio queues the worker
again. Still, activating a thin device waits for a full grace period,
which takes about half of the activation.

Remove the synchronize_rcu() call.

Activating 100 thin devices of an idle pool with dmsetup create takes
per device (mean of five rounds, min-max of the rounds in parentheses):

  before (ms)        after (ms)       change
  15.5 (15.2-15.7)   7.7 (7.5-7.9)      -50%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 drivers/md/dm-thin.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 0b65c1b09f47b..bdd250d1eb2e1 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -4292,13 +4292,6 @@ static int thin_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	init_completion(&tc->can_destroy);
 	list_add_tail_rcu(&tc->list, &tc->pool->active_thins);
 	spin_unlock_irq(&tc->pool->lock);
-	/*
-	 * This synchronize_rcu() call is needed here otherwise we risk a
-	 * wake_worker() call finding no bios to process (because the newly
-	 * added tc isn't yet visible).  So this reduces latency since we
-	 * aren't then dependent on the periodic commit to wake_worker().
-	 */
-	synchronize_rcu();
 
 	dm_put(pool_md);
 

-- 
2.43.0

