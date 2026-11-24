Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537884;
	b=rXGmlfBE77cWyzGydeIGitUA+oHF+eotnq/ly+iGQ08hyNA+iP81qerIQWJdlI/HNMG0
	 wefxBF5GpW1rDbgMMxUdKfw9450KhWHLEbxNMh87nMD8H8E0wwnqyrtJQmtBHjOezPEvd
	 /YdhYbSI5BIMZb56EhopIGuFdV9jyEkt61yZVMjsXMTNsF/L0Fcy6x4LgmC3uHxY3+l36
	 RhVuIoKvwVhymQX+/oIGYLhF859taARGp/qm5mPC8ZiY/paf1mOejikFv2x2flKPYGZSZ
	 7/g8vYJ1hE9g3Mjph6ShSykl/0rbL1pUdAfi3lQtFBxhXmwiT13MCImTOMdkcOTAfvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hOIc5kjFGDJgz1H1COlV5xHNmspoYVPspyVBpPnRxGQ=;
	b=5bIxcpg0iw7NRFWiwW7CFLPTQed9eTT2aQ/RuHdwWHbznshBUmJugBYLLaz0V7gxzqEu
	 db+1uwxoBmeejSZcU6EP16i4BZVYEfjd5sDO2Bz68blH+UsHPLyugy3MUkYxQzK2iKxNQ
	 Eiw9W+x7SbTDdHIIIlwMN/WSbE4wULr9Oyh7duo5NkiCNKJEg7bfhEshecD+XPO4goTv3
	 dyN+wfjRqoo/eE6xmGVjI+J9KadNgJtfeIVb8MAYBcvCFDPhe1TdLorf8LEUyErHtU4Ml
	 xrLXwwyggCTz9peOTTbjylnpm3mRhGMTtU7Kt1Qv+ZsUV9IMqE7Io4UM+Dw2uwtAvuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LO/10Qmz";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF325606A338
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF325606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LO/10Qmz
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491846221ffso4043450f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537882; x=1796142682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOIc5kjFGDJgz1H1COlV5xHNmspoYVPspyVBpPnRxGQ=;
        b=LO/10QmzbMJOWlxbUU6wBuAq18RVMV7yVnrusuFonIgvjZ5F/JZ6fyv0rlQZ8wJZw8
         /LC2lv8BGgt9gUrxXRwMO/7kOMJpJsajeFE9DHp1Wsg678U8tsI4j3Bg22LSiDro4+l1
         pWR1FvangA3SP4W8BNqlaFjcQ6A2nDX5dF4sPcCu+sQ4T/26EYHE4F5ThMM5XgO0yA6L
         F+NBTXExgLltLguJ3b9yAhNVi8D/t1YKGTuFK7BWlwdwKITV1bUn6qkjbyQMxNHCfPzc
         fZeIhKAl+pFhBVx3DdMfjIvc+/UMXcj7cFfCCJCFV6JU3MxBNm0fIfAUlKVMmKSpNvaC
         dkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537882; x=1796142682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOIc5kjFGDJgz1H1COlV5xHNmspoYVPspyVBpPnRxGQ=;
        b=dMWO/kuUhF/XBKTqGUFtIHVyYF7YjtnVRwWT6EfTtfLthtOgL792kR0eXRebBwfaz/
         n275sVoMH1Q/AtPCZGBH3FpUcVO+AGB0hTSdqMtN0QOT3vJGy8qzNspvi8Ofud38s4or
         sYorAOcpC4gb5gt9ft36WFXKhpv1rmNE1BYy9El01rhkdGUUM9fG0+oxhp7eFHkOCE+s
         H81wV9ArCP/BWOyF4/zW4W4fdXx/6qJJsKV6zjaY32jvGGNZsfL9SUgkZVId9K5WL6AB
         /34E5VP4m9+/HjPbwtIPAaT2gUP4RsP+wZy9qOFwY2YVAGaja9VtPHm91/QDb1sMuCzl
         5ZTg==
