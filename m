Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108233;
	b=2w41aje80NE/9OAXIW22HxotQUkJd0XeIsLhX81y9CZ8sGAvJpYKjnj+yquZS5z1gyNZ
	 xoP8MPH2RQcADRZoBb1tSxV6DaQELvD0nvrKl3tzxhmnfT7N5HlDuMLPKwB/87NAormCs
	 VOCA8t2+FeHc0GGvUmKAZ/nwwOzcWq0aVuYENAFWPMkEJXy/hHXYclBE5FtLJCppuBxjt
	 4dcNkpEWcnkBDJPzatv3PeFJ1oLem6+GZdHoExElSEjiGEnJR5QyraSlGPd5VSoLlMrOD
	 7fsjG6b3SOvp11SQsgjI6GS9wlRD5v+MQm8SW1/EBp2a3AzfeCMPtPBsV/XhaZmLt+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=J8wemuSg+wTBYN0mejqZk6NbTrVxXdYsEZvmaE6mIAE=;
	b=TqXYvtX/q6lA3lgLBgcrk7rEVBnqajhu0yx+qoaf8Krrwz7F+LMdNCCgpCyMGmD7zOq2
	 q6tAkZ7Ddit14cA3ZN3jMKkL3b454GumVUax2dJmcxB6WlXT802ouiHLzYWhm1+jVpe9n
	 ABUtAOkIsFcG+atI7HT1SJOJdPGdC0YplfX1Xe3u/fCh1Y2oFPw3TAqWaFV+R0OizqppI
	 ga9KHbSxSxaGXJGPQM9rUqjcu+DDemgAXjkplaEMmaDXmG8JMNsLkkNvQQIxg9fhMHZCS
	 +2Vsw23QvIGajc3szxPyEBhSA5EtLq3mXU9cWHbL0tMUu0Q0Qw+FeN9Vtiq1lre3K7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=owY8U0UX;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F6606CAA5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 800F6606CAA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=owY8U0UX
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so2678163c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108232; x=1795713032; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J8wemuSg+wTBYN0mejqZk6NbTrVxXdYsEZvmaE6mIAE=;
        b=owY8U0UXZfZ5hnlUvRHrRrH/k9cuhoZFHBAb5Okt84dSpay4XtmapCc8LSEsUmc0eP
         vIahLJrdyG6rc7HbNfn3Zu28aAKVOokn1wyW2aWVhsIJWV8r1Fsufi/NQ9P3+9+rtE+E
         QoJz7vk3uPWzwoPoqs5dUZ9fZpRxQtroufTCThQf5m7x1qxxUtyx2nnC0arU3Hhk8ZgJ
         adpKgXZjOILiYdvUyXASNaQeuBMlqwC6lUMxs/G7f8gT+0HvMh5/Z225OBvW8bcHw3ah
         tWMTfzN9lv3Skkcj3AKgo8P+nsD/opMndXfM4D2kiy+2vnJRSF6sWzYi/DPLM9yTAplz
         ctfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108232; x=1795713032;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8wemuSg+wTBYN0mejqZk6NbTrVxXdYsEZvmaE6mIAE=;
        b=p2qtWQEzL4gSU70gj+aX7ulcse5gAnSfFT90Rx+hfo6Qn8MK21tdzYqhNyfbqDR5pI
         UlU6J2rR5CR6OGpmlQCMP6IPhCLiU8EzsmD0PPoqgvNypmSj0BXB/5gRgfdtmpVZOiMv
         cDuP5HXnQA1ReaWq46KtnHwBQ/visYXrEs2LDsZ55cQpdEtYl1n3yTJ+OYLWKpqfK2N0
         wrBPnKsoujcME+DeGsvcvVGBJTfhRnOL51RRsq+WwJkEstgWOQ5DJRefEo1Nx0+vNKPm
         sd8JKX/VKmuvHpZbitq5+BrumUhd1oKUa1BUr+Zuvnr1L0ss44GbA9ueezNPKj0KaWam
         s1eQ==
