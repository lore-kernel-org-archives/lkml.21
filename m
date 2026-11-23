Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452189;
	b=P28Om3fAdLlaQA9Dy9kPE8QuuFHyY+dRlen3oog5WhxKm0iSRecb6O7tt44J7AhFyxwN
	 hzTAz90bahNw3rQDI0SMqUQ8IkdRziln7rcbKiMH/Pr5bPFidjHozg0IX9s138HqX1b2i
	 EWrwTjZqwvrDj6Kichu4XMAgovWySpaN7v5vibYgaCDzpZgTuUjXxgaJDKY9xucPIncrT
	 9B29bo5NPFnxn6fW2CjayUAcwNQAU1jAPcTk1gbLfHp6jyXLSZg3J/SqfgsAYkcbdTpbO
	 tnAEFBAGLgoCj+L75p3Hz1/uXv3tchKXeGQAJf8BH4PRSAqVgxkQ374VRhFiJnWPoXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
	b=POkK58P4ngut38Hc2ZjXlcT127Vjw0mRDOMAykVqP63FrObtYhLbvhQtn8g0Xn95AHmz
	 gJjcmmxEc9P0iV7rCQkJZfmcKxsUO6M6g3Eo3/PASFG0Zx4zAF/59pALHCa/rj9CKwxtd
	 X8gHO9HbqpOZr2CYKu7ZvCKx/Z846nzjYZJT6rP871Er4Qd1Os+s6Iv443+BpBijreeCA
	 Ol9xQUMrjA5AYpQ8Cy6hMzR0Oszj+YgiWqhvQkFflmj0FuMACMcNhG4G9ad7qYdtk05am
	 VQ2Ig0PkNWZcDqsrbnuEvHCY3XMd6voljjoJm9Td7XnzokypzAmfQ1w36zRz/x2jpgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jVaG/tJP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DXG/Q+Nu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8ED606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C8ED606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jVaG/tJP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXG/Q+Nu
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmBF3730185
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=; b=jVaG/tJPi0r5azqr
	iTYujdKSSFZiF0oXoaHGBKaO6GK2EeqBYYH/R2kMDVLZJhFMvnvC3N/l8UjI0KM4
	lx/0zs4BV6JRBDoWACHFkH/UWq/hTNj4fdCCTrHDOIO+Wd54RPFyg61POHHB3P8O
	P9KM2OyBzCWox2oAa6WxHIcVQJf5Qktgie1qgFlAfl0JvOcPn7dQyfkIzsE5KO4G
	Df7UWLuBZk4LdwSGEUYEctt/DZksROF+bfAYjbhNygHjCaItPhji+MDZzwUc1E8w
	Gl07qsYMsDkSxvlJQ3RhVbG4Y2JggiZoGDnrGbBNJgyF7b3uHLhMebIS7XkI95XU
	1q8lyw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2een-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:07 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99e09f506e8so467046241.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452186; x=1796056986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=DXG/Q+NuMFr7Yuf3I6NXdU4VD17Nww2DhT9CBq+IlA59etn7L9LJ4qSbLU5gb4kX7P
         GfD1tMl87Gjd25P02rwETrqP0+4lzVp+OaUl8qGB+Sh/z0FtBn7d8aG3FtVMFHwW28p0
         ztamE50DOdvSyQLNm+r18CNW1X/bgAT+vJDA8O9PFxCfcAZy60NfpSA9jucMYfQ4mgVm
         r42/QUuXAUfT/rFvFHhm18Xw0qkVNehETSlC8AgfxUE3qULF7rPyDRp1HLIL+3QXC7Dz
         vp1lNqb3+QCEcKFjFxI1ROkQLJsBBBg4MG+4nHa8BOMppZ2pxuLrZL+wADSQbjNqbfmD
         3CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452186; x=1796056986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5yNgUL2BDgyfbgrWsnpUHmwm50nYFdr8TLu0kHo2HY=;
        b=btEq/LwjQ0gV2vs1IBQUJYmZ0DVOqcSHRdrik0xK/AseUMSA+HR3MSITL3QEpXnHjc
         TTprJkdYvq1PrU+HG3mS73nkmq9SpG+QdM8fiize95+NAfftkPWPKfFIUMWFl/E/Q90u
         OwUuHZ26u1vbLGa1CfLMxyosvuZLqWurQeY3eqECvR/2FVvbpcxFGIb21OLpJBsdfY+I
         1SFBZ866aIx7HrNrkw+QjV2qx57vz4hFXNWj6w/PwnOP8CUm4fV6PfNB94gtNqkH08Pg
         yMWa5SP5rOeVinSbYxzjWewWQuIoOYiE1VFEFz8BiIk2vZVT3rLTSJz9UrWUPmwcXgk1
         M5Qw==
