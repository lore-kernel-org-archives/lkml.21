Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371140;
	b=KoHD4QmEO7/tS4MX5ciHjtKLJFD+l+JqNxG83DegViT88NuPXAw5qMYjsoyazRPtO/8m
	 DGaYmmEhXLVwQGJjypVkEpBJ1VfGk6orLYNKIYIjrZTp9tBU9fYZhwtKyWapzFgK+Isnf
	 vv6fMdtzKdSWfKstruRS307fDJkTQ3z2KUWPkAiUJT/9tGSlx6ixvleuK/ifX6jcIbH3v
	 q6Zp53bqLdUN2JtJ6QQaCrdLkgixsPcQulJGPYDpRR9tykk/HpMJ9cJqjDT1B+vY1edI3
	 Labp0MJcfVuwFfMjc0GVxX4dqzeAMnk8lTVd+6cqJ89tjPoCguwly5cEn1N0vZQ2UGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
	b=DtiMtlG2NzU8Xoy30n8G9Mme/dv7l5NulXKzH3+QVuDQV7dfW8K9x/sv1efxHsWikGzL
	 rmsllFsAaxIlyRROc3KuvVgeTTZGtswjnMCIpN7LJP1+EEnw9lrR3r680rqVX3oQQj8Lx
	 SmLuLPSFYvC2ElZJP+8d61oDktMsOABUU/Q191vCrLlpNB7950mtgkj6L8g5EesKaXnhQ
	 G+KyBQ2430aFxHreIM4lvNOyHQe40ISgTS6c267VBjYnSSaM9Gs6H70i/oPllvSutADZk
	 JG9deKB3Swu/AZA+OusVGkhzxtCBr64kdRTLO+GJt2qXXIsj7i1bvDtEYmPbvylJVpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="yJC7eV/R";
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A77606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A77606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=yJC7eV/R
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so3147453a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371139; x=1795975939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
        b=yJC7eV/RcrD0X62aZ6misJv5IOVhVL3maz0KjDgU7SMO9Qn6WDPmdNNJNh0QmoVKBs
         8OkeSW7aYMCWUwED+IUQxU+nJEwbT/A0KPLyEeq8opTBOai/s9Jo02ReAgi1wZyJyB6F
         MZxKT+ut5wrndXzBRbon5WyPjBVjaQsBS23vWiPCitMeNh2JYteqtNW67qbiUfGMX4eq
         7MMOYyEINdi9FQFZ1Q9JSdCvhs6mKJ31q7ow6cpP1zyHpvf3AC96P1cQKX3TEEEjYYeL
         pSWqsiCFvsgWXO+GgE/irM0zCLko5Y/O7LIZFblbyx1Rb8OqUaDJ2ekTeDkYANa3jUBx
         pEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371139; x=1795975939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
        b=CZ7zZBByyoTCBcLFXD0BrwFFaPMxLTLPZu/+KHGcsmrYwsXdMW/nG3ROD/Kp6ZDEk4
         Wi7uj1qVyAPdeFMLpk898UDv/M/Q8ZCmN187RWmc9MTLqCn+vuUheK8b5+54cqfz3+ZZ
         cC1Rnj2MivUNIp+jA4MP7xvfCuTtDdwbLVwExAACo/yDOvg/o1Bo07UF+hcA6GdLQFLo
         xyNY2O9kNSaXvYxMkVy3bnt8VlrfuL9kZ7lr3uxqj+EyaAuMJ0TGZO7itkmS4wwk5mT7
         aI83Xxr1DoOBWLEzsy7dTTxNuKuh5qgnxHZpNPDQ+qRWpvVRZPUIN3/Z6OgetPqsrqai
         b8Zw==
X-Forwarded-Encrypted: i=1; AL+hErFNJzBSZaD+FZ+gOut/Cs0TG38rhlC7Ngp+54qoINGqyBr10xQ16wtRg1D4hJZe5cbvrDefiv0lxOnAoXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hKn/xjVlFAEMStnITO8aX+AkgcRInrP4fqBigwt/RK16sQ0O+
	hpAr5sSG5EQMqfpqiTHrLOjqIqTVM2sJh4RU4Rs/UwQffxLiCjpP6LDuvLRlALOe9Q==
