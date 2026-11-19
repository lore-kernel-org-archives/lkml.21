Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073844;
	b=fD82g5D+HP1cCYPBrboOWmt+f45JpjN1r83YaBiVKSJiU8Dg0MXZWdhpy6Xpbv+YTzPT
	 5+YeXMJz5I2Vn7ZEeuuqJ9sjCdJf69WOX+6cTvDDx3x7HU6NpcsN4WgH5Hr9fKT0JRy6m
	 0kwcOsJds8XQ8BF4t3gwqNZ4eSP7rHz9D/3gPaB3r1rwlq3zYWViEWX+/unoWwaCTchXv
	 xP4Y6Wzkj8AH+iMzqGcXFKLjMBKN9wQLnFY6MR2Sx9P2ZmaUayfJ6ETyBLmOYcWLS7YZj
	 SBWTLR41jzyhqKBCymiLM1blCOLPyeALzl7aMhvJDE0g+unVMbHo0/ALnDHgUHmFQew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SREqdNPk3JQsCTcSiofLF5qVyqSl8hjBAsQ727rgaKI=;
	b=bwJ8LnDLqV6veWK4KolZ39biz/GVg0q38Dv4I9qbivlt4BhHJ8BAn0CcgfRQt+34lGod
	 UaGCIQP3u5EqEn0t9hKHJkY8T6DvLAsjF6ABzvvO34iZnquYYtG7uxOD7EfQLZLfxBLMr
	 kQDBC062HRHrK0wB979gW9aWwAP3/s2QZmu7B7817rp1vwAkEsKwqjdBruSxINMsLg1oq
	 mOTXLLuW8iUpyPjcjPK5S2dTqssoUU1jzQSspS49PdNcuIiwbW6exlLSlNwCW070rS22d
	 tLTtErljPIrVBFOs4XQGmr5OYv1Lsz8Q2TzUR1O8JfuCvsAvjPcLikTOZzg0ZeZZskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asJKNSmf;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB18B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=asJKNSmf
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-381d542bc29so3568446eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795073843; x=1795678643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SREqdNPk3JQsCTcSiofLF5qVyqSl8hjBAsQ727rgaKI=;
        b=asJKNSmfC/rYASbeVtVcrb9AOR6+tw96/vwikRFL8m9+s/0CWE9k/1sgC9/nTB8P/3
         D7q/IQrHMOp30NSEWkPaYIEs4nYYLv0bnGT4hwhMIvLx9afMTb6MPBWoWQNr09nG6Bjg
         REHIJv9TA3Q0yYaC/HEa303Hdyq3HODXQx58/j8h8LshxwbZfchVnbw4psExPrAA9AXc
         2lW1f4oGPpJdRBoUuhJAf8n2JQjKq9pGMb9IIZD3yYjQPwyujKINSH/CvY5XxVM/37IY
         5DXEWht6jPlqSxGHPEDiXXqANKIw0vx+nyZIsc7yaa++67mhZdZDd6gN7JHlZcvPrZfh
         JiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073843; x=1795678643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SREqdNPk3JQsCTcSiofLF5qVyqSl8hjBAsQ727rgaKI=;
        b=L2W73PJSoPZoaOztKLvvlbidWLvMJ1cJLvwyzYciRjDC/i+N+rp5NrK2sBE3x6K8Jy
         BYejRRTKOndEakGpU/tHcipkHA0+2eOTR0h56LGs/WIDhO/sxhtW78rF/SdtIE2XTMzX
         Xi1z2a1XvPJmUyK1EO6ub0ik72VwfYqpOIRAOhAjSHZmOzaMFAicitchjD0LvBRPOX4G
         nUss5TDjzDAqKSR1zd5BZ3zUG3xQ6T3q3TZPpn1iV59/ek7a4TQtJ+htYa0+E6Tgx94P
         hxd6egwg/Od3CiqRi+9CNncqulBwt2R7oBTk+nik7X9jUdYkFj6qOQN8Gu+xWYo+ZQh6
         CJ4A==
X-Gm-Message-State: APuU4Z+FVxjH4sItyFxTF0A4cMYK1WWWaWkkUxdnffYjQ8UH/i8CsmV7
	nbOD3mYmdBbXtPdz0pfqJnpNY2q05blWGewmj27AJdDN557y8kBMSpJX
X-Gm-Gg: AZFdTZfl4Ng+cCOBXZcMcy2hZ4N5oA3BMVv6QK3lcAvBP7QcOjXCKjKGh07of4MVU22
	WPmznNS7h+qdvDEAuLmEYQ+GKu6ghSHBr/92d4rFy4e3jeYWn58GkJJRArfCBX6LnXcbZPL997H
	+5dx3TD4fRV8cjpXjWWC8LIfN/MCyUHflQgcZCwA1qQW38RcH4IjVMkFQn6t3CRoBgqPw95/kdT
	plKhsxIcWsNjh38O/S0MAYxghS2zoNu7DZpjK4M6N3Ud5VcCQ9HiL9UvAAllLV52ux3xgFrm0R6
	+J5GP8md611PV+wYB24MCw19Lw+0Wsjd/r9VIfNBAnKSAtFa+eI54Wun6b7T5xNNGUSmO7t5IkD
	VDGshJCzTKP2fW12ECWOWraKXFo9/iZrNSWkwosSiZ1IFBOY/lvdCCrmeHMY3solnubVKfsxgGv
	of71lqUJkcxG8P2eyHE21I2lfEwUWu6C5y6eVNRRbo6vaBWTTPaOecCqM7Xclprn68PgxxDqiKG
	MGyWtJQyw5sFkhgydmylfQF4OLDPSiJVFZrgl1cL2zReNAO6tUTJV1prnqICozAiOA751e5Lj8o
	HFNjhjvGfMjTCGVhfMUhbeVFh+0u0UovNCJ8OHpwqm6FtmCL4qb2Zw==
X-Received: by 2002:a05:693c:83dc:10b0:384:a0cb:a6b3 with SMTP id 5a478bee46e88-384a0cbaa15mr467087eec.13.1795073842990;
        Wed, 18 Nov 2026 23:37:22 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm2663207eec.23.2026.11.18.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:37:22 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com,
	lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: dmaengine: Check DMA submission errors
Date: Thu, 19 Nov 2026 07:36:53 +0000
Message-ID: <20261119073653.2632-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
References: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
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

The dmaengine_pcm_prepare_and_submit() function does not check
the return value of dmaengine_submit().

dmaengine_submit() can return a negative DMA cookie if the
submission fails. However, the function currently returns
success unconditionally.

This makes the PCM trigger path believe that DMA has been
successfully submitted, even when the submission has failed.

Use dma_submit_error() to check the returned DMA cookie and
propagate the error to the caller.

This ensures that DMA submission failures are properly
reported instead of allowing the PCM stream to continue
as if the DMA transfer had started successfully.

Fixes: e7f73a161356 ("ASoC: Add dmaengine PCM helper functions")
Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Add Fixes trailer.

 sound/core/pcm_dmaengine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..5b9fdad4d9a4 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -154,6 +154,7 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	struct dma_async_tx_descriptor *desc;
 	enum dma_transfer_direction direction;
 	unsigned long flags = DMA_CTRL_ACK;
+	int ret;
 
 	direction = snd_pcm_substream_to_dma_direction(substream);
 
@@ -172,6 +173,9 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	desc->callback = dmaengine_pcm_dma_complete;
 	desc->callback_param = substream;
 	prtd->cookie = dmaengine_submit(desc);
+	ret = dma_submit_error(prtd->cookie);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.55.0

