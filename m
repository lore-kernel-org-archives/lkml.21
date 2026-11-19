Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795067144;
	b=B/VO+kMFEta1w+VC3ptos7xve6wP/T73ht6smoNzkTttN4Pjc6DJvLMLDskCols9UbaD
	 TUvKlbvuqNeJMaCql816j0NoWgNwNvOt7j156VnKlAa3xQzxTzdRrbh4MRZRw0RodwXz/
	 KbcbTq50hML07yiux+4zWoT7dxfXRo4O4joaveUYGwvdxaZYwUc9AIETy8bXAzZo25xbH
	 DSBaYLgHNjSAYkcmnsNhlMPIgRp8zih8fMPlx6QHGAnBXAStJNKBoK3BhLlIbuqpmiyQg
	 etSONgR1BvwdpteVuDsj2NDmm3XjVFLpRwtZpUTqLPhOWL2DVH4h7aW117ajb7qDEBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795067144;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=G9E3ZlvCNN3za7iFE86FRPDY3ASAW1F+dUJPgk3tYvI=;
	b=YuwPRiXsI+SXK04xxeYiLaAff3gMBi52dJ1wjcFsOS4DmUnwWFyxpu7Cx5wMyGZTG2NM
	 Wmf62DbwVRZSTbSQN1rujM9jStmig16KHazbO0dDXxSNH34nhjSS3TsNs0GQ6KCRst24K
	 ALJx7Ppj6V++2NK5s0men2FGxj5Q6x9QlSAWUaFUalwJJMzJw5wRFIGSZ4JHXHrxNclRu
	 wdAOpmw8INYxGN/A9/Atz2Ph23njQuMrEzuZ2NUN8Qb8BwbzP/CDduehlZIxTkjhJNW/2
	 fvm4wx4lmoKOyaY2TchzBnYS6hakgR7C6jDVaOroosDe4akh6PL6wHgbZMUE6mPFFlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YwgIdczF;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F5160A2604
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F5160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YwgIdczF
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+pB1raUuXQSnWsn2TwVMoO8d+Us7Fizp12KZsMm8Os8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795067141; v=1; x=1795671941;
 b=YwgIdczFw/9rhBQCtDhg1v8tRqhCwALpoe3PKUNPfuTIfPKust2u/cljoAAra/nchLWi/jLR
 svNKqDrEd2IsytSpTl0UBOqiyp4aLCo/FWc5U9DhaYDdbXXQgvOIoCy/QQzsbGd71UZifJKQUVZ
 WB9KSxt+EU63aFAol6aNzX7Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 64a14d157764c6be;
	Thu, 19 Nov 2026 05:45:41 +0000
X-Mizu-Trace-ID: 64a14d157764c6be
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Thu, 19 Nov 2026 00:45:32 -0500
Subject: [PATCH v2 1/3] dm thin: drop the grace period from thin_ctr()
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
Message-Id: <20261119-bug-dm-thin-rcu-gp-v2-1-055d627763c3@linux.dev>
References: <20261119-bug-dm-thin-rcu-gp-v2-0-055d627763c3@linux.dev>
In-Reply-To: <20261119-bug-dm-thin-rcu-gp-v2-0-055d627763c3@linux.dev>
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
  15.3 (14.8-15.7)   7.5 (7.3-7.7)      -51%

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

