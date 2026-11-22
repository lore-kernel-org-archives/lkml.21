Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368956;
	b=e2bCdqLc8Uh/JY+t/7CsybvmrcqlVfldwZfo8moAhGSDrwt542p2+PuPLcNpC/LyTGpu
	 QTmPqloNn18baboQA+WjVBOA/C1rW30NjopEbw0e++C5YhIFUUIjsFK0i/VAumfPn1I8Q
	 D/DjT4JMLcNckCLKQt5w02leyikWvENKpTAmclDF8BgZ3keRcsB4JI9TqPmvcV4Y1YG7K
	 ImvfQy5bFDYBdh57Ka+hMa8FigbnzjTduqHXn8EiMnfoYRg0pcmDnVtoEkVKjyEuUx7Yw
	 fjs1rxpXOoSE6H4tWlXrx3sdmklcoCIowIwjF/KjXX3wwHkvzLp9amNHJxt3fmSHIng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
	b=j4CYkOolg0fuMn1gtmvJzQdUWJr/YRVBfZKxI2Vdb50D2kp7XRcmGqfG4Muhd/eAGzAJ
	 uEp+2IBpbQq2MNz7YcwirCaYYfOLKfdLYJbRM9zpKE8o8daSL1ap4m9jW4UbCdXN3U25s
	 h61wFZt3xKZqKVrJbVnqpx7gQa4gZhpjhblh/oEsV75h42nbVd7S8cVG8UeIbO/CIwl0X
	 tw3jf99Mu24/tZHQmLZjwBTKvxt/hHDM7L8Vl+oZxr/+kG/lG3AGI4VLX18nEnK9pRAyw
	 +OHVqOsgLtWr2qb68KhwZjCItznkXqJsa9w0KYTSDSQazzGgpfFFxr2z5A8wjRrJtzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3691606A331
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3691606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCy30Koj
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2af4c8d00so4562890c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368955; x=1795973755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=CCy30Koj3yGMktI7EOf5/TKNz7iYG67TRpkRh4+WyGd767qqOqi2odsV0Kj9RgzdpR
         0MSArWOqWa+qgM+DG05fmhi9iCLdhsBgQjyWvfKvR6CvHw0Kw1swCXgJC/I/7YZCBFAx
         RZsTHUXrF++DcIHmfu48ehUSD7lTQd/teBhoG7/svuDH6wVGUUZoRzezr2+ICHNgB+xA
         7B5kvhbXX+rswGCJVvdZwKkoJksBx01YiTcQfMMqQbNarj8hGRVzKxYKOSZ4BfgjxYel
         89B5N+j/zhAHZO5DrKcXigl4LPA6/fMZ8gt8HzA39nE2qNvNiOa8oD5wwUHgzPz4oTWv
         z3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368955; x=1795973755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+GouGnPJfECXmIJYX78k/uwgPhvZezU2VNMojKprrM=;
        b=VIRtCNWJISQi854t4uIKq2SRsTOip68jLn5zbPwwmR8v1G88ZIKMBhP8f82Huc2vig
         CbgkqQvOT+Id+UnDJLLhRUTX9THonP8yoPD6anTK03HvUzJ75HJMNwcO722SEKoCGQb5
         +5cUSohDk0/8Ir+2qm4shVnxFXdIjlLLfeGRqczRdlYDUY/3SenI9Qpd3Ojgqzf0SE7H
         EGTfR9zbPC17aCk3gy++Ic5DND93DjIvg8cITjYdBfKGybFS32x2eWbdO3IXDSoA5A7R
         Xx0gHOVatIkPkmtSkEQk6mKW4SbsOveoGPnWQJj6VNb5YNfdWYQOx8ms8MBh90OGyQX7
         Xm3Q==
X-Forwarded-Encrypted: i=1; AL+hErEHF4EigJsGsf2pnZVg+x7yxmrR3KzHyobvZhXwT8lAJVtLDtCAAQxrYhsn1KfTpeDnQRMNwrpRN9ESIlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EAKRzMN+cigMENuisrR2moDRMYr/TVuHs80A3LG2+8fU7kcMo
	24OOa1xjZcB88tgQgtYNINGwwM1ta5KK4omdbDwKxdnmRG1t5t4Y6yi7
