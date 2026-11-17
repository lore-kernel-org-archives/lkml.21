Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956471;
	b=rIPgdOsoWdzOZK8i1qU+EBWPmQkWpboeTZ29s8waXrGKzwy3rv6GtcUon844dcBxSbXd
	 dSD2ZaCcodbe0kcvlm5Xjo3pu/zDjXrv7Ondjl/MWVfRpX3n5jqBIRZOuIhZW0Xjw2EaN
	 zjxzCDleBS/WDhILkCY+IS1KaLIVDyxfxX3XPrLkaWlkrmXqPP563LbvyBFf2Qv7zWtwh
	 VZQ15hPTqm8d6KGsaCeV7cmf6bn5EBjq8+wSnbmk8u8FeD7zr91HTN5G2XPtwh6Lenxze
	 xrvXjtFBM+ycY4u2Z5aYg3hPXf5SXaWSr8Ucc977n2jWGjzYqSzJ2dxgGfHBkEfzWmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
	b=NKIXL9JK9pIOoO2wAtJo0jvLSjV7KGJNqb41sgnaxxEub++hvQK0Ez/zxNou+Z+CaC7b
	 UtywKIzLV/dTr2EJ4YzninGBBpadB0nltuHPK2TogbfWHDZh6OJOS4NJgJdJpzQLlW8vE
	 DyRObo4H4apM43KSXu3PYp4vUDahwWhSaOIMqTO1W57ivmSRyuXvdIHptDLOkVNr9TEf2
	 rdGjLf/5d5w65wxNNg4Z4UO8Z33reKmW0MoiR+y4HqU7gKHzRXtg7yI3g95lfApl+NnTl
	 PLOV8PG2BFJG3OAyof+eCftXeh7NOai5C2U6GvL8ny0+7EwkcI6n3uKVGF84paMfMHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IG6ynn4M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FokxlMrB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87760606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87760606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IG6ynn4M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FokxlMrB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMm4Go1509494
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=; b=IG6ynn4MfORNEa8i
	XJ7nyp7/PSx00XDLozkwGJINbGUMdPwCV+pXCJWRIWt+TsbOydlIT7Dk8YAcvJ3e
	XxnfGAxnF1pHN5x7GbuV0kQsuMYEsQp5F9DfsJ2wPb4/N8mnwjm6LWX8EK3VgYyM
	g0MvMCfQdsPePuGeCuUPDRvwpdMr8pWHLWko96mlHQeMpclPd90+KxJ5FnzGCFVs
	2F0271fpw6lrohvi82PoDOSLs+XH03VMWkpYMy/srrujEySvw4dhQKzwbbfqb8gW
	22WShGo8oAqo3KBnsGt39x+pv+nUJYRhpay5kZVlw8VqpCvDPUpHajfWx3/9pJbd
	yJTKSg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8g399-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:01:09 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso393918c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956468; x=1795561268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
        b=FokxlMrBZbZaCJq0g8KFfdtemnjJdkHBo1+3yVozv6R1YWFJPpae93m/XlHY8HOYcW
         t8fsdbz5Emai2z1fKz2oJa1th3HxlHryk2xsGiDOCr74csUS1BbqUAf8uc4eB94odBTP
         1CBHNtgTmwKc9ybgX+BiXYMBkwCwXs2pzsbH5L8RxRi67tiF5re44cjGuErTY1W3YJhd
         HDUt65/4Oi11oFrS9Fvry5oTzzdIR5lMWZjg4pBGObNIu7bbxYVEOfLCAQvqZYRuZQ32
         pm6j3qcKKf/RMdeSS79S4cciFclkamELir3zuu6TpmferVPW2S2F0C+UFkKK280Y6ZE1
         j/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956468; x=1795561268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oGuG6gtDFzH4M9TtmWAc4LvmLxE8dx3JMMf9s41U1E=;
        b=wRFTCynP03NRt/mwvcSgsfx1xOdyy1tgQNjhD5GfGkzSRCJFuHqHG+cfO4cqMt2Cbw
         mUt1TYXA6gB0uNqA4wk4kE05Wm3KO4Zn+uHqwTmx60PuoP0QBELLCuMoSxGxdnCy2kKs
         N1u/92QsKrhfAB30CDxPkRhrTpIoVUjpnwjPrm1iZsq0k5I0s2G0a6Arya/8dzyxqylV
         kp2LP4bb08o0Wd0P/3nxvkcHmAd+00XFU0eKOcusD5ejYRUJ8CFBkXQv3mmETOji2LJb
         Kr1nmogvJzUhxiyyPgB9DD8emU/VUfxkJ7BEwonvnXXyyPFNei2k2hkJaHlNMIp8+H9k
         BXTw==
