Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542558;
	b=lK2qVCAVWnsvzxf4Zk//hgSvGle19snGs9AmfIw0EucJsIA4eIkVQQGk2Nx8w1yMz2Ll
	 Exj7hAWO07caHjyz24GWE89JX5Xv2dXBWLSkqnlU8Q0atuhDEUTK/iz10p5mfmqMz7YtP
	 ExiAIpzEZq0Vab9VSMT8Cglz//uRPJ9SLeiTLjZ4tXbPCg0/RHwmJM4sbP60tcqirEkay
	 t3VdJf7g+VmVIQPOwbkkwScV23bAmZ47TiI/22kG16Gwk9WrM2wTlcL6tH3XkWYs54Z+w
	 FnOlvdJ4+UcatQKOiY0SPOJXhG3k0/zgXQJh5ete9+3JVwXwvpmkDz43jt0PqoltASQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
	b=H9M5uoU1DbN1iGwwi5J/oea2HOxlzGKqUVSWDkwHaDb31n/0jF57JbbzqnEa2wpG6Sxg
	 PLuRsrjy3PzMnXiy/Eed8jEXN4e0T342oVcOGjlAhhvENbOQTCh8GUecrKUGuJegioofs
	 b7VCvNZ38Mkjbduq8vpO+Pox5GssG40ZzU9X6o545/iUkNrOGrAZfaRxazGTXMoRJ0Xvo
	 517ug5oW91pX9kuGElr2NH6IOEwpHK8tpPttz+SSSWOQe3dcBCOOeC3ozAZeYKo5Dq309
	 92VgZhdcRrn0GAaeJXHEip7RASo6cq8NpEftiVTQPSZ4xE3oa5jLFfBMeV8MFRQz09A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I23tXzeX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHg9r2uY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E18606A339
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98E18606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I23tXzeX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gHg9r2uY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOGs1JT1541859
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=; b=I23tXzeXPGo4gL1G
	ONfNNJDfXDfarmV2KsFXi1eSzNzuYr9LU0Zf1k4t0Nyxvy/XipkybtUyHmTPhGjK
	BKkqUVvyiiZR0vIf+KhtZiXXWioep9WpfvzmPprMz8+IHwrRYPHmeLk/je/9gZQV
	h8FKmlc2qG96PUuUJ715F53LZneSGxcnQMWG5uAKUisRWOvdBMyAam59T7qS4d30
	mK4FI52vUse4qDKGfSU1rCi/o4m9U/vhBzllTrGp3Q7cdWxrokiNLEQc8tKjgNIU
	bbGL1IyW3tek7jROTOiqs8XOS7n4k2Ln6RuPET+F/WtgFhygyTkgocb7BffQ1Blb
	1Bgz2w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs8a1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210bbc04abso93566276d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542556; x=1796147356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
        b=gHg9r2uYIBk8O4s7T8KNDqEt6u7ZTzrpGZOQuxztD5qvbERcgEYKxo1gK+RiOZsY05
         GyNftDOwwaJ3u2zqC3KUl+XDJI+7X16wvrRTkOW0XyBDEqT0yAEqgGlOG/pQbUA8pA/s
         os8Mfg/gbfc0FqCyD0QIxMzPRIffEYSilRjlI2bB2Q9CcVCRX0GxcljYtjmJ/B29tCB4
         rsBmLaKX5ZBHmWBnpSOIOoIvPsWJWlCXLbSiWsv0TnTshlOJlgH7JMbHXBCH7i2PLqq3
         uZynm9bYdU1xZhcYGjmVU1GJ2LQq8hXwlMn1xpOr9/PefeGDkfZB21X2JsJXaBRaI7rX
         Bw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542556; x=1796147356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvhyqEHOHCh5YYp+Y8pXJC/Wkab73TO4a8NMGWq8jzs=;
        b=o5r4iOexba3g1NAYQJo3Ux9LjVx3NbajyzX6iyEeUJoASHuq2cjr4sEy0yKdbSCFSf
         gwhfWpUoik16Z3SNvZr2ri1Xk+TzIxjB64dfIWTRJbYa081SM8SagUrjLgtKwJq2Y6Vu
         2TkqbwnnCoqMU7zz1Jt1CbGTQOjbhwV5YQc0MM7ZL5NksmH+TAY727LvbloZJTd/c86X
         tUG13gng75eAeE/UahrldjYlXNQxyYXyT5cMjlnKSVvg99FZPsdusE9FpWmJk/A0ZjHx
         PvxpKOvRP6vOsnmPIixr6+mErgZNcVTclRrpO/kzVdeKNNcMkMssfgYkMN3gWhFUGFOD
         PzYw==
