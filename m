Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095754;
	b=WWMRvRy1kY9RGPmUJTUAOHCBcKXqlIPvd0TvVuNDKhwCKwmWH0IT56mqnWWQJiQhRAtQ
	 fyBjM1tnPm9MKhsDjc+6SYWMxPbmBrWpLdARcxM2VGJyBXseGgItXF//HeVHBYe84nzLr
	 jcDZNi/L9vOTLAUvacU7C0Sf4VQvWR2K6bldSB6VeDPd+H/+gAmBdhTG3Ha+aLMwQ4elh
	 6i8lHvQsyVq40OW3grg8FQWaxHy0dmdtCOfSpcJt5+3LYpuOMMbYviktkjJxGnS1Y5iwZ
	 k7GpKARR/mOJ2hb/Fr3alNzSuZAtU5MzucuO6DFljEVgb1rfjoltQKVKxhihMQwsNFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
	b=omsBpY8VLEHwd/TDtjFHjvcqtQepzG8RUGbpSzx+Oqb8u26gz4hPMyFUwWkY2v/+sC4Z
	 /LWds2Xzm7Z3pgdinE0tGrmRJt7aaIRNFJtP7tVumXdLAUM+g/2fGuoVM7e7YYEz5DPTr
	 VS30PSSJLZh2xB/Wq8Ud2I/pRHKKhixQFY/0mUTec492hYutmagR55OxnpH0ipRp5eTwl
	 Lv+kH3BZRVwRVxFX3Dd1sUsUauWHxKAlcjDpMZeC+hMbckHUiXbbdON3BDYTL42oGDRvp
	 uHBNUi02/xyt6UcByx5ORehZNsLk0UzTzGACbmW4Fqs74zpSrFutRH/t8Ya4ZwH/fuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7MKf09n;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5CF60A3832
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A5CF60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O7MKf09n
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1506625f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095752; x=1795700552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
        b=O7MKf09nfKVBP1T4oceqltTqNtUEQMesLfGURBojEzm+GY2PG4pGTRLM358fYPh3Bb
         J7gEm70bgkgR+aAKOziihcRGiyQZ/5m1A4bDhkpWXWGOvot/7vlfc6twpDoA/knjlyBR
         v9LdUIG1NjuUuyejLuiKGarM1yLCqKXx1emsnc/n8iS/V5ZQ0x4Gc/x2wEkYkAaq4Tx4
         oLYuQRNkzG+C472Qn4CWCBXndOU7ucavfo8oISYimlIjbR8g4gaPvgZSjkz1NnP1BnZ1
         ireq8zSTYDWK8sCK18d2c+u3Go2TXNKzJ+ZUPeqB8xM1O2AxxOkIEXf9tbKIB/a7/Lrr
         vI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095752; x=1795700552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qeJQ2WcAvPP7/Q2COJ9+M/C2lXq9FsH5eUhG/hiMvQ=;
        b=WHAJLpSVdk39fucJNq7riZFxzoyFTjau4VhL2nkfAApm8sjkEAoaF+9vtO83FlRlSA
         YNfKXHG+/5BaIX3LxwdAej/5Un8wejRC7BiExgOCCZnL1Sju8RS8FH4DepOIi8XQw/1w
         9s7Hekk7u8RNoDL8upH/jxj4bZvRUxeAa492n2ie8r47uPPmgEEo2x8pWJUteqN/ynQy
         9W907oYpSFo4ECMbD97SrKRC4tEovspn/6nF8UOSPKINlH3pkLhHvkO/j6ZMtMY8bojb
         g5IS2y9vO6MMclz6QG8xQb0i3olyzfmJxSE4e7B3TW0fBtmvvQrHi1QHeXDuAqctQfan
         AzoA==
X-Forwarded-Encrypted: i=1; AL+hErEFHmaylcSSLpUX7DfCh3jP3y/+01jmkqBeTK34dU1ntAUtJ0SVzzTCJhgEn9kYrfhmaGlp53hCG4zES3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SjmlI9vfsMtsBjCxNZcOc2zLv14CJD9hansSCR8S8CyAh7Swq
	0rpAbv9WOypK68ohd6fPZKYwCLU42cG6RxkQIeHum8IFPAQAzj5IpIlV
