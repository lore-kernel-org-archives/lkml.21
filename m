Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718306;
	b=dU0rmzEt+ci33OkIza5BiFc7mirFEnGHnDYkio2gS/XxG6i1dJ4I1kw4ey/qni+KvvNc
	 twt67k7vHTHPzkfLuMWJM2kLjfjSMNxhhSnKNYgYZEe4rsxw9Q1FIxtohSrjdyiUYStgo
	 WFHXpFh9S4NMkdIyZgdUx4l4NvT95FOAo71Bl/E7wWnLs9lPvGU5PRorFXLpZCqkG16cD
	 a5oDiJg8sNeSlGUyoTQEnY0amqu8PVI8uYLkAn7RTbah5CwmZiwz9frsivz4tGRPSITDS
	 s07UWAk3cMgU+kttSIdbKPpiO4fx+zNk7tWIVzs3C6KH5K/UD2CukVqy6byL0Oj+FUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718306;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
	b=5c+oJvIde3DaF+u5ySuH8otzOzOyBQcF8E6QW50vmFvfOSg4wt4YHVMuJxS/PaFQbgqz
	 ZNGisefeQOkkeNdxyj3vqBdUkHq7KQGh7iJwesVvipA57CAeIFnxocpH6Ev9lIsd7Mf/1
	 Ttwx9LVvqiDyOa17BPea6BEuLZKTDUP70Zx2gbnErhXHutuHmRRTjtGRUdmuFGElu+nMU
	 84BElMvUO6PsRW/EdOwu9qxIFyWj0uiFePRXNjHghP75pSaQg0ELHuenhyvhfKkPkRsSg
	 1AmZ/A7Lfh3dYNg2hCRxypMMSduT+Yglmc473C88wVnHH3YTu3zdcYrSSSfI2o2jYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JST2GU16;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388DA60A2604
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388DA60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WW5cN8+2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JST2GU16
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtwvv2835004
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nH9UtRA+iyb
	2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=; b=WW5cN8+2V2noCVEsOBkEE5TPXCh
	gTqFl2XcpTGncgwWJWlyGdcRs1G5/mmhUqkCaRlMFkj8pMJq/PLusOuMvxKdzgEm
	4zKw4r/5qo+qwYSDtDoskm3Vqe5tiIsRPQBxTZmV4whQizrAIQot8udq8kciREIH
	DEhwbTZJSYd+GEpYnCUX+kCAF1en799LPpx8B31lcAaRWtCteI3xAuD8mz07QUmb
	LUBfknojAU7TQrkAsMXj6SxX6DkBO47s+7QjHFjW/Hajcz5WNPvP7rOaHISku22+
	+8zVr60NUoK+R+fmSO0JQsq9jTJ2J/kAgaacdV3C1k9e0iFoOGtxJvprc2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqgsk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1328823185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718304; x=1796323104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=JST2GU1606dezn3xdz0oVvFmUAQUTezcKlYjF6L7s/LgL0jzEM4qTYaIO5lEDz9lyp
         dQ26XEUk2JzX187+WmWZQUIlmEyMrcoqWkxnvEnzc9bIm29JKgFD72NzoFmjOb7BYjQI
         t26A+ZYBcQusqHcqImGP4ZKPDDZI3AHxCyCDsGSPiMcky++kfM8VzCEYrErglEMtmz1J
         36rcKmM4Acu1tT8Ye46GEirMvNPN0S2OB5a+vrDd27595cmA6qhLXpe/+oOsZyic3VjC
         yyxUf2lfhXWPHJvepi2A0ImwqWx/5SB5BAndbWrSGgxseruLabHPDm8oDApxU1BDgAUF
         P+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718304; x=1796323104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH9UtRA+iyb2/vmAvJC8ZOQys0hsGZoyHduhbYNsrOE=;
        b=e46E+LGd3uRxUStzaTCu7+7PiCkAzoqYp8T1pBY3Q4vZ64W5tqm1oDKcMaY2a7yVqI
         W+SIo7zjJbCfWEWtaxzdBhGiD8RHj/Q6UoCEv/bRK2n9ZU9vCUUtQBonWOMAazvQL7nI
         7xqSDhzboLzeyCiRjbng+8Ya00sIq/5BOfupaGnUBQkmfeCVtpkvwnOH8mOLIiSEmvl8
         bKoCvKsoHZKUVMIxLxibKhhtXv8DHRzxH7sVJuQw9UGQ5sKnMxIzaNABqQd4XVjsleiA
         I0yDySKkQLWo/pEJJbzpkWki/CUrGKfwhG9GpGPhk/rm/UldQdsNn0A4SC2x3qW2dMr1
         00EQ==
