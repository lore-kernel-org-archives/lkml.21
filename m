Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202050;
	b=Ep1woDAOV/hsUNhrCM3wjoaH/gGQ68Xp/IMvNrsnkEQGbumTi4MXrCGsq/3NHa6xjViI
	 5E7xjsAUPOAgTbIWZQyCDzKdvCv5lU4BUWPi+OeUsGHFil7WBhtgAKSPgoawg9M50c7+F
	 HTEpBUqPDirD0mbJmt2Mxk8/W3cSq5sYRIzqqvuZX2cSQoMf9nuKotwLJ3krjt8Vou5d4
	 +6VdYXuhP6JHtT5MOYosxwjg9ZrHzR5V6nENnruz+0cT7bPotaP+kxjwfqVFuyF9OrQNk
	 nZET/7KfHNAUZ+nG3BKwbfZiLuvMqPCaskw5bNVZ8xReaeoP4DDDbylXJbPsQK+4P3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9XmdIKDNqOq1IqNyOaH9sp5VFW9+Oyqd3k96RmqKjnE=;
	b=GC3L0wpmO2URJ3rXCkKt0m5l2SGB4IpS28dPE/6SqexMzV/E/gAFGmbPrv1u2LU9Vw8H
	 PjAzbMnz/OWHpWQMujEtiEi6U1MKwHb1q1QKS0vo0hllGr7Q3JZVBL0qm3MbHe0iStdcB
	 0oori9nL6xCq942lWAACZYut8GdUV+4qi6rrdbBe15jspPetwpmD5heOiCtkXIWww0s0n
	 gi2BZUdQPV3etU4pxCtNB1lwNGnz+79WwvnmSO7wV2NaOgkDXnH2Zg3vjun7IfJyOFbEm
	 zyjMHtiX2v7OeJ16SIFnuLqMBE67WEg+UEOZ7dldOFZTYBDfYoWc5LVfTlx+f6hwtGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USCAZclK;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588960A3812
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B588960A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USCAZclK
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-8629ef8613aso522732a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202049; x=1795806849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XmdIKDNqOq1IqNyOaH9sp5VFW9+Oyqd3k96RmqKjnE=;
        b=USCAZclKpTAGAq772/HU3Xz81Eg5tL3nv/vGaFsUbt9Vaw+3SGs4v6Nf4VfDh60iqK
         gr7kDSmTj0H8PxyxjsgdkB691dJ180xtqBkCWyI/IggJsycfLNEDU8tl3Oo/9KCy1N3n
         XIm1/9qFB15saRRsKIxK8z9fQK7RYbFsWde2OOaoliYL5sC4j+BtPZeVMqS6rSZbwp7K
         BAN6CPzBzf9B/kcP7EGmx9D5kc41nlYrNSrYQy/1VcbG+7my4FnU3EE7Y+bsTAzYEgSs
         Qjkuvuju6DqND8StWjj3J+cp4kqWc06H8Nx4NDoRqS6PikZdWKSN1sUrZbeQB6rmVa7W
         h61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202049; x=1795806849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9XmdIKDNqOq1IqNyOaH9sp5VFW9+Oyqd3k96RmqKjnE=;
        b=Xz+pDbtTbwY04OQPH7UGmBt6DMdysUTnqd95/o9uiUa6pjLUNsQ3/zd7QYpO8Xi0DM
         BsGXnK4+ZrRC6C8pHzCJpJN+ZrZ+2Hsn0TaG2Apk8FJL+xZMfTKaVrg+nTEtmG/qVJef
         udxaG1t/EdbCczjX6MJ6h3Zp7DDBMgIYiK8zZ+GJaBsui9iLpEpFzpCtH5YiiZryWrx4
         ef4QV6GCUH8R90XXxcxuqdftt6SxprNHDWIBux3E9gUHrlVr6KC2F4wntiTnlBYwDjyX
         YL80w4f6F8rzoQhR2TOGodJzJ29lwg+joMwWzsZ1GBh+s4c6MyRx8LTS+X3u2HC8mpWT
         UbsQ==
X-Forwarded-Encrypted: i=1; AL+hErHobw2LMsJye4kLgWHSka0miPJnPIv3+BKHRjfaS0MxTI8mNUcGe487A7q7FArGkZkE8/FW9bYYY1zVKLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LRfBqDN4e4fqx0VoFnizDQhifyin71tvLNvzWmyH1LCaEUy2o
	H+aCW8B8ENr3x1S0GOuRgOmrK+9mZKNda23l+G0y3Vp0eZg74vHTYkEo
X-Gm-Gg: AYBFou24VGyCfmF50m7CKivkeWLa7grGGtJURsywfB7ExgmH09TbEs0LUEUYgPx2iXl
	lGrh8b7UMtFokbHDkzMRHdvHXva6NHv/tRWFFTOie/872uvn9a+6yBiFADuQGe/q1LXl2Eh0B30
	qqnOdCYrel3CHZX8HewH/6DOUThcKQ0FS4qazkQfhdIoQzBzFwBvxvnL7IezTQtq1R+9gPX8Sky
	agt0wnVer2Fgj5skoxyGS9Z+Q7k+oMjaM1auOv8v4FIuenv63/zu6ww0d4iwIMBBojS7UqgTV/h
	QhaMymt8mCChk+g6UNutYdnJ7ljjB8KpCmWV8O1uSdRAi+/g9KsIoQ9n5JYrjDDNcSZuXFvk1pf
	SeyvhvaH98UwKyoAApo4qZva6aMxmm+soz4a9UM1XgvUHLK9bE2ozQ/WhQ4zZUdBzGnqFxTugfE
	zEwrt4iTedCzmw2qyAVm8kPg6oTE1O5gyVX/GHEWrKADYHp2JtIwf9OK4myBmhkJw/BwUA3t6Ql
	C8s3ADjM6nh7dwdgeodnjqgZVbdrb+6kdGUQPto+FZED7ULfxuSFti2ijF0X+qM4yZmv3PuSPdL
	otY/Xiql9iyBY7xZ3zoN1F6esTL3XH3xLz/4Kfel7sC4HFSCY4kjzE2io7qLgYzBiYV1+Ouvq5N
	lW/HgdPx8I5CglSygQa3pGfZ9w0/Cw+ILGiBV9lYmTYPJKQJprIGiOGxMmWoxTjW9w+94Uxe9Wl
	louelUuDsiYhVX2Vhov93zmTd/ENw5i3OSz0LqblKB7Va3tJSz3uzD
X-Received: by 2002:a05:6830:2705:b0:862:9bc5:5c24 with SMTP id 46e09a7af769-8631596f074mr4518795a34.31.1795202048618;
        Fri, 20 Nov 2026 11:14:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:58 -0700
Subject: [PATCH v9 8/9] dmaengine: dw-axi-dmac: require an IRQ before
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-8-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

If the interrupt controller is not ready, the DMA driver can bind
without an IRQ handler. Clients can then submit transfers but never
receive completion callbacks. platform_irq_count() returns -EPROBE_DEFER
in this case, which skips the IRQ request loop just like a zero count.

Propagate the error so the driver core retries probe when the IRQ
provider is ready. Return -ENXIO if there are no IRQs.

Fixes: e32634f466a9 ("dma: dw-axi-dmac: support per channel interrupt")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

