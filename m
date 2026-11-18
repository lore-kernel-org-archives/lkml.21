Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015739;
	b=UswEw9SIrTMyspI6LkgQfHUeTchSSOvo4O5rEWMQQx3bwI3bVvHVLF+bqmiIEE2wv3w1
	 TBmNTrRvII3ioYsYRQcZjO52WykjGVgOnoZZlZjlByWQopO1RWcMeUFrQL/pp3lcISL7R
	 miC4GvEy0CNiGVgWvRLYCRmhGHF8Gat/JNMA9puJ1OdHqLHyKcM3JxKfkb0DxtM9IJnb1
	 JRVlPa2WcVySTDWhZjEqjnH3QHS123OS+SyksCLoz2U5Ehq+0QvE9FQbXIKw86NbqU2XI
	 p75J53fXigc+sfT0amcQ0/cnj1meFQ2Aqsm6il0kvuc2TbXObzGGS53KcquT58xxp7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
	b=gxlNgJ0Y/jwSRcXZ6D2WjxhuBuvRCQEr9rICJ5PL8AsAhMUsu9/8REb7VvwETk+I3Tt+
	 nO+LmXmq3b2DMPCBBM6+k6K9JoYToK8Ph6VC2MY88dEOgBd6FqqUGZZo9iJlQkjKustDj
	 5YYlbjU+y89VmG8C2LmRCCmVoaAajkwM9uxPi0MHMQdvtUD7tSPtKG8EBF3oyJGSX8tcW
	 g2+bUFI0S6VLVn/+g/DS5AYClfPpAzxPGCyXFfqhOxN04yhVLsiyNVCOO0qtD3DMUPWsQ
	 UAGU46epFpZ+AjBvL9AZ9w+SEgr8dCBL1PdiFqgzsdXmc4rne9beQCDo5RUxysYo7mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="s8Al3wZ/";
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF5606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CAF5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s8Al3wZ/
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so655239b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015736; x=1795620536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
        b=s8Al3wZ/wJLJLZVUJSpx+ewxs2DAhPArX2XFkCHig55UUkXDMnQ794zy+S36h+eE1Q
         O18KxyPxh+q+tdb0rsryUGsZC47avqf9rSKJDIIF6K9YX8tGwECCkGCDV9jhtpyH/yN2
         vWPX7pWcOKDg52Wk9lz2e7c6K3qXRhGgKAOpdTERRX6d4iF+0TyNoQnMAzGqRxmNe8+B
         9L5ljdXgKN/M+elOWbyMhOtFaYpujL3TX49tMaF9hEQwTaUIjtuh+7TuJhbg47TNe5W7
         QKWnvgLd1+cgVh7mgGkUbdQ3iCmjRFBO/+2yra06pilVD5ytPIiJtjgzFm9G3KLWM+q7
         RAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015736; x=1795620536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
        b=r6ko0fuze4D18Z0nuBocleXbqif+iKiesrQSlaHq6uqEYqJ/SGSkNwedNH8ymqhKot
         H68cVotk/hPHNlvl8QJKbmMFygrYoMo3LqiavxguKWaMkRNB7jQE6nWWlsLK2ZIr4npy
         QgWAWQMFkfuiqdEl9JfdU0yYQPo+cLugeqVL6iujYa11mfj+vuoPVAYTpBx/XFXseezs
         9HsgRVV/tw+JAkjq+2IJCEGHvadCk2e1YJbe0RcThMMaQ11qvugCoos457ihh/AJ7xFY
         u9BSHajMWfgezkzU2SGUqMranp9BW+Xbi99FsDjOC+a3xlzNF6+hVHWwoPzS0e5sGkCN
         O9ZQ==
X-Forwarded-Encrypted: i=1; AL+hErGWECIz+wvgpP3u9uI3d2a3uTBn8NuFxkqeMHWMBVjlJRW43AGyk2rEqQoknCSttc8ACqt/cL5uGpa53ZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6j30HFR1C9VZe2Trpn4tUP7E4nrh4Y+EZxjWoQn1J0/jxKcdd
	FZxxbtN33PtWFmIOYPh0uW3vF9Z7/aoqqwmGtdwakM9WFpx3bqbeZ24j
