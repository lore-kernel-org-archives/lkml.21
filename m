Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445617;
	b=mTtZXnqxmclfQmNu2VUFwGACej+gdpIxNHMSCBONZDoFsTUzKyG+bAcZgoyoPjuSsiqh
	 283Bf1fBYpwWGuFcNTCcN6oJIq2QWmLOqwprhIMojHljunrOmuCkzVxt5Fw2vnGh8yYeC
	 yait3QATs8qGP9CnXrBU7hn8GiPZ+xZ4QE3jT9wfRJTdkf4WZizM1C+r4XbVzgVXXe+GB
	 suFNWJH8PSBSOnGoAFB1Umi/KTyjsfZ9ghMGgXGBiwrLFs7c42GwzyqYItg6ghOGNYa76
	 bFbE9wJ04s3hMxvsM5++lJgAOUgPz5aIGOfxFXFzaBolVQHMTNpe0WBEzIo8YRWmG7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
	b=Kq5ISJhU6qwcU93Rhcqur42hxeSF/labahTb/DgFz6rxPOw7Rvt+Gv+O//5YNlUsPZRa
	 CEYWau1GBORO06rU4jt6vEqJKF4fqHgf+P3Er+GG0Y7NUrE8MYZygXRwwoChOB70SKATd
	 zvpZ64p6MPJSebLTyC8c+44FQ4Sn3aGcvi8AZ0NhcOlafZAILniY1maoEH5SyIZ1+Qeqq
	 9A7Aeh/RsEXCVNEX5PUQE+skUu4u6agd6qWJ6iIbvBKrKocT5pfL/yWZon7kfnj79gMqK
	 zfXhkbtE1tppn6//e/5IssTtac7BlsJ/SJh5SgLlGoJAPLyUHqXWU1LZuYtF9tHkGYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XkVqsZdM;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753C606A689
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0753C606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XkVqsZdM
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e09aa5264so1879084f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795445615; x=1796050415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=XkVqsZdMeHpiJh4TE4FyZ4rGJAMbAslvY9zSoJ6LUQLDl/U/PQ9u1OeVW3wbxvhHKx
         kX/pztzhUIpaTZ+2DQLK6ZoUnETw3r2gArj5GEP/QBZ+Anj4sjUrLXFNPsf4lshi+/Xe
         AMwL117lSaIfAQwEP8+nmdBnxrkv28a814bMLCFljC6G2qHN/oANg3FumU8aezzJoAvT
         HBW4cMrT6WaUj4FmZNuK2yJjT8JrWlCFFL4Uyohrbj8LUtsO1qbX1YefGEzIuSY3L93f
         b4EP4GNfVWsHiOj7XLdIclXS6HI6RKjgVRYnNtTJ8p9Hb9R4MMYDf0ZlieL4vbdj7rr1
         vcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445615; x=1796050415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yjvjix1ikk+CGbe6cYBND0Wj9SQniRLSb3Q1jpj0b98=;
        b=ter81yGbkQRjciLavNCl8bp7uNWyI7LCcv94E/qhfwRK6NMs8yZQGiwfg8S6DehlMK
         DGhMP364rOowPOD6GzIRka1zS7hnROOAQb84VtnZR++h7L0a4cKo5ipabiSvEGlu+1J0
         Yvlwk1OW/XlNsjTegfsbghBFnyV7zafMZgbly9aN3ApA9JIMFI32/LnKJFnXHF3J30tI
         zhJ17vOsb5zPm2P0X3gr/Cq9kCSzIEY6vK9/CVJm2N3Tz3W0rtBvOwkGPy4//b1df722
         Z1FrfiwHjcD4jyGzkuQzl6tr+W7/70PPj8m+2c+l+9+FobnIq1Vv9b+YTBfI8N0XVlPd
         DDvA==
X-Forwarded-Encrypted: i=1; AL+hErED6YA5ElDNpl0amgev0SjjkUknC5Yr75ojdSXKc2P5wBm3ESN2Gz4HS28rUz2fmFP3rIdwdUrs/VhDxu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ieh7Olp5UU2gP1f+rTLfuDHWZwPWqZdbrCyQYswhNRn0BetBR
	wHw382/AJkNOufI2pu0Om2s/C+ZutQau0d5Kzh09gLY4Dh9VPslj0eEvsnSE0tueDdG1KNk2fmh
	m8xBGLY8=
