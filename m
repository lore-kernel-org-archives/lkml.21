Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139779;
	b=tdOpVz9NTHwR3PVnPe0eyivYDdZJsYOgpxw2a3nWAa3fT/s8U3hUVG/Or8fE/+GTAUqJ
	 N4g6kxnZSx+XiBPjGxnL5nseqqMq8Cq8F9j/LwNzT3rCyTzId3mrm9d2iMkAft5hL8FQ/
	 nFqjrRzJXuZQxsidluvUBHkFzVLl7EvjTuyijpUo4J5CwcfHQtWnrz0wupUu4keuU9x/7
	 pfXQXYX00wVl4zkr+2NuoqPf9NitxG3g/QBZM8RmJouOqaeVriVOKTXzOBtmVn2lpp99s
	 qKjF9qei8YQyHfrhsaAyNH50Fqh7Ep0VOS+UiK5cqld1EnTJ87Gwl+G1+KzakkHViVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OkbhqlAyWh5/Yy+HX+TxYjT70VGm5Abq0fqJanB9ny0=;
	b=rUsPVfbBlqX9J43rs6lsAvNVFMkYSnVfYhOq2vjuqGUsX2esQqVDKop05pe3jNFK5EOP
	 G3evAUBF2x2xj+nFGom94auCA/9o+mPhBvCJ+gluJzG5Tsj64/yfBy/lgJ9jz9Maul6tB
	 yZ+0Gthn2DfZgFIGr9Xip4jes1pzk2eoZ2jT8gNgyepsG8S129yFMlkEialO4pQrmBD22
	 7O4CrO7zPumSj7hwS9iGHnyJLqif7t1igap1NzUXJiPAIfnWzodVA1caWNx0yW5fWR0nm
	 E9D843TzXvNemYrNgVgzrHYSgxQcHyvdq5wBCdBWVKTpiRbeMXPrxKDfnZMRFCwOxgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ooFgZK/s";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D7606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A7D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ooFgZK/s
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso218630a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139778; x=1795744578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkbhqlAyWh5/Yy+HX+TxYjT70VGm5Abq0fqJanB9ny0=;
        b=ooFgZK/sqcQ2p4MiFRiiHGZxovN89mDo7Hd/mc6MS7Q1wnI8wkrf9m5iw7oNEbPvvI
         GUCR3ncfyOIn68toI0tJ1/KLiFGZayoWb86SlJq3ksvuyBGVVo6lgcJcOc/ocmVN8IW0
         WjAfVBVR1J83C7C1rQndqUNCj0aOGBvsXXINe4eDZofH7aSZgZ1WzCOOaFkTTin9yOyL
         FFgkFSe/Qw41Zcfukq9JgOdencE9ow0cbrzomt1oVUrcGAxU2D2OBxGb1wpRCanzjDbI
         t0jx+JaGdnqUYrcCwyP3oq4HpS3cCbNiLSI9Stm9SIpQ3HUm6hKQwG0tW9uaDn8dsl1V
         gWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139778; x=1795744578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkbhqlAyWh5/Yy+HX+TxYjT70VGm5Abq0fqJanB9ny0=;
        b=S2oFFLvmBH7BAbCnmDbcrtZ4py/18Det70fgj8JA7vFstex6FHzwe0bP0qPV8M/xTf
         ipzQRHJT2x3N9HZqqAdkFYBO16P5YfS1kyYT8RsqMl/LjZPFvLgQXtGn69lxJhxnjbK4
         Y5I6BNhV/XxlwbQDTwaotJOodKE/153pO8MTDWDGNEGQVE7CqrnMPKVFdV1V1WQ/QRqo
         n6azBlwgpjOCtbk8rgLndM1zmZFL07b8/SByGEBHaXy9FVBxIvjcp1BaS2J20f4Bgd8y
         skzSOatI1mAy4bsfgn9xgXF/3tSYgqnyY90D6eahzZ6j0ftKbeMwpOMOn6DIRXpLqD/R
         LoEg==
X-Forwarded-Encrypted: i=1; AL+hErHvUVxNMpcZd4GIrfdOSunZSQ5Ur6m5e0uq9jFGImSRfIvDVd6VGV5w1AlnCHjQc/VgR3A0zPpB9jWXB0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kxvtE+eNiEI7W6yUO+kMUjuzkYXsN0tAYdAgROPpsssMScyZS
	Kd/GHT8KxowHYdQngJL91WZZt6gTgVPeWzl6SCQcYZ3PGEdSar9479U4
