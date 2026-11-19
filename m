Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095753;
	b=NyXwLFTPaf5wBoj5K0bCb/1XWwm54WUXOtsQPTXdVlXn29S2D+I0DUMG59tvtVBaV+1B
	 I/Oqdi2Fn/QhAu3/F+UdzqWpUUAnH4mgHCzdRhqe/WMAVRgIczCMPvCKNzQkPbAzbiKb4
	 eyZUhV0d+xoB7hSl13L5xi5gghvzUpOVJaC/WO/rtKeROOVuxZnujeKPe6VISPuIw9zSO
	 CBAui73qfM4snoakrpl0N9pz28WZ7n+rLNBJZ0CgwJuNK0lVH2NFiB2kwyYYn02MTv7df
	 j2VMjY2iKigTApRGLjtbgrnFKkDokyI1Eso3EjPjmXiq5laF5lV5H26t7DZdP3GhFIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
	b=VeDW5oJN0vVG6vpsQJa0dMLPcnOQMGPRUJhuLdSmDF5e7k78Gmil2d7BSREBSo3y7TGv
	 TypUBxikWZ+aouHPERNlr6yxgYlhfzWXLH/5sO3Fy12OHnmBfGvXLtzL+hyF7FjME2TW/
	 xcYeo/biohC2Opfhf7cH+P/b/i0JxbEbozg8DR8h03z+ci/5PgTJCL/csA78KQiX9evFv
	 4NgAJ0u6T1HsuD9Nx5+AENShy0bzjLDIWbQFUnpvv/b2G3AwRIE/aFTm3dyHa+tMebXSl
	 UaXNf+XXFJusQy2FviqnAD5DQmiPjk5SWB23HX5ZDvGJl1tI2HpbInWBbMM5kK0bIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1T2EOXH;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1560A3810
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B1560A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G1T2EOXH
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49d64a88222so571664f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095751; x=1795700551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
        b=G1T2EOXH84EotobSX56mYIVYj4pfQfsC2O2uaIBQJU9qJXvcXU9geS/kdilVem0EYd
         BVhZ+n2KFxyVb1yoO/LXqYQcfl2ub1a20ZhuwLiykMzYx3LiYerVs1BJwHALaNwVDcnI
         1hKE8sRCNiK+OgT4lnTNm8W/lbMGSrLsXF7oR3vpdCnGu7qvgYClBePqWOV1fL7Y9odh
         6aU1JkkECs37u7t/GXZ7aDwqNsTYIMwq9a/XvMc//Ewt+Sy3czPsJXi96CFSo/4DOUWL
         jBWawokwRp+6h5iLfCosuW5MyUUqpIfCWOXA8iS0iqdGGsfsyzd3oabNgivqkFRVJGxk
         Tr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095751; x=1795700551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV4UJVZ9NL/7DCp8HEJshTGUvYsQkJNidhWUdfBTaSM=;
        b=Rv3cP3ENjT9GFfZoI6fp6q+PB8ShQLqd041qMFs82yJr42I6bMm1HTSy7/wFEe6j7v
         C3hi1rq71NjW9z7j5ipqcGOLwygOR5Ct1b0eEHqStByyl1v/Z8iOFigXof6iRbciokxB
         oo9aBcZKjaXw8g9hJXO+QDIwZXGtdAS3IH/OQg8Edm0tMH4jzPKDxXdGT4MzfQwHi7Ta
         VdtgYPjZO2tBIJBAWNnLI6flefvRXdftCdiRa49T4R/ZS5lie15YlOKTCmQlQ78SNOPS
         bwy8GoXGWPk2MuO0nuyhKWgxhEYgzBv6UrgwGqtKdRl7cbI+CWYSOtM24SRCnDtHd3kV
         ZlSw==
X-Forwarded-Encrypted: i=1; AL+hErHioi9H4WeU+CrAUYHK1XVCFqe8i0V//xWYOUEPPNHIeh7yGaCHPS9E2ADgGg9KfH53ygWgdAs9mFEchv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8ROEhlBXhuUXWhZaG2/2SgKEUrtKHF9FpMlJDWsea5l5M9jyC
	GThWNdegrbsaSncUcoX1Wy8POVOJEys6Zwveg1nDybmjaUUThGHsxP/m
