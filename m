Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717794;
	b=Z5O3IXQ6iMZwnOiocD5GyBaxcaTbgAXwZtDNW38BWE1fRP+3XMY2HXlQFutM1cmgKizs
	 6VjaugOoInYUFSp0SOHxftaKV5QalFiQltHjmkxnWW4nvBkEpjlUId7y/CLIHdNmOkNHZ
	 wa1y1LHCW8XjD+tQunUpS5aO0rEMA2NsOI0ZzZ8F1BK0U5gSFdBVV1WIJrSPBHAjMGfvG
	 7JV6LCaqkp9FL6xPHvuIDLu6FVpM2tKNNK5x+G45zvZ7g74Pqm0EpumUB1ZcFO2urBUSt
	 4rALGXp4tJcUEZ9DfCFdzigy/MaJIQ385IPlLDQqpqOKV2Ij4o9uzclaGrr+iqmRcyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
	b=nX0ZOmwIm3LI9DoylYC87IT9nweRO7ymyNGh7nZpBqum9leQNpxJVYhupxXjVOOk8JiH
	 v0uDLChp+7OIDyNyhIJlsOSOJqM7laA16SZ8nqesibfhe7APlDlHtjs+m1xKhOvUIC6i2
	 yYZUoFTzKhWn3HVKbtBnxBsWoqCozXyc6nm8ITGVjx7659+297/I4K4mqsUUp/Eq4CdnZ
	 Gpp+kyssreukWcQ9woEciH5HkdKcgFEBxXmaSq6BcgzO1AFtgdkC1NRAXm8s6E+aJCqO3
	 hXgNyx3w+Kuxp1Uo/QuwFJItFyuviRtleshmxiBBGJ+9uID0eYEpJG6bntUh0t0NHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fc32uFlP;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC47606A687
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC47606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fc32uFlP
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4943657f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795717792; x=1796322592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
        b=fc32uFlP6VlCsTBDohgQ4H7elNIQnLDaShQ4dhgK5Fm5hjOo2YW1MQGGM0bYz0suEI
         3rVbyXDP8iFx/UtWAY9TOPaL1Yv1RvgadtTuIxrsO6m17QHCXEQuClKhc0HseDKqnEmD
         mtDyhYhRIjNLSzsQ6ghlNdfInk63QDYCQak2jzsubNl/hFI6R5IHb94/5jG3Xnz+8f1U
         JvR3zb4UUZewww6/UuJBhBMWrTFr40Sj7sb4PMKZ15bfqvo1dqyAB3cXK94ZqtHRg2JA
         xbcA9DPFom4OdJzDoPaPMFa33RlJr6DJQM8HssN9Su60yLjYhMX034WlX53cqhtTBvMC
         lbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795717792; x=1796322592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZacRs5JbXlxo/OQerWiYpTqRNCbFu2nOrkARU1a5+kk=;
        b=UfEVqpQCEb14Z4RMAAjI9zwkV2WRlto4+nTyKeo+VJwK1H2BrmmYrWDxgx8ih7plW8
         5s5zP62yLnfXv2iTCQttGMqbZiyCUH2LuLkKkg1GRQcMfHd0nPheHdLoGDk1U/wavstJ
         cviYiI5UGrkyQpJUPpDCmYZloYvxUkMKS0Zi7OmS6Qr9USoZQiLxv2taHf1C/DTnqrCn
         5wTEZBu/94Y8JRDc3P137Y8u695uD2rtU4EJ2yrbSEHW/szBwJyy1wqgWGGd6yEC/+Nx
         oME195VUKlpILkuZFvfwERiaIOi1jY5EehF5UuRwrqp0Vt8gPPDlkkaQ8t19B2eKlPpo
         ygAw==
X-Forwarded-Encrypted: i=1; AL+hErG3UXYTmj8gJhrEp/yuZE+y46XdcqHyExjq3Cg99UP7E5Fal1jA8u2UwMk5fTgbcr5Q0I9T2uci8nFFmJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D70iWiDYjLHnXjGVEVxVENdyDFBsoY6jOTx3FE/CPA3YdpC3p
	490Q2slHjSl/ob93kbzOpu0gAT/hOyA0F1Li3wc8NO+cqi4tHbC6nfwG
