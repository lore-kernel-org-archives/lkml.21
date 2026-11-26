Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670129;
	b=3d+2VEo7jsahxOa16uwvcA3+3xzVzH+RsFv+L1FU8ZM0a/rC/IspZie0VteVOzA9Gmsh
	 g9/XYXDGGFVx1ydfy1KK6PPqB29J4p2ps7daglRgBYPtipV89oAkx8QWn3KrXOgF2UQnq
	 Jgq0Al9fZcllFk68g5z1kUzwAv4IedeA8Mtt8pD4ouPyh8X9WPeLIfIcIUPHvPK8yZOyg
	 7WF+JmNnnEWnFyMavYOpFgqtHtJWEIznyqo43pnmdv72guFOSroP85PnrlqDVM99M47BC
	 pw/lGudh+QzQyAvWTvoV3yHToU2dETiXM9mGFFwrvviw7ah0AqaDikKNtd5RoyabJaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kn6BBQ3QBW0mVYg9ROb+cNf6wk2lxnrC4mh+Wfh8lGs=;
	b=0bYLaKasDQ36USA+qqge2zZPsGZYRgD+ABLUNbTJYlgxxtHaTay7/OCIyGLTbVAPUFoW
	 +ormOPTsR25pKWA2xUE+uruL0gmXGhqpxD45M7x7KFG/K8ZAV3epQTOJ92hu6wihT042+
	 DQ2RC9gnob8zVUVVI5QZD+U3IA2az/ssRSvvD4oUbAFg3Ym2KkMcRbec5wg9XnOcANCTU
	 CtkIxlichPjdmhgMDXpLcxaq8u0ErJrHN6NhVJCybWD6nr3HWbwdVMb3KsfqFXHnMngym
	 rAlCeP/e42T/mDsJdJlLITxq4B8Q/2oMZtLmeSYb4avduSq7lED5yjsUqIvqB6/lN4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OFFMM25o;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE72606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE72606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OFFMM25o
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8c5ebbc5150so4618360b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670128; x=1796274928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kn6BBQ3QBW0mVYg9ROb+cNf6wk2lxnrC4mh+Wfh8lGs=;
        b=OFFMM25oHOgjPekKQ+WlRC2bWBuoEayX3eMalu7axlD9sTETbyW6ASQlUYKanwkSlx
         fI+ZiKf6LB51zonEyR/iHy7eaprCJDgCL19mLPhTzZKCdhQ2m8D+uV8JB5t9UMwxaRdJ
         +KJ+TE8HwaYsOBl+GhDmUEbzjrLK8SmkHR650h7MpiMkQfP4tWjVvNpUyaMKs29R4cXk
         U0/AsqgiG8y+MuOTdu3o7NKchnjnJUQW+r5Iy3pOeZid3Qg1vl9EZgSJHN7vueSRQQ4O
         WnsGGBqYxzkQk4467sPUc2GxvY7yV62t2UJOb3VZhv3xtMryysYw1U0B/U9apIPCZqci
         pCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670128; x=1796274928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kn6BBQ3QBW0mVYg9ROb+cNf6wk2lxnrC4mh+Wfh8lGs=;
        b=jniDzngckayO1k0puA15XM07roE37GWr2aYlDOz/t7nARkwmttz7FqYbHwPPYfFwwq
         4OFvvepYuuikm8EHmcOdi/QU2ICIURDWkK0A8iQxL+6IES8BJnGTtGJTNxUo5n7S3hIY
         i53qSt259HZz0p1bIRg/ULrw3aFoRn6gl1mKxSW/r1k51XXD4xJVC2A+644ST+67fFOh
         fgYc6szrvdh5TFbAuI2yCCMMTN6rb/g3JbxQ0gDFYmjqwKUYCbMy5en19oQNQ+8merYN
         EXSeS1TO6cGnETZt5QH+VwOBPt3033JSAe56E2TN2POrRRNltcVfVBy0ThLmcFfCSMtK
         iydQ==
X-Forwarded-Encrypted: i=1; AL+hErE/IIIu6rx4WS9AzOsn9A3tebJp8Gh7cBHpaQdcXksK7dt+KZD+/cgVwJNryRtnXdXUq5d8ePR4v0wCMZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FsrFwPlIMoXumD80btIPtsRH6fdxPns6lYXExkYhJeTxha843
	iEwNhBiatClzawef74i7lUEcdzJf34OmA0Z2A8+Li8aO6IVqlKt7mly1
X-Gm-Gg: AZFdTZcZstXPuCXI+qtrF+t2ahaXy7+j4MQ/6qmnqd6IPe8DnBMIbiU6TlgycNo3f+Q
	prCRfa2BGg4tsMFV/ZtBhYt+obvP6WzWiTRtEq47YAdjlxb18mbbqhJZMx1sVeumNFZxiETCcfD
	TzH2t0VYOdifOWLY/aI5idg5YGZrRvsG7YAEmNgbQP2guGV+Ya4mDvcozyA3EQQ2Pzb+oMdq8bX
	V8B0mBhZQkYHBWphlGf7dSlB2KcvKkjjLzuVV238cKmI9aewDlupffciPL2hqi9UKQ5vXAjwEGc
	l0YLfO7J73E9zWkbE5eNKM//xUYD256Ju2VypRGtdUwgVYPg7mGdG+9itQ0zFEfRmrK6PPP/f2x
	0bRnEJcYchgwjqpC3bl0pWvhd6nxfHL5l7nRVlSdiOC49+95Q4K2Dr4zuj9YIlqE2lDSGGX1bgX
	5a/UVcg55GxcAXr5/3Kqg51fJjn5jEpDsGFizW+KN6KgCEyfHvsG6gXFY9HlS4dphPYHDpqD1DP
	Ph6qMXC+Ptzc0HLrpdL7KAT9EnKTkNj8mcI4PfENpuH8RvMOOo4yPUEgOGJZ8DhiCNkWCfKylC4
	XEiS36xzUXEK4gdiP9HiXarcgSSVgo13PTymTqjre2gs2fFOdg==
X-Received: by 2002:a05:6300:614a:b0:3fb:5869:81f3 with SMTP id adf61e73a8af0-4014ca44550mr21042470637.25.1795670127999;
        Wed, 25 Nov 2026 21:15:27 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077a058sm10179820b3a.8.2026.11.25.21.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:15:27 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: vireshk@kernel.org,
	dlemoal@kernel.org,
	cassel@kernel.org,
	linusw@kernel.org
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH 2/4] ata: pata_pxa: add missing newline to DMA warning
Date: Wed, 25 Nov 2026 23:15:21 -0600
Message-ID: <20261126051523.14431-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126051523.14431-1-artem122novak@gmail.com>
References: <20261126051523.14431-1-artem122novak@gmail.com>
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