X-Gm-Gg: AZFdTZel+CU7PEIztI0X7rEzLE5oVSw/sgv64nwz7NUnLMzPOthbskzN5W1Is76K1QC
	NZAOhsMQWMJy1Siuwagwss3J7Jb5S1MWBYTrQDGFVOoSERZ5m82lfKfhnvGTrEY1mGhyrX6zVSB
	CBU763CbEv2Bp9gtvWHKxGgZOfNfslCRS9eUGIsj+gO62LRHU4PXP5zdlADhIooWEegdGk8ZqhN
	Yr7Vo0S9Q+bnC9v2ggRjrMOJTNHlLtgHaB58afwIdL1+S4eMJ5OVF/KslzeAdkn9WxvfV0th2Du
	PwokhgiY3+ccogNbqTLiRvfX3h+dEXSzF7WNVLtm0B6mBP4zyfhwS2gg8Bx4QyhmER7cJ5JemvI
	nGXhyl0n0TfZs9cTDbdS5bTydEI3o85kpI4+scqbBhFmUWGseRUwtCNCE1jxr5G7pzN9937tofn
	vbjzWwkAe765CZWIGwNRC+dmhVXYmz88EN9wlf8PLLEnD6U1gfTUU56gSxeEcq9HtMjlbOuBaW1
	YxsODHXKGol10JgSUGtLHXVfetp4Y9jM0bm1x/8JsYwD2AC0AVUIA5LKE7+NXpKDMRL+0uD97Do
	cJEkJbMufMifYX6EaZXx58Yz31bRTcW2ibxO9+3zGdT4HGBpeg4=
X-Received: by 2002:a17:90b:2cce:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3b41c909001mr1165606a91.21.1795139777792;
        Thu, 19 Nov 2026 17:56:17 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:17 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 2/6] net: wwan: t7xx: fix runtime PM usage count underflow on -EACCES
Date: Fri, 20 Nov 2026 09:55:52 +0800
Message-ID: <20261120015556.131547-3-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

t7xx_dpmaif_tx_hw_push_thread(), t7xx_dpmaif_tx_done(),
t7xx_dpmaif_bat_release_work() and t7xx_dpmaif_irq_rx_done() treat
-EACCES from pm_runtime_resume_and_get() as success and proceed to
access the hardware. That is intentional, but
pm_runtime_resume_and_get() has already dropped the usage count it
took before returning -EACCES, so the pm_runtime_put_autosuspend() at
the end of each context (in t7xx_dpmaif_napi_rx_poll() for the RX
interrupt) drops a reference that was never held.

Take the reference with pm_runtime_get_noresume() and resume with
pm_runtime_resume(), so that exactly one reference is held on every
path that touches the hardware, and drop it only on the errors that
abort the operation.

-EACCES is only returned while runtime PM is disabled and the device is
not active. Not observed; found by review.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 11 ++++++++---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c | 14 ++++++++++----
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 5af90ca6e063..77770869d575 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -911,8 +911,10 @@ void t7xx_dpmaif_irq_rx_done(struct dpmaif_ctrl *dpmaif_ctrl, const unsigned int
 	 * which can't be done from softirq context the poll function
 	 * is running in.
 	 */
-	ret = pm_runtime_resume_and_get(ctrl->dev);
+	pm_runtime_get_noresume(ctrl->dev);
+	ret = pm_runtime_resume(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(ctrl->dev);
 		dev_err(ctrl->dev, "Failed to resume device: %d\n", ret);
 		return;
 	}
@@ -1068,9 +1070,12 @@ static void t7xx_dpmaif_bat_release_work(struct work_struct *work)
 	struct dpmaif_rx_queue *rxq;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-	if (ret < 0 && ret != -EACCES)
+	pm_runtime_get_noresume(dpmaif_ctrl->dev);
+	ret = pm_runtime_resume(dpmaif_ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(dpmaif_ctrl->dev);
 		return;
+	}
 
 	t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
 
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
index 798e4e95004f..48558b98e7c6 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_tx.c
@@ -162,9 +162,12 @@ static void t7xx_dpmaif_tx_done(struct work_struct *work)
 	struct dpmaif_hw_info *hw_info;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-	if (ret < 0 && ret != -EACCES)
+	pm_runtime_get_noresume(dpmaif_ctrl->dev);
+	ret = pm_runtime_resume(dpmaif_ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(dpmaif_ctrl->dev);
 		return;
+	}
 
 	/* The device may be in low power state. Disable sleep if needed */
 	t7xx_pci_disable_sleep(dpmaif_ctrl->t7xx_dev);
@@ -461,9 +464,12 @@ static int t7xx_dpmaif_tx_hw_push_thread(void *arg)
 				break;
 		}
 
-		ret = pm_runtime_resume_and_get(dpmaif_ctrl->dev);
-		if (ret < 0 && ret != -EACCES)
+		pm_runtime_get_noresume(dpmaif_ctrl->dev);
+		ret = pm_runtime_resume(dpmaif_ctrl->dev);
+		if (ret < 0 && ret != -EACCES) {
+			pm_runtime_put_noidle(dpmaif_ctrl->dev);
 			return ret;
+		}
 
 		/* A runtime suspended device was resumed above and had its queues
 		 * restarted, so a stopped queue here belongs to a system suspend
-- 
2.43.0

