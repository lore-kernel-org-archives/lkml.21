Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432105;
	b=R/JaRUZL34eID10kEaTpfNDXAhKthgJm+baJcNPtWpRSQMiPqGKRFZFmHsEXi3mKWlIz
	 PGuBHcDruy1NIOGYCHqL2f2yGBO3VeuWnB2n23nymJ2YrNd5JJIj85gCXPI0zmkxZY9rV
	 oJelcnrS+naCb3nfAu79ySwxf+5/BKu8fX8VheJOGzgH8YjViogk3Hbs93+GZsfFb9/0d
	 dIzOtlWtESp73dd+q9wcTVuTgYza4WB6PUjcJIfqBJRLNl5dBjuKQHuEroxMY12L8HUr1
	 5zueC41P8ndq+9JeaduPChYa7/MtEJSgPPjUj6M+xpDJn6Gl+wZHeaaG+dEn7k1abBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
	b=BTJxl06RDwJK3p2e+ewbMHyhw39GuR2g/AJ89tEO+m1FYKLWW8/lxoZcnYYJzm7anf0s
	 sWiP7MduxY9CNojXZcwoaSohLkqwG3FvHas1oU5xykNO2jSqLlhM9FWJwdqgyHzvov17g
	 VUPsL/QkI/ZVykNGuMYz6JVEvaAvJuYqoxE06Wdjx4LUnVmbhwTN5t+mdvB87qnZ7F6x7
	 vKqD3IoFlIX/SYUv3/fm6RBVAYlkNFvwHutLAEuISUv+P7MDRatHEAAmCmebwD114GL+a
	 wYiO0TgEVHefv16gZbXAj5SibI2RPH9jJB3vU5RKABoglBw2nFQ56fdWL4qyy+2rznQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB32606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LwoqaWK4
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so4339588c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432105; x=1796036905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=LwoqaWK45pNBukfs0hE3P8NcEWeez9hjX3QJpbuCkeFGZ3IRbS/bA9ob05/MNaPzF1
         /QWJCjhAdYFuw79LnEu3pC3MHACbTpz6SfAe9I6H6Zh0Rei8MSCiau0i7ZSfwrOLIwVi
         guBmrn8bKj3vJ0hAPEmQy1Olh0ayHDqLPb9z/w4jVbagtfpHnnazFx7chJnaeL3BK/wZ
         C8oF8qjWjHcBK7hid+eAD7FaUqsl3oUKhudGZgjUag2SB6mKGTeoZ3N2d1wxt8FUrIt3
         wrIKddjRTUt4e/zD17S9i9xmHSSFtp0lo3v2w92T1rJ9fXt7blLEIVGepbjOJgl8NqCv
         ZVWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432105; x=1796036905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=apdOIp+d8dMosghugd4A61IWkZa+bKaIlqx3d3jd6f4=;
        b=Rf11vYBGQ/YpCYpWhmKqSwQhaRRUEEgvBUc+DYqKnf0avIWL3eetaeTchHC63srSkc
         s8aFuHoErnBhEvZvRNvlzx+72KQnMyuCDG8JASgsVFpTrH/9cdTVfB67ry5rHGuK4Vs+
         jaNfXOP0BSDXSkKy7gATOZYBtbrD0yacDy6qYKvTRR95btjvq1q8rDAip406buwZiJz/
         IN/nJjc5eb4gT3XDZIXXi13+ZbpqYmiOsDG2wu1EbMMHgC1W6RPXc5dx2HoeVfAoawOc
         odnJgK2jcU2QPRS91s3mj/JWmx3k4QwxfFEtCxNEezQHUhkl98x0iDybyXaVIKlm5ozz
         9PSA==
X-Forwarded-Encrypted: i=1; AL+hErHVnvPNRYYI5xycdmpRTXlcjzWCwrhNxO4Y3L7BJilEoOmNvI5wiiOILNV+N0OK0mYGYq5H0OBYzPh1p+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XBMvc5JbmJToxPqiypdeERrolaCABO4dXhwPooGxrvwm2B45Q
	uza52gmfq0HijEqhcX02GyTZLA77aAIf5yVD8yWGt946BfYyLroG9rDs
X-Gm-Gg: AZFdTZec9UyMPCcoEF+Lovk1u2wAT65wL1sKv7h/9coPT5fA1iqN/VEub9M+EybpZ4L
	ihDDn+wG0LXJcSxlt/FWO7uG/NsH6a76+cuLv0zwYG9/XgkVEvh6VIl2q6sv/l16uyhKaUc9iyZ
	w++hl1xSugbm738UTVymFcYaKUg7zguc0TIGZmgWIEeW3VUS9LN2IIQkBUZYrwDABovqV+CrVMh
	Qobz8N0Sx6MGnatA1WdL58v9grrFiJ21sjYcR2iLp7FApKp3gBTCUcbcCvA0sTj9f3HK7vl2Ntf
	0GPaaVXFHZx6xxtkzlMlDcE5I2MIcwp1AjD01b2HEkQhkzFlWvKf+Ndb+j9pczM11tWU1G0KKox
	/LVVHoYzP9ujNrhfxHE2YuugpPlPqgH5hrp3+QNpbqC4k0gItCmDvzvNQ8nRKmgJtYvJhTwtSDq
	utBOX0l/GEJBc0Q8JIPUmkWQh5qX2HyJsxfzIeM16CNP8Xr21Q+aSzuH/Mv+g6hqu0Qe2U7N7+A
	BHJDq1LhTObuOD63z3UxfC2LvJ+pn162hBCjUPWam+rus9+e44Ymh4Va2AEccVhgifKCQZfoEsm
	PMo98tBJlBGA2LhI2hH0NjMOIeZbSAcwhWHaJQvqRmkjRw==
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr10021894c88.9.1795432104625;
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:24 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src 100MHz parent
Date: Mon, 23 Nov 2026 18:08:00 +0700
Message-ID: <20261123110805.119610-2-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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
index c4ec9950ab68..3987cab327b4 100644
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

