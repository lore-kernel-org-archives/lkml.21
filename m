Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108097;
	b=GlHlEpXBU+DSB/EPIeydzneuN3y7aox5xIpLzYw3ZFUbvWoVQ+zd6bSHQS+uQ8fmE4Ep
	 8aLWFs6ijhhQPwXOoWigUq9uJ0+san0YBTS5OTlaXZpQOqh3gEAOywwy5yuwJL0+e+7dZ
	 Nj2gUUgZcYXRvMniLxcKeTxvKX2dv/x+c2HG6AQ16XmHC9AlQ9HT11HvpojGuyxx2Lyc8
	 QIcpH6Z2BOftOViE5vSEGNwzLv5hbHQm4tLHS75824BhCUQI6K66l2+phBrkRPULS7ah4
	 vBKxaeXb4F/xmjedrg2gdzJM79+tLqPav+moSbkhS6mST9FK8EX3s3KKYslfdZIm+9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
	b=VMnnz3b8yCZK+983KSPOi5dQPC6PVmhWBFwM6vI9IzKog/qZaZqtsdRssuy8H72l97Un
	 8qCwxOi2bKKaIJLX/okKP++5hETkcF/0Qcq9b4sEZ2II6KWuh6z/lnT6U4/bWY8rZJ87e
	 s6ionIMLcjjhIimpWl5fqhQWUtSSsAPabnn5OGVa9LOv+EiAcPLcRH+nrUlne77aekIog
	 wx6bvciC1CfKzVE9X0ATSLf/R3P6fVnbVgxanCnfO3Ntnrt3/ao+4GJ+PP3STlv8ZdWzt
	 nOxJ60mStWkTaXi+P4Zp6kwdmv99cO1mYzWDa/3OARdphX9DQaesXQ/pdA4tv4ne6wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="gGHa/39Q";
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3164A60A262B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3164A60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gGHa/39Q
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso1419312eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108096; x=1795712896; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=gGHa/39QLPyCZ0RgBw8vLO5i2C5OU6Vs5rt36RyPTS8CI5ngk6cAVvKkALlvpa/ofA
         Dnjs++Lua8gLy2tHZtZTr0Pm3F0+C0wwo1MGF3Ltl5KkT3rj7USwYH83D3TSxUfAoFFS
         N9Ud74nfr5Fz3yGmOvqmK0D5QyCWlPfb4vOfKl7ONEg4lzdFnRy7nMEOAZy3nNy+6JUy
         fVbf5+AvdE/Lyko8jMwJJEASxjpuP+Vpu1SoV1hKXqfXrTz2OknoW6GnTuT1JnCiOskN
         Epusush5r3HXOLZfw6vCBurVNfGslL8BRMvFsSp9EkZsZHnz9EX+OvacpaBMVTcEwHI8
         cbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108096; x=1795712896;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghmmPH2pRPCD8AwyevzwpwCC/jzSYHUp2/6zeVVdZoo=;
        b=wIu5PadzhNoNRkADGMZWlT/W4j3MjSlh7vdszds/1Txlxmj2o4x5jY9IIhO9mXGSXM
         j0dzKNI6eshC4J3WNpRkKdoPU2b48M3H+v/y+sv8cjmTydt65+OEnFegLhfbeQDUlawZ
         44UPwMhrveaxaYD37hbjghg31oik7HO0wBgOAVvTJogDA8looFsEJyRis0tdGVBm6BBg
         HEZXdh+6JJ6voiGyS4T10OBpsk4wBDwiBG/uH9e0mNySI+IqnwIlsGHwAbdHvNWq0uDS
         MYreffQEV8JtgEEojfePJLwrIoAv5a3Cu24Lu31gtNbF+n/DyhmgiA+RF1L7TP6yU+zK
         osag==
X-Forwarded-Encrypted: i=1; AL+hErHwb9NqK/qDG0mpwmTQRVu1KC67iiu6iaz2TjuDJASf+zH8r//IcW4UH/+PQ9C0hwD9yk8DefdHtwovCHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AZYbFdfbaJr950zOYkbDt+Og2REtm6reGgncZogBOoJy8Tyef
	6cGxYPsKkibnWcbwsxmp4Vr7VASecCXLscUF565mpIbdF/hmkeRpmZ0rSxryF2GSP6nieyGoLbo
	yChLn/snWWQ==
X-Received: from dybdr19.prod.google.com ([2002:a05:7300:b293:b0:375:861c:512e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:db86:b0:384:d59d:199c
 with SMTP id 5a478bee46e88-3856c2c3fd0mr22119eec.1.1795108095991; Thu, 19 Nov
 2026 09:08:15 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:59 -0800
In-Reply-To: <cover.1795106962.git.irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106962.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <1de898fc85710c85f6f90bb685d3be109f44c2ba.1795106962.git.irogers@google.com>
Subject: [PATCH 2/2] ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid
 DAI ID in DMA ISR
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In lpass_dma_interrupt_handler(), the default switch branch returns
-EINVAL from an irqreturn_t handler, which triggers report_bad_irq()
in note_interrupt() instead of reporting an unhandled interrupt.

Return IRQ_NONE, matching the other error paths in
lpass_dma_interrupt_handler().

Found via Clang -Wassign-enum on an x86_64 allyesconfig build.
Verified by building sound/soc/qcom/lpass-platform.o with LLVM=1 W=1
(-Werror) and -Wassign-enum; not runtime-tested on Qualcomm LPASS
hardware.

Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/qcom/lpass-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dad4becf7579..45379604b689 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -963,8 +963,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		val = 0;
 	break;
 	default:
-	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
-	return -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n",
+			__func__, dai_id);
+		return IRQ_NONE;
 	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
 		rv = regmap_write_bits(map, reg, mask, (LPAIF_IRQ_PER(chan) | val));
-- 
2.56.1.708.g77570a6a1d-goog

