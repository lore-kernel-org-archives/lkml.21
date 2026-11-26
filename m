Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718309;
	b=R2i3VFNGKK2rAEqWAbOoXo0VpckDsdzo7UhEZhATFfmZWqT/NIJ0iNrsZUp6YxWe49s9
	 CXfEDiJxpr+m4dVk/gmXZ9ZIvqdic4JNIdznzA0rrAtjPfy+ePhEiVcn9uiP11eRQbhLt
	 EKnKKIHidoMIac4shWmRyxuCvaFZH64YCJ6Ryl99mx5LAKAWclhnnRitCFkZs+Sd6rQtS
	 c6ozNfdkFIwTx7Qpx3Xw6UTz9Z3Mv7kh0fQ7UKFvIRg5NHwfxvN543cATm0IR7fqXde+m
	 NpQr1SyNiGAPKzF6+wqrUNAVF/mKEjo4Yvx65MxTwVDW84coMFfIBfxZSgMudcADD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718309;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
	b=dhjgoHQHpHg//Zvr5q1C7OdPVI/hl8yh8in//Jja/3G9DpFJjObNzQ915vb3n4VZ+Tv+
	 iYZ/SRlhSIfWiBWV6xZJyeijc2C3nyFA7SVJZ/arCXxSZloj76zCUDsWhnf1o2FFbfa3/
	 z0zVZAobh3kHlRHzymxIRyJ+cXZThp9KU6URN460oU0FgVJhQdCimbmRiZUIOwz0bJBKU
	 WvIrInUwj7xZqhz4llgpuxWkCiw5/d4q1LVCtlUIqCW3h/G3kXUEKQy1YhZi+02GU30F3
	 FzrEE6LoLDpD3a21QGKRj/me6su809dL6UkTHkTd2SlmwnK+1S6vug/dGaJ6fFaGn+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7B606A698
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC7B606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kuKqrbZP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RCIPHABe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu2Kq4049018
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4cGi2mqS1eP
	+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=; b=kuKqrbZPirNfBCfa3QKN6gTP4op
	6Zxyk82dv5sDJdlZuOh4mP2Wg1EwwkQ1J6in2wE5fVMaAJM5wbBtVnk1t4cZ6PVv
	d+nczlGzEUj+FG8zV2GKyS7RxlT5VOPt/ZVPxRdAIpwA8YVVbetWJ3Aa/Me2EumR
	/bKRdt2ZtcgKb+YMYX3KqQ21b3nxG7NjY7c/psBtz1kYe/UJF9+du8AND6yorb99
	Cyr922awU32Xy3jVCI1LDOqNU72RlfIzCzZazFgLoMTUxV6FNFVRpdWHaob1Bf0H
	qh7MT9GSsgJmFfSxFSiD+x2pSPYxg8tnj668KIEaqfEmxb9PCudep1cd9iQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjjxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:38:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363763b556so134415281cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795718307; x=1796323107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=RCIPHABeYjvdTYSx+RUvTx/9Xn/zZnbpDUQHo+qhN+Z+TPuS21OX0nj9djx3JDYWOd
         RpU+GLjSaLLLWRbFHM4oVVl1xx90hsBfc7MX35YSE98vYHrhHGHl7nHTJaJblUUXdvk4
         QkbNTtnFa2wtKZ8Zgi9APjzn6TJZ9O1HFluglv2/BuPyfi6xU0NLealpjDCBWHiTC4iV
         o3Cngm2v9xUQujTQZYk6wO6M0tfYm0ywsVLcg7jCc4tTZqtkceJzc5hsKA2Xh56ZpSA1
         UcZcS5O3sZ1nWK4HylgR/TU5AQ1jSHtT1Jt41C/sF0r+t89u9ri+bGqsmlZxnwKkjIZC
         EMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795718307; x=1796323107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4cGi2mqS1eP+d2+ISfQymAfpmIUPzNrK7HG192QkGOU=;
        b=JRMhDWzlRA/06oiWpTXijCzbLNYhglk7cNZJkLRwX6IfsvSwnHIdl6SSiQN9gTTHSn
         Nrv++S6TNcmBSCSlWgaXQYYmDyarchuVEHqDEi+wTJh7nTfadIwkPMwicZIu7hi01d30
         kQ0DXU0ZcgjsHVsFQoZSqpMdi1t02cuOJGO7L+RIYh/m64PA2LpWaRJOibs4pzn2TBPz
         uYHhGj2VhRojPCrUGBkvsqwKrq2w+zbiJ4MjNSZugGpUEXjldII/Umkbzo+FMoHfLuAV
         uR9Rt17ppwFtjG5FGF8uBxgGnO5L783RHe3/Ub4hyKpVl3QgKO1mL2sA+TTPs/ZvI/R7
         XkWw==
