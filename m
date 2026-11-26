Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669132;
	b=FpqSksHeBsK3ierBVBHBXinXZHA852ZEy+diGnMddfjdYS32q1qcJCHwtfD/Al1o96N/
	 QOiNOe6SskJY1q8jFYfw+5XgEDN5+0lClJFaZ6U7SVs5P8OWe5tMuwPjqLYU3Xj2eAPQo
	 kWKsC7186GtDhR4pRMviCsDVXn7X/I2yRaxNsQVEwDBIig5ehkCdDt9pl4yKXf1rQzjkx
	 UNi3FLPY8zmgvryyBoxi4TrrLjsJyRX7KX2icHGHG6dz5FI44J4Heg4BYpMvbopgBD97G
	 XqZT3j+KYnS8GXadkN7roeiIa8sQWSCr2vVS1Vy+185ruNx5k4AdN7pUWauTkD07kxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
	b=ENRCRaMABAMxDRWqWWyczqyce8xZccN1lW93GL9wqY7zX4YbK0MtfrwIL2eou/Ru+MNO
	 ReF+MSIcMoKI+mixdZdZTKy1UGxm96Hdg9b15JbeyFCwWb90jSwKwcEeuTng7cj5e0jBI
	 uAW/S/UfHCRS55TtcO9fW+8CHxf3zkN4dNvlxNwC8vQGQz3IRqZqNsns+7kZjYf/FfwjH
	 olAxZLQKJFua+d9/fgF7haJNHc8W6/TblAKxpL81wnEkFsICng527u2Bo7q4HN5zeUK2P
	 fqSvYwc1FcolgoWy36UH8ySTfN7Jbhw/fH1+ypydhjLFy9tKOsnky7AZKH2HC/1nXyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLFgUwIl;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0310A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0310A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLFgUwIl
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so12942206eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669131; x=1796273931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
        b=RLFgUwIlz0g0MjaqUyAsLzSqvkJ1xLt6pNRY4OtdtTDSlvM9yWhwOMqlv82swf/spR
         cpN8y0G74ukIXQVmdxMFTvwiAVDQpXEb4h0UvDTgh24cJTLOD7b2+v/rs/d7CXIycJLD
         6/Msy39eq6ajkqsqV38tDFS8MpwW+dQxPz1xrQ8Dc8ur4k7630y1efc5HB0HdHJ7OxZo
         g/ivpWJyMYJJJJ1i+qOAkTDlHlCdrB7MClyIVaIO7z5NLZl8Eu6yrksd3gzIVVAwSJpm
         CfXShRM450RzeD/OuhH+/53DkoIF9c4PQI68XlBu+thZ9SMj1Z0ZZoe83miPr9iKsH76
         CfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669131; x=1796273931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
        b=N1fQFSQDM0yt1Cli5SEVxuPqR8/N15zC5kBnjeCPYxE4Q2kEZaTOUcZcpe9evmgVei
         cna1WlXhw8S1U7+twqLaqQsD/c39xqMq5ioQ36yBzN1hk0qU7u+qq4/EPRL9BOBGAMJV
         oVvMmrNZ5Zx6w0gKWVgVBwzaGExWXD7K20FrGyRt26A/2kl9aui261sOxWiPzCxDnqWU
         9oPK16Ld9QH2T7WaMDFIJgRO6OdyO7VzXHeTHIivKCBREl7eCEasxktL+2G32eia1HKt
         smJ129eC8B63RtDXyR67/Tou7V5km1CoAGurK0Nqn2A8C8fOQ0KHSjEG2s5EMeacWFPZ
         pOlA==
X-Forwarded-Encrypted: i=1; AL+hErEBPs4++hRDBTl4HO9XVa76bSjbr34QArf5r9Qwd+7q+EpXV2qIjtWi6gW9QtxBRVOc2LNMTnkoH96fIjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cGbDGbuo8R5JovjJRNQAdQICDf4v1Waa3kv465+U+/doSqLQ/
	RB/77fU71FvuKxhLpQEmYLlr41isaWNTHqY9vuScjYERzyPFaHytdEGh
