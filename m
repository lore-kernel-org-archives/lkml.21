Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437368;
	b=XeaCI9fcSKdUXuOiX+GDMr7XTalNiGZJa9E61O2M/qLz49tptx2UQJelACzsRJYjomF/
	 0folNSxP1Q0YcCIWm+jztmMRLJnAr0QzEa5y626iy+lPd4UN8JE4topA9D224SvVYsthv
	 B5oDXpUBZsqrrpNvP+/stEkBdOoOTp05ZPaUi4oUagG+xmTrQ4PLOO8CeZ2RppCB8kXGx
	 rafhvs/T2AKCdKNHgRcoI1vbuaUb1agy0WWXqgb4VqirNabqucxEClMl5Fgeru48y9j9V
	 ZWomneFCIx2BY2HD1yq4eKAEu8yZP6Uh7a/GUw4+P4i17TwksxVQ5vD89TwRNSeKlCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
	b=EToM6rnIEttTDsmiJNSipC2Z300ZXIsNTmWCtQY2HvtAW8M94pk4UMbq6sp5B22plfMD
	 T1wPtMPSpPwcAONDixCbUYi/CJmhK007FOCgQgvqCzDfOcyzx/ZpBYEe+xyyamEQ3loFn
	 wmj9s4PTL9/FwWsDYA0nE60xk2U9Ytp0S+eubRtZKPFlKTkswHx+lL+2fK5PFExAGtt8T
	 /EUgPSq34mvX+Ws0b4eFcTX8E73XcKs0Jrs5m8Ojy9DMxTXSASKk6jVUiEpSLE8O9CskN
	 Y07g0h9FGaVsuoIhjIdgL0gmT+75T/Ar8D1sWRwZEkpWdA7Mh1EFXsMvUYN7tHUm/6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8F606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A8F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alq+xpW8
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-382f4710a17so5494950eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437368; x=1796042168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=alq+xpW8lvIvn7LcJwzSvomTxbVuQXitCohB6cKUBQAR6jW9xKij72us30SL05FkMa
         H3Poy1cOtIZ4Sy0okJijmUSOBntFNr6/Oxa43vJbYWKncSm6Do4G1wHQS2tDipyPE/lJ
         fwQh+u8cNBxIiNdUK+P/pbNoutc9ywa4rJr/Geb/7NAHIHIGl+GlkvwtU8NaxtVNcE6x
         3vMPNKRFxg87rC0bZNZfq9UgV+4zlMY6+Jh9w7xb/LhDIVRk8EgnbFP9ID41wPMuZYrX
         e7Cx2HK0oF7JaWx+jgqk+gcKRJ38vpli8lP3FgvCI2JX8jt+O1Dj6VtscZ6JFVBd+4wg
         f64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437368; x=1796042168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qTs6qt+I479MzVm3TzmSF9iYkRLfWtY+RBYI0Kg8HgQ=;
        b=BaUPRffYI1JjvChKmtCbGR/b9V4c5a4QMGIRMyLyv261q6LOcxtEdbcGB1lfXLFnj4
         eqL+JQ+tJrwvB6bbCeZVEUQCkqxFa0+LM3hhvHrcgyqSqORDWuhrppMnpGCjJlbMVFmB
         spWvXQHeoKx4Vjog9PJeS2gefLSc7SktPBXzIZkX4V5RUquyNN4zDtzUZSeWmHKKvToA
         Ns6lBhcw9bAnRaRAZhojsPgBUVWorp1nAn5L9a7podyAKAxBFbt+d80+u0tFHsBJq52T
         b6UuDD7tzq0aQUit5dmR68uWwnnMKN6Ly97x5AnyoECP0ypnNSc267dMRVnVLXu87AK5
         1oOA==
X-Forwarded-Encrypted: i=1; AL+hErFCtILSnMJeoAaXfgEnBtGWN0Y3g8BAqAS/g1CaSC9NQFM7MlaSARFBg6M7+VJcfRuLRXUi+jIZr/7oHHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c5TPMe5/4/kF1yBoJZJJqu2wfPR/qSEp8gZGjt4H8NnHLjo4+
	U69dBTfyW70A7MH9+TCuPkAl7Atvu0abjJCUmdkaIeR9oonYzZ3vqdpj
X-Gm-Gg: AZFdTZevIkYbFsyK/nPlvXoyzKniNUJNdN93C6dzZcitNceyTAXMZEf6PFl2pw1Poqy
	lw23gvAkMYz6mAAnY72hN+95YUvX1Zj0rIVMNcAXs8aUsdY2EzzgN1ZEKp/AU+uxf49WAYDsOBV
	9YBut/XSR3EJ3ZNVsr+s1oZHGPQVF7Wwry/VEIJeIs8mPSthVe4Klm162BSA73s152JGNcXCH9P
	cgHMUZ0+MoVhXPoTl2thuQj7t0j51YMPWiplQ1fn2b2L7t86ZuYeMzsVh0JzJgv9TcHJTkIovQ7
	DiBjRPu+lxL4Jz6ayEBwSgxRbjsIX1vVHU0ZPe4RX6u14s82vu78jkyk2szj37V0fcULm8XqAOo
	41fc+Cv12EkwvvTG2iFbJxHStg6vKjG5rc2aqnWm+G/1nusroaV5Qry8GQvrqf8RFag4YITM8F1
	ZSu6grc4DCgFLz6EFWfSwyNj6X/i96mV0N3+WM8gUycXKcRAzPJ3F2YI335Lhwq/F3A63AFedNr
	BHRhY6EoAXJd+a/Y6PRcPgfadMgPMwRTpbciryymWNF84VA6VPa/HNZ8Y7QQz7ikb6+RXc4aLxM
	MP8nlOnNCTBqiLCjxYc6yc53O730OAYDSbVG4vRsbm2BRA==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr13059014eec.12.1795437367601;
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:07 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 19:35:40 +0700
Message-ID: <20261123123546.152162-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with
a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on
MSM8953 platforms such as Xiaomi Mi A1 (tissot).

Switch the 100 MHz parent to P_GPLL0 with a divider of 8 (800 MHz / 8 =
100 MHz), matching the 200 MHz and 266.67 MHz entries.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 drivers/clk/qcom/gcc-msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8953.c b/drivers/clk/qcom/gcc-msm8953.c
index 8fe1d3e42144..8aec5600e837 100644
--- a/drivers/clk/qcom/gcc-msm8953.c
+++ b/drivers/clk/qcom/gcc-msm8953.c
@@ -964,7 +964,7 @@ static struct clk_rcg2 csi2p_clk_src = {
 };
 
 static const struct freq_tbl ftbl_csi_phytimer_clk_src[] = {
-	F(100000000, P_GPLL0_DIV2, 4, 0, 0),
+	F(100000000, P_GPLL0, 8, 0, 0),
 	F(200000000, P_GPLL0, 4, 0, 0),
 	F(266670000, P_GPLL0, 3, 0, 0),
 	{ }
-- 
2.47.3