X-Gm-Gg: AZFdTZfacYfBNxCUCNmM2WCs65h/MbUCNI6+V9w/2zXhfMqa0wPlDpq+bwLpSdKDsN6
	wjPi0Hmca5noi3w043V+N193wREAa5yb3gvI71XjpSaB4kasIQ1pR0YjBb+jlfbb9jTjh6HQioX
	nNsOVZWUEcn/x1VMfZuBJ/DsCmEf4dbPWJ0zQWnK5MkIHOAnbqv1iYz9lEjseVvOEEdgyIGQQcA
	OzmjhjE7EWGAyZZ+4y3+8wX4ms2VjvHEPzENMtOG/eeJGFNn4/VP4Dj5UdwB3UlPYrI9Qhhyqw5
	uncsPnmr+tmlGx/r01QbV1HO9Ul1/y9rRRIIsesOEgYfqsKDv90i2UAQZQQVpZ9HLqv5chPFD+b
	YBFXtAS7ENRp6gj/ohhZBOmLDC29mR5q8EvdjFvI6/Ahz9kNVlGuRzbqwyRi48tpuuCNmzhprA7
	HlMIqlCycedjsWeyanjEz08IW3Rww6eHXCZ1O5nxpAt2C365PjEFRKHpT5YR5HGYHj7jIUccBTz
	DRVbuSG/TCsAcN38KGICFBP3VrefLuHJQf2YLAaidTRNeSZ2ynOWHOequnyFPdeih7ZEKuuSqiI
	oFU7ioo0WgshAxkMHlbqU41v/aI1WGcCveqmNpmES67qKGOHBAKChc9s0E+3W/aCv/4e8q6scp8
	KauXXgT1pgPpM9ZUv/lh5jg/cwxCQgvx4kE2p6suMxSE7oszvdaVmmkXFTYo1I4z7iykhv+RS/k
	3XIPgVaSxjxeEMjzNvdo8DwIav6w==
X-Received: by 2002:a05:701b:260e:b0:1a9:c52f:655c with SMTP id a92af1059eb24-1b556900476mr10503800c88.36.1795368954863;
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:54 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 2/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
Date: Sun, 22 Nov 2026 23:04:50 +0530
Message-Id: <20261122173449.21009-3-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261122173449.21009-1-surajsonawane0215@gmail.com>
References: <20261122173449.21009-1-surajsonawane0215@gmail.com>
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

LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
unnamed, so a device tree cannot select it. SC8280XP already names the
same slot ext_mclk1_c.

Name the slot on SC7280 and assign it to gpio5. The third slot stays
empty; on SC8280XP it is qua_mi2s_data.

This file also provides the SM8350 LPASS LPI driver, which uses the
same pin table, so the function becomes available on SM8350 as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
index a61df10d4..278d5fac8 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
@@ -34,6 +34,7 @@ enum lpass_lpi_functions {
 	LPI_MUX_swr_tx_data,
 	LPI_MUX_wsa_swr_clk,
 	LPI_MUX_wsa_swr_data,
+	LPI_MUX_ext_mclk1_c,
 	LPI_MUX_gpio,
 	LPI_MUX__,
 };
@@ -77,6 +78,7 @@ static const char * const i2s1_data_groups[] = { "gpio8", "gpio9" };
 static const char * const wsa_swr_clk_groups[] = { "gpio10" };
 static const char * const wsa_swr_data_groups[] = { "gpio11" };
 static const char * const i2s2_data_groups[] = { "gpio12", "gpio13" };
+static const char * const ext_mclk1_c_groups[] = { "gpio5" };
 
 static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(0, 0, swr_tx_clk, qua_mi2s_sclk, _, _),
@@ -84,7 +86,7 @@ static const struct lpi_pingroup sc7280_groups[] = {
 	LPI_PINGROUP(2, 4, swr_tx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
-	LPI_PINGROUP(5, 12, swr_rx_data, _, _, _),
+	LPI_PINGROUP(5, 12, swr_rx_data, ext_mclk1_c, _, _),
 	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
 	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
 	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
@@ -118,6 +120,7 @@ static const struct lpi_function sc7280_functions[] = {
 	LPI_FUNCTION(swr_tx_data),
 	LPI_FUNCTION(wsa_swr_clk),
 	LPI_FUNCTION(wsa_swr_data),
+	LPI_FUNCTION(ext_mclk1_c),
 };
 
 static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
-- 
2.34.1

