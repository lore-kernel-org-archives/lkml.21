Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202968;
	b=FQL0gBPDchSLwbLccMVti10W2WZIKqQsG3NML80K/XIb01QEZ4+dfwWN24CerNIC+2jo
	 pZnUTw1ej/4PPkMt9vUdEuqSmZmSjBlPkL+eoFZIJ860USjGOmJ3EFU0NraL90j4GQP6e
	 Jx8b88yFL3dn/4pSUejQvTckbIyTJDBSBdj+GMBgK6Vp9k/rba8kTv4Ovr8aG3iIPSQ3R
	 bK9LeAW70zfFsJrqzPe8ICyayV3qGW0r6U2LJOPYBIO44ngJQLAb2n5Tan2YLqjM2qrm9
	 W0lgrVMbSZChpnHQmteEi9NtfFyt9C7nRjke3JQGTf6NE9csYSeCchiewAR2UtI0wUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
	b=RZSFDs8SgUrFPc7aNtAA4PZODOKigWJjXVAceK01NXf9Dz3XTjibr7DiPSWHWDgZM8hS
	 2DDrt+JohYrJ23MDLr9LV9oN8pIZf2UKxqZeimCJhonzOpA+D4H/Y6mdv56LfoNLSonXy
	 UoS1zgLa9gg2HzqkQbpOp0BVsmwTbKecd35IVuQGGhhJWlycVglslCGTJzjh+QWbvVd1t
	 Fnvyvz4U0tGB8RUOss9CME3tJG8mKt0HJsY20eQlAAZJLWA8NKI7yYdrbjAQC9hmzuEA7
	 6dNmi2iw4nqCe5aRUEv1bHDsu8/YtvLhAO1uHWqYvJq29EEFtXvTfVuXJZXnHP0VwFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AMc/O9rv";
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D060A2617
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 888D060A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMc/O9rv
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71b30ed75a1so802970eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202965; x=1795807765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=AMc/O9rvrWAOFSHNAZc0dEv5FdYm+9X8d3+iGUjnqCUmleO2ZoOaXnA79f2QfP6zA0
         0A4ZwFdx5PpMdIqbCMlzik05E5roocUnTUWgap9FrqK4nBdbDKch4p/jENyuBXwlrKAp
         Jrt3w46wyVyIsLUTCUKO5JfqAAsPy5anDy/tKp7xp5ojFRCpO5tsgrg6/WVxL1SUTew0
         seL/FvxrjA9arO+1xGAlecaMB/p3YeWal23LRSa/vJiy6cf2P35umEn3i4QgV457o73L
         BeO5mvZRLCgwwy7quIVn05j2JSz545+fhRj/2Y2TJH/szJMv+0NLPqOzqhn8MCLOdm1T
         RDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202965; x=1795807765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgAhw8d5YaKxhipigIjxpyoY1rnfpWAZBnQgXb85Z0s=;
        b=kDuG96zHn2zq8SIaaGEzYT6BRGzRvBSaOathZNoO+CdHGOPHFdUoByUYpiKnnm9bDI
         6rpZbzE8vNGCclz+/81+XRFe8UjlATVBvx2YgDrfRmP29a4OwRXFVQgsheTXAdSlgjaW
         jf/2RCWD8DFJHEyRE0rQejYDXy+IdhERadW0Gm649bg5BHQOAuda40Uul0K+l0pCawHl
         aUvnFOMkw3IyJ4698aowoHwPJF/5NiAQUtlNPwcuuvJdBWpG6pO8ona8Lqr64KBdVZda
         cs/mK6TSrHOqCVKF9DH+CU3a19AFbob61MnusNej3zOu3mLzN8ES5ow2qPGlDN3Aabcq
         9a3g==
X-Forwarded-Encrypted: i=1; AL+hErEG6QM/av9ZOmEVc6I1VJPGKpJIUF/UgT4K1knf1B/j6LEjoJCrL9CcfkpfwYgR/wJpkOXmotaRwIpmNsY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OfdrmuOX6I34U2G9He6YkXb1XIN3H0qrGtxTFnwaeXhdCTKfD
	OF7B5w2dlbPldtnw7StLTMSoWoddDTu6NCtin9jR9Peu7Y0w34arSbfW
X-Gm-Gg: AYBFou1ZazZ9q6F5zerWLXynN+7hQxim1drDQOlu3bmPUjxZ+3m5PQ8QEDP9VPJM/fl
	C+glyjn/WCODj+KOoeXlHaJ+tH09SwQCd4POYiLFRRicEXt20IPQItUlBbcywtOUSkDntajhbxU
	PW7nGW+r7Y9b7qEuLXIy6vVa333SL9N2j7PizAYAx95YUsbMaW7aX/rcRLH8M26C+UvmcjUqPSb
	D+bdKAEK0/0aiJr54N2lOuVY3jYzHcDztavm7ZmTuCEAntRyD4FyjM5NOMJqCv89MamA7dh8D+9
	Gt2vCF7NGNN7ZY0rAR531ayTPdG4/5zvlOuYYQpWvuP6onvIyU3X+5YItUF33BIrHUIvt6VAj38
	ySnDwZEal+FRCgNB+lPhsjueGWz7+N3uw1PR8ZnxZd/uMZgMyvXx4RHr+wYpKM7zOh+eR5LEmoG
	u8Hm89qQZ/qzVrwuIs1yxGYpxtnBcOGApfsW6+9yx8rF8axtK/+fYn+J2GYtmnmuXwNDlUY/xVI
	T2BMojoJ7O+nbfXRK1XeeMLsF792P16WfAu0SIsQ4grHfeIG/AC7ILXy88++U85kyPKKvAA6BOw
	3XVqZHSIeP9S7Un77edsrq64NTfhP1AjUieFFpITbi1USvweWUskr0Y42koRTAKG0ga+8Ws92Z2
	qCjG3qbHEUZcZcmSGBbHzzg92b93EwbYM4xJwWnv2Icse5rA5ApY+QS+bKHyLDk08HLD1B98uCo
	5yY2ojEYekYgK/dmx/ZVOqNR3qqTnC+twGCuVC6yoMBnMjwSN+O4e4
X-Received: by 2002:a05:6820:c451:10b0:71a:f8c9:c6bc with SMTP id 006d021491bc7-71b39507d6fmr2684229eaf.55.1795202965405;
        Fri, 20 Nov 2026 11:29:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm3434498fac.8.2026.11.20.11.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:29:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:29:13 -0700
Subject: [PATCH v11 7/7] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261120-submit-dw-dma-synchronize-v1-v11-7-9b9166bc2cc7@gmail.com>
References: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
In-Reply-To: <20261120-submit-dw-dma-synchronize-v1-v11-0-9b9166bc2cc7@gmail.com>
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

