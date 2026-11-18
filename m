Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960478;
	b=rgRyIrQ81AKXWvoyQ06NTFRzqGxK1K+JSU7fePe6kVIE+QHprp1Z7Q2GawWEsu/gPL7Z
	 ra73t1Ey/96N/kTfytsggILSjhLZRpdw8dnBrL6v2zyDxQo+mkl2PyC0nz+vw4YuEwnba
	 hrN0qIUYukBArYSlDvTZLuU4Nuq3RoidvkwOuPaD74MKAqokoXCtVvkbkrgWtjyavjDIS
	 2Tayv4kWTSxrlE6HFYefZNk0Rejj0nFsLdIJ9JXkVQBqSfxRdxLLfc7EDXkLRSX70P1lY
	 elsmXWqLHKlTYPXQ7DweTJBs1qtUfvMVaWT+1ya8ErYp0cMekTgLJHC1Fip8a2dGQcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=5S9V7zT3oemkC3Xepkd24LD/XCMXei6CHfkQbzLYUnyf4g32qlVbJ/qWf686dVQhoM67
	 K38VF0QDCSLxl+VNBIKLxLffnfB0iRYqtPScEw9JFEbAn+M3Fx7TFfZs0OHCujR5/ba9O
	 DYEFlXdWv1fSbVaKulyJMP/sN7bfUFypdKXgmE1O8/h5XPrOqBSMRiDgaypHL3NtbrHob
	 DkON4EawvH6PktPq8n0g4YUQGgPi4NTTeV11B4emLQ5nrCVK0x40ZOzcazm45zgQN3RHD
	 DnmQ9S4GwWPpUfberh2hjWyO5FQyTFlbU9ONMZ0tX/RDBzr/grSLMpOEmVMzHC4Pc8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TG8OO5sR;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01C0606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01C0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TG8OO5sR
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-4932b13c4ccso234596fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960477; x=1795565277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=TG8OO5sRdGdUt09EZBY5KLUbbKwJFAAZgRkFs9hz3cLqeb4Ox0FhXdC+l6EWe/l3/K
         zxrRL84w4viTDvdzLDbVCRGI5dyxtzH3U2vLZe7abhs2HuqdunzcfTmM+r8pGZlTcCTq
         +seLN+jg+PzB60eTa7cnrgiYV37/PUcY/u0w1mx+u93qpwuPKKAmM4QjBXgBShEktodf
         Mz2+q2WkYFySmnjBVTbwL7RGiUFe2Fg3r6YFl41WTgucWSMEMJFeWzfslMGJq0T+1/7g
         SNhZdcg3sHsStcLL23NZB9xSfja8muqz2XEpD+5zUvrI1Oo1bKk29xQn7DTp6JeOmdcd
         zFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960477; x=1795565277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=vfUVKSPPy5IkW7PPwgoZrQt6FT0+MzN9GNwBmbtMo5zsvY0+tQRxXe+H6ZBZr7vJqw
         Vl1GB9ZXNBo+tFsyNTEy3VdnLO1bYo2UFkQ7GK8blPoEDMyeEy1ybgbLG4GlQbNnTM6G
         1tUTvsnc6mjdZj1t4VSuY8biMEaBwRfUMQ2CF6aKNfrJQ1oni5FHISTOF5+3gL72hRNw
         i41QUW6v5whsM14RejF7u5x6zOATZpzG7JtLGDZRn4X246BVefpRlBRv3zMk9B2vUAHL
         ppyBfKBV7eLgm+pkDkwWUiXgZeWPaa7JjVNTxeajHXOFAqSY3KrAqETcCDm7+I/qSf3h
         oKMA==
X-Forwarded-Encrypted: i=1; AL+hErEIVGl7rUcqGYYNq2Gvr3KRxqFW+GiKyPwIUViBoVJJKb1rMe2BYzoj5nXuTT9Jdqk71rGh6OfwebOAbw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ho5w2SjN79GWInjPoT83tqUoq4RtnNXSW7gATuI+r8hTq5Sv7
	jHLvPmEz2T2dfGLushiFkF4QvDEU2uQ1npe63HvQ/EmRrqjjVjw0HFdt
X-Gm-Gg: AYBFou1LJjJLYXVgl0n/69GtZplrcTaAT1aV6PTy2vnyFes/G6n+ZDiE4M7HT7i5mmi
	SFQgh23BhidWbVVyZ7EaiN+gtjzjKNrK0C9dQ6XSyby35iBFdwRvNg3B9B2KXn5+EKPPAZp0Jq4
	Pw2HUVEHY6nSvLDxUDDSbqP1XUtr7nYW5teNxnQ7vm2gKLEeZ5YD3WMBjohhawEep1ot91XQX5J
	y3yw05/sR4/BLgcj1Mljgr5YR707hawfkW2+1i6gcDIPzK5QIF64RaCVEhBdJR96Q3O+1+fwlUF
	zeNmdB1r0VTtXMnNlQRpIU+m56oNzrUyLV1IXlgZyWx8UbOLiyIM09+mI/Y4tRwhfoa2nBuLZZz
	VRLwHjPKdq+zQ5wKoUeTgeXhJqYw0OXt6vsEU79AupHhZQSW3+yHPxLYrwj7h/M8UcOl4ZcTD6n
	WnrXULyo4YgMfxtS36V4KX2JEXkclurXlbDGqK68euu4E9trJjEO51nRZlPVPVQdq40l1j7Vjox
	ZudhR0meThanCeg6xAtUba/X0lwfkc1eqZpDH48evpyQh+K6Sy7i1DrVl4fuRHaW4Eq+aM7q5Ed
	WioRGIKgwXVFfeOSaa8mZRXV8DJBxB9RBotfkbgKpbSsoCYHSFCNX5FkXYpOvvCkMTmhv+qACrp
	fDXdlGRNtr3rd8M85qW0dTDF8EdUNO7Xhhx2Bz3kl6m0LdQD/HzQ+u+cPdal0cXvTFSRS1dXYeJ
	86XokyGMM6ycDUJmHRKs0IYc1lNoIDLrvvbAsBFXQ0BvshO5hwKjMm1lSkAnEi1YCNZLbGnKTX
X-Received: by 2002:a05:6808:14ca:b0:4b3:8d45:aa2b with SMTP id 5614622812f47-5774045ca4emr1613768b6e.16.1794960476659;
        Tue, 17 Nov 2026 16:07:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5777b393d40sm434954b6e.17.2026.11.17.16.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:07:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 17:07:41 -0700
Subject: [PATCH v7 2/8] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
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
Message-Id: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-2-d5f2309afd72@gmail.com>
References: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
In-Reply-To: <20261117-submit-dw-axi-dma-stop-pause-v1-v7-0-d5f2309afd72@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6dae63024721..405ab9a78955 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1179,17 +1180,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
-	if (ret == -ETIMEDOUT)
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
+					enabled, !enabled,
+					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

