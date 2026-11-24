Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550519;
	b=fIY+aS6Wk/0iqxXSerifx9itYWtRlsCLHHQMdQQLc7OOCcKXD1R96ERlCDcJJUdMtOBO
	 QexrZ/VTPFEqVZxP9ftU/3Ki17uaH4eas83GIQLZg9b8WO/sZiSaiQrF3wvZZus7Z+b96
	 FccmlyDY6rO9XBIFh3IQTTm0hbq7sxcUiNlmWaAfqVQDPsYI9rF7YDJ9xY10+EJI2epXw
	 JELCNKWYOj/lVDTUskIj/f52t1zcQWPMMVwa/DPbMkyYzIyCQJtcxZniliQ49Yd6Sx91e
	 3iyiCD7vLC8tIf8kVfDcLR5FVNtK4MQai0F6C+JVKbgsSOda/VLsjDynGmDwh1J1z5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550519;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
	b=WieUgNN9OpIXytXdJHUfdcotA9msaXTis0J0mHfXrk/GuxQ3v/hAGMjg2NFKiHd48bgH
	 h6qXqEL5JpwprbLf7t6+5LS6L+XAP7/FpFfG6f8r0pvTmJn/fwBtaIWa5r1+ufSm2xYMA
	 yTiwfB6QTL0tKVXNIGvS/s0oS+fESLGp2hYNmy3fDD8ChTSM4WujF1hiB0YuHf2c3IiF6
	 8yOSmXyxxgUcLpCpgbd1D03aUZLsutnGGsTGbJSct0owbkxTIi8dstixa7cHbHtmtPrdv
	 9gtZFGFTo9VUawL5e3ePbOfWkeUO3rU9Eu3xzo6eUJoG1oisuk053ia8IZ20nE4iXWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hBRuHQyt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D2606A330
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxgJ7pYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hBRuHQyt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXM022306276
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=; b=WxgJ7pYe7a1NhCBD
	3RPzR2OHdYUWIS5BRV3ASd9SBJtUla9otD3oKx8Rfv7ZmXMWn5wMrWC+hzhMqeHN
	rDL3LST8DUaiCMJMLwHyw9wBgMJzLdgjCRaPd+8FZZVO6WF2zSwPh+PltM38iAbc
	cRVdPpj9Qvtocc7imwvdK7kXy47+nYBFgMSbiNZUeLuaq2qV4ZVDyGu0h+BMG34b
	djSFX6vFJaJHFZpNRAOqBeO4y/XLli4Xo3kNK0NUcaEgGRhJ5OAKLbzyf81x6XGe
	0Skyzl3FVkdBBRd4lN/Kj7lZwho+eyTE59HIU/bXUHeEEctJ9bHyPPHemd+65bBp
	y436Yw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9ath-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:01:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ca26a454so174424137.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550518; x=1796155318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=hBRuHQytRvNplcczmgsNYo0D9xReDAfEELgPFD+Sk0/l/4YPGx4jR7wEWRIqIiA45u
         iliWtdLJ4Bzvl9pH/rcOXZRmTBq6FWc/56ENDzuGy7MzsvhV1aXOUObK1ic6riN3xEBt
         3Eiixt0yX6b/6pk64VJGAaIyh5yl34RgXG8GN0m8uP6SZE7uHsbXmjwm3RdA9+wWF8mO
         3ymcUIGGgnmSkZZYnfsCzPlWAF700ye+1333yCB3u6cbn9DP8FxtZVuCYJ31XLFWzIc0
         c0KVReU0gqZ+ofDzBYA5jsrqPb8el2tHKNeNRMB5ohdbC6YF10voO54aPUu/CU5M+W9E
         OlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550518; x=1796155318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQz9M5ZF3W3F/I+cxRQF9tuKAsAAUPgvm5b9dNy50Mk=;
        b=rIcUUXG+mDjxlVA3K4zzekp4H9b93TQCyecaN4QOEUiyofmmT9xaXQ1a6NqF+jYBYy
         mIDDSzH9C6HNtOyURSTu2pQzieGVHC2YfEDExLM4S00RGxM7QsW3DP1kwx5s7C/5eL4a
         DL2jQ6z/uQ90w1bf5BHrBtPHRr46Me6I5YY3PNNcM4J/UP+gZNySVNSXAMcfAc0LhtjF
         B+H9QsxfliMbRD2OfQqOvEx/hL0pgWnraLo1zgpRF572zWRXUO0FCw85ycKiOS+jqItP
         IDmn/EYwgOgN1nMWTztl8kCjYwia0BDE53olxXT91mpo+3Nn5scblMdrdsixbCH+s0Ld
         Cajg==
X-Forwarded-Encrypted: i=1; AL+hErEDoS9nvCeo71nBvazcdU3aSrJ/QYADT87AjHJqhbB/alIX7cUf7UL3bc9nCTpcJiXcrb7/eNo6VmK7zRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RThl5WXu2k0xCuIUK0d0SknQLdYcx3k+5cvdGbbuHWZa0aU1R
	Xj4sdIANZeDtcfLfVXViKG8rD8m/ELSzA0zlbNRiM193YY3CCQ//Ly1YniDnbSz9HiQh4aPHYiY
	WAWjPhoBfbRLm6AGHVRBbdG9T5+3Vs8AxZw5tntPAjZwIvSc7yPxVwZ+Y5jCTuOr34Qo=
