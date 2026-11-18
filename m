Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996477;
	b=kvpbQjYNgc7Sqz6e9c77BvXPPzmDz+NfecxihiDTXVhXcx/uGToUKY2Qwu42s3/U/uCF
	 Fkcar/GxEM/yhi/Rr5+EKm8BZ6mjaTAo2K5rZ9ztcCFvXBgcHyMRnX8hl1J8aVx/KvfzG
	 gpepONnZU/qcoB6CTw/GfA6LvoiKdgyx6KLxZBhT7tJddqkrcB47jFF/nQrVYegypOaya
	 QKe4ldvfJxm/ESWhxzahfx0OLUDP32daUFIWn4nlID0fj7Mrhkzje1TCdPlHnS1BNWscz
	 rC3dDwQm2+kFWnZQGyP7TaojN+zG9crhfDEwYP4xeDXEbzY1GEzrnN7j1WCG1dnol+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4K6+J+FWfITr/tXSH3N65sGYtsLB/T4KBT20GPIXyQM=;
	b=NCOfHsQHbxo9BgFjqD7NNiLTqMfHB5PVNPoz0Ry4dQpb2hGLEbOlLoamhipVRBQER3IO
	 LQjRSas5EG1Xt1EZyte6slD39or177NKHHQI7jiCM9kzX4W9KBzuiH3E6HeilyM+c/vMS
	 qrG+Sq78/MxXoO0OdXHxInTjq4Lg6ctDhepu0t3AOMv3jl79elRRvY5du0iXEFDdE5YiJ
	 eOJF5//3rh5hO7lvJt6fQX97h0giMutmLUdgeEhmvjAb3Taamj4bJ6Q9cv/RFOZj/5bP/
	 3KLc8WAf1eKm2XfSRTK+NwVMcu1/wPIRj7NROCY2jkrGdRJ6NU1QfS0pmsjLeWt4qeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L41oRpCm;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E891E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E891E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L41oRpCm
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2efcf92af4fso2923765ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996476; x=1795601276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4K6+J+FWfITr/tXSH3N65sGYtsLB/T4KBT20GPIXyQM=;
        b=L41oRpCmZZauvMi/GJY4qNMiQdcAwddGvTG0iJoCxkWBwGfSDCHcUGBC2kRdsNxrdY
         6xQZ2PsiS6yQMVMPSj0Jv+vQz5eP2aGOeXv3TzuThyR9tLQY+vWecNgyT9QGel7dz7sG
         2KUYgphMTMZCecGkpVpgd2rOWHvudnV+Kdc+PI2d0zCVAVlC+wzgLCRQrfhgZ39pIDEp
         0RnsaMGGFbnn9bca3VCXrWWbr4etFY6RJuzDiVkCqrgC1lP5s3VBeSxjicJxUOc/uiHt
         ML7Rj+ZpC1IT7pXmE60iJc/By4sdrtF8/xb0JVsddwr/p1DUR4Fz8YECXBC9BlsoFDIW
         sGMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996476; x=1795601276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4K6+J+FWfITr/tXSH3N65sGYtsLB/T4KBT20GPIXyQM=;
        b=v8FaVh8FIPwdgwYLPeu2pmjsZdYk3pj4+0M7PgLIhFoKJ/tAm9az/ITPgPjXoMtc2x
         1s9b69egJLAsb4SRZbzLu15a1Vgj5VaHktaU2qvmoYLQcNbXfvTY232Suoh07nMmoajq
         Vvh3nXxgobYdYPB5cADud1t/w/uyxD/9Zi0DKw6Ih3Q2K7y3wkmOXuubCJeVxMjJN2rf
         YKaoJef6WJ20tBcbr0ChMqdTuyErgU8sQ4QOfeWjWrjHeYsQLzEpzap5t8hmmwIcjvx4
         qEwD/8sjDns4UwO9Gy+y6x8fsckJq9+lH+d5Jv8kKmGE1LGPEUMt/1K5N2BYJfmWh02u
         XwOA==
