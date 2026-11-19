Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083009;
	b=2jkY3Dz9XMtNyVQfIIkN+gFw7xAla/7yDx+2nqNNlFXTu6C/yskcPevcJHOFVVh15X/6
	 i0nF87ozL4FZOI+6IuNA5qJK+7ieZC2Me2LNGgfs7vlwv+506w4fWRj1DzV7tZcMiO/yx
	 9b2nHa3iNVW5Gs8UZaJH04gC7zfKjZn6yhZ1dLS41SRR8lnA66OrXrNWzubNP1gu/Yfzs
	 klH+0O1jRHUD8DM6kIHIUzf32DA5+nk6SM9ZpePNn1H4VLI+3r8nSba+HKL0YZuL3aqTh
	 xHO+YbM+ma2+CrABPuY9OjXEEf4Pj3yzo9WLETlkTJK6sxINQ4gxR2MvbtJto3u3XZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1VCxugRGfr9JL3h5ot/gqlsJ3Pc4OjcX6nU5IZyeWk0=;
	b=M+UHy5D+Kgu8CdHCHPWaBxgZUbW0qH+FdgMH6G03/H9VUXBsy7EfzBpOVENOzyBgAOfW
	 dguVz+oSEq19gwVqGgenvAzKSsIbLfynNyhIwI+DSDTqsdUOTccFxhlXRA5LcY8ya6KSN
	 roUsGYhcvmf4b9HuQj9NM6kxmb1+C2ehyylngfMF6+/glsk8lkMHNeQcFIIft0n80+IX8
	 U3mikRZAkrK1DogMZP2DyKojmVXhh7+yHsU/OZ7uGnzc+rtiYZtUwTR222RiBnohky1zW
	 Bm1zimDtprus6am+QM38m+CcJEsLQ/luzy7tO3CsYf40kajwpEPwOfUJEgFGl/AD+IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWeVUtqF;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31A606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC31A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWeVUtqF
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so892336eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795083008; x=1795687808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VCxugRGfr9JL3h5ot/gqlsJ3Pc4OjcX6nU5IZyeWk0=;
        b=lWeVUtqFC78fSXsXF+xwkLqCFLPeZbMySmeOJbs31rL+CAAeclK1MdGPZY6lS+X9XP
         KBYxiMWx4FvNJ4JhQTDNQlGQM7FkeINXx2UJKB1cHUYGf0MQqYwDsgIn9jm0dbp98GAV
         j8u9xjVl7cUdnV2MWcexsUucMhvsBj694DWVhrhrKVgDO59mqJL8gYo4RIHWuAvDPEzL
         aw9PlmTlLSvvK6gcz87pUZBzZm32QZWdfXWepGMbTmJugndUdTC4N4h5d6efWWObXzmO
         l36aVCyqDnrsxcDBAHazRt9GpR6dZIRi7UggbKkzuydIIAqPXMKbqNov3/AAYf5zAkVR
         n4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795083008; x=1795687808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VCxugRGfr9JL3h5ot/gqlsJ3Pc4OjcX6nU5IZyeWk0=;
        b=taaxhn/xA+KGoY58xtAsv2KLMtjvma4ffJ8vYqgyCtwCtBBslq+9yRoS4qRLJ9uoxc
         N++sJJCP81BSza2VHZM00q5ufnoVGAgTW4plVuN4bj4gP05UiAo3VmZTpjsbbj3NYkxS
         22kb6Ic8FvRnhpE7FO+bjwM3h8WLf4eXQlZecl6LwCHowvlMRumWDiFJc3+UrBySEN6M
         DZKuQjRPL8Nv96RgzNJDixR113elUkt8P5hGq2LpeKaNhJxOCJLasV8ykCbPemCmyRvK
         GkSbKjsHUCJe+uPbuenPVzhTLeBSTKCSuUbyZu9b+a6txTGhVRAYvhZ+YfmoRBPm1L4G
         wW2g==
X-Gm-Message-State: APuU4Z8NoGf1yJSGY7fgTKql7tB/tnH7toPnSzZ6/rGu6KEh0XSAaoWR
	skk8ahGFkix8wK7CfyJFvdrVfDDngw4Xxnh7QWf6gjVjdBEknMdi3qpJ
X-Gm-Gg: AZFdTZcpF94gntvrGQrJWQvdKMM0yomaOLS+ALwT9D89HxENSEsyBfO7/JRlk05oHBZ
	h/lBhWGfNZNyy8qO998jNqCkSFhL7JXO/OPzIvdRXNTNAmUyzvG9fl3UzkKoz51M5+JM3QCFVM2
	bngE6onb+B16cAirFhFgMWUoxWn3SyA0n/uL5bW1T2auCZ7ixsqow8NgI/2gPWj2w1ZilDfKTka
	kppln2fE2XrBgac4/1ExU/PxkOcusPQjr1ReliTOVggva24McY0px18YsANBbUxZrB7XjrSKvmb
	5FKxBGk+qy0OQP1sKaHoGQ7c4sW9VP2X3oWJfucFqqyqbBxk8RSL2r7j9zNL4yU6vr62T6O5sHZ
	3bCQS0C3sQgSiynfJSjUT98l+0jDV1eKvBg5yt/vRrke+cP5CtiJ98hAf1r5Pf1Qei7pwlqUiUn
	LEEN3uH+wxdw9s4Q6aVNGWlvBpNjkAMVgWR9pErt5yL2HuvkmQUUb5pWIsyG/sJFvXEXgm820qA
	Uoy97iLEVBrSqQ69F1x/u/eTjNUo3ZQIGJ0MQFGyOsbgoJ++QGPi4meq9l/Z0A2+H23IdY2Qfrm
	MzWigThkCC6VpErc3CUt4OMXQuoz0AVsXbfcgpCb/BonFDrn4ugs
X-Received: by 2002:a05:7300:51f8:b0:375:85ac:d14f with SMTP id 5a478bee46e88-384b3e786bdmr628025eec.14.1795083007854;
        Thu, 19 Nov 2026 02:10:07 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm18680854eec.18.2026.11.19.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:10:07 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: memalloc: Fix DMA allocation retry cleanup
Date: Thu, 19 Nov 2026 10:09:28 +0000
Message-ID: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
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

do_alloc_pages() retries allocation with lower DMA zones when the
allocated address exceeds the device's coherent DMA mask.

However, the previous allocation is not freed before retrying,
leaking the allocated pages.

Also, if no suitable DMA zone is available, the function can return
an allocation outside the device's DMA mask.

Free the allocated pages before retrying and return NULL when no
suitable allocation can be obtained.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/memalloc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 5986e9b84ac0..9458f9cbee53 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -298,13 +298,17 @@ static void *do_alloc_pages(struct device *dev, size_t size, dma_addr_t *addr,
 		return p;
 	if ((*addr + size - 1) & ~dev->coherent_dma_mask) {
 		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
+			free_pages_exact(p, size);
 			gfp |= GFP_DMA32;
 			goto again;
 		}
 		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
+			free_pages_exact(p, size);
 			gfp = (gfp & ~GFP_DMA32) | GFP_DMA;
 			goto again;
 		}
+		free_pages_exact(p, size);
+		return NULL;
 	}
 #ifdef CONFIG_X86
 	if (wc)
-- 
2.55.0

