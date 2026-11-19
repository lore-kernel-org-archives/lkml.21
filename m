Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082556;
	b=M7DAAXYj67ZsivNG2tL8zfcjJ0Fy2cxKDHycp/vqHivlSifg5uy1ON9A1TAcGx+UFMGd
	 AF91Hhno2KdORtpAkbzlKG1yYYv2Nx+eaIEe8y9Rh/gGL+toZ964hiQrEoIWtLpazdr72
	 28dptI+hIpzkgRatTpKkbROsmJ2y1xu8qAvqBfSf2UnkPZyDy44sNo3mmu9DGcrFh22cC
	 PfJhCtEyuSWJnUdrgbdOs2+Ii9sMnJUn6QLBU6fv+z5aVJ4uyy3aQzMA0L4+EQ4dKdPA/
	 PctM24J+tkc4GdDeZ6ja4pKOS54E/QowJgN8dM9LmeShZgo14LcsdLmOqg3CgEGr03Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
	b=hUbs2Cc6Izta9PAYGzWoUv6zX8ohEvKsEXX6NJ5O2hELcEnu8EL8cln/asNKOyC8XPJW
	 Q5bSAEOcEDKoqo2juOt2XrtVd7CikG9yw3eU5Ek9rxSj8qEZdFfHV3RuZfD+Wi5f6XvAQ
	 GUq1i4nLpqc0ITrQexhoXlCqGkD5BHCSxPH4CIllGsGeOB1kKmrENgBfakHLlUgeEhkM6
	 5ENIKue13KQFidyfDeRDrAjVG1YYoInFGPa8KG+M671mOrSrDQCQdWTZeV9gGfSmhLGUZ
	 o3qY99fh4fVY4vFHlTb9U6L3NnZlMfLpjfaIW2M5epjRbHDCSYFggephz9pGjiXw2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdTIfOeL;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942A6606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942A6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdTIfOeL
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-70b875f6f13so1727466eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795082555; x=1795687355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=zdTIfOeL/7d+RS4Zt6Awzo6rb6wnu6WousZ/R88LlA3yr0tZDPkSAtaCaKBBXX/qb9
         NpQrleP8lK5nW65IK+0le216BnWWjIgMO5H1Gw9I9zt3VnnHGdJibzVKovL3Cc860dpJ
         r2/SR6Eq0um1536Nfu5IE0PQcAhb+W7DQn/tkfXU08UyncERGTkE3Mx8D1bOGB0vC3x4
         3OzPFY1bVX3GYIERM1dUI76jQscxbzQzTNZZm6vWAGCOBlDfUQKGuD/tDUPgTU/2FXD4
         hLEsyXsYcEuVyi+A5m9H7sHe1V4Ug8hj2zL3/TAMqS5QoWQdyzlBuf+hU/vSMvIuQfJf
         LL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795082555; x=1795687355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=RtlH319ClmVEBTAFP62TGJay6BBLyXvD1dh4xNm4ZDwwmvcPGyYaQj/hagRH4ctnnu
         vKzxHoFnnKIzaYkZINiqZPdKVZw8ydMxemIkR2ZqBlH/EN9IWhOIewoffc09cNTTHHxx
         MPlh93hAThs8XZ1/fiPQYx8G5QM0DMXdReElEzrE6NHoD6bGRsXxs/u1xJaTSu/4vfag
         PORgm9jWsOiZ6Todk+OrqgKUNyaO/aMNqQm1QHrya+A4sx26Y7uVYp1UUSvmLbxCwv2i
         PMdGd70ChvFXGVg8MdAc3eD5jEFyqp4xVzXiHp0qr6pDJya/Rf1xDckoZ/vspewdcvOO
         kMZA==
