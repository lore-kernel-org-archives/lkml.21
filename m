Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794944;
	b=E87gFkEw6i9qgDL1NMQZnv1pIJqhgV5JbJjbLKKeh6ojyDM1kHSb19PfNMmHwF45+WAG
	 ISKH/hEkElhSfw7MLKFVSIVgQ83uLtW9kwLoLvniaR4Q96No0oJCXtxhraPHD3DUYI9Gk
	 te9WECabdoZPaK9oh1O0vUSApEzmy/tc8EUVJiUy92Fq3Q6QaqZEXVkGkjut54ru8s8ac
	 1PKdl2yGa72od3QwubEvPZoh5Tk66crr0x4H0k0xdjixtAI6/NpoFIrcymcSCy25nIONE
	 pC3cZptHQJ9tBPIxXrkV9DhicszoymiZBhrii3gIFmcDIuu/u3uF8zEFm0zo5xh0BZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
	b=oKjLGMTS3wOSXwMcwCfZT0ly6yQNVtscl8I1re1dTw+ln2gC8I4PmmfYgm26J90n3fMh
	 spfY4/4jgbUArXubQ0Yo5j99uPwO5WyJLtM1Zz1SoQlBlkljSHllLsFd9motgBC0WpbyV
	 4rJ2W6gPyvueGrhsdY5B3FcR2qH+/Iizfk7SSLSi8HwTxOzviJZ+nMVOAnbJ/meFAc3+d
	 RUli40/mML/tC9nnITNxZLCftKycd08LCwWEEUweqoQBOAI3SUdjRpmcFJHxYJcRlTsJQ
	 BTVsHYLj1M4dDfCXbCrYyzBFhfYRBOW7jYQlaH9HdXj4TU99FPqznp5PPs3T9DYCq5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4035160A2600
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4035160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l75Q4gj3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8dAAePz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFovNV2923864
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9nbCdb+Wkcs
	s33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=; b=l75Q4gj3xPtQT6qzP1aWYxQQZz+
	HMqeTl1UvdzXGp13Y3jS95txfQbIsskxTt46zbh+S5OP+g1MsCj+GR593ZbEhk48
	2KN5+kqpgTPelcEWdyiDcLHdw3nvOewFOpryhoGyifCbH9+t/DAwhpH8NSR/jQ7a
	uTZHwHkw/kQdLafjmjZFM9v7VXTDpBzrAjHTTiPPbde53nebF3s2RV+A6LId/EJe
	jtxbQo1KWT/NZ2my+f+JqUHSzh1e+cJlROabOFcekuS0f8G8yLUkYyOE7KPNbl/V
	bFgExzddoN8Y/7pEL/tBHjJLfbCaJog8L/KHTSTGCuRNB1TDl0zfS23Jbgg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhjbay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:55:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92111028a03so144234896d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794942; x=1796399742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=K8dAAePzvBVvSMjqRtQIBBSWERR7aNAiZ/yi0iNEEv9o9wafR02hPxRg+3noQfXdXf
         3lM8OHv9QYAcLU+jS7J4VQO4k1loHDQ07NfoSSJAM1HMO2KiGpPIBI1tYHm/dAW9ebQI
         Ro3zPUQcXzGlZsggNDJj0Mp09kV7sH/QDD66z8YfI4WHYBoqTYRg0iZAAsmlGJqJb1Gm
         C+ojV0VU6krxLWpQ6O1vT11WdfTn/Ho3UuF4GM4Wyx7tZh6aVesr3AFFAMsyZPhtGWkT
         V1Q9/R/j6E9w22+8VpouZoDOhs7LykgSg2NezALsHqvoI5C7P173zOsEc085oRV1/Tde
         B/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794942; x=1796399742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nbCdb+Wkcss33IJ/qGvTsnfbG3mcLCoMRGj4dJScAU=;
        b=piZtcnuPDfOP5DNNiaJN+cxHXVq0MqLctOIwG8//kHiwalUj099om8l/xRx3TPf+UM
         gNUHxKy47ILiUXeGvb7g7QCtRk77mP9YzQuQkbXxJcf/fevmGZ0iefQaWvt/bT8RKe1q
         GIyWpgE/e5AMtP2MAUjww+4BVqH25ITzlF68pKZ86EHShp2NZhvpHZZvTiz/t8DMIFG2
         kAwPDo9k7RC1ZP7LlQkM0Uj+2nwiUSNakugp40fYhwBAc2hsj2iFG5QBJnK4jWbqYeGk
         ZDIYYBebB54o94k+VUDalkY4R9Zp96IWViufYW/karwk0572MEmJ2ljbTl4Fzi0/j+VG
         JKkQ==
