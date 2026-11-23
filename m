Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437114;
	b=5PeSXe2Dxfg+hGAw0TFDD6EBhZYFHG3sNZoo6T5C+KELoYPS96dDBUc2+dj/Hm+6e5qA
	 ntzGWyvrGiKcRUL6mMrZ7/mHLc3whCxc94BtbEYpT/9wfgIzLJsMLbkFeW6tFKb3p4lC+
	 9jAuMjH5MbGIobqoJGnHckWVt4Vgeg5ctSHhVPZNCqPFTa8WSjg3dG3gaKsyaN6u+zchH
	 IdTBTHL0IKuaQsFzPynJFrDxHJXi1sF6VqU2YscCKHpuejqwmsLIWbyA8H+tprAcy9DMr
	 3b42cOmcGkpMYv5mN5WVJc/tRkWSJC7q6S+jP/mxYSoZHOwx1pjkJQpbVH5QvDY7Naw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437114;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:
	 X-Flowmailer-Platform:Feedback-ID;
	bh=6z14FG/qUkB0TQqSYTw0EB97zf0sS3cRoV0rPbDMpjw=;
	b=mOT3L2Z4cpPfVC+fcvN2S/jqS+u2ZwSFkeMAGN+RjURvdNF0ifoQWLUYHz3O6S9FJU6f
	 FlT3qhC0s1sQF1h534ltCEk3yiGUvYccO/dlqoY4lbs5pbfPnyGY4FZsHaKLzYvjLCP0G
	 qkcuaDLTtbLM4xNwu367S2zjyq+tsLSWZ+akDHPo9Lpd9w7l3RyWotSQm7dYgb1aETDGx
	 PJr4AQySDCfPBAHpZH+IvUrbZ4tpBIM8WrypkwnVanldDQozLv3bMV8UGTSxEUnq5C1k+
	 mD/xarnFxQ0+fCWB2oMweeW7DHUL0dKaddc258fU2x6jeX8uCb06dxfgYXQyRY8kWEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=ghdABsEd;
	arc=none smtp.remote-ip=185.136.64.227
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409E4606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 409E4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=ghdABsEd
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202611231231437c84062e6e000207a8
        for <linux-kernel@vger.kernel.org>;
        Mon, 23 Nov 2026 13:31:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6z14FG/qUkB0TQqSYTw0EB97zf0sS3cRoV0rPbDMpjw=;
 b=ghdABsEdjBCdTaD7ZOaG5XaD9pcnV//vmStcvsOHL3M0ksQ2/q0LFLfx8duC9XMZ2LYN4d
 cj1OY+2tdxGNxaZ+m3nLzKnT8EHBBcUbjvDrGmlCp+CSPNqHzG2vKL/LAwnHszQKHk3jtSJg
 5KDZIP97wFK8kIngym56ScmOBG0jBAV+47H59Jx66DlqnVtK6vrtKx4ul3FXKw+kxWQZ5MHu
 B1wVqQ0tUSHGHio0suY+ypxMfLcxCqHNpFjsnlhUmEt8WbvMZSTerysDwltgrMYbSrOz/i5X
 WEmvG/t3/UrRSEWjJE7E7W2h7ChuEETL0DqwLCUVleTqKOqw5KOukYzQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-wireless@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next] wifi: wfx: drop redundant outer loop in offchan queue search
Date: Mon, 23 Nov 2026 13:31:38 +0100
Message-ID: <20261123123140.952143-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

At this point the queues of all interfaces have already been collected
and sorted into queues[], and the search over them doesn't use wvif. The
surrounding loop over the interfaces merely repeats the same search once
per interface. Drop it.

The loop came with commit f7385a20249e ("wifi: wfx: allow to send frames
during ROC"), apparently modelled on the cab queue search below, which
does need the interface.

No functional change.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/net/wireless/silabs/wfx/queue.c | 27 +++++++++++--------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/silabs/wfx/queue.c b/drivers/net/wireless/silabs/wfx/queue.c
index e61b86f211e53..6471564345a86 100644
--- a/drivers/net/wireless/silabs/wfx/queue.c
+++ b/drivers/net/wireless/silabs/wfx/queue.c
@@ -250,21 +250,18 @@ static struct sk_buff *wfx_tx_queues_get_skb(struct wfx_dev *wdev)
 		}
 	}
 
-	wvif = NULL;
-	while ((wvif = wvif_iterate(wdev, wvif)) != NULL) {
-		for (i = 0; i < num_queues; i++) {
-			skb = skb_dequeue(&queues[i]->offchan);
-			if (!skb)
-				continue;
-			hif = (struct wfx_hif_msg *)skb->data;
-			/* Offchan frames are assigned to a special interface.
-			 * The only interface allowed to send data during scan.
-			 */
-			WARN_ON(hif->interface != 2);
-			atomic_inc(&queues[i]->pending_frames);
-			trace_queues_stats(wdev, queues[i]);
-			return skb;
-		}
+	for (i = 0; i < num_queues; i++) {
+		skb = skb_dequeue(&queues[i]->offchan);
+		if (!skb)
+			continue;
+		hif = (struct wfx_hif_msg *)skb->data;
+		/* Offchan frames are assigned to a special interface.
+		 * The only interface allowed to send data during scan.
+		 */
+		WARN_ON(hif->interface != 2);
+		atomic_inc(&queues[i]->pending_frames);
+		trace_queues_stats(wdev, queues[i]);
+		return skb;
 	}
 
 	if (mutex_is_locked(&wdev->scan_lock))

base-commit: 24630ff92eff08500ec4772728d4b1fa08c28f47
-- 
2.56.1

