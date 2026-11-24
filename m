Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550536;
	b=S9zIimtY/yoLkZaompW2O0hS06AeBBPW4RntyTus5qFUJqPJiFyS8UOolMIKE7DLmCJ5
	 mjN1tJq/FgtQfyVlTjDJapprgD46quJXtcx/vVM1PKxAEmh8wH8wkChpnXQQ1nINEuRoV
	 Z74SLLVP+k4Wb2WFZa2UIjunilQ2pID0R+U7Z2MFd08LGOKk7VW8XqOA3Ily6ZUctmJmE
	 kOXSNO7w4yuRvr154ZGdJV0zGKY4kznlIXxMEaiGU5Bidr/tOw4GtvMiZr/GTyEY86F+6
	 kaLxprF+M6JMcz+V5YaPqCpOCdEVcyzMK7ba1nKa2nGjTO5ZNWhzw0x0H9cAtVX00QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
	b=lZDr94CiqLHTdhsJO4su8H0kVvrD4V/2/MPErZevTdJRNpmGcinJc99AypbOjRYP4CuE
	 0Ix+bgdFuqzmMIX+iatLI7xDnIHkTI1aGVqrteuxF4V4w3QYs8gq+3/hJS4gRMpSrPiFq
	 hav4/3lJcTJmSLYJzsN3r1LiyrJwOxySSU1WK2K67Y+uQVhUyV7zDG10DV2mFKEWV7SoZ
	 hojvkAi4DJ1q+hmw2LPBlm5wrJgEby8ezULxK990CbwoEWqdx0+qxLMzhi6PRFDrxtI1X
	 l8qsM5/XOHWIb437G3vaJuGUwRbzyqRwb5erCZHAL+lUH8+z00YpFooaIU9HUSRiZGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N5cxqNJc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA26606A683
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA26606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IC4IN98a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N5cxqNJc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXMHM2306272
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=; b=IC4IN98aD3qMMEOt
	0/ZBAR6kZlsNSyoJV2ql5TRgq5Aithhlw3NiXK80diUP4tatEE8W/L0FHZNqbzeW
	cvddkNTUUUx4H9QZ/ZYL7Xjnh/XxQoWYHs+q8UN+cK9a85cOGpt99ISk5ylzfgao
	MNEtC6y2kHRUu8Nfkj4yt2f/MzpQaPBHlX/e0kvKkdeIfYWGqOp77WO0WyLXv3X8
	05v3ELy4Rzcs40UYYP4oFubxOtgYGOdhzvamXDcn9I+jp/HNFXecoMDOoU4/xSJ6
	9C4oimlwryuUy6Ixw0QVRMVxXxa2zMUvV+ZK6N4VRmVH6FU/sPXSd4ZIcZMVf8YQ
	3ZhiAw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxk9avn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:02:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a6f57c066so502333eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550535; x=1796155335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=N5cxqNJcR09vBHWiv7MrX6jL6pHi17VIpRjFhnUuZnSHpnWri1HFSqmxqOaWAbecKl
         35HOlda68X9vRjgX/7Gu93y1OhVaFXm73XPSqPnsGqXZqS54wuKoJeLr6VIimfz1cigO
         J5SVGOr7+P7cV+mDWytwXt0rN/Y9NMX3DaRV3vyMt/hqyy4xlD5r2Hz8FjPRHSNMtD5X
         ODYTyfZSKEP4a0pbBt9zGrHS4v7FldOdk6Ns0n5trm3HrB+ngTHfg6zVFq+7eMKurjDG
         Ksg+Wo4Q3GKWBtmGV6QrlnuUoi9xu0pao/DmUkK30enbshZOtvWz8rJqjH+i3ICk1lwl
         36vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550535; x=1796155335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jWrCu9bn8Qpw4f5V5CADvLlfy8TRqVXlmaSz9se7qXc=;
        b=ff+2y1Rm1Zr3iXH5RTV31QHKMHF9IV2P/yo1LylAs/oTPp7Ryg5zJ6m+X3laLQtc1m
         MuakiZZKb3Uo4OmpL+jHDWrHkAQc2vyKtkSfGeK3EQF0IlA4c9rukHPk/bijyyz/xa2O
         RX/jzSns68IlFsq5YapwaVqficPqNJfgK3lsIhqe9Gwt+5DameuVdMJVIi2eFUZB/Mnk
         c1T7khBdWj2OlWj0f4gTk2LuFYK8bW4Lid7M6MPEvD1GoXWhMnyKJjf1kjV+Zx+RRq5G
         uHovowCwxcbQFFzyTKg+FggrPubitVzd28dxoGQIlE0VPMD/zU4b34wyQjSIpDicZ+0g
         8xxw==