X-Gm-Gg: AZFdTZdy8BvjmZuGP9Nh4gj5luhe0QefDcTSaej09DCrP9oX9urel5wJG59k1NBv35Z
	avK+hXL8dbAk15h+F8e1whthDLG3G15efFTfOPze+pcJvRxRxItwudWvYt39oDxe2j+ttqLBuxq
	0fF0BR8Qodejo8W7r+eBIUAS3rWIOIxNZTCb5FhXAbcKMwhQLeiUzo0yvUBem0BPafO0GamEVTr
	n2zcWN88QyV2DRMGQhb+R4Kz4L1EEM1BFRFcIB6SGOv5ZIC2C7A/X5+WnCXO5wA0FHriDvpHkLQ
	RUTTq1b0wTC/jtuuAsGthNRc2HyI4qLzO/0XmGHDggnK+JNtrDRD07Q98h99t8Q8JiQKxlWBtOs
	LdRoH1m+jLtR5eHoagIXjAzXzsZGma6HmfUVZb3aHDfvKeM1xUMYetiyygmmisa8h1Nda/3PYM+
	LYXbwg6YBmZr7EGloNgDxCMCeEMjrTML+Z7Nr9MTi/zXAQ6KUBGekjBHSeRV2yo5IfSQ3ccm35y
	Af2Jux6uCIJ0tIWg2hYsBuEG9Mil1psWGWNf52w34w4fzIao9sZ8a3Lhq+dNsBasXl5EXkjCuUF
	ZUW4nD6kz3HHdFEuW84fyD6Yy9s=
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr24213933f8f.14.1795445615277;
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23180331f8f.54.2026.11.23.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:53:35 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 02/28] dmaengine: bcm2835: Add support for per-channel flags
Date: Mon, 23 Nov 2026 15:56:40 +0100
Message-ID: <20261123145728.29082-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261123145728.29082-1-andrea.porta@suse.com>
References: <20261123145728.29082-1-andrea.porta@suse.com>
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

From: Phil Elwell <phil@raspberrypi.org>

Add the ability to interpret the high bits of the dreq specifier as
flags to be included in the DMA_CS register. The motivation for this
change is the ability to set the DISDEBUG flag for SD card transfers
to avoid corruption when using the VPU debugger.

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index b19182c6e3df..690f5ba1c439 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -137,6 +137,10 @@ struct bcm2835_desc {
 #define BCM2835_DMA_S_DREQ	BIT(10) /* enable SREQ for source */
 #define BCM2835_DMA_S_IGNORE	BIT(11) /* ignore source reads - read 0 */
 #define BCM2835_DMA_BURST_LENGTH(x) (((x) & 15) << 12)
+#define BCM2835_DMA_CS_FLAGS(x) ((x) & (BCM2835_DMA_PRIORITY(15) | \
+				      BCM2835_DMA_PANIC_PRIORITY(15) | \
+				      BCM2835_DMA_WAIT_FOR_WRITES | \
+				      BCM2835_DMA_DIS_DEBUG))
 #define BCM2835_DMA_PER_MAP(x)	(((x) & 31) << 16) /* REQ source */
 #define BCM2835_DMA_WAIT(x)	(((x) & 31) << 21) /* add DMA-wait cycles */
 #define BCM2835_DMA_NO_WIDE_BURSTS BIT(26) /* no 2 beat write bursts */
@@ -433,7 +437,8 @@ static void bcm2835_dma_start_desc(struct bcm2835_chan *c)
 	c->desc = to_bcm2835_dma_desc(&vd->tx);
 
 	writel(c->desc->cb_list[0].paddr, c->chan_base + BCM2835_DMA_ADDR);
-	writel(BCM2835_DMA_ACTIVE, c->chan_base + BCM2835_DMA_CS);
+	writel(BCM2835_DMA_ACTIVE | BCM2835_DMA_CS_FLAGS(c->dreq),
+	       c->chan_base + BCM2835_DMA_CS);
 }
 
 static irqreturn_t bcm2835_dma_callback(int irq, void *data)
@@ -460,7 +465,8 @@ static irqreturn_t bcm2835_dma_callback(int irq, void *data)
 	 * if this IRQ handler is threaded.) If the channel is finished, it
 	 * will remain idle despite the ACTIVE flag being set.
 	 */
-	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE,
+	writel(BCM2835_DMA_INT | BCM2835_DMA_ACTIVE |
+	       BCM2835_DMA_CS_FLAGS(c->dreq),
 	       c->chan_base + BCM2835_DMA_CS);
 
 	d = c->desc;
-- 
2.51.0