X-Forwarded-Encrypted: i=1; AL+hErHIsb6zlGlboZf2FNPSOvNIMbpSWjpt2MDV3XNqNtvDlGQGPVRfRL2itQdX46yylI3khal7fusFFaIFJdM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iOgx6yadEs0SDX3OIKFWHjvO2AGgpzH0HyRzavFItRcnJ5p7E
	xV3MA+AdoAotQGklnw8ZWIOdCIBINv+qi396j86WDeY8zSHbTO4mblKr6hekqov75khmQQf6R82
	CFg2z8unxipXZQPj440rKiWN8uduQ2jQvqBtyW/27l0QRMnWlekSslJFTXp5A1oSjoW0=
X-Gm-Gg: AZFdTZchcl4xdDSeE/4N685UCKvjYF3CjlPlkvWThDPTAFBNEGeggVVZ7qU6fO1vEj/
	YbVq8P4CDx7EL59I9yO7zahYk4tGleHB1rjus/vkAez+HN4ZHl/eQeyJJVwFmTDkrYhIWx8xjVK
	nTJuOlF/t8X2ncOkhl3XgJrqAIHlqnzMfFB2WrP/sChIVlMs8BEA6IzWqY5qxcqjbho0I2cHO2Q
	fBch80PY+qPlh9hAHh/W1osdRW8sugEO152B5Upi9cgpi81wMe7JF5THPU95Qf2sGRseVVYDHj3
	V+NLKqpTCk/BTGzdLamzSJ6y/uFgD88IBC9QlgQVoMzFviL+TVHLNb/Rh13J+yKLSKcPqIEATXO
	SzGKcnjS+BBvikxaCNTTehpu0W6wpqUvUoOqeMOq1g4JThVEu41pRpxthNrkai3EdAojgtplNOI
	k+eRE33Fl13GfN
X-Received: by 2002:a05:620a:6c15:b0:946:c54c:f8be with SMTP id af79cd13be357-949ba823485mr2275870985a.8.1795542556108;
        Tue, 24 Nov 2026 09:49:16 -0800 (PST)
X-Received: by 2002:a05:620a:6c15:b0:946:c54c:f8be with SMTP id af79cd13be357-949ba823485mr2275866685a.8.1795542555570;
        Tue, 24 Nov 2026 09:49:15 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:14 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:53 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-arduino-imola: enable the
 EUD
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
Message-Id: <20261124-qcm2290-eud-dts-v3-3-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfXyHP3cE0Sn39k
 NSJGELaqxKMnel16LKspn/WBR/CgjP6jqZaAFuUSf6ORt52jnM61lXCi2r+zowPgX0Vu7ja+xXg
 saRTYDTlxlB6/c1bnv1dP1luihu6VvDX6hR7FwhN0OAXNhtghx6VbGi+cMJW4qeplkvEVKyEtBr
 otd2xou97adBr2J8xgpKos+bxKMdAiAYjtq100m1WU/HSDsllBEZNsOETkuxfnpl6a/zXksID8V
 h2GTQN0TEuQEICWwYd1nzVSZwtclLHYL25PmBNWZWf6U7I/lUDU/EWjHXLAHqHqkCrAR1YdunFI
 XvdN/Ui993s1pXH65TBktJ358eNneMq6H4t3R/d0I8fFH8v9y8fI8LnAhTUngP84WV2J7Jwf2QC
 FP8aIJxC3H5YZIAazz0N63UsHBhCpgZcrSh15UFFSAcGu6WPA0kIewPf6pe3rtqO6VppsN3CXY2
 kj7TtlNPdujIHoOSprg==
X-Proofpoint-GUID: uPfJ3ef69Iy3EGwXS_yUB6hHlGDjzqca
X-Proofpoint-ORIG-GUID: uPfJ3ef69Iy3EGwXS_yUB6hHlGDjzqca
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b05ce1c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pvBjvzZ7d9aESBAnF-kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX1iJ2n1IV+/SB
 jrd9oNQnmLfB3vTHgr3XWT5ebJALVl7lvcrMg8TUn2Cy/ClzTkCVxjDDh3J1D96br3lhkSZ6Bi7
 +lIb+w9tc6ez4/IQQnGFfaV87Dveys4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240069

The UNO Q exposes the EUD on its USB-C port: with it enabled, a host
sees the EUD hub and its SWD/trace functions, which OpenOCD's EUD
adapter uses to debug the SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index e99d2a56dc28..a1af2caa5bfc 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -226,6 +226,10 @@ vph_pwr: regulator-vph-pwr {
 	};
 };
 
+&eud {
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };

-- 
2.53.0