X-Forwarded-Encrypted: i=1; AL+hErFfcYtig+lCTa6kr60Ws+oJCid8iKbPedgqGC4MW9HMHewPz5PUzzRQM5PHMjDvyNUmGlhb82ykB7rbHQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qgaLC4uOKbtjGDH4/ObW4331OZu4/OLDrU/HYaER7dunIy8Lp
	ipX0b4E+yyg2oosJ5nAJ+jZzC9AEliQBjVqD038Cn49eFKR6h3NZrxXRPJlTLw209u0Xc34R6/F
	SGURK6qcjtY9GEzRtM4wZ7aMZjyDd0znhl62XlC+hEC9uJ+g03ytWIeIOQeAgvZ0RsdaSg+uHw8
	8=
X-Gm-Gg: AZFdTZea1QUPAbRzsjRwd8gVp8kvPsfF7IEdgmcZ6KC2WNRDzkuL7NBKBn4pbhjRZB+
	SD9jqlhMdVf5LGs3sN3f08u0p+ILA8wMWW6I3eNP16b/nVTcFI6M2BeVDwP3kNibKEzkkBO3ega
	M1URzzRzgw8XUUNZkhvQU8opHVqnNa6KXF8PzV5x74t3Y9qLzqOj0C4gCWPiAyi0OJBooRYP0rU
	sb5YbKe6RR0uaw4KFIq2IYdfQgvZwZ+oLpa95oOFgM06MmwSyrIzNGgdUn08I3dqhHL2eyZOFAf
	eGU8OfqiJK826jN2ppT8Kbxiv4j/7d/lWQImsg4OTRC7HpLmSp/pUff6CYsntkIygdWdSFvHkQj
	+l2J3P1MjieyJ8qwOxTrIChUcOpr22N2IZHg/MwiDSHbX7lHV8RxCFW27d2gfpwmnoncklsRsNk
	Juz35JH5FAyQeZ
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452475e0c.13.1795452186364;
        Mon, 23 Nov 2026 08:43:06 -0800 (PST)
X-Received: by 2002:a05:6122:2493:b0:5c9:a60b:e5bd with SMTP id 71dfb90a1353d-5ee8aeff63fmr5452457e0c.13.1795452185869;
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:05 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:56 +0100
Subject: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
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
Message-Id: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
In-Reply-To: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: iJ-whuhatki9KC4y5yjVRbQqC3E3AAoi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX57/tKGBFmfgi
 QFacV4W//wCoz/FOiTMcIJ9J4XflBCFkFU0/vQLlacnNSu9TW8rEI2Q+eETBqTPgnCA7Caj56Pa
 fmHpPfE9WD4i6dWfQTCpvCc9IXUs/MNPiTil7dP/HGf4RpbX/wjwpwzxkSXz2DRxk940CrCi/un
 qULufa1cQj77GG2htkj2RDXyu7BnYmKcvFF2IptVlFZXdr5rZGTUcC2+3Y9GYphMah3YwBWQ3Hg
 eZ9QPH8ZpoCMTRtisK0WaGPSvYgiO+q8KVZV+uEuenIrnDdIeENI7oqvfTZ3XpYy15p39YPhUGV
 Wu8AE/Q2ZgmhGCZrdV1Z9EMM9LTxRMov2La3TWmTVqYFHBMCDAwRRc8wW/n8YLztDbFXAiK6Kqm
 a7MQwbiPL59i+aG4u13yZeMFuWgVnDAdlCU8UvZu9QgosHcSVFdUg1uXF+5t06K885R7GVMLD+q
 UrwuIB/WswI9JC5dXCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX76sHT1ki/Vss
 ftVTctbUuhJ/cDfv5/p/GDKFqtia72AsklaMyI+SjfCYoWkOdP1oQDI2867ZgRNomMhaHJ4Y483
 URBv9ZauRN+7l3r+MLM6Q5rMHESFsuI=
X-Proofpoint-GUID: iJ-whuhatki9KC4y5yjVRbQqC3E3AAoi
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046d1b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-IlMunDoKa5HfhwsZc4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

enable_store() sets chip->enabled when the EUD is enabled but never
clears it. After a disable the "enable" attribute keeps reading 1, and
eud_remove() disables the EUD once more.

Clear it when disable_eud() succeeds.

Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..6743a1c7d717 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -97,6 +97,8 @@ static ssize_t enable_store(struct device *dev,
 
 	} else {
 		ret = disable_eud(chip);
+		if (!ret)
+			chip->enabled = false;
 	}
 
 	return ret < 0 ? ret : count;

-- 
2.53.0

