Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139803;
	b=t7Wd/V55ITWZu7yDJ/+X47Ihmq0l67IlYaQwPLbcnFwCZb6yCbBWaRSHw8J+9ZovHVmo
	 UL1ja/nGw72QY8hNiy2rosQ4ot/EgIle9AUcmYcOpAjpCb+NkXNY91qx5MMGqogo3FMQO
	 s7EBBXOQ3XCadcY6eLoirQbCjqT+9MjNTExgE2bfbssdi79qK0WJz6Fp4ViOeAI8AfMwN
	 rk0zB22TyrmQ3YjmiqbdkVZhF4EmNeWOSXVTd5OXNzFvgyAa/sjKZiPsCkTOLVHn1Imc9
	 0ZUmElm8jvJ5hBydnrD+j3bBm0N5SfJ1cLzTRegQSWNeIT9ZDmMi1rMPHqxYVZo3jIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LR2B26HtxaHxg7a5ph6Qay3k33nHcyeCg9k+gslMQ+A=;
	b=C0bZaNiwplNCh12gWtb6yDaPUO7fyy6PZ8U8jlpdm4gsdXXIgemxrbiOQb6zgVxGVhkE
	 tTlWgVncv8oUVRuyWP9fm2I1kUOjY0xUX0+SHGESaF5T0/X2Z7D3nR1PTR7YGUrWvwNd2
	 WwUAv5C62yqJUPYz9iY7gOEKFR3sv1/rvRe8thDIwvCdoZ/D3pWMguNt8Ow27/B4EdrOo
	 1jt82MvNc2maVr9MbaD4BuuhrRGjcZ+LXOavWffxTU8oObb6SdnMPBoeLtgMLba1d0cv0
	 6cRYk2I6hO7kjsFsKGtMHsEX+1lzJRshtJv3geZTeZS4jUkR6lGDSm4wnuPGyZ8gUUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwMRdYeq;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6C3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JwMRdYeq
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb684859cbso233576a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139802; x=1795744602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR2B26HtxaHxg7a5ph6Qay3k33nHcyeCg9k+gslMQ+A=;
        b=JwMRdYeqg4g+oaIIij7D+9eeI8UsfeB8XrsqYWn/lpYVs6dFxvCKKiBUqsSKv09qu0
         zDUYGeOoEynr7CSzJg0Q2M6SK4rcdV2ylx79mCwkRjmETbPZnkM6tfPYjZ+HeFXUONQo
         mHbcpttNUaBJUGa1P/4tyDVS/QfJQkoVnLu0EkqdVDTf2x6GqtI5h/HGN+ErQUPMp/pS
         xQm6ykT3RisuBi//q6huBXbiCN0rfzW5vCsQJVh9h4prT+J5D0DxSvH24VlMJUsX2Y1c
         7i5nsYletYcQ6Byf282j7HbBE4VdgMO9T5an6TTTC1WQ/hTl2JBsMSH/T2upYZYMPhWZ
         sjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139802; x=1795744602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LR2B26HtxaHxg7a5ph6Qay3k33nHcyeCg9k+gslMQ+A=;
        b=08jmS3TZjMLDhfX1+TdRKgHhK2MAy/2682e2YhTyALRfBWfdBf9/4ArPgcc4x6kq4y
         dCrT7N1O3yYb/NyyubD61RnzePOM9Zu7TMtjXGLvV4k5ZQwLJ3/YFBfe1CRo7JKH0Zd9
         Xs81puJ7EwTkKSE4IrjJQ04rglBzy4Wm1HxH4gjP9g4qp+RTZIiqr1jytVNNzcP8DkHe
         megmlv25auU1FphXmXc/6Urhrw8dYN2rFXwTeUWPhSYe4Txk2R+nKqWggdrDD/QF7gcl
         ev8ytd/vN1n3XFVOmG1eLmBI613qshlP1v6xmgXXyI9Z1EKGnwLzG0Qy0mHDDpOhXZfi
         r+uQ==
X-Forwarded-Encrypted: i=1; AL+hErEPifu4Ini+EbRj5Pu7THXDa35bSHVjlxCp97DmeLLbne6riqWVA6ydWOQY0pdxXETdXeV3eOhF3kmdFTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uaOUBfXiXV3RJf2DkvoSFAod5hE7FnsGdUnznI2PAjWRiqWgC
	GLN1S7+EThfvdh/uwgNUROj8RI0t0TBzoPdvlM33VjwSRtezNb4Yqun+
X-Gm-Gg: AZFdTZcrDb1V6teIQDpsUNKCvVzydFG7mXNnkxpuuGw+kgbbyUxUsPOZMbDAxQ6vWpa
	ZJ1gA47+jwhT4WT8XiMoihT76G8qAHjcg7qh5tpidKev/xIWjCgyCQcukFHcQ3glBBk4hLwPWCu
	rdfrUSzJggRH2I84xyMJAeUJuUErULCnzhcbEgXefjUeIMJp0EGj6ibw/4GhgVxaF4lKYhX4XTy
	ASl0PTb9dG6iyf1DRk070YwxJmf+SfU7kGxxPTRqBJ8igRy10mcM/CNfYyFj5ANOl/Lbw4RBgAL
	b0p5HDOad90hhjYqMSegLV0y3bikfNyK4cNZFmJQhaH1XHRUorsz91mqgxDxT6IchBfuYhm5kCY
	SMMsEOM8CWqvK3z/aRNmOE6o9H8sNrsSQpVuG4VhWvQdUbobk78USx54hVrJHLU0QVHoSn63wSB
	mSNi+12e8SSeFkLFdS9oZ8wWc/SqfJclhdEjWKTexKWe63rN4o+IVZXuxT1roEYsSshz62QT4Jg
	p2xNRr14VDCr3MfoLfgZimKtGFUQFQiC13cfA5ek5MDIFcV068pIScYo3rpOF/C/UFwj+9k4GqU
	Q5rg+dx4gy1KlsT866VHcXYC8Uwb6C4j7Llw0e/uhX5E2FyG/2U=
