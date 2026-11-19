Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104119;
	b=wV9kwkVPICuYrGPDTyWWEUy1F8RxljO0c5AsNIdHYfUiT1o1KoNf3Ng+DKRvTgpFrKnq
	 YBCcorSgY4oWrNCcx7ISZh706gN0L7fEzZWb8GDmiu9ycxoRjKkvBcFUgjpzdefp3RchL
	 9TALWrmbYoGHx4vk0EI9CPgTIw/LoR9DYkxevzHI/5t0WXBy10bbiVC1EkmFfNr+lMsq9
	 Qn6Bjp2bacnFcT7g+Hq2EGcodV4fQloULT2v9JJ4dz1UnGGERETh0Cn4n+uKZS2RCD6hW
	 m11Z0Bgk1xsgqGP0mRzKv+85nwcc4a7MbvFbtdzZuRXpW596aUToIfDETHvOrR4Sn2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=efYuB219fcaN9C26HZvNi4/GEEQYMSSt/HAQ3O/Eb2w=;
	b=eTbRttZYRWXDAXZ777i1mb4dCL5TQOh7mBY8Gkb+PrtLIMOvc7aVlT6o0lceQwNcfXUi
	 jiEbDQ1DBB16sM3PMP0Zs4DdGFKK6t/FeFLfWrSgFU23jXllRT4Bibi9yVbSyB2lo25+3
	 ojlLASf6VFJidMZXe3fXXG6fwpplG4H03htGkPse8nVqM5T7IcMiuTunnEkA9nfSEH0B/
	 B82x6gUmmSDlZgltiDLw2y9ZeSJYVVdHjbdiOrzc94k9WbHiBsTJUpDW/hoZ6gT8tAihn
	 iV5yUz58gPWTJZqFbuPUInWC19K3xn63EA7NecCplaDomxyrpg1f6V3fj+vw/5qKMkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bqX+sPLM;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B4B60A3829
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3B4B60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bqX+sPLM
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b4cd576f2aso21022117b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795104118; x=1795708918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efYuB219fcaN9C26HZvNi4/GEEQYMSSt/HAQ3O/Eb2w=;
        b=bqX+sPLMc6zRDTNZOyMiZh94eEA9Vcrfu8bai0LW+BMdAaE97eIUXYosPQmW0Q8zIi
         kYgVarK4eNDNZC9orqU9V+kZEmO0Bz4SlFR00hagzKraX6CR3nyTTV45Oyl9oBznaSad
         UeLidQDmBC/CmHGHKwLJi6/g7RpEU5XvzQoKPKr8SspVX55H5qJ+xCnPRfOdSP3++2Cp
         AxOXFJodi+ICFGcHaPYQCD+4anzri5guXZOccffgvyM3uyIMVKM11dtBl8mmUEjkQgTB
         WxyEzLWLLYoQLzjHw2LA3UAJyScJxaLNELNnEheds907V8cppFAQM9eWa3N3z4dGygG0
         ghoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104118; x=1795708918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efYuB219fcaN9C26HZvNi4/GEEQYMSSt/HAQ3O/Eb2w=;
        b=JN+Xbai86Pw2cBXJXahrBamdPFZRoJynDVbVt+X7Ih/at3OkLsw2WNYvrL1zDG+28I
         8qdcJhbf22LqQ2J4XZhhWasQQ89oF5+U0NzLjUY73y0HsC09ZvnzT4Md5ddena1zBWh4
         2/yO2B9krfhzqtAZDANh4YzGrhJiohqNnpZAiLhTXCQqG5R9nZ3GJhpHUDsAnwNsmmx/
         WN+oFN6EfSYSS6wU1xc0HsebfuzpPC9z/5id1sKPI1TRxcvUfR3dDIlV26M+nS/PMyYv
         3qkgghRYVPwHTDA7iyJ0xRqBI0zs/HnVOVYBJ5+hPyBH0fYkx93mkRuwGfoSUfhvnuCR
         7Wvw==