X-Gm-Gg: AZFdTZccSn9UbW8sCkM8IDfJPZccwBdI+dhkPMc5J5XGjfGGlmwQ6t8+Xp0lo/6+JDi
	SSk1ashyimppDSiEWb+wmln+1TYsPqNARs/N39rG96o0n1kZru81NBQVkB7nejNMOhR/KhEC+b8
	2Vgjsa5JVpexWDrhoJp5G4fQgwO9Si0wmSt2ibUTqoh3asgsC++AqJ7XdRi1P+Wvo4jQ8tifY3S
	ruadd+yg0bqEW7w6YVVMkQw6keTrPWUYkrfEs6UWnWTc9+RU3p3ffveqKd9UMrS9FOgSFiDItcH
	mYq9UfA4sVYmKmUVpJATi7q5mukFmARg5Wjn1ettuuOed6nxDqh0NwT3AMxp5Bb115DMEKxctzZ
	eyqJXRtchu8qJtO4uOMts8X7KloNYYJMPlePr0vgu5KZwpuCkY8gWHbrtKeKqmpJzTX2dSnid/V
	1HOO6Dw/LWond9RH+Hu3KQednC/rt0RpdgAFrr2MlkcRQAjZu+EMs9kvdkqdnqrXcy0W/BviurD
	+/F+vmJxqG1YUgXdCIBwC9SpaDVoPKCQoqZFO+tvQTRXGMmVFRAMRCF1LknkmKI8/XuZL/YPIj7
	/Rzarj4RbuWo/RGMWPIQOXMTMJB4iDhBKHQjfsk5ghsrEaaiUDIFvCKr
X-Received: by 2002:a05:6000:2c0a:b0:4a7:1fca:e52b with SMTP id ffacd0b85a97d-4a71fcae766mr11850285f8f.19.1795095751841;
        Thu, 19 Nov 2026 05:42:31 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:31 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 3/3] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Thu, 19 Nov 2026 14:42:25 +0100
Message-ID: <20261119134225.265242-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When a byte of a DMA write is not acknowledged the controller raises its
interrupt and no DMA request, so i2c_imx_dma_write() blocks for
DMA_TIMEOUT (1 s) and returns -ETIMEDOUT, where the interrupt driven
write returns -ENXIO.

Let the interrupt handler end the wait when it sees a missing
acknowledge during a DMA write, and return -ENXIO. The last byte the DMA
writes is still on the bus when its completion arrives: look at its
acknowledge once the byte is out, before the final byte is sent.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index fbfabceb29ac..06b082c677a3 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -480,6 +480,9 @@ static int i2c_imx_dma_wait(struct imx_i2c_struct *i2c_imx)
 	if (!wait_for_completion_timeout(&dma->cmd_complete,
 					 msecs_to_jiffies(DMA_TIMEOUT)))
 		result = -ETIMEDOUT;
+	else if (dma->dma_transfer_dir == DMA_MEM_TO_DEV &&
+		 (i2c_imx->i2csr & I2SR_RXAK))
+		result = -ENXIO;
 
 	if (result)
 		dmaengine_terminate_sync(dma->chan_using);
@@ -1123,6 +1126,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
 	switch (i2c_imx->state) {
 	case IMX_I2C_STATE_DMA:
 		i2c_imx->i2csr = status;
+		if ((status & I2SR_RXAK) &&
+		    i2c_imx->dma->dma_transfer_dir == DMA_MEM_TO_DEV)
+			complete(&i2c_imx->dma->cmd_complete);
 		wake_up(&i2c_imx->queue);
 		break;
 
@@ -1248,6 +1254,9 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 		schedule();
 	}
 
+	if (temp & I2SR_RXAK)
+		return -ENXIO;
+
 	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 	temp &= ~I2CR_DMAEN;
 	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-- 
2.56.0