X-Forwarded-Encrypted: i=1; AL+hErHiwK20zr1CVQqIwnufSlVa5kGCtkB+hhASm1AEjwwmKl0hUbJx7+/zHXg4UIXGaXH9MMP1o/xP6aQSE1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1YXed+mtLKgGVdLb8gzd9VXrMwMLU4Gt9N31WYpcLM5YVZ2bq
	PiTgYlVRKBXqBSSW42sUfsiDCjCtCPV7iP5jnPR9eNVe9BjC3uPBbs9L
X-Gm-Gg: AYBFou2fCJHsYPHjCHCfY71QBc12wGyHneXcJHcrmcwEBtvLUzrA23+tZy94KFTuxfj
	bYTo/Vgb3GcfNFesb2tEs6IPSYOAdrzuLa6wo32+WwG3BgQEnm9NNLra4Dkrazyl9zMeYV8x8G7
	cIyltFFE40YcU0I/FFVZwQfltBEbjw9E2qC3E9siPxcrR9YrjelEuL7LWoIlmGGf8DohvtDybUn
	Ny6VgZDBsjP3iKJkKo8xHvEvUWIkOVmz1PWE1qpjlpkUSO4KEBKKhnEeaHbhad6FixH/aJoMr4E
	qXP+D7GhD0G29Xtyg78kDEM6iEzrqBlk7ylmk/M0Tyt4rJL2bN2iLsAFpZUUa0crhG2iMH1+kRD
	kNVvzbzA+n5GPeP4W/KsTo2hMM4F1LJl7h+gPedulZ2xk8bkei3NEua4wsVYOOFE/fvw6l0Rt2k
	/2K/k5Q1ApG5IMfze7MRmU9a0Ep1bjvuAt/ogN6M6zxpxbQM8U66UfQBLE1nsNUcAvgGN+GtuJ7
	LpZNykH1h+xAdk2f707qm3zI+6xDgrhXIAkVEV1coGN8KwgV8DyQitlKutlSM1HckhrBbmg3FXC
	Bv7IvRhq45uYCTAVjMWNGSBr5myHge01HAUHVP3gMU4nr2Yldc6rEM981MRWrgjIlWGOhbW7Thw
	C+IXO6ahY7EDySPbnTxjbdCM/V7du7A7DhIXzS9aHb4nF+/YFBTUafFCki0tD3GTk9UP//P09Bx
	+4mzW2GQnVPvqwBvwQCiQx2N2xKd1RoSBkbZZZI9Pq4i5wZ7a/fk4Q
X-Received: by 2002:a05:6820:1690:b0:718:984a:50cd with SMTP id 006d021491bc7-71b18476360mr4278894eaf.25.1795082555567;
        Thu, 19 Nov 2026 02:02:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b18fbb9a8sm3906194eaf.0.2026.11.19.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:02:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 03:01:41 -0700
Subject: [PATCH v10 7/7] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261119-submit-dw-dma-synchronize-v1-v10-7-3a737597a0d1@gmail.com>
References: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
In-Reply-To: <20261119-submit-dw-dma-synchronize-v1-v10-0-3a737597a0d1@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only checks the active descriptor, so a status query
reports zero residue for a queued cookie even though none of its data has
been transferred.

Search the issued and submitted queues as well. vchan_find_desc() covers
issued descriptors; submitted descriptors need a separate lookup. The
status getter already reports total_len for a descriptor that is not the
active transaction, giving queued transfers their full remaining length.

Fixes: b68fd0976286 ("dmaengine: dw: move residue to a descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 7a66dc75c546..f9761651c7ec 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -942,9 +942,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
+	struct virt_dma_desc *vd;
+
 	if (dwc->desc && dwc->desc->vd.tx.cookie == c)
 		return dwc->desc;
 
+	vd = vchan_find_desc(&dwc->vc, c);
+	if (vd)
+		return vd_to_dw_desc(vd);
+
+	list_for_each_entry(vd, &dwc->vc.desc_submitted, node)
+		if (vd->tx.cookie == c)
+			return vd_to_dw_desc(vd);
+
 	return NULL;
 }
 

-- 
2.53.0