X-Forwarded-Encrypted: i=1; AL+hErEmj+4us8ifxvxQniRfoK2NZRr6jsfO1K0RXdR85vkI5quVFwjOT1re2fxGsxjToTq461fpztlRXsPD2JA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nakoSyFuA3Ugqp425dRbYUAtPpsgxV2Io/IJJjAN+K085lyXz
	6WROTRRzWBCURo474LEK2Xos9szNHP8VoQMCfxbQFZgAw7O9I3snqtU+
X-Gm-Gg: AZFdTZcfy2iPyUHVdjGR9gv9jgSLnmiwoNs02e/eBn68lMKpp0apeQZCkSjTV3a3nAV
	UIO6tx9MdyCMdiGQATbr9GXhRH9FFunzIAF2/WJIDqnY4tqFxpcj8+fcsKjwzc1sUSIxkVhPgZx
	IFo9c5dvJAIJq2mpze1+XFptiRwF5jx3nzf0AlMwZoCxHbb67Jt90Hl+4m2VdBuhEjpbpg16X3l
	1OXkWO/Fx/j//ERc5H6dBG7OvvsfYHGcaSkqdBIQ2JTcJN+NDorBYRn02zG4CwVdnu0KTWOXHCB
	KBzO2idc9sz/dZZitUb+wIq1J4PH8viIGSwlA1tn7JF8VVPCBBQPohfN55PXB9THS3JPtLe5FtR
	zIS6QdadNABaukzpSkZbec7gbd+FVPKT3sFoJl45/x9Yo8TWneqmT8Kd+BRusGZcujb2Bq65vFa
	YcYlAfWdHCLfHiTxhCejI3C7IUludpvIIYQqP2WdhVkxp1j2hhDCXeehlg8ICucPeUuJJQGJoYO
	TEmIAMY4+Rlj3eAsshHKcrHfbwBbMMDIyQEzAJegi509o5hC6fOTN3B3HFdJV83+1MgCcw4sNKx
	8uWdhx3MFPSWNAKFOcb1BPqj1SVn4NqpKKMlhXzJEimHV9mpjq3+NjDdda0b8qWaVUAqmoAyzdU
	T2nQtSgTrSYtpf/h+0kQVWCEIzm77+rSGmf9tcyDVIn4rXkuySx7q+2COIJrRb7ZXzVgr1DhtWw
	f5ghwcsxj33b/BKIN2MkmUJ0rs3Ic5a/VyPm57BWlYEvwKOmjCnRs=
X-Received: by 2002:a05:690c:3745:b0:8a8:6a39:37e0 with SMTP id 00721157ae682-8b5204ba970mr652727b3.42.1795104117742;
        Thu, 19 Nov 2026 08:01:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52031aa4bsm623267b3.34.2026.11.19.08.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:01:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:01:03 -0700
Subject: [PATCH v8 8/9] dmaengine: dw-axi-dmac: require an IRQ before
 registering the controller
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
Message-Id: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-8-f8e7fe60594c@gmail.com>
References: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
In-Reply-To: <20261119-submit-dw-axi-dma-stop-pause-v1-v8-0-f8e7fe60594c@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

If the interrupt controller is not ready, the DMA driver can bind
without an IRQ handler. Clients can then submit transfers but never
receive completion callbacks. platform_irq_count() returns -EPROBE_DEFER
in this case, which skips the IRQ request loop just like a zero count.

Propagate the error so the driver core retries probe when the IRQ
provider is ready. Return -ENXIO if there are no IRQs.

Fixes: e32634f466a9 ("dma: dw-axi-dmac: support per channel interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2eeb902eaad3..531705f8f89b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1518,6 +1518,10 @@ static int axi_req_irqs(struct platform_device *pdev, struct axi_dma_chip *chip)
 	int irq_count = platform_irq_count(pdev);
 	int ret;
 
+	if (irq_count <= 0)
+		return dev_err_probe(chip->dev, irq_count ?: -ENXIO,
+				     "failed to get controller IRQs\n");
+
 	for (int i = 0; i < irq_count; i++) {
 		chip->irq[i] = platform_get_irq(pdev, i);
 		if (chip->irq[i] < 0)

-- 
2.53.0