X-Gm-Gg: AZFdTZdNNBtoJ4aJpWuFbxY21QOGsW5SKHfW/q1TD99L1TKmTtM9hLPL9VgXnySnY0h
	9yj5cY1c4ZTZAZl6HasAAmRsdtKh+67vYunaxCC1H+EDXAGttWbC1OcK+femIvYYoY/vRq3rNpy
	gs3lYQ9ceKNEtxZDrJnJymSJq2feV2Z1pOP92Heap0wrDvhbicRSR4pZG+ia38kdWMWbAt4UI9O
	/+kO5ZOMWDhYUOb7xH6vmDNBemBazI1iYr6FueTY8iXGok6w5n1z1wiC2oFMYHwoT75oZ3VOeh6
	ijAwyq9/mZAtas7FEUQRhNCL0SNdLSXuOKPvZETRS+eNnna94d/bB4ThnG3vF9HAceYGJjs1RJR
	7Ij88WPdMbI7WDkfEVQd5nRutd+bxFRfDfAewkm+xAoeW7+zbi99xPWXBIJc2NNRzfTGDnLDSfq
	ZSF0EZ7v7D9FVjT2QirIJw1YC7gp/0jOnQtY4Wh1zEewUEy7In9DJh4HjoL31X6Lrr+CDEGQraV
	f6q87pyH/RUGJdVBh2RIvKl48YW23A8Qca4OFx1JcWt22FXIE+CBVFUPOpWW349EEIOzoA3awGP
	7IxqTu49RiEv45cTWsP0yR0a9YME60myaLw=
X-Received: by 2002:a5d:64c4:0:b0:4a8:647c:f962 with SMTP id ffacd0b85a97d-4aa573ee4c2mr3035038f8f.23.1795095750641;
        Thu, 19 Nov 2026 05:42:30 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:29 -0800 (PST)
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
Subject: [PATCH v2 2/3] i2c: imx: unmap the DMA buffer when a transfer is terminated
Date: Thu, 19 Nov 2026 14:42:24 +0100
Message-ID: <20261119134225.265242-3-mehmet.fide@gmail.com>
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

The buffer of a DMA transfer is unmapped in the DMA completion callback
only. When the wait for the completion times out the transfer is
terminated, the callback does not run and the mapping is never released.

Unmap the buffer where the transfer is waited for, after the transfer
has completed or has been terminated.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 41 ++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index f20727ffb5ce..fbfabceb29ac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -469,11 +469,26 @@ static void i2c_imx_dma_callback(void *arg)
 	struct imx_i2c_struct *i2c_imx = (struct imx_i2c_struct *)arg;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 
-	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
-			dma->dma_len, dma->dma_data_dir);
 	complete(&dma->cmd_complete);
 }
 
+static int i2c_imx_dma_wait(struct imx_i2c_struct *i2c_imx)
+{
+	struct imx_i2c_dma *dma = i2c_imx->dma;
+	int result = 0;
+
+	if (!wait_for_completion_timeout(&dma->cmd_complete,
+					 msecs_to_jiffies(DMA_TIMEOUT)))
+		result = -ETIMEDOUT;
+
+	if (result)
+		dmaengine_terminate_sync(dma->chan_using);
+	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
+			 dma->dma_len, dma->dma_data_dir);
+
+	return result;
+}
+
 static int i2c_imx_dma_xfer(struct imx_i2c_struct *i2c_imx,
 					struct i2c_msg *msgs)
 {
@@ -1192,7 +1207,6 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 					struct i2c_msg *msgs)
 {
 	int result;
-	unsigned long time_left;
 	unsigned int temp = 0;
 	unsigned long orig_jiffies = jiffies;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
@@ -1217,13 +1231,9 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	 * The first byte must be transmitted by the CPU.
 	 */
 	imx_i2c_write_reg(i2c_imx_addr_byte(msgs), i2c_imx, IMX_I2C_I2DR);
-	time_left = wait_for_completion_timeout(
-				&i2c_imx->dma->cmd_complete,
-				msecs_to_jiffies(DMA_TIMEOUT));
-	if (time_left == 0) {
-		dmaengine_terminate_sync(dma->chan_using);
-		return -ETIMEDOUT;
-	}
+	result = i2c_imx_dma_wait(i2c_imx);
+	if (result)
+		return result;
 
 	/* Waiting for transfer complete. */
 	while (1) {
@@ -1298,7 +1308,6 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 			struct i2c_msg *msgs, bool is_lastmsg)
 {
 	int result;
-	unsigned long time_left;
 	unsigned int temp;
 	unsigned long orig_jiffies = jiffies;
 	struct imx_i2c_dma *dma = i2c_imx->dma;
@@ -1321,13 +1330,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	if (result)
 		return result;
 
-	time_left = wait_for_completion_timeout(
-				&i2c_imx->dma->cmd_complete,
-				msecs_to_jiffies(DMA_TIMEOUT));
-	if (time_left == 0) {
-		dmaengine_terminate_sync(dma->chan_using);
-		return -ETIMEDOUT;
-	}
+	result = i2c_imx_dma_wait(i2c_imx);
+	if (result)
+		return result;
 
 	/* waiting for transfer complete. */
 	while (1) {
-- 
2.56.0