X-Forwarded-Encrypted: i=1; AL+hErE/4TYX7ERU9imCKg1RJG2NhOy1BLlHqwXrxltMQ4K0mTUBCdO6TJSSfHPj11fYLjUQ76UYncrero0/7cE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rj1tvOvXC9nFU2F7V15fAH6+CbNI98n1X56u+dGMLGbOQXRlL
	4itRhxTupT73wSRDg+9Fhw6TM0HgagbIMZzlacV0xTqfHWrRUKpkWtdVEKOcQSytzumswbpl+8F
	06FAzLiCVKL/EFksW9ItWemusXD7YVnLRHEYjcxGOXi2f85g6F/O8E6BRZMYzeJ8zkR4=
X-Gm-Gg: AZFdTZeq/rtfmgnkHH7puMCnMdpVPMiToDGCgBr3P4aYaxlG1ti7odRVcAmlefLnBgm
	t5v54r+XE2wbQDHZLkL4+SJtU4jNvqrhp+Mz4LcdLMnQ8Q5sE7cnSnnHzJC7+Yfq3lqaOB33I3g
	BUVISx8R65dsy9eNHWohKNnOrnDWzXvABZjcAJXMY5ksk5kYaVMt4aI5EIqUl4nsNV9tujAp8qJ
	c2D+GjBDe37YhRD6Xgi7IDKE7oAtXdwEfMgcVcc3co+Dwz3NS6DaVYi/QusTtjoeVyGX9gJFF1+
	A8yxJ+esaMJ99bs6LJvKAp/Kb9u4O58JfolZZhgwxyX9R6TQq18vCc7v/hGkJvDnicDYf+vphrE
	6bJdE5jVN7fSjlqP+/mvJCEnGXnsjrrSN52A9M53nnHL8OAbqZ0mN8Huysy29+PUS
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440883885a.78.1795794942415;
        Fri, 27 Nov 2026 07:55:42 -0800 (PST)
X-Received: by 2002:a05:620a:6f8b:20b0:94a:1db:1639 with SMTP id af79cd13be357-94a01db16e6mr1440879785a.78.1795794941976;
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:41 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Fri, 27 Nov 2026 15:55:19 +0000
Message-ID: <20261127155520.358909-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXwM3UxCzVWu4u
 kjyKNI9P2nnKPyzVEcT3WqOqkImonxsGF2ztsSMDlej4wLrzfeqlLlQQTQmrVsTGdDK4nFVgfYl
 29oIT+qfSMZhldQZtVpsudkab37R92U=
X-Proofpoint-ORIG-GUID: A-lwPgWi-U6xBUXHd5R5QbaN9_UvQvJk
X-Proofpoint-GUID: A-lwPgWi-U6xBUXHd5R5QbaN9_UvQvJk
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09a7ff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX5kH6etf2Dv20
 VgxgVOVNAR0lp3VW4iPHpEZxaSt1yQsCtsERJ8pFFDFuPkt88nEqh5tzuQyg5WXSky1fjeGDQP+
 KELtW0bByHllUl9rqDyH7jxTnEb1jZV+l1ykfaF5yLsqRpcHkD4FY6MCdFFJl/mUs4+bltbXJYF
 oPjxUA7JEkXzwaTXN0PqbgM/GRiX0ickvr99rGTUjX1IjvwpE9Ho0j9caqlY+ai0PVuWCT1FUah
 0KFwRAjSUX5FLzh6Cqb5lB/PWNOOiAuuua9YtXQcdvOQpusc0wLoBaDMybugqE991r+FtY1LegT
 48aBY7aM9OVA72u/yOikT9Cc6yHN79pqc0dERf9u6cXm9dF5Iq9PsDYWaw2f2v2lWKI5ELQ3yAl
 2xDq/PNvHWo/yeJA6cuX0BHGYQzFKnAGaQggQ8tD7w9gXpgfxp1YTo53aCmkIPm3PzVfSSuJMho
 SVjU13AocOmcL8aHmPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 3922d3eebdf9..64740ee1e3f9 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -343,6 +343,54 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
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
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wlan-connector {
-- 
2.53.0