X-Gm-Gg: AZFdTZeDZb2s5eW/HuszCAAUJVU1KqaKV4fIATX+IxhcEhTQMvHZOdAUKujUQ3idvwU
	nj/ADbdkzFjwEsacr1xxGBKt+cnXLBi4gBH00gMOQw8ylXfO8W3DFzNBHiYD303S0ptH4Q78jG2
	DOrOEZwwRxEobAKgNHiQa0jEnI8C0p9nIRLrsmETkTaHz+F8EcwOTo7/7QH3/i4CeDplevLDKnx
	l/Gd+qfnaZ8YRdLlZnhmTu1OUqAifsbSJT0cnfg7ugrLup5NdluMOe7bhtild8iOs84SOVE//Gk
	WdKQQHbNe4DyQG0wabrrHdPlL4VOfaFk+YCl5jYp9d72mHcDcfDsepGKWr2P4boGNav4GCl7dEP
	v2HDsi3ib0+R0Ig9lF3IYPSgz0Xk4VPrEA69N3Bh4S5jmjCfBmyoXj7Vfhq4awRUEFJQGXhVXeK
	/G8YbR2jAVzyLZTt+RjPM8+kGX/nSRfBI8Iq45IPYxieeD3S8kMtDjv2WFJtSDptz3BoWj/3IK9
	FfYZCOx1C/sSnhjY2qO3S2gsjic1axswh5sekMck5m+5PDd/LPfaTSWDvIH2FHqge9f/t7eD4eK
	0FR4zC58Xe5OFk9h8+Mjob6CJR2QEQ9g/1ORTxExK/8xDiEZZY04KWGC4V1bS0HRbDK0fpmzL8U
	MUIb+j1g=
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr19606973eec.27.1795669130976;
        Wed, 25 Nov 2026 20:58:50 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:58:50 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:08 +0000
Subject: [PATCH RESEND v15 3/8] thermal/qcom/lmh: Switch to match data for
 SoC CPU-to-node mappings
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
Message-Id: <20261126-sm7250-v15-3-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=4181;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=4OXsCzvDxUDZzUq7vC0F7ppwML+xpv9VHox1Zc+zKA4=;
 b=iheqhOtdpQh/0n3iRRubDWuH146ojwlMj03gsY5OjYOhXTj1+XoFKhFe+wELpJighk7dT3Yao
 Hv0TPWTNrXDDS0mPVo8AdoPKojWBGrDV40/iwV7M6wZYIT5nTOAQJTP
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

lmh_probe() hardcodes the mapping of logical CPU IDs to LMh
hardware cluster node IDs: CPU 0 maps to LMH_CLUSTER0_NODE_ID, and CPU 4
maps to LMH_CLUSTER1_NODE_ID.

This assumption only holds true for 4+4 big.LITTLE architectures like
SDM845 and SM8150. On platforms with asymmetric cluster layouts, such as
the 6+2 topology on SM7250 where the big cluster starts at logical CPU 6,
lmh_probe() fails with -EINVAL. Consequently, the second LMh node does
not register its interrupt domain, which in turn causes dependent drivers
like qcom-cpufreq-hw to fail or indefinitely defer probing via fw_devlink.

Address this by introducing a SoC descriptor structure (struct lmh_soc_data)
and an explicit mapping table (struct lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 63 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 6bfe25021..de3fe64c3 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,53 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct lmh_soc_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct lmh_soc_data {
+	unsigned int flags;
+	const struct lmh_soc_map *map;
+	size_t num_nodes;
+};
+
+static const struct lmh_soc_map sdm845_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct lmh_soc_data sdm845_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct lmh_soc_data sm8150_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+};
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct lmh_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
 	unsigned int enable_alg;
+	bool found = false;
 	u32 node_id;
+	int i;
 
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data)
+		return -EINVAL;
+
 	lmh_data = devm_kzalloc_obj(dev, *lmh_data);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +173,23 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+	for (i = 0; i < soc_data->num_nodes; i++) {
+		if (cpu_id == soc_data->map[i].cpu_id) {
+			node_id = soc_data->map[i].node_id;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_err(dev, "Wrong CPU id %d associated with LMh node\n", cpu_id);
 		return -EINVAL;
 	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
+	enable_alg = soc_data->flags;
 
 	if (enable_alg) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
@@ -231,9 +264,9 @@ static int lmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);

-- 
2.43.0