X-Forwarded-Encrypted: i=1; AL+hErET4vCvTD5clkF7fVz07PdGGUp/SkV0mwbKojJjwwhH6tr/KSQ6PBSo3bDa4VFYM8jl1TVAqncl9z7OSIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y01QcwvlykVUC7SqbbUa4uZbotVkWJ2RhWhy3mpyVV6tqKWDY
	3r9ukj8iaENFSB9k5WyU4MtA031vGQ2g4Z1ymqX2+6T773KeDmkfBo5/rGwoQ4YFqcucCuJL35a
	IRJpYUjGPdhZoCKfMQA1ssco23FykDWxtAx/DBZU+IiApCgZ1F9Kl9ltFZsMl4jf4k+s=
X-Gm-Gg: AZFdTZdtqj6cd7KTVmD6OaDgBKyxe+06CGZF1fs1nmPQxRu6l0AHW3NN4aPlDvFsc56
	UyI9yPw7Ueq8DoesQzPZT/WmRD3767lCJZT5FlB8FGJb+og8y3oqDv/bGJcHyqa1PI4NVf9OPMx
	8vZAsk4G7RSpKivjvobF9Y28LJ6GjTK7U5K8pri7mrnwVI9vrqOE/5Z/d3v+fvYxxzy4uKSdmuC
	4OvcHXkFQbeu3jiwDUs4UZCOXbnVsPgQ6Z+o85NOj8NXeSYJM2IGK7n091A4CDBaIbiMQaLXHYP
	bz+j7hRwR5xWJSw5QRnIG+HdlTyw1dzAU8cuyydRzlr0M3VhfsYGfp8Apb+GgnHJz4pdLd4z5fY
	P1x4R0YX3J2gSf1wR45249xIPaOxxluRYyg9zpy2EYNxd5rj6JsEIfyJUZurzhzWy
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223073885a.21.1795718304578;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
X-Received: by 2002:a05:620a:1b81:b0:949:6a66:66dd with SMTP id af79cd13be357-949ba96e873mr4223069685a.21.1795718304127;
        Thu, 26 Nov 2026 10:38:24 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:23 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/7] arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:03 +0000
Message-ID: <20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261126183806.172485-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: Z7mxCi7cTwiBqGQZ2gfd03EMZFL3IcPF
X-Proofpoint-ORIG-GUID: Z7mxCi7cTwiBqGQZ2gfd03EMZFL3IcPF
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b087ca1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=7VYxjO81rbqYX6bM38wA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX5y2zsTmsb3xH
 DIVtGYq004zFE83/4+zROvdoNc5l2IDpNfna34GlZT7wjr4Jcj2OCMazra1deQ2NbJc1MoIW4vD
 3IFwSy6wX2eOa8TpbHyEXAmYfr7DTc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfXy1ffZ8JAJa/y
 ebARp7oRcgE51iHnoTxGRgEb6tSuFDvbFpSw6jk1oblU40JJSmu5pZ3Fs/f1rYmqMUlAEAys8vz
 xD8CIPniwZxbbuoN3nlg48jV0zgFg8dlnB5tyzkCTBB+m236pGCHr1STitc7qb+JOgaTiR9JyfT
 4K16NV5XuunSC+h9YDcjrtNP1fGrFANlEmSHY2Bq9KK2GWoFYSVEnNpSO+g2lDdXxMSB70rO7N+
 XbKcTGlLTzrLhUlGy4VzNsIb4U507taYzk3OD6pQKZP5Cyo2jbFyd6UBELEUVI9iAHCGQo4fZUq
 F0Chr3t53KJgDzP/TebG3LNOoSYexheqjfkXF4AkQUIwWWcR9RjsLKBze2GJ3oeODUmh3d7Yv2s
 m1ZLDJom2mk4/PsZ7+hs5ElKD43s1+BZ22SedyyJDnFWfkYhw1y4bdW1N6XUETroXA1mUrqtn4L
 /4N65l0qccZ7IcMYEIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable DisplayPort0 and DisplayPort1 playback DAIs on Glymur CRD,
matching how Mahua T14s already exposes DP audio.  DP2 is not wired
on CRD; DP3 is the eDP panel and does not carry audio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index be0a2cf10f54..5428c6a45ad0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -298,6 +298,38 @@ platform {
 			};
 		};
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		va-dai-link {
 			link-name = "VA Capture";
 
-- 
2.53.0