X-Gm-Gg: AZFdTZeOQV6d38qO3uo01kSKQgOjWTlFdiOFP9MMbZa3OxNakCHVztDtKVX7QW/wh61
	CtRN+llHIIQXUZjk8UhOLK/YRQE4PjOIAyX9SRlKAgfMLCG+XhpIPH+YJQcyS8IIDuF7vWLGshh
	acSFleSPy9laMlcHV6Yoepqs7OLuzYYz/gsb9F3GIVDUcA1UklaIoj1DUJJ6pVlr03NZe65Ottk
	Cj81MYZfImazChYuXcyVKYqDys6FwlTOaeq5kcuhlUNNtgdKP7osG4AoK9++3AsO5uMMDUIXpiO
	gkoO9Xd56w8A3Vxg4Ry++N2vPMU4eS4Z8ZFV/dQY7M7kA0BJ/A7n9BgW/CdlNQCI33gLIj1LGU7
	UbwQbMsJbo1Sb5xTmYkHpAZ5vUmyIlUYEB1kIdy9AMpRpq3M7ziOch38rBAZDM5blUWPKGs78hh
	09xgXl0UGt+KHZC15iNXWcXI8An3lxlP03n7gzMYfTXK1NwyG/KWwxv84G/rOtiNHra/OXq7ZEQ
	n6ukLpiQeSTyG/vf7HVB94GfZGiFlVlsAfg8JGQkxBPlk9L+0VpkFT9eN4fIHBEZiVG7w7rdl2j
	PNBNLcQdyjRlB4/X3UhEd7267Zv1blpsWX1xRyM03a85u/lAOLAPbljZnCEWZziZLlb66Z2FP2Z
	i9SV9GcLsFUr3k8kNfgQnZ19DMbAnP7MZDXf70b6nsK+7PAu6hKFSFxethONie0ek3Ah2jNKuDn
	UIRRJHLh7IoqoIlhN8l/7DFSgHfeq6c4UoINiwMBB0P2yxjZd/u7zdJNeHPaSPvcfVGvPn0rwf6
	YcqCYNS+ysi8yPAfeX2sj12Rf3dpQC69LqzO3fLyA==
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr46331265f8f.57.1795717792277;
        Thu, 26 Nov 2026 10:29:52 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42382159f8f.41.2026.11.26.10.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:29:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Anfernee Cao <anferneemelokc5@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] mmc: sunxi: Distinguish CRC and timeout errors
Date: Thu, 26 Nov 2026 19:29:44 +0100
Message-ID: <20261126182944.3136900-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
References: <20261126182944.3136900-1-jernej.skrabec@gmail.com>
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

The driver reports every command and data error as -ETIMEDOUT. The MMC
core however relies on -EILSEQ to recognize CRC errors, which mean
that the sampling point drifted, and flags the host for retuning when
it sees one. With every error reported as a timeout, retuning is never
triggered.

Report response and data CRC, start bit and end bit errors as -EILSEQ
and keep reporting timeouts as -ETIMEDOUT, attributed to the command or
data phase that actually failed. Report any other error as -EIO.

Currently supported SoCs don't implement tuning, so this doesn't change
much for them, but it is needed for the upcoming A523 delay-chain
tuning support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/mmc/host/sunxi-mmc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
index b862df26e192..c2e84c22d3fa 100644
--- a/drivers/mmc/host/sunxi-mmc.c
+++ b/drivers/mmc/host/sunxi-mmc.c
@@ -537,13 +537,29 @@ static irqreturn_t sunxi_mmc_finalize_request(struct sunxi_mmc_host *host)
 
 	if (host->int_sum & SDXC_INTERRUPT_ERROR_BIT) {
 		sunxi_mmc_dump_errinfo(host);
-		mrq->cmd->error = -ETIMEDOUT;
+
+		if (host->int_sum &
+		    (SDXC_RESP_ERROR | SDXC_RESP_CRC_ERROR))
+			mrq->cmd->error = -EILSEQ;
+		else if (host->int_sum & SDXC_RESP_TIMEOUT)
+			mrq->cmd->error = -ETIMEDOUT;
 
 		if (data) {
-			data->error = -ETIMEDOUT;
+			if (host->int_sum &
+			    (SDXC_DATA_CRC_ERROR | SDXC_START_BIT_ERROR |
+			     SDXC_END_BIT_ERROR))
+				data->error = -EILSEQ;
+			else if (host->int_sum &
+				 (SDXC_DATA_TIMEOUT | SDXC_FIFO_RUN_ERROR |
+				  SDXC_HARD_WARE_LOCKED))
+				data->error = -ETIMEDOUT;
+
 			host->manual_stop_mrq = mrq;
 		}
 
+		if (!mrq->cmd->error && (!data || !data->error))
+			mrq->cmd->error = -EIO;
+
 		if (mrq->stop)
 			mrq->stop->error = -ETIMEDOUT;
 	} else {
-- 
2.43.0