X-Gm-Gg: AZFdTZfMcVSvb6lWqAXBMoXjE63vf58JNzs9tKJKnTzpX+o1dvkktDOo7bd0XWG6J0n
	ApH1CzDt95/XbnVmeCuc9YwIzgs614cBEz5/k0G0AD1moXWgBSfrMdfn6n0uP4STMym+C2XLBWo
	zRxnfEiORVixF3XLOIh9sR9HIglmFbSvwQFW5c3KeKTBU4+bh1d9mGAklwTyxRnZaHod095s3c4
	7yU4xhB3OHGMZXFSODrd9y1EquCSPLUjISzKjwoiy1gf+Eg7vuifXVRxX+ZBrFfaCjU53H+Pi5L
	nOkxiCJTcpnEwrHt4Q+0GxsKXBH8qv3gKcFgOFxqqs/Vt/TAqrSQYg8e2v6/IvMk6RdvnKw+RQx
	U1RsoCASGfD2uOwgKd235JWr/bzkk7PrMcykRqL03cj3MELGcQD84JxVumqyuMZK5EAKmm3wTHi
	esxwCPsE0=
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353308e0c.5.1795550515617;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
X-Received: by 2002:a05:6122:264d:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ee8af4a6c4mr9353247e0c.5.1795550515061;
        Tue, 24 Nov 2026 12:01:55 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:54 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:34 +0100
Subject: [PATCH RFC DNM 05/15] clk: qcom: gcc-glymur: Don't poll the status
 bit of some USB4 clocks
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-5-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=2300;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=GmuoZNziZvPu1UlsqsifvQlY7SuM/U4EVYwsYPf4EdM=;
 b=GTjcW3B9vr7Iepca856fdLsOvmCpCMBNJCU1xy7eO8dKAHF60Cf3bzFsN4Z3SQoTNDUIH315P
 skO0DtYej3eAgai19OVL5aamY9nYLh2MmYMMnuwrsr1b1hs1Qu2gIJe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXzMopCHUW6xJM
 ifaAwsglwGBmJmOjlT/nllFFpkxPPuvkjj3cGW+ePCqy1GcqXRBDXP70VxIDyou+sXgVLpb/qOO
 X15JDl9vWLex/Mpfks399HaXaN79fvFaE6ENr4GFTU/V+cIUjXM7xLUdjNnpgNY0+/jM3kmHUqU
 7gefIsQeO+RFGHXerHSaTi5EsDuccGwb8XH1gMVxS7x7Gmn48XnbS3gDX0FdGA5gE7Km2SxVHFt
 XnvOG4h46eu1T35v2Jbe1Bi1avJRzAVonwpXUSLZ1nZUBqfAi313HDtoh6GLbXqmelFLPZBHFEk
 ZV/i1bk7T+FHkbE6pWo4zOTonra31Ie9qvrdBnSJEywno2c/v2lPJ4Pk6oHozkbc10h9FXpAXiA
 mwXRE3ANQ9GEON1nPwcSOivGApFLU/VuoCaRPhiy3KcXhY5hlXaezWDrGr7904b1IXLILl9O6Yn
 VrFMYjYvxYRVI33RTgQ==
X-Proofpoint-GUID: yMBclCzY6NxrOsVGDpxeCF0PfyS3XzSz
X-Proofpoint-ORIG-GUID: yMBclCzY6NxrOsVGDpxeCF0PfyS3XzSz
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05ed36 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=zk98c5D4pPYhsamE--UA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX74llJl8PdYcQ
 MbdD88wYk8SNplk8eg+GoyGLzmDn5XBVgDisSeqt52J3RJ+0U40V0qOKTcOI4crRGEGFDOCRBGC
 XHvsKiJ9mz7UwcWOohPcasD9IV8LumU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

These clocks are PHY-sourced and their halt bits seem not to update
reliably. Ignore it to prevent spurious warnings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 186c779e30846fef5fbcf66d114d58389d72efa7..3323792929d9292db0fb28b116723dd054d6deec 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -6833,7 +6833,7 @@ static struct clk_branch gcc_usb4_0_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 	.halt_reg = 0x2b0c4,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0c4,
 		.enable_mask = BIT(0),
@@ -6851,7 +6851,7 @@ static struct clk_branch gcc_usb4_0_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_0_phy_rx1_clk = {
 	.halt_reg = 0x2b0d8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2b0d8,
 		.enable_mask = BIT(0),
@@ -7068,7 +7068,7 @@ static struct clk_branch gcc_usb4_1_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 	.halt_reg = 0x2d0e8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0e8,
 		.enable_mask = BIT(0),
@@ -7086,7 +7086,7 @@ static struct clk_branch gcc_usb4_1_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_1_phy_rx1_clk = {
 	.halt_reg = 0x2d0fc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x2d0fc,
 		.enable_mask = BIT(0),
@@ -7303,7 +7303,7 @@ static struct clk_branch gcc_usb4_2_phy_pcie_pipe_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 	.halt_reg = 0xe00c8,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00c8,
 		.enable_mask = BIT(0),
@@ -7321,7 +7321,7 @@ static struct clk_branch gcc_usb4_2_phy_rx0_clk = {
 
 static struct clk_branch gcc_usb4_2_phy_rx1_clk = {
 	.halt_reg = 0xe00dc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0xe00dc,
 		.enable_mask = BIT(0),

-- 
2.55.0