X-Gm-Gg: AYBFou3xNW99Kh0QSbYR1AMORrjochhGNCV1GgVBbhFxveOSGQ8Z4JVp9pNIGubDtVI
	EcVWERlwbqFbm+FbNGZ/h6wHnzui+kWotGYWpwcGhVfLX49GzXzi7/UQWljzABKgZKKGFhyGtq6
	Y1ysJLc8xu+uEuLpXiFnKn5wwcZXRYKgUhKEJ+vm3mroN9wVPay+yoL5LW+ISBaglIn85yp8q8i
	J21GZKDIvu6fgjE/6lKnQ5j2oiN/0DuqzjnL2wJOAiKKdS1yxwf05yNTdysC2IlgUKtEZEGtNp7
	l1/Wi0MbCOWKXmucvMSjDYTmSHKfROoJCzoabLAMe4jAhmd4rIBvVABZpCDbdaGol6KqFZGT84O
	SThnNZNVFl+gJ5/iAQS5V6aUCc3lFlAqxQzXIghddGZq3O//TRYJCYu0ydXv4AeNvgJGXN/nwFW
	sdQ/R5bKpkK8LQd09zxgpNITY1fDuxvzT2CXcvwRoOjP93SRWDkxJds6oI5FBt5pCwu1oyaFg7/
	4cQxocvjXPn0jik0RHUw1t725YszVXyOH5+Ic1WmG2WYG8u8ySI9iYdyL29Ao6XTIP3w3RMpecH
	P0EBtBMgQpghbjh96od06WdEUj9KRBSzxOoklsBk3Iz1rAST
X-Received: by 2002:a05:6a21:a10c:b0:3eb:b9e1:4341 with SMTP id adf61e73a8af0-3fe98af4d5amr2641588637.67.1795015736458;
        Wed, 18 Nov 2026 07:28:56 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2b3sm1419153b3a.9.2026.11.18.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:28:56 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] dmaengine: stm32-dmamux: don't call runtime PM under a spinlock
Date: Thu, 19 Nov 2026 00:28:43 +0900
Message-ID: <20261118152843.1126665-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
References: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
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

stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
holding dmamux->lock with interrupts disabled, and stm32_dmamux_free()
calls pm_runtime_put_sync() in the same way.  The runtime callbacks
enable and disable the clock with clk_prepare_enable() /
clk_disable_unprepare(), which can sleep, and the device is not marked
pm_runtime_irq_safe(), so both sleep in atomic context.

The lock was in the wrong place: it did not protect the runtime PM call,
while the CCR write in stm32_dmamux_route_allocate() was left unlocked
even though stm32_dmamux_free() writes the same register under the lock.
Move the runtime PM calls outside the lock in both functions and take
the lock for the CCR write instead, matching stm32_dmamux_free().

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Cc: stable@vger.kernel.org
Suggested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: Amelie Delaunay pointed out that v1 was correct but incomplete:
    - also take dmamux->lock for the CCR write in
      stm32_dmamux_route_allocate(), which stm32_dmamux_free() already
      does for the same register;
    - also move pm_runtime_put_sync() out of the lock in
      stm32_dmamux_free(), which has the same sleep-in-atomic problem.
    Link to v1: https://lore.kernel.org/all/20261118082853.926607-1-hj351016@gmail.com/

 drivers/dma/stm32/stm32-dmamux.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 5731871..8290122 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -73,10 +73,10 @@ static void stm32_dmamux_free(struct device *dev, void *route_data)
 	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id), 0);
 	clear_bit(mux->chan_id, dmamux->dma_inuse);
 
-	pm_runtime_put_sync(dev);
-
 	spin_unlock_irqrestore(&dmamux->lock, flags);
 
+	pm_runtime_put_sync(dev);
+
 	dev_dbg(dev, "Unmapping DMAMUX(%u) to DMA%u(%u)\n",
 		mux->request, mux->master, mux->chan_id);
 
@@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	}
 
 	/* Set dma request */
-	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		spin_unlock_irqrestore(&dmamux->lock, flags);
+	if (ret < 0)
 		goto err_put_dma_spec_np;
-	}
-	spin_unlock_irqrestore(&dmamux->lock, flags);
 
 	mux->request = dma_spec->args[0];
 
@@ -156,8 +152,11 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	dma_spec->args[0] = mux->chan_id - min;
 	dma_spec->args_count = 4;
 
+	spin_lock_irqsave(&dmamux->lock, flags);
 	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id),
 			   mux->request);
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
 	dev_dbg(&pdev->dev, "Mapping DMAMUX(%u) to DMA%u(%u)\n",
 		mux->request, mux->master, mux->chan_id);
 
-- 
2.43.0