X-Received: by 2002:a17:90b:388c:b0:3b0:a378:1cf with SMTP id 98e67ed59e1d1-3b41c9b2d39mr1237682a91.22.1795139802471;
        Thu, 19 Nov 2026 17:56:42 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:42 -0800 (PST)
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
Subject: [PATCH net v7 6/6] net: wwan: t7xx: fix memory ordering in t7xx_dpmaif_rx_stop()
Date: Fri, 20 Nov 2026 09:55:56 +0800
Message-ID: <20261120015556.131547-7-tim770802@gmail.com>
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

t7xx_dpmaif_napi_rx_poll() sets rx_processing, issues smp_mb(), then
reads que_started. t7xx_dpmaif_rx_stop() reads rx_processing first and
clears que_started afterwards. With this order the stop can read
rx_processing == 0 while a new poll reads que_started == true, and the
poll runs after t7xx_dpmaif_rx_stop() returns.

Clear que_started before waiting for rx_processing, so the two sides use
the same store, smp_mb(), load order. Use WRITE_ONCE()/READ_ONCE() on
the two accesses that form this handshake; the other accesses of
que_started are on the same side of the barrier or on paths that
t7xx_dpmaif_rx_stop() serialises through rx_processing.

With the new order a poll that is already past its que_started check
when the queue is stopped finishes its pass with que_started == false,
which used to be rare (only after the stop timed out). In that state
t7xx_dpmaifq_release_pit_entry() returned 0 without touching the
hardware and the caller zeroed pit_remain_release_cnt, so the entries
consumed by that pass would never be released to the hardware. Move
the check to t7xx_dpmaif_pit_release_and_add() and keep the pending
count, so the entries are released by the first poll after the queue
is restarted. The hardware is still up during that pass because
t7xx_dpmaif_rx_stop() waits for it before the hardware is stopped.

Fixes: d642b012df70 ("net: wwan: t7xx: Add data path interface")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index a7d6289415b1..d70ef315f5f5 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -240,9 +240,6 @@ static int t7xx_dpmaifq_release_pit_entry(struct dpmaif_rx_queue *rxq,
 	unsigned int old_rel_idx, new_rel_idx, hw_wr_idx;
 	int ret;
 
-	if (!rxq->que_started)
-		return 0;
-
 	if (rel_entry_num >= rxq->pit_size_cnt) {
 		dev_err(rxq->dpmaif_ctrl->dev, "Invalid PIT release index\n");
 		return -EINVAL;
@@ -565,6 +562,14 @@ static int t7xx_dpmaif_pit_release_and_add(struct dpmaif_rx_queue *rxq)
 	if (rxq->pit_remain_release_cnt < DPMAIF_PIT_CNT_THRESHOLD)
 		return 0;
 
+	/* The queue is stopped: keep the count, the entries are released by
+	 * the first poll after the queue has been restarted.
+	 * t7xx_dpmaif_rx_stop() waits for this poll before the hardware is
+	 * stopped.
+	 */
+	if (!READ_ONCE(rxq->que_started))
+		return 0;
+
 	ret = t7xx_dpmaifq_release_pit_entry(rxq, rxq->pit_remain_release_cnt);
 	if (ret)
 		return ret;
@@ -844,7 +849,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 	/* Ensure rx_processing is changed to 1 before actually begin RX flow */
 	smp_mb();
 
-	if (!rxq->que_started) {
+	if (!READ_ONCE(rxq->que_started)) {
 		atomic_set(&rxq->rx_processing, 0);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		dev_err(rxq->dpmaif_ctrl->dev, "Work RXQ: %d has not been started\n", rxq->index);
@@ -1127,14 +1132,16 @@ void t7xx_dpmaif_rx_stop(struct dpmaif_ctrl *dpmaif_ctrl)
 		struct dpmaif_rx_queue *rxq = &dpmaif_ctrl->rxq[i];
 		int timeout, value;
 
+		WRITE_ONCE(rxq->que_started, false);
+		/* Order the que_started store before the rx_processing load.
+		 * Pairs with the smp_mb() in t7xx_dpmaif_napi_rx_poll().
+		 */
+		smp_mb();
+
 		timeout = readx_poll_timeout_atomic(atomic_read, &rxq->rx_processing, value,
 						    !value, 0, DPMAIF_CHECK_INIT_TIMEOUT_US);
 		if (timeout)
 			dev_err(dpmaif_ctrl->dev, "Stop RX SW failed\n");
-
-		/* Ensure RX processing has stopped before we set rxq->que_started to false */
-		smp_mb();
-		rxq->que_started = false;
 	}
 }
 
-- 
2.43.0