X-Forwarded-Encrypted: i=1; AL+hErFBO6PNBESsuW7Sq/VZVPjnlC2kf5H0hE3of2ym7ldCjmAjeZN+1w02DAfIlcHPEap6rj1WVWISDAJ9ToU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+d/DN/jiZ1F7UeRLqi0WYRJtgmbGm0vuAi/z5DUNmQDe6pnREw
	mo1PaE4aSfpiYJa2Yo6kPENvPE6uIYgysyLYdVH2CYT+oV752hWRVmD5
X-Gm-Gg: AZFdTZerUzsBFrbd4AKrYx/Mzfg5BOpguf8/Nld7l82zzbTIauTQbhR99BDqd6HS/xc
	pwjQeQh7yko+qd2pcOvyNpdny6AqtJba1hcdEk5zk1a0y5S+6UnsK/WDJPK3Fgo6mT+JIlRH/vz
	yEtMYzt8+ZdqM0ysA5eIWCMntDho1tWquAutqDx9KomdZqvkymiMfrrOAvCAv9eR9Ug62K6fJQ6
	iiWDa9bmWP+79BRwOJWm0SgLb2jgOE6d+/DzfrGUGdsSlvdY6hDWfwoh+nMZAAyNrHEO5aeW7gL
	qIEIpebAojVq/vMtNtWV/svGHoTOjbf+HlIItI6LaYvmPlLhAUHanzHoY8CiyhaFzUSH7I+QQnY
	ElmIkRhWJL3rcJJ5SAw+4IGDr52gwa9TprTpoOMcupbnMdZXEK1VNRRViB9A+dlTuC54ynxgm+g
	tvBPjNVGKEJ9rEP5PnuZ2Sf9vSb2GF55aovrv4R5Q/DvFRiEwCAMljvkKVFVQ0OaqialQvMFWxf
	5Y2kzTseXVIF40NjGEuWTILGR4MgRmorm0BMuwZUwu4qIoMOt4iQhmy6IJ4Eq3HLyLQBM2PDeFy
	Z56bGFe1Rx7a55SFmgx1tKzB6qniVqR8vI5axTNeuJeGUaJFh0iw6p8SE/NJhp6bcjTsvBXSlmJ
	KUtEwYBh3X5bTlvnu5Y8pKuu9XXlAKIwgVdu6JW6QsCA4
X-Received: by 2002:a17:903:1ae4:b0:2e9:d0fd:639c with SMTP id d9443c01a7336-2eff7569fd1mr19749265ad.55.1794996476359;
        Wed, 18 Nov 2026 02:07:56 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6215025sm10634145ad.46.2026.11.18.02.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:07:56 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	jonathan.downing@nautel.com,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: fsl: lpc3xxx-i2s: Fix DMA depth configuration
Date: Wed, 18 Nov 2026 17:06:31 +0700
Message-ID: <20261118100631.26658-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118100631.26658-1-phucduc.bui@gmail.com>
References: <20261118100631.26658-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The transmit and receive paths use the wrong DMA depth macros.
Use the macros corresponding to the DMA registers being configured.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 75bd148c1432..67bbc69dc2d2 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -198,12 +198,12 @@ static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		regmap_write(regs, LPC3XXX_REG_I2S_DMA1,
-			     LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
+			     LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA1_TX_DEPTH(4));
 		regmap_write(regs, LPC3XXX_REG_I2S_TX_RATE, (clkx << 8) | clky);
 		regmap_write(regs, LPC3XXX_REG_I2S_DAO, tmp);
 	} else {
 		regmap_write(regs, LPC3XXX_REG_I2S_DMA0,
-			     LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA1_RX_DEPTH(4));
+			     LPC3XXX_I2S_DMA0_RX_EN | LPC3XXX_I2S_DMA0_RX_DEPTH(4));
 		regmap_write(regs, LPC3XXX_REG_I2S_RX_RATE, (clkx << 8) | clky);
 		regmap_write(regs, LPC3XXX_REG_I2S_DAI, tmp);
 	}
-- 
2.43.0

