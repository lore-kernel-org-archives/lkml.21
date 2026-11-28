Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795860579;
	b=SHaNxR9gGl4EjcIWlRaV2iyyXbSnlVHa7nFMyJBsvxMa+FraUNbTUHH9LkZYAKpR1M/w
	 pb6bCAdrYavzLnY1KhO1sgfOAlMrv56jHDGsaxhV5VjpitOy0pdcfaF5Oco6OdDnuSTsN
	 kE0UjaqbLl5rNHT8YnPUTWFfokStJUsBzbptzwvxcfzF6N7/s/Kl7jX71MPfma6zHxtzU
	 0Zj21vPjpq1RzC9L/B3rHDi67lU9rNOKU3pySRGx9q7TZvTkYafpWZh+VO/pIzDJaeRbX
	 1BVc72smRUFX099O21U+2Jw1W+2Hrts26m5rcxsoRAL5Z60sMO0IBfPZZDPWKRUBnvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795860579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
	b=c1BlJroMBgHzh4MfhBUuZVoRDabYpuuxlhbVp4vy1dxmJpl6O52VQ2NUvvNmLlpZSC4U
	 hKjrPzgKcoZpv5ItdYgRqG/g7p5fOJQBz/KXFgfhIdR4n2eTfgxvog85dtZF82RwNgPBd
	 roPnE5v6Ga32/e5rdqXmQFeOgZuJhFSZFkwHyi4ym6Vs2xP+SwMUbpLoPMF3Jh5VZbMOv
	 ab8QnoEyiKuID8i26Z65T7e1QRSlCerSeWIK0s3sLFn1Ut2rluMsL3NAAOPFCewHU8pxA
	 L6ezJBQoZFZxSyarTVj1hXg1SEp1KTg/QqFYYtGrKcPdbRwHEHCtCjNSIh5WM2wp/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRcuHncE;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2076606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2076606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRcuHncE
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so75980765e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795860577; x=1796465377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
        b=QRcuHncEDc8jX2CaVQr9tB0YRx8yimBZsVErESyXrG8bQXBU4H7Wk8vm2VCt9OqcA/
         rgNZdYjTTzbpbBp/L+SePcvq4qh4Pba+NQH3SHFxrnmXizvPvWEENXJeNXzc8s6DkJgx
         JPBC3SMKgjBvj1r70K1QD/+uU/GsP2EK7CdA63BnG0wjA14TZfIGyKEmY9rn2MEU7APp
         kg/Dk4F7QRFsWaqwUDpGyPs32nn3lOKGOzyJlefVuVagrVNrZvCKoaC/pDVdis9WYLsi
         1HGRz/YZanKjjEr2Kdw1+WKT3AdeGGa9jFtwMw7eXlVZZSHd+wk/R3YjaXoCanfb6crL
         N1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795860577; x=1796465377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jFkQl+1kffZkQUkv18i3cnYxd2zz1oEQ3A2zDQZ/xs=;
        b=u8FlQ0G0hfiDxOD0BAYRfj2abycwAiMtuE1zAQ9Shqg/0fkR/HBx5h0gUO3k9k8eSd
         k7zqdas1cKDdCWeVMk3/MOfY2FvCnXxk4UYOEyNKDpDMEYCn6Aduu2cCIvoZI9Oc2jUe
         86dSlqZHHY8m7jwYQrqfxD6/8fXD1c+sWgEfXQ5CSbu0sf6U2JtnLZeBHoZoLhVWfeZc
         KtPg2yOlMYIhHtcM/l8IkK4Sh8yimEllUQRlO5lIK88kSJ0kr61372VDK/CU83PxCz5Z
         a4J4J6F5lsmrLwW6dHIMFeaYGdwrQLMZMHaTJg4Bmg5fs44wICqImOYfqzybQzwd/NYx
         daaA==
X-Forwarded-Encrypted: i=1; AL+hErF2u/w7S3ClQYEEzweA1GNcmztM3/QIYy7Pxr7VONpdNglf563dkvUULfc+JPAouM69EkJ8pG2VbT8QFz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rEvLc5hgtAL5bKcFcpeHatlkgd6nfHgbku/FTA9JBJMbwEfeI
	+cT9aAVxqG3ShxFK7HKCZdfletDuBaNr1I7ii/NPwlrQnglEhZKb/baW
X-Gm-Gg: AZFdTZch2zujYhlMAbN+4cP3b6Suc9lxsGUU8ChLpdRl/biURbBv1AANlZ0DE9ICeYH
	ksZQEphhgTVDeJ05ojkV1eE6AGc/7iI02PNrkgCcaDxhRFmhDtFONkkUY+YMe10hV4O6X5LKiWE
	vJ0YBVhRW55lCacCbr4zLcgqoac9M4gCqYuMt4R+KTmfCzJ9FIF5MF+iE1ghEBQoeKMf5/q4d1Q
	AhzMtWkF+TEzU0xzr1Z+7qMzPORk3dEFms9ZGnvb3cWEwc68bbIV97Tssl8PaWn8n+b16DHq6Ym
	yhP+SVE3JwA6i5AwPrbqmuEKRsbGCANxc1zy+IsYTjhL82iEn6ENKuxgSMHyAtihy1qCKqn9DbX
	Wxanxacny3syQfZcskaIekWzAXHzRSKtZTCZi3RRwWDPv5cbsjpYYkzxvjnPqS4sIwEKq8XLURS
	FwfoPFZfaJT/Hs5XydEnFlCnSuqpfqPi+39d8b5lZ2byOBHyjkSnV13CJwmoJ6S2eSiEm8mce8G
	TZO1Oy8pGyBMa5eegydQjQMo202Im9eYjRyhD8bB/Y4iqBUNP9PIWle9PQXHY8VJs0tEYmBJ1GU
	ymvJcBhZgn06z/OMNUYMqZBjL9P6AoelQnKvzBeBLvYnwp8HjP2jyHr8AVRkS3OJwEgCS+UThX4
	0D5YHj6WbfZxa4hWzN8wtUH/BrNWIXGWRcYANu18s+VtfOibOAUTcyDPnvE+7YSH7jWs=
X-Received: by 2002:a05:600c:a55:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb88827db0mr588682865e9.30.1795860576991;
        Sat, 28 Nov 2026 02:09:36 -0800 (PST)
Received: from localhost.localdomain (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm698641065e9.9.2026.11.28.02.09.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Nov 2026 02:09:35 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Sat, 28 Nov 2026 11:08:09 +0100
Message-Id: <20261128100809.97430-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
TEGRA210_CLK_IQC2 fails with -EINVAL.

Use tegra_clk_iqc2 for the iqc2 gate.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
---
Assisted by an LLM.

Changes in v2:
- Drop the Fixes tag since no IQC driver uses these lookups (Thierry).
- Add review tags from Mikko and Thierry.

v1: https://lore.kernel.org/r/20261024110113.63341-1-kmehltretter@gmail.com/

Tested on a Jetson Nano 4GB (Tegra210) with a small probe module that
calls of_clk_get_from_provider() on the Tegra210 CAR node. Unpatched,
TEGRA210_CLK_IQC2 (220) returns -EINVAL and TEGRA210_CLK_IQC1 (221)
resolves to iqc2. With this patch on 5b0764a53235, ID 220 resolves to
iqc2 and ID 221 resolves to iqc1.

 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 4dcf7f7..47bb657 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -813,7 +813,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
 	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
 	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
-	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
+	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc2, 0),
 	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
 	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_adsp, 0),
 	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