X-Gm-Message-State: APuU4Z8uFGSc3D3XddlBEBQ3q0CTA3U55kKaN9Udo/yc7ZVbg4+M1pa9
	mqs7SL8cQf639L6B+62ae8MNOhJKtCKdDPFEq+ViDA9s2W9s2Rn5NjT4cF7q9BxT2+FvoTE8CFj
	hy7SSSy6oDA==
X-Received: from dlai4.prod.google.com ([2002:a05:701b:2704:b0:1b3:ba1e:2c7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1702:b0:1b4:f5cb:ebe3
 with SMTP id a92af1059eb24-1b5568b45f6mr233091c88.16.1795108231268; Thu, 19
 Nov 2026 09:10:31 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:26 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171026.1535538-1-irogers@google.com>
Subject: [PATCH] rapidio/rio_cm: Check rio_add_outb_message() return value in
 TX paths
From: Ian Rogers <irogers@google.com>
To: Matt Porter <mporter@kernel.crashing.org>, Alexandre Bounine <alex.bou9@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Both rio_txcq_handler() and riocm_post_send() call
rio_add_outb_message() and unconditionally record cm->tx_buf[tx_slot]
and increment cm->tx_cnt and cm->tx_slot even when queuing fails
(rc != 0). Because no outbound message was queued to the mport
hardware, no TX completion event will ever arrive for that slot,
permanently leaking a TX ring entry in cm->tx_cnt (and leaving a freed
req->buffer pointer in cm->tx_buf[] in rio_txcq_handler()).

Only update cm->tx_buf[], cm->tx_cnt, and cm->tx_slot when
rio_add_outb_message() succeeds, and clear cm->tx_buf[tx_slot] to NULL
in rio_txcq_handler() since req->buffer is immediately freed.

Found via Clang -Wunused-but-set-variable on an x86_64 allyesconfig
build. Verified by building drivers/rapidio/rio_cm.o with LLVM=1 W=1
(-Werror) and -Wunused-but-set-variable, and with a standalone C
reproducer under ASan/UBSan; not runtime-tested on RapidIO hardware.

Fixes: b6e8d4aa1110 ("rapidio: add RapidIO channelized messaging driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/rapidio/rio_cm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/rapidio/rio_cm.c b/drivers/rapidio/rio_cm.c
index c55af5924da2..5b88df79ff53 100644
--- a/drivers/rapidio/rio_cm.c
+++ b/drivers/rapidio/rio_cm.c
@@ -670,12 +670,14 @@ static void rio_txcq_handler(struct cm_dev *cm, int slot)
 
 		list_for_each_entry_safe(req, _req, &cm->tx_reqs, node) {
 			list_del(&req->node);
-			cm->tx_buf[cm->tx_slot] = req->buffer;
 			rc = rio_add_outb_message(cm->mport, req->rdev, cmbox,
 						  req->buffer, req->len);
 			kfree(req->buffer);
 			kfree(req);
+			if (rc)
+				continue;
 
+			cm->tx_buf[cm->tx_slot] = NULL;
 			++cm->tx_cnt;
 			++cm->tx_slot;
 			cm->tx_slot &= (RIOCM_TX_RING_SIZE - 1);
@@ -745,8 +747,11 @@ static int riocm_post_send(struct cm_dev *cm, struct rio_dev *rdev,
 		goto err_out;
 	}
 
-	cm->tx_buf[cm->tx_slot] = buffer;
 	rc = rio_add_outb_message(cm->mport, rdev, cmbox, buffer, len);
+	if (rc)
+		goto err_out;
+
+	cm->tx_buf[cm->tx_slot] = buffer;
 
 	riocm_debug(TX, "Add buf@%p destid=%x tx_slot=%d tx_cnt=%d",
 		 buffer, rdev->destid, cm->tx_slot, cm->tx_cnt);
-- 
2.56.1.708.g77570a6a1d-goog

