Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955752;
	b=MbLrSQEcLuGq5UObaCf8dHdGD803dCKg4Z+lBiYsI/yeg6iWqFSpS3KSwXmDPaxzSf8o
	 +b6ypwSa4R/AB52SxKEzagRVPOgxxYfy86NCi4qef9GZWVBKwqNgnktzopcttZqm6HVkP
	 JzLQT27Dr602pka5c+DrlJDyommi3dLnDhPGDg4j/1u+j3P3RyXWFUfyX5nditS2nfdYv
	 An9V66AgXjsK0cDs5ok3pU1oPIKhXvgBsU7xc+MuaAGQG9gfx3gqLYJbiPNkoHukxrPoW
	 okriwwM6mblChn4zqCkbk6xt+yZoJHR5Vb40RP141x3JWziZGx2lxbdlnydEor/gjCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=k4Qm7XpfJ4IaAnPaVRdhRvip1Jdg3xw+SpQe4yTzGGQ=;
	b=MywCyUv3JO/cbWoLdy2zkf4rnNdAK0BlOdOyXZFvsvK36ksDwKFq7jxZnFMaFSEuDeRR
	 U9azBcHsRaM1n18QYtfE0/UWyuPUxFD75HPywXv1skBLDq4recB9lhJNCQEwuZ9IcepmQ
	 40T1riK64OPHZp24DQqCWyfsowa6/7nYhDOQ8fr/vUtXaVghaVnqI8LVXUfdvwjcpY3Wy
	 PAhzWJMPz6BisSSAJcp44J4uGnOTWkQEW4z8n8EsQJQP+xi14Ou3qZ4CLb/wVMumVtaBb
	 zb9rr2o/0o8V/2jnP15lMgzu7mcnJu0G+KhaPqZjmj4REAlFFHpklAeBTfUimkoVYnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcwrOPy3;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04340606A8AC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04340606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcwrOPy3
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4877837890fso179200fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955751; x=1795560551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4Qm7XpfJ4IaAnPaVRdhRvip1Jdg3xw+SpQe4yTzGGQ=;
        b=PcwrOPy3tfi3YBg8v5BHLPacqa4Td08uSUMN6sTMXCUIRMVBFU0iUEooEMj2SWEqLZ
         zXlwALAmDbfl86YT3JmsMoeUpVm2mCP+trIJhMj8bvOQjrGYGtgP2z+G43mSEWRN9teR
         JhMPLX+NEdQv4vbBfnEVSh7rUZlShSX/6NR4yFEuWXTL0eX+/+u14h8hHqBL/SlEM28c
         P9km1wHqaeOSrIpkNIoiX3N3TPYTq99ghrE0V2/OZDo7CA/+S7MwKVMnM3OINxV9XdKX
         nAD2227a7/DYkwBSGKsGxWZQP79S+NhVi0P7S5Z8G0smZSgYa35O/rJx0/w+yMbJe8lY
         CYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955751; x=1795560551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4Qm7XpfJ4IaAnPaVRdhRvip1Jdg3xw+SpQe4yTzGGQ=;
        b=Mhl68ledCdf7LiiN/OoP7aCa9AtB3V1rNErTO9PNMOTam9flBCGcqUFC77OOP2nzZm
         GvRcCMfrtvDCuUfMcnT9Mh3e10VG8VZgVwEzkCCgdt14hm0Mtv166TIoW1uPYUg1+LKd
         gVcn6WV+O4r6jxN6S+aDaOB0J+791yfKgYopkh5T/fQ3nUr3G0UeZ2K7McLLqurElxTm
         yT0xyIkV1z2yDHfsoB6m4wkfE6+9bD+emsIF2X2wVenaVv11kFjI24tFKVJW2+xCrA+q
         D48fU63/j1eVSxekuPewEOLawrWLOMDGc5WlwRu/MgWQOCWAVVWQ6jiCEkbVtlMNSB9l
         2vqQ==
X-Forwarded-Encrypted: i=1; AL+hErEcWFusUqzP/CVREyVQNo7zyY4y/ViPzrx4mpxHqMis2E+AhX623AkW4Kr0KgYPSHSn+M16/wEu6zP8DoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hMrOnnvychbVH3gY5YNAYv0urRxHdqkVL9+osPd4ppjkaHlYh
	uOe3j5E3dqkzow6iyaBjYOOJSPNLaulH+5grMbYxIxkPaYGkKuHaXp19
X-Gm-Gg: AYBFou1KESUwowRB9yUZJYA4tN2VAdFCCBD6iuCjDyX5/C33fpAQthhqCduzSJKk764
	T3TGYhrps+Q7VHl3sUohKnYILCfC01YashtyBERBh210EOlTWk8jzV5J4v3B+SHgXYPezCh5PUz
	41OoOT6wJ0aVMfKCKfwExxnYcX2cOwFm+Df7wOgXeUC4KBMobPLEXxZK5lu09YOvtfaM4Pr//QL
	xYBeiEKEQRI/ub67zE+bqKog9VY8j6OKgLTP3TY7rslejZ11zm5bFAzXOMrQJ9lcXNR2dsBXxAc
	e0MCO1CbPw2Q3kQrTQNTvX0ZNqSxBUfi4xA9XGIL/yHmvYgWjogvW3db41ZC1CZwDAZdeY9vyJ2
	qNUWio74Lp1dBbh8xbRnRH1qXgbNdpywB3c2wtkCAyy76mXWgVQlNazvk8Oy/qxqtBHkCVRBwbi
	XGnikVeJ3LZnsLFaCunKJ1fyWVZxWFeZY0XFZsWPlCcB0r8KZQcAKksseD3GCu3ZtVhrsnmxRgk
	UL1sqelfg/76955lKCg7FSD18XeR9F+0yQegXLRByVBhnIbF0F2oSsZ5L54jKIUUOrO+9Almkh5
	nA8bqexZlE7rm27ypS4/PDlXUIUg7lsutjG6t1M59yXyOXMyyL8VFIOY/Gm9qCCqospUuAmRV68
	qyO52mTqpWNFHJzrgPMpO+Ii9jb0qTCSsCqAi5nmjbYvUHsIDkdQNL7zf3wjf2MRIyuUv9k0B1Y
	DelVwcgLmsed2FlZJ//Bf6Vby3EP3mkz4C1veQAfj6QEzPWM4gCWE=
X-Received: by 2002:a05:6870:17a7:b0:4a8:ffd4:9a6c with SMTP id 586e51a60fabf-4b75d850d84mr521682fac.45.1794955750772;
        Tue, 17 Nov 2026 14:49:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:41 -0700
Subject: [PATCH v9 6/6] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-6-7dc066ed0bcf@gmail.com>
References: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
In-Reply-To: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
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
index c138008d7cb0..1786dbe2e850 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -867,9 +867,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
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