X-Forwarded-Encrypted: i=1; AL+hErGn/L8OS4H2KOcVfUjTdAps4pLZAdUPuzjvTKc8MSTFej1i4POdW4y2+tb1N81di8u8/9wj+ZzlMHDM2P0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++PbcIeiBhFYJXXbflgy8jrK0Ri9OS4b9PLWgbUHNFYw0SFAKJ
	v7Mvh9J/PUfi/KtUKndp5EUsKTGwQXQEIyYtOdYdf9bgbDzJF+GFB6PyMQ5tkRWUx1FsEj2+OaA
	QWbDje3GZCG3b2hB2WpZ4Ch00gUmsZ34DLJwqiOaOLXCMBX2v7oqjhaycv9C4H05uzLg=
X-Gm-Gg: AZFdTZcRiba2fb9p8tFTAJDEBb+gr43eEYX5h634WZiNo8qwZOhLKd3RzD5hrPYs6DI
	Q9a/hQkGbZzgvMthrxzMQ1SNdmJSdAQp7aRplprvdVwq5MIQtOFM3ZpmPgOkGaSqRNoPZJQG8P/
	vDDBh8xdB19xANrAaoIxRcAFx+8YxERm8VhRv/Sz8VzTgajmPh0vGyNT9CLf6IYSmQvzz+m+ESj
	Bfs87ZnZ/DIfwOECVkGpNBMf/Y/MVgcy9ft1hRAxSE1YtqX2Uk16Gtuwx5GHCxsGp/U5XiyMHe7
	9fjWOUvo+8GVnjl2ogiGhT8MYn1betDVX2Cuvqi9m4v0cTnxJrgJQEhV/JuQBsqAodetI96sLGG
	ykHR6/1fKF0F+bBxPXKfJ2/QV75c8nBHvtFM2sW2CpiVdukjqW+ECsi83aFKLYzmB
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793963085a.73.1795718307192;
        Thu, 26 Nov 2026 10:38:27 -0800 (PST)
X-Received: by 2002:a05:620a:2a12:b0:93f:1d5:9973 with SMTP id af79cd13be357-949bab5a6a2mr3793959185a.73.1795718306758;
        Thu, 26 Nov 2026 10:38:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm239659035e9.3.2026.11.26.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:38:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI links
Date: Thu, 26 Nov 2026 18:38:05 +0000
Message-ID: <20261126183806.172485-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX/p0B6ZPL+M2R
 2jpfRJGGYXLuuZZyRQFU6bhBMDbV52i91ljvVvUO2craGdwdtW026LpV9dyle42/X9/hgcqBfr1
 T+ceeKWA0Hz3eoazJeccvMiuYgwf7bHzhf3Olw5OiLyxyJ91XKz2kJw/p9pNXPX5Us9UGAysiG+
 SMLbYSHEKTARq4GXh9at9cgF9YZEBm5s8u7fs7Y2Eppil0isg+aZsZY0Rc3rorRK+GH3R2iTQeN
 3F5ZpIzRmt9rwbEbngiHcIG4EsIiAGZq7swC6D0UQiluHk9pKk649XCLelBodAXG0ctO3L6aQ4J
 i7VoYCDzxFzOoLdxcAcxGVSQ8RP7JPnxx+7ztJzNAQVnbATbDH4yYnIPE9V/2Ce8qEoyRnbY5A1
 55iVhCMSYG8g7DVeknvT6i1Bp2DTYD9RlaS8CJ+0ebnnm5US19AwleM0XYjaYSj88ChkgE5BDv/
 w3+QEZcFCrxWyHwsLEQ==
X-Proofpoint-GUID: PrCvO6MGG9duzypKDxXdIDa-fuv4cX6l
X-Proofpoint-ORIG-GUID: PrCvO6MGG9duzypKDxXdIDa-fuv4cX6l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3MyBTYWx0ZWRfX/gxObLFyQ1kS
 8YGEI2rv/aj0XjeBAYOH1Ea7LJwaMd5W/Zr0TTwtSJF3sb9pSGoVfGevca4mEB7zUsjN+rYkx9H
 N8YsUOwt1ynynbKs7epzp1+iAlLepPY=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b087ca4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=HyG63--OPLWJJjisoYgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260073

Enable DisplayPort0/1/2 playback DAIs on the ASUS Zenbook A16.  All
three DP controllers are already enabled on this board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index ca035f10dc6c..70efda9ba2b2 100644
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