X-Forwarded-Encrypted: i=1; AL+hErFKKU2Dc1w65BWJeDTz6eWH/ROk2ilPKFadqoMsgh42yBvdISDICkVNT2nE4smRAAqZxabgrq+SetyDVv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VbbnZk8vyh/HADwsCQ2wluE2wLiZ5bcrofZk2im2BcrJWx/6v
	k0oSQ7jyAE30O5oF1eK/Pub7a6TZfdoXsJLak4SqCqxH3IiSgn5Y1KxxI8CtvyRc/Z19uSt/YDY
	UWCxJUN7B9tY4ivN1C3kdka8IDvNU12cvj6jbAhcqNQLuxKVB1XIVOa5LDNBpL8EKF24=
X-Gm-Gg: AZFdTZfNgWfitnYAq+5x37gH8gDmYjhWLrvk74YA4VUSYri/fLn0vjwt5iYasp/lkFK
	Bzp6VcpPxhebr/LZRmmTlCHfTi1+SVOUTIBFt5Ij+UUZPtu23nTIjxfrI5w71IS18MWDMAj1NQF
	pN0SQ8pCRjig3NJBB9XgL1qVqsLC/kgWQiUt2NynyZJCqUgw5bBmFRQVXgKoq5WTDdodLjGWHMl
	o2T7D6gIynt9iiPFPElqITUmR6oTiscgv0No4s10/Jjd8MUCpHMazsjISUXed4QU5FjdCE2/h6k
	pFdv1BaAg0ASD6kBjYVxS8NGzMGzlWNROwa0Mkn5drPGfma0tbixKx5LtYOJl2gI+BuZCKGyH9T
	HMiwHLDwGIANRZSUGlm6+FXriyVZUL7Jm9LTCIlKWX2YuSE8G+ZcLyIDbjLBUgAoE426aS1O7oo
	g2rnHGw1g=
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181177c88.0.1795550534101;
        Tue, 24 Nov 2026 12:02:14 -0800 (PST)
X-Received: by 2002:a05:701b:4554:10b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b5566e72c7mr23181120c88.0.1795550533379;
        Tue, 24 Nov 2026 12:02:13 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:02:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:40 +0100
Subject: [PATCH RFC DNM 11/15] thunderbolt: Raise TB_TIMEOUT to 500 ms
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-11-a9b45c69cd38@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=771;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=QbBiyvqAcfQWLt33cWM1d6MRIS/efAtBYRH5kpUuajs=;
 b=ceEoSnWOSQpTKTmrasnJ/E5U6w+u/Bzq7S/DCRvL5JzUoYBrFt5Cr/GlkYw1Cau+1LS5gz3BQ
 g5SlBy2yDnSCde294+DUgMW50aPABreI95lPJgrBaNZOLzRqhodnx8M
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXyd7rmZ6a5hCH
 +pNRyEThH4DPwgccGXqkl3JnJgCz06t+HgxPO24M8jsnk5YfNpnlxSeGx1BMSF/GnvfM1OcOqF+
 mB9vL3tM+557Uc23hee3OcfNZhkxtrNtbRc2KdRDoGSUIYeKgzKlT2OZ+YF0lwyigZkS17I0hBs
 CgoYkc0Zf5lQwEjtSJNbJUnIV4kaU8j4Yqf/FnkU5UkM21yeNpajEQvc3+6sfinaYClu4+8+74F
 HtFlEsThLSNR8UPEhVONJZ70TegbC7fl+2h77WQyME5K9boLbqhYdoT0j3e/4Xme4dRveliZuIi
 cFGI/fPajfHWnAJKN/utludRA3d1s1mPPOhkQWFRXmESHV63UTFfL4wcL+vtuPExiI33K4up5yp
 uw0L94TXZZdar9k4Z1Vvz95BR78fdtZlFBvRsL4WJFvatJfo8X0Yi9Pa9VAIPI9v2cYARYsY7dh
 0USn9BSrOzSU/ONtMDQ==
X-Proofpoint-GUID: 6Q1lrWhH1Ya-uk9_eg9aztREk6CegUHk
X-Proofpoint-ORIG-GUID: 6Q1lrWhH1Ya-uk9_eg9aztREk6CegUHk
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b05ed47 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=S55nwNfuHOdlGrVOgPkA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX6iUiFMeNTzrT
 1hCD3bgC4GJlyoHSqFaYwh+SHClroWS35upd9NIM5jwcOWzcmqaGusgPUGiu1Hv+v71agZiWJET
 +Szi5Lqx5bWZImwVAc/U0fDJjGfBpKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240078

Routers with firmware-managed link training (e.g. Qualcomm) can take
well over 100 ms to answer config requests while a link is coming up.
Increase the timeout to facilitate that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/tb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 418ad0a61a5de84717d7653c3516faca2a3db2ec..7594bc24c443fc27af651dd22c2db4b6e5acd696 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -16,7 +16,7 @@
 #include "tb_regs.h"
 #include "tunnel.h"
 
-#define TB_TIMEOUT		100	/* ms */
+#define TB_TIMEOUT		500	/* ms */
 #define TB_RELEASE_BW_TIMEOUT	10000	/* ms */
 
 /*

-- 
2.55.0

