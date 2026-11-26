Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729480;
	b=U1ig/wUb6lEiKv+Y5VKVEup2GLScIFPQ/8agTr1HQf1uoRBX2ECWjnIGdxvL82GJkLDO
	 Z0HyyaVB7mhpnMrryl7UcR7XU1il0lExXg2LPQPagCDKLvt2xmhLZmFVfUyaJQQ3AvAN7
	 PiZYTaAluv+LNkZLDoFaOkUrolMIV+scanuNNgGn/g46b1aZqE0Skv1YAAFdSlMqkZReY
	 T07PbaRTochvcBe5P7Laij7YGSXY1ULSl1d0JPesmrExBdaf466kqKhrviP7FAPBbVO/j
	 345ZWfFgr/XmBMcAqcM+MoDYLz/X5JonbLARGX8HPoTrvghZmOZRIyTCKtNrCLfd5gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kn6BBQ3QBW0mVYg9ROb+cNf6wk2lxnrC4mh+Wfh8lGs=;
	b=B1vrLOef/tFrNEr9T3ILDLbODUc9jXkZQbcUTQ0t1111QtBJ8T3In4L7g57KHh6zgoqC
	 /MNd9lPwlH9IvcBi96JdWdEqn//POOhNfYaJkXKSs1nX9zQmDlAuHZLysxf2nC45YmMcQ
	 PNKSARz/VuJYcemc5sJtCCXBLgErp/kGlE0uNYbKe4Z1rVVe+pQu9NCiRiYjH2eXPZP03
	 BaVWWD0MeQ71ZzGknifvCxkwAu/74mirqwv/WJUThW9DZzUFXLLeUbja6a87FNcYnmgV1
	 lJtpbX6dy9Seaf9+RGtetehTyeEUYWx70gxAV9JlxinQCFSCAOeUHmlZOLJ6By0lQTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTOf7+TH;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2368606A68F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2368606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTOf7+TH
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc758830601so5493677a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729479; x=1796334279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn6BBQ3QBW0mVYg9ROb+cNf6wk2lxnrC4mh+Wfh8lGs=;
        b=hTOf7+THA88UEDhELgxphRrr3O9AbAZs0UQvGdb58DVTpvrclUfbp+BKc39/oqmCl/
         XccliWyVihCD4pzMKCUjU39uZCQ78S1YYgb3VhHr8w9oqWjY/a7vMgFKy3tHA6Qfh0+S
         LEuCM7flsEoupWKoYVIj+E9nFk+u7zKtOCJDdrFcto4xn994dUhJ7jJCE++UDtT68iD3
         jDWVMFRMyNAmFQiEVAbJaooyHnnH+A2S/Yrzz/CatL6yX4C2uSbtd137zGf+wHDmaNik
         pRfnclfLk2h6xO4QJgxoJ2oAVrioctKpWxfNIe9WteD3dGlnlph8u6H+EByOmqlHQsV2
         ct6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729479; x=1796334279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kn6BBQ3QBW0mVYg9ROb+cNf6wk2lxnrC4mh+Wfh8lGs=;
        b=BN4o0Gxbf3l3JIho+nPOHiiQ587bwxJPDZj1nZ+uOO7BVaIcEBXyAVdxrC1Xp0ab+W
         fmRJwdbP6LrJLLfM2ppEsq5uB0YE3JvUUFcMh/flvFminzQpyF/f6UasG64LfyMJ3EoU
         437yR9ncQR90W37/lzYG4Wo0ALx7YW53NloFR3A/uCbQ7aq+cYKJLXeYDjJ3ZUnqyjs7
         Kl7Xaut8nEO/jfWoU1N1JVZ2aAjmJouc26Qt7HIJla7uwL0fWjJHjNVbjPdq8eEBoAHw
         js265i17tBaBF+5BgjaL55U5y2JsQjAKVTEOg8nghXHpYjEkPgCBltbfN8J2C8G0D8r9
         WwPQ==
X-Forwarded-Encrypted: i=1; AL+hErEId04OW0ys478BfSUpFpssYSv3gQUAbiAPIdoSRGl1BQ6PYlScDaMj+JcDnlGnugijvghm59fbESpskW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ocbpa7p1cSQau6j71jnHw3uDUBePqY3AJIFLV9jDJ4ZZJie1/
	tCqXl19FVrbGbfYIbL0mdjMZyVV1H+wYHVKGAA8flNCnCPm6MDijHZAF
X-Gm-Gg: AZFdTZeSh6I10Sp8KRL0hFkKiqLsMpj12ogqDZ4+Kxl9VKwqnp6Uay9F/mVKYBa5n1K
	PuS3UDDwHx/LK8uTMdu6YiRxmMwF/agMsYrU/FGq+hglUayIvJLsDB51CJAhA+T21xpAdxVhi+m
	0Fp2AMDknGau+lccWZnEUrWAwv+i9uvsIFX9qaAs2iwh4XvyjKqk+ubbklJ7waz+UYK18754W62
	FKpy+9f7w9bKsGeg8+c2lkcakoWLN8yNyHfIOaMjcbs5eWgh/qiBsXmxu04hHVyuzRItz7AABYG
	V1CdxTW/IO1DXODscK0IFr8R6Gtu6Eq2RKbaOa3F5RCLl9gO8r0eDrW0+DMJA0unaLKcz6IhhE4
	XFt29fDAm6J/jCyp9eddTpZf2UURoVYwTHQ3AEEEwLJRM7nXlvaitxCULMYWIPaWH2nHbSXIYRS
	Pt78tUxVZ2/99q8sl3HrV2u7rIxkyhNNPhRdsDM+6Kwcg8zvGbUfLsxf8iICR76mMPJz1/g53k1
	25PuoUUDRZHS6nkg2CRdHkwoYyU0L9VwErU4g+xuy4P4CnpMOdKq7WPzcx/mDnybPtEBVMfFIgR
	uK3/inHzuyxz5/KEXdlQXYlvz/g3stoeRNn2b0RcV2FZBs2UxA==
X-Received: by 2002:a17:90b:1dcd:b0:3b0:9e2c:9b57 with SMTP id 98e67ed59e1d1-3b41c7c7a57mr22714647a91.4.1795729479015;
        Thu, 26 Nov 2026 13:44:39 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm36176538a91.3.2026.11.26.13.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:38 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2 2/4] ata: pata_pxa: add missing newline to DMA warning
Date: Thu, 26 Nov 2026 15:44:31 -0600
Message-ID: <20261126214433.38317-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.38317-1-artem122novak@gmail.com>
References: <20261126214433.38317-1-artem122novak@gmail.com>
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

Terminate the DMA completion timeout warning with a newline to
keep kernel log messages properly separated.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/ata/pata_pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/pata_pxa.c b/drivers/ata/pata_pxa.c
index ed8c19db207c..46f93ad25a80 100644
--- a/drivers/ata/pata_pxa.c
+++ b/drivers/ata/pata_pxa.c
@@ -97,7 +97,7 @@ static void pxa_bmdma_stop(struct ata_queued_cmd *qc)
 	status = dmaengine_tx_status(pd->dma_chan, pd->dma_cookie, NULL);
 	if (status != DMA_ERROR && status != DMA_COMPLETE &&
 	    wait_for_completion_timeout(&pd->dma_done, HZ))
-		ata_dev_err(qc->dev, "Timeout waiting for DMA completion!");
+		ata_dev_err(qc->dev, "Timeout waiting for DMA completion!\n");
 
 	dmaengine_terminate_all(pd->dma_chan);
 }
-- 
2.56.1