X-Forwarded-Encrypted: i=1; AL+hErEI4UB3YszhrQXWpRW/cLdDpA0sC8GNTwZYkvB+oqGEWU+iFJ4y+OyHEUjX/O24D+B84mlF9rbjiQAxMck=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I1xqcCOKL9zXhYdBjrJIj6C2cdzRZhFmeNtyMT9I5vnxadVw3
	Rqoj9l4LdY1/iNSLTqlvecrxyIJ9GdCYxyQjiXCtsi3wN5U6Dlc0DnFq
X-Gm-Gg: AZFdTZeFztPFkEbfoAp+rQHfeGwL3JmxqyaLO17p8Xbm1iBc7JQlL4lVi5DDeZGqXHf
	Rsw1dlqJTAaCT6F5o9lCo9ifBQZ6+w4ykqcAJcBt0ZEx7bjVo+xgCDzpV/9uYyEq0/Ku9umiF9j
	7Hl495vEpPn16n5HLrxGNncQODnKF6IJ/XyUy/0CAIMgAncNxeV9v5NEcCD7Z9vVLKxbdpXCD79
	fyTnup+9lQs9yrbyIIoc8KlbcfxnVgjBSaPVQQoOHp2sdQP55Eg+OYUwmoNs7gvCcHVeG2d9vTX
	34XfNO2fOmxRTJMYBGnn1otLWomzpt67O04LYoyf++A09r4B7RWM72f4pyglrBKpxm/D6hy4g9h
	PaQHZ4HFZxggEJeyhh1rONEoxSv194dSbi0ThQSuTC37z5BXdosfS3xPm1g8D2Vry466e7TY9OV
	PGk4GHeaWRuIHDVFn2PQEu2dxTNtx8AMpHymcND120iUyqK0n9Bswn+3QRXEsl0JD1E1o7cOlt/
	rgzDbWK2q+9Zmyway/a8WZRkKJ30wgGUQz+rJVVeP/ZyZ6qhWAslrlHJ571zm+1n375VX+rZFQw
	UkPLMhASOKt7SV8zuoJDh2LB9rvqzEsRjv1Fc4QOEC3HlM3Ncrva5jLHosatV++y7A==
X-Received: by 2002:a05:6000:29d6:b0:493:28c4:331e with SMTP id ffacd0b85a97d-4abb31ae161mr19737972f8f.28.1795537882037;
        Tue, 24 Nov 2026 08:31:22 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:d107:658c:9ded:696c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm33058741f8f.24.2026.11.24.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:31:21 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Date: Tue, 24 Nov 2026 16:31:19 +0000
Subject: [PATCH v4 1/3] mmc: renesas_sdhi: Save and restore IOVS across
 suspend/resume
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
Message-Id: <20261124-sdhi_hs400-v4-1-df452ccd9bca@bp.renesas.com>
References: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
In-Reply-To: <20261124-sdhi_hs400-v4-0-df452ccd9bca@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795537880; l=2555;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NNhniuzpGFX1nca5vW4pDZfRZAtHdZfsX1g2gSTvGpQ=;
 b=dBACvf+gLaRjRVNK5ZH/7Y9iHRyWPDVfxjWRzSwE/xYnB95yUePgO1M49y60bDvH7MB4kMpL+
 Wb/iCFWNbT6CvM8GwpmwVwu3xluM7SozAfvV4XppuvliB4Xe1I6YwFn
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
whole register is saved and restored, as IOVS shares it with other bits.
The save/restore is only performed when a regulator device (rdev) is
present, as the IOVS bit is only relevant in that context.

Fixes: dcbce328d3a2 ("mmc: renesas_sdhi: Add suspend/resume hooks")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
- No change.
v2->v3:
- No change.
v1->v2:
- Added fixes tag
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 4f8ed1d8efee..a93e613e9821 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -106,6 +106,8 @@ struct renesas_sdhi {
 	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 5e649ef20990..56286431fd2c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1465,6 +1465,15 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			return ret;
+
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	}
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1494,8 +1503,23 @@ int renesas_sdhi_resume(struct device *dev)
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+		goto err_assert;
+
+	if (priv->rdev) {
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret < 0)
+			goto err_pm;
+
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+	}
+
+	return 0;
 
+err_pm:
+	pm_runtime_force_suspend(dev);
+err_assert:
+	reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);

-- 
2.43.0