X-Forwarded-Encrypted: i=1; AL+hErFns7a0eruaP6bqplDZ0s9T6g1DbJ55kXtyTZgcB1kmSWiytHqqhSpUA5MgL61IOSa2veahPyGijvTV6KU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vuAYinQag8s5Xm6WhHsoewW9fkCBYA9pfAh0i7wusd5yDt6iY
	MgmOzgp+TwAgt9ZB4gi/mZmvZsGXkAEJyQgQ/Zj4ftMlmdNuejpU+oARGmZb1ti7VhF7aQXbuV1
	1wjiAK0dQjU3ykSwmHVB/i9yQe6ifs3BkV4XbaQm5PqIfbUCsapspWedyecYQAknjpSQ=
X-Gm-Gg: AYBFou2hHrYbHpcFNXt4kfhtaOvLOZ6HjQLXmjAaSwJdj8oxYxDmP6pBwUAX1J+edLA
	pe2YwacuCbY0HMKEt8IruasSjaz1rFQFHHkmukcpwkjzcS3+YnGQFPgwNongOjduXCM4Rb/39B0
	eriEkQQcxe2kq3k+0qDZ3ejqK3JnoPIT4nVedkPk8gvJL10WX1X4B+OUsUoNxFyTvwJNH4hOr3L
	JlpBrSGdxbziOvhD4V7XdkOZcb2w/Gq8Q9gM3ppxemrlJ96ICqkR+tkYg+Pd9Rqouy0mPgNwkiU
	HzQ2FWJbrYwsYA983W1TRKAIpQmjRf5fWG2dSR2wggcXuon27oPu2y7RcE0sr262QSWWT/CpYjN
	yckL79JOspU3ojaO5uDPnIirb8HlPQFPhiqnpHD2pp5/VULWEizaaNipnBjKNC+gAy1HVkbvuFg
	==
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr799559c88.32.1794956468056;
        Tue, 17 Nov 2026 15:01:08 -0800 (PST)
X-Received: by 2002:a05:7022:1408:b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b543d3cc31mr799517c88.32.1794956467368;
        Tue, 17 Nov 2026 15:01:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:01:06 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:08 +0530
Subject: [PATCH v2 5/5] arm64: dts: qcom: nord-rrd: Enable Adreno 753 GPU
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
Message-Id: <20261118-nord-gpu1-v2-5-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=813;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PC/6atmGOO+qaJdXSQTumHCgKU+rZftW+u9k7tGoypM=;
 b=81oJm0yeVzyC+ZdQ8YeQRpGgoqhdFgmG7SzEXxTKhIsLI1fCeKTL9ePwIANNm8mrrw7xegEy3
 9ec6KAziGSTA7y956YGzjhQFN7vKgoYnCfCMxA2xM5oEu1cy/MU2psi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Ipedy2X4c-c8xhoNah6od9lTpX851-TS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX/VrHC9b7lzdg
 7ggACcilcxNoStAcOMVysRg6x6djPnV0Qmto5YrZcXdOxYGFAOkr9CwiOXxs0XnY8cXKeDsScX7
 JktQDn001sNcDadwhCylOuscEvObaQQ=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afcdcb5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXx4H3ogj+olsI
 WhP4AjJjf62OqiBp9IFOfWye1KajqB2EZmlAQ0Ab85V0UEg73U5WUwrwPwx8rymONq+hOn4WOWe
 LHQXdFPlAS39ChfdZglbr7W+5gbm6WcZstXPs3UhvVWW3rQAWxuToi+3Cf8BmCNGbgxulw16k23
 FG/vI0f92CxbKWrEaKMipB3LDPnyXg5xrrJBxmQYO2NE1wc2c6Fk6k9P5ZPR6JNBjtxXy4ejqHi
 o+4A5jFALPJZo66KEUd8CLRqLJspsW2ahuToYRHJ3tm3jpsbv7Ntki11F9YZCmxbr1mIYIc89BB
 D8ADOTEwU4aiuzECWT2t2hTvlmmXJr24miPbKaTr+8hKfr/LnHbRXx6+muxiR59vkOrChnPqWlL
 h22H/URlpGE/cEyRi0zOvJ7pkfVRzG/Yo9yAKHjeBpkaA4RKaku64YeWZtcENBZLwN6DZtj+6A6
 idMr64uaXnG9eM8nl/g==
X-Proofpoint-ORIG-GUID: Ipedy2X4c-c8xhoNah6od9lTpX851-TS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Enable the Adreno 753 GPU on the Nord RRD board and provide the
firmware path for its zap shader.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..51e5ef927b7c 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -366,6 +366,18 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&gmu_0 {
+	status = "okay";
+};
+
+&gpu_0 {
+	status = "okay";
+};
+
+&gpu_0_zap_shader {
+	firmware-name = "qcom/nord/gen71300_zap.mbn";
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

