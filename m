Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202052;
	b=bzZC7k9WuChVrfH+OBIpJbvMhKYkImZ3swih4MqBAZGjIg9VvX9anXtVIStgQWCn6Obs
	 Re/2i8yxHVje2a7GaeMd6JKDTs9vluIYIYgL8J3wXxi44LMI0WqS37/sZrtzC21qVuFq/
	 hZ6Sxcyr1p1CEOiADukh/tTumaooPExMx38QiagstlDa3mH5pJkqSH3+iMXgEi3qgTDRx
	 6ieQcpjqBN3Yq3V6sjo2cehOsw5eXiZJTlrNN8kdyUVEwaam/A85wFTfaUyYRURqyeYsS
	 2fhGftgzSC6gJVhlwYEJ93UhhzpxepO2Adqz813yxlWDiD1uf5apWPCA4MjbdH8s9SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9b6+vzAhRKtQhjqw9swKPNAviMKOXHv6Fk81En8ghXE=;
	b=u+qojdmkWu6HLnz8y9sOQPBj9g/6cIshhESkDPkOMwV3MCv+fvyxaB/kjngRK3uI7PS8
	 MLbN8+nMnU6p4ITe9mbDfn6US8jC2hqdOMdeOpWHOGENnQzLs6OtrVFUObQ42hAF5A+fI
	 xfWvgu5sAZFLWVNkkoy63Nz8ib2UALxowh0pcXokZ53s8oWZaFbRxczSfUw9I2i/f11o/
	 eqJoSKSCAHsLYggjCs/5Yx6EX0U9aRF+h1xwJHyGd4V+o6y+7z6JYHDO+hHSdcemTwCiX
	 7mbrbG6EpRn1c2iwvObr5knvUHgPl5YmadTuOt08eOJ2yI6cQW6zpa9ozZD4X8ZaEjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQt3Sk82;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4062460A2625
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4062460A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQt3Sk82
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-70059e4dab6so765089eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202042; x=1795806842; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b6+vzAhRKtQhjqw9swKPNAviMKOXHv6Fk81En8ghXE=;
        b=dQt3Sk82CrlVQI1D6TBRa7FG1VF7RHeczAxMoicoTfJCU5zL7183TFGDg3HOn9/kqb
         p9/Ro7a5AQAnTU+MvxP0n2PKBdhzSUxHjH0UYSFJjppsaziT/xoFCIUhjFrmk5I8qp9l
         egjvoVQi47XU/cTbu0ULF2sYaLd3ZHyykxwnNTaqU7ViWYsPBnSqIvp5jpIYCZF8Fa2j
         ZkzLkGrXBcO7GN/YEZ1TWHW2lBS8YFoyMtnhC5EEjLsq5gWk5c3gJXBLtmqzW0ZHio3Z
         C98QcPm1njJxh6bhs5Zlwm0TEO+U2tdHRehZkfO01IwgPnlSyEqox+LZtnJhASFpCoWA
         WEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202042; x=1795806842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b6+vzAhRKtQhjqw9swKPNAviMKOXHv6Fk81En8ghXE=;
        b=EGSxZOR4hxbHYrh0rNSw2ZxufM/SzT+9EN0FiOsG/GBwtq4O2f456vEmQrTs0vIfu+
         tSVl37iX82RYlnP+AvL3W3wJWLY+p/UrIl8h2A7bx4SG39YLnbmK2yw96gd9gDUmmFKK
         dBewmuPgRhTyU2tflXQknTbsmCxD3AoHlVG7koAzZVX3qfW7kDV4Og84axUJ0+BjhtIU
         qD3GuaO9QsqYFlXK+KF0nFsYoJgpYqLxNzORxccXzQ7SAFlAmYIZwPr0Fmm4A0ZnGlow
         cL+iVwcWY/g4BwBLekYmsyarbbNFr5Q9MaOnx0ZPnMGOb5vqLrHXt8r3Dh1zc7cK4woQ
         L2Qw==
X-Forwarded-Encrypted: i=1; AL+hErFD36mtIj9RWh7Ji+fsDKCf57Omnp+WYuXr1Pp/2TsXpe4UV4Twf1QGVJYijeTnSSou6fk5sHElCycINc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OeTU+EpcU3TGkihuNuS7sY1gn33I/uAt7WVmgvXPlBMkkjlRn
	Aec41oBojMik/HW7o56zJ+jgfm/AW/p2v3ry4kKY+4S5trlyBWMnfAqZ
X-Gm-Gg: AYBFou3+t3ZnUGuzYATIZRtVFtnPI7XEkX2zl+RIGy1uIiLZFD7piv/aw2aeHu67oym
	c2hdZ+NW1yyM2R3cHrAg1sHUq2jCxbe74HGZ1RC7Hz95bc6QU3gi5EkidBDlcj+H9YNOaATRQTe
	RA8ZQixydRPOWR0HuhGPeAZmyBQmsmQ2d1x7EwhmEjx+/WgdjITBUx/7WSD6QMPEPLA/HeKFdZ6
	+dnyLZiw6RUK7Fx0GoJdu6acbBDefxjBj+kEINeonLsq0qKtAyT8+dcek6FLmATYQyKNxeID7vn
	xD7TGVBnQmMGSMKj+vxX62AYYdS3YYERdyGZeTnTdzEVEpfIkOe0u15nWfSTChpLQvEuev4CAHP
	4dtcbxlsuJE/vLjNu8lkrmdgxrvOrzsSWagdsreTVYfR/F2kPD0cF67yuHhbrk0HPUJhSISmqrB
	giqk17D/KG3q51iZdbnOeRZaxETc7BTEVKcF6Las8OYCglm92Z5V0wJk4+LYPyosw5rFNQeQNGN
	GklKi/9JpGLjJTuWsXxZiOrRtd0nzkWCX4daGdNXkVLjr+eTNjiUUtj/g5LEyZ48J5uTOXCqi/J
	Vx8d/z6Ln1yJon6KsBRNTyMXVdn6Wuv5WOwkw5Qm/nLgEb3jZzt2uSUpnrCyoAZvUbLEEpumvF7
	SClpeEgrsK7XvuSbMhFeIIVIf+k7vXGAGWoxfMRjeNrCGHKlxaCsF2MjNAq3FPG2I8TfoGFqzKq
	nmYUD++amN+1DkmRQ0GCDF1lnvD44MLUO3s0ZGSWEmv1y4dl8Uk6jW
X-Received: by 2002:a05:6820:f021:b0:6d8:bba5:658a with SMTP id 006d021491bc7-71b39566733mr3401867eaf.43.1795202041829;
        Fri, 20 Nov 2026 11:14:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:52 -0700
Subject: [PATCH v9 2/9] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-2-48ab58961d6e@gmail.com>
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

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6dae63024721..f17a71183050 100644
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
+	ret = read_poll_timeout_atomic(axi_chan_is_hw_enable, enabled, !enabled,
+				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC,
+				       false, chan);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

