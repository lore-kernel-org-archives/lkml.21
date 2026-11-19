Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795072298;
	b=qUp/+KZA9HzGvGIexcLMsU8wQz61o7ZOSZ/Yt755IZiAjdQ3DKfmjsyEK4fTczQyCF9h
	 zOUG72+18wVtNfOv5wZs0UI+sR/TjJWs0S2obsy3xnBaFygTzYGatd2oJOoRY0mxsm2d5
	 GHkYgbVXycSLqCMqB7GbiSckB9Zzvo+By9Y210d5TnjhPj/EiImtbL2+vBEKU2ZDNVf9C
	 UZXG2STRLf0qVKbTqebpu1vX8DjxOMjdj+mAXuRIckBvX8mSrryXGsMuHK6Zy4faoVIVE
	 DNhKiJI+L5Lqt3Ej2plLQi14GaPmUeRjaApgKTt2nOrMtGPQq4qV4BD6K/8xSxpN6iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gmQfPdDmWKnrX0XAyqEsmKfub/wtBIoPuAXJa+FkKa4=;
	b=d7Jp6NbgnZRSIcm6hRZlbrzp2LYgHJVhTMECNwNRVXVPo4SKYZqTWOs9TfnVPo9lqTPB
	 erxtOGPD/2/lvID6/0VDPe8guQ9slyBNxicTqgujJ71jW3Apac0X/oBaZ79THkOPDmtbz
	 sL2eT5OPkD+AmmwL3O4R2G98HNaXvly3q2LmTiHcqZ5BgpVrmrG/FIQX7a1Kl88WAxhbq
	 l8XveGOL5c2BVdzq+Z55pftM32KFJPHxzqGBarlRL5l00k4OtNr5MVq4W/X/FpdIqlBka
	 H+tD/7dUn37iTUTLwRlN5PHvx6ShJwmtK9s5gMsKjwFao6bp5Qx3o0qCw4DT48N+iHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPCj80qf;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85716606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85716606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wPCj80qf
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3b4944a0eso1645507c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795072297; x=1795677097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gmQfPdDmWKnrX0XAyqEsmKfub/wtBIoPuAXJa+FkKa4=;
        b=wPCj80qf9x3rLyBPMPfqrgXvK9D+G9LvILqDllIhziPB8CaHd1uFvjrd+4abRp+ttt
         03hjcPbsCEowG45QF1HyoeSVNXK/2AHhHcYXv+Ti7gubrWpRmwz1kGLF2QA8c6upWawJ
         8QpVF2zyJ2EUR8365OsHx1KxbneW0J/dffJanq7gYEYaPHr1rhoD0gfNLhhHkcICQg8o
         8GySWP8LKE6z1pMKY3Th75VANM1F8VcsNvP9F/gVb/DmJnnito3KoaOrpY9bx2zZ9gZJ
         xa4JjDV3XI84NGGgUq/izjO87zWuFl1xNCzRnKU+2XqbC4qJrBvEPd9cy24HkI6XQODx
         e1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795072297; x=1795677097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gmQfPdDmWKnrX0XAyqEsmKfub/wtBIoPuAXJa+FkKa4=;
        b=hxlbNKLRUh4kQBwMIhO6SoPPgDvueEGLFrEQIlyqbrWhtJKYvzJfsl9cme3Xbl10Az
         Bcg7J1dvBHi96mVIcGc/Er5vTdlY8y4p0CvYp21wbNUqwMhFdyhr6GnPKBbKJiKpqQGg
         4C+/Tpo/tZhxF1ecN+sjRl0vY38PEewfhAN1VvDMZ9YRXN1hA8HNLrGdxV2TFrjq6bgP
         TOS9XxVX+DTVs4GfMe9ZPgQuaDD88/PAbuzBoz/kN5TXYsGSK6BJP5P9jOtfrFiy7VU8
         //hb2vyvEI1DswT1T6SxMcgXbzqBNcZRjZh2ClIgKUpuQ36HV6RGSvG/0wEvasJIdFsL
         XBBg==
X-Gm-Message-State: APuU4Z91vWRclksEAMjsULgQVRs7skzb4Rgtko/t5POtzk8aDrQ8Vc+d
	W9TKHfLcbpNoe8gX7ZkqbopnPoT62OSIAdLTlQpEKkzc7yXibIkGqkJD
X-Gm-Gg: AZFdTZcmzvnn9GtJon1Pl2Rc1GbLme4GzQLXfoDvRBNGbkgpU5K6NktRu4rqeSJ/Xc5
	5AhP3x2Mik5yX+CcZ429OA9tDCrE66YDxSWvQK7uSgUJbvYemlmRagxBEDoo02vhS0ODMfASaqb
	uGZSKeKEZK/N872Ubx0rmXLmudjdzt4+Q6eQrZzeQTaT9m2oDPawMicVPevu3Mj3/0QF4VSBgS/
	B1Wap5z5FyB8JLZZjhlpq4jnWWbjLYZ7YYQfu6Qp1f2WtMkIqd0noEplvhdNuHEuitaYlqyF/E4
	MxTkxRDHYyifsOV8HXvdKpRZ93M9s9ichX/g6vBLbNUgTZb/hiEzLYcDkw4bR7PGjwXrjbYf+TE
	K3KSA69c1Ye3OJE2r5IhJ8AAGkeXzzHflG4o+2WaWloznznaKZYhZ4ZAq8Fyn4qqG7tuhPjU/BY
	XG+jOpdxvu4ND8QWtB8bPl6fcUQmsUi2f7vOkbBbTFJo9hNsxAPZxeEB6g2Vh/ja+vVq+aA0pe5
	336yKhlnrp0HJOTE2VKergq+dvJCjLzSbUjqeGzlfIXYA8d0VsjBMDyZtepgJYIws2knZmxxpro
	v6AwH0jUjqt0+u0jGYmWDNcp8q6hGG6wjyYSJ9jrWUzuLBG68Z8Z
X-Received: by 2002:a05:7300:f795:b0:376:2ddd:2ab1 with SMTP id 5a478bee46e88-3827d52c221mr4384828eec.4.1795072297425;
        Wed, 18 Nov 2026 23:11:37 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm14627902eec.1.2026.11.18.23.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 23:11:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: dmaengine: Check DMA submission errors
Date: Thu, 19 Nov 2026 07:10:43 +0000
Message-ID: <20261119071043.2943-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
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

