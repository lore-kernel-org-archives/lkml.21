Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729685;
	b=tifzliwSfxSgDkjFZ5PZX/tw5q87o7gsNl5StWYkIE9AWmy4PAd8E5a+M9Tep1wuJMVB
	 BCiRBYRADRi8faSTj4ixSU4tPV7BDf1ulySTZrXEyROs5ImqcinC9shtYQS2XnuLnT34l
	 cdoEdISn8IyXX6mDjVbWkGNzC7vd3yKUBcWfw0BnnDK0qlJhjUyqBgIp9SKJdow4CFaKe
	 fWecZevU0O04gyPCjAhmUuoVSB2MfaRaimLcQhXIH795XKN72W5Wh/UvZBGGnlgSP99RV
	 quxFG2CYR/x5bXn6HlOGB5xx7Ude/c5PVI81WQcT5O0G+6DYsCH0ZchTcTnnWXJN/9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oIf7AWYdO1zS62mXGE9pCL6nWbiT96WGLtk/goDJuAQ=;
	b=bvG8Fb5xQ4C6ZEOBnn5gJz0DJZ3yXYxdo44p2fALQK3awtdUHJShG0re9gqpz2lcWQ8X
	 uIXUn3tp146rondtjv3Supydyv5uxfZXk/mjeOfdu2luwuJP4pYESb/4dHx6kiiWB7e7a
	 TKA6dNo8o/2Wqg/2PK5EI0WN9Nz7AbpX9XT3a1DVarK+/xz5JlS7cgO39ANieMKztgtx5
	 fgyV6X4UP2zBCHMFlsyFFpFLUI2ltBbwSrZS5Z6AaKNd8UoVWGjdekkI5Qa5OJwgMv8J3
	 vyf1aE/LiVj3MncCkEFWbXSmOAwPVyLIdjKYPneECGfq9tyhvAhG+VL2SL4/rAjFjTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CH/Ch4LV";
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0F3606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A0F3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CH/Ch4LV
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso4265764a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729684; x=1796334484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIf7AWYdO1zS62mXGE9pCL6nWbiT96WGLtk/goDJuAQ=;
        b=CH/Ch4LVIkJ1qMZ1aGmp3NPvESW0Uzn/DY3d5YsRskDr/CfULJMiiIpeoVui+fG6nT
         FAF/XA/DhkpJfB4OUo7Z0NmtP2kWebOmvt1Y6vivKJPZw5A/fIS1RKbDOIajaJW/M6kk
         gSvt8ASrKTMqEUiPA1Er6xDU1Ox6X7UWEQV5bW1OdOqAV8g24jh2qftlY/6FOpeAJBf0
         HPYDIq3UdBw44zhfrdbziSsZOT3sOAnFgrzTYseN9Xl+JgJ4CQ8138ONgsQ6bErEp6nI
         Mt99E1ikg1dvszWQ9mYoIrDnr8SiOCCWsnR2ZNJArXgkVH2UGFmj/dpIiyBHtOGFbiZP
         ocCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729684; x=1796334484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIf7AWYdO1zS62mXGE9pCL6nWbiT96WGLtk/goDJuAQ=;
        b=t+gZ4C+Bd2aglRKn606RIlqnJ3V2YH1Fx9dImwH5oc1tfk4rx9fu6KC5g1fh/L787p
         oSeLzDsdA70Hy6b57qWwhXLxDrc/Dj8McamTPifSEmkjjnWmHv0dvmxd2fDcz+2RdbSF
         y1A7HvmhtMj3FZ12z3CVO3EkD3DhP2gIca7c+H5BNCvwllzNYVCldfD548BdY4MWArOF
         V09NuHG/Lo+GlV9ed50XCY+LwTPJHsmPd4VNNL5fymGLd1tYt38aDhcjqB0Dm4UhQP1r
         DxSGQh3finQqef1rk8F9m4OqUFJao4mKse/WxsifNOWuDbG0avX1hhF3hGllRBDjsAyT
         QNqg==
X-Forwarded-Encrypted: i=1; AL+hErFtqc1KtasVNMR/TQvNyq1R0BTnyaZGxHjZjQJjfUmykamqL9rnuH5EUJXbzzmwV4k7sx1uz0OQCphKO9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dbm+zTwZXTN+s/lwEIZ0iuPN1F5Uoj0EQ1Eo0NBiVMBcU2X7C
	47HB1nkrjCacFifuB30aeUbzgf3md8MCae+C+MXx+C6JghEdqhYX5SWJ
X-Gm-Gg: AZFdTZcaUMiubyM24IoM1jQN/t8k1Eq0g0ALs31KtFIrQ2uWAGvsjOuJajrHX5OkhVF
	m/FyvouHAAn6EiS6uLJ+mhaY70QKvurxBZ2n8hwdkmeFJVdH5PzWlXziOXJxfMwMO59tJ2futuH
	nax35qEWOuT6B+k0p23w9l1xcfnyrhsw0v2IaPh3yof5qMZ3p7t3Qe9wzLvtcI1YOBmQN57RAds
	4A/9ix5LzsBgftMhG0aimOFe9DxY+yZtWvJHs3xhoVCtzD365cTeFqoZ1AVENGsq3DU1ocd0bBf
	ju49if7ZIOLHnFRa4wK7X2D99qqXsuvFVe2XqoihJnWoTZ2YQSpgHbKrmxwHLsJelTLQfXR4UnQ
	r434q/DJN9ZVIYsFeP41Wl0LRtejhxJNdKx0bzWhOhLNhf/RRRw0FKEnSzGcNhWu9RLZQvRbyyO
	KzSJh0XWpwlWBINbo8+V5CJ3F2gz78O+IXQ+g3uv9yENIaGgzTRc7jHJk+La82Z7VjQNTIHopG0
	wnl9k27JwHQDRRzkzWtzJG18UlOXVrbSFtQM/ox1mHIw52dEZhL8UHmX2GoaczYNPn0ezh7iQJa
	0LzjLNtIP2M84OIWEKT9W8V/DpPpKnfvRCKlGJT8S8neZee8aA==
X-Received: by 2002:a17:90b:2d06:b0:3b5:a3:4424 with SMTP id 98e67ed59e1d1-3b500a3461fmr5476821a91.38.1795729683673;
        Thu, 26 Nov 2026 13:48:03 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm34636414a91.8.2026.11.26.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:48:02 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: dlemoal@kernel.org
Cc: cassel@kernel.org,
	linus.walleij@linaro.org,
	viresh.kumar@linaro.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v3 2/4] ata: pata_pxa: add missing newline to DMA warning
Date: Thu, 26 Nov 2026 15:47:54 -0600
Message-ID: <20261126214756.39027-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214756.39027-1-artem122novak@gmail.com>
References: <20261126214756.39027-1-artem122novak@gmail.com>
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
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
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