X-Gm-Gg: AZFdTZe4DGZYpcE1Lsmj394l3slHBpHkruOxKDrMz6zvtU/aEBpMnODhxXpynExOq+Q
	gxwjWs+n09pJ04T9/vXM6+hGyOeqHmjNYSVLj+tz0qmQPIYMtHhAj3vyRcc6CLypF6qISozrGdJ
	/JrooXuYKOdwDuEPH/XFJRlfxCp9F1eTvMxfaYVsYPc7DvXTchsxaCL//pAHvO8+QysoS1BkeFD
	dhUbytGDiQ+xHiYi8wsAE7CUg3PTqQ5Ohq6I4Ogh19gRVIdSMzLQgoxxRi7EyYpqmTzwqUsqWZ/
	nYxdWUUClH/xfCkm/sfpwzLrFcFC/SpBgxMLQpfJ9x2tX7NYTgsjxUDTAyanjjyoTSZC6YF9jT6
	JJE4WgZzfMAPWhPldQpU+iDu4/D6BQRw1RQulQk5nsNprNR8Rj7x9rsh9wrw/HViJ5A4PIX2jEf
	33FVhpB5PHJfJkrcLGoPCF9TlpQrZH2IJvboB/To06x5gixpNGHFpfS3bHLEhPU6OLrqqBqChuP
	H3dvhX9NqHaX8kuwu4IVO7kTYsGrQDBcLLUry9Ntr5KHp7ULDZ/ysLEijyOkcjoI5VUDqithaUz
	vLOAlR3tIlNH0ASz6u5tZu0sqZ3X2lLVJgdBBVDvsMOQ5ncAIdtDgV5J8yLo87ky/AkbfMhiGQe
	nXfXjpyT3x9Bz/uPPVn3XMhnEk6JmGS+4Nj/QyTuaUIZrDYwFbgg0hHfAHtAMK447vorH/SknnH
	Ys5xgRuEkgpPlXSuG4n9xa1gU0Ri4Ie+ch355lex7rGPcMhLha4Km4viJ0ZpsmvlXDquqgswdUT
	j0zgwI9W62sS2cSNmUmd4bFucoIjtecgqj21VHmdlpYhyYm7BkWxky/hQJupH2V776CYngBcQQ1
	wLZHOg9RqjkIMv3+8A+zEhSHUJyimnYOKdXhM25HFQnvYOFLla+zLczRKomh0gRrvdehlV9R
X-Received: by 2002:a05:6402:569a:b0:6b7:5712:b6c1 with SMTP id 4fb4d7f45d1cf-6ba37ac6db2mr4318502a12.0.1795371138807;
        Sun, 22 Nov 2026 10:12:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 3/9] wifi: ath11k: push TXQs from BH work
Date: Sun, 22 Nov 2026 19:12:07 +0100
Message-ID: <20261122181213.1016590-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

Each frame that the network stack queues from a receive poll wakes its
TXQ on its own, and the wake ran a scheduling round at once, so a round
handed the hardware a single frame and paid for the ring access, the
locks and the scheduler per frame. Record the woken access categories
and run their rounds from BH work, which runs after the poll and takes
every frame it queued in one round.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  3 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 24 +++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 8b7bfb0cefcf..74fbff296b60 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -715,6 +715,9 @@ struct ath11k {
 	spinlock_t txq_lock[IEEE80211_NUM_ACS];
 	/* access categories whose round ended for lack of room */
 	unsigned long txq_starved;
+	/* access categories woken since txq_work last ran */
+	unsigned long txq_woken;
+	struct work_struct txq_work;
 
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 090df2f1cadf..0af4f2fe27bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6791,6 +6791,7 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ar->ab->update_11d_work);
+	cancel_work_sync(&ar->txq_work);
 
 	if (ar->state_11d == ATH11K_11D_PREPARING) {
 		ar->state_11d = ATH11K_11D_IDLE;
@@ -10211,10 +10212,30 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 	spin_unlock_bh(&ar->txq_lock[ac]);
 }
 
+/*
+ * A frame queued from a receive poll wakes its TXQ on its own, so pushing
+ * from the wake would hand the hardware one frame per round. The rounds run
+ * from BH work instead, after the poll, and take every frame it queued.
+ */
+static void ath11k_mac_txq_work(struct work_struct *work)
+{
+	struct ath11k *ar = container_of(work, struct ath11k, txq_work);
+	unsigned long woken = xchg(&ar->txq_woken, 0);
+	u8 ac;
+
+	rcu_read_lock();
+	for_each_set_bit(ac, &woken, IEEE80211_NUM_ACS)
+		ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 					struct ieee80211_txq *txq)
 {
-	ath11k_mac_schedule_txq(hw->priv, txq->ac);
+	struct ath11k *ar = hw->priv;
+
+	set_bit(txq->ac, &ar->txq_woken);
+	queue_work(system_bh_wq, &ar->txq_work);
 }
 
 void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
@@ -10953,6 +10974,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		for (j = 0; j < IEEE80211_NUM_ACS; j++)
 			spin_lock_init(&ar->txq_lock[j]);
+		INIT_WORK(&ar->txq_work, ath11k_mac_txq_work);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0

