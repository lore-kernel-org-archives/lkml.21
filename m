Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452192;
	b=o4uUfHLHFtk0GJ2JQKSlinB2xClwRbUsc1bVSgQh0HZmz1mdOqa/FAk1CnSM/qyiRjJ9
	 10D3XaGIY2vHhMFmf1qknKDDOX8cyJG0I+LvWjGKv0xjJy02RGGkyJermhCAk/aJ03crD
	 NnbKwEvz/+8toB6DWa+rBTlaaPwK9u/7DPoIoV5RgebIPQSkamkK7GnGZQB1GUP98Skm+
	 Hak0lsdY/pJ2SVPNz1uoVjwM3uL2aykpNDRUMNfx7iZnpjAlQttUWg+aU0vj2jXpAZnSf
	 8ztE1zOZiS8pow2710PdAWSJVdmsHWhmv4/6l9cAV9bBsNmgkXoeLjQN81BbeTVZMHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
	b=ui+kGL3Oq1sPrTxQuqjEX+V+NrTRRJV1L50uNkcy/lYAxBhAgpO5VKhOwJISmsSsWqF6
	 l7lN1ivyb9C9wLtfkVlawjJ3RE/9FDw3KHUhEItRD/90Iobj2q4Ijjla94mzB8kepQZog
	 RN7/GEFnZJX/PGDHe5RvUnb1CpF5y9JEhZewfpShgQBtCYqkvz+czTYEzArh3HPOh+dPw
	 Ws+T0SWWmJPjl8PcMaxuA5MOyQ41hIWfxx69GDcXNviCpVDh351oX4O0J9dRB9+Hgclrq
	 pWNWE7tF422HPnHl4BkBzmmZ/PjRQahDT6HtNrhxG0jzYHEBLQsWd8fR8SU28mA1sdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBX8tEHG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1KWKQCi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F5D606A6A7
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F5D606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pBX8tEHG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F1KWKQCi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3Hf1093800
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=; b=pBX8tEHGMxt7t+Fe
	gOe9ZlhDZ69XL6O96myWKHan2DOxZEa1hwbApKly6Kw4Nzx4UC71qx3rAqbq5p3C
	XYcIix8Q88EhoUKFJYtpc0oTNaVW49cqViChMZzlBh/wr3IGtabxdf1Z3NRthC/y
	Gwy4x/i12cy2AG1AEkVLQ70hqQ5eE4hflHfL4RBoxxFFKXMTYN1IVE+AgbExaOOO
	pZXUebKCWFfx3GtYjh33n7dkQttKo2afODe/Yorp2Y78Ytf3aMhdhEdt3N9HUEbr
	UHb8n9gIltqmWtgXGMNeW6GiuidpgYr5L4ydzoDh/cqLr66lYLV38uJ1/nVYQME8
	FHSw0w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0sbca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacd2f2229so3106512e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452189; x=1796056989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=F1KWKQCiXN0QA9TuqI1iMKOgfbzhaPQnhVxfMI7NXnfoept/9xO+9iKT6ufxljAZX/
         3uHEFgrxQUpI3efS3o7UlU4x3Ow2cBJPRpNrpjjGdLsYtpJ9cERMM9EfuvcWTb4qTOtD
         qeZRTjLeuu43Jj6natq6M4Pe7g5reI+2Ulwpdp4Vx8PX8Lryg0F/lWLRQHUn2n5Yoq88
         XU6K2yy0sG95pygsQjjx4Kjb8eef8HRK12y0a1IFXs/x3Lf0dc6pPMSQmgOE8rdcTu+/
         RiuPefM9XSpgi/OHnTmvl2eJTm9YDRfN82N5mFJxw+UEpcXerwqB/xSb//FoDmaSuPLq
         VQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452189; x=1796056989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=t/xx91EHT6V4B6Gx0JCp0wO0tQhyCbMXvLrL6vpdwbxtOGrgW3lw9PNu7/xYocps8S
         qGXQBU9e5Mkzs9uBqLCRkj3Zetqkvzl+S42M0ztJdjCjR6cf04GUHdou9n4VzuZsRJKX
         SWYjue+daf+ZaIkzcp73noVdGy+ewXNajmHELrzwWumz7UrbgGqIrPky1sE7d/prPPuY
         l7wxJNQxHgm+6UlCII/UaRsj6pq9udu69/fjmsrHViWzM7LZL1BtggHfMunn0ndG2Xeu
         kiZzz0MuzUZ5jgTNit7r8htl6D0FQBOB1SYiZ6fEGhxbxI6qe2DnSVxXAVF/C8HnSGJ1
         yQTw==
X-Forwarded-Encrypted: i=1; AL+hErFkGBZg+vAxhQqQPF9EkLUdpj4Pv9KXlA5Q7X8Aix3LpcISGSocMshNGTStsrhWUFf/Vt5+dXJOzS6yP/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U7/8MY+4Olh9xHgbQIL6A9IB0BAz8OxlfGZ4BhXnAsuNyQMp9
	DZynFDOwlqD0/q9kGJ3AAkLfSIl01WCav5CkZAgrUTBhq+6fKLPNuT0p9r0WNPEC6+mRkDdjuCz
	Gwe4z3l9Z0pkk/uh2ushDDu7u+5+2dJz9GB+pzdtVnyVlpHIwmWkgz9cbJgTTEj+tPCI=
X-Gm-Gg: AZFdTZftkfIv64LoGIbyMhQ/gYUW6cajHg9d3d5VJMLecSIl5V+4suVe6hYxhqMRwF+
	tfLQXLMv15UlR17baKmMAZdQpZdTE3oZsoh+Dx5UR8qwbT4p5S9CT85JCkhe3WBGWOCVwlbRm6c
	wkMvrleq0Ie1oXh++S9+zmsOJxMEaMGlaM/6Lp42Zdv45vvRw8GbkBzmo/wvZgVOz37lBqrvyA1
	fZ1h15u07pQgYwmwi1vJcF9/NL6vu/HgPp+dn1DoKCb8K7AsYRhkpyjXL8BT3AB46hMGI0Bk8nO
	RDWJh9kqHcZhx7tooteveBOEX0KLCHhmmMruTeZiDrLLjVNOOhfyX35Z2M5WnUOOy54oAt7c8yu
	hgox+58axASLxSQAQF9Ysv+93WE6Ug0zu1ky1Fd6+C6g1C9mRzVMFc4SGaK4LoOu6DPFirh+yWj
	BByaOtWjXxNcLv
X-Received: by 2002:a05:6122:616e:b0:5ec:4653:2431 with SMTP id 71dfb90a1353d-5ee8af08643mr6845728e0c.15.1795452189526;
        Mon, 23 Nov 2026 08:43:09 -0800 (PST)
X-Received: by 2002:a05:6122:616e:b0:5ec:4653:2431 with SMTP id 71dfb90a1353d-5ee8af08643mr6845683e0c.15.1795452188978;
        Mon, 23 Nov 2026 08:43:08 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:08 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:42:58 +0100
Subject: [PATCH v2 3/5] usb: misc: qcom_eud: set the TCSR check register
 before enabling on QCM2290
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
Message-Id: <20261123-qcm2290-eud-v2-3-9bfc432dee07@oss.qualcomm.com>
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
X-Proofpoint-GUID: eS8bluMyJE1KBPVH2lJjXXaHi-MAZ8Kc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX+CDhZDi8X3Jg
 EGVpFcqyKeGc7KjSDPZrUP6ik09cVJBqAOEV4W5Ypinm0XrSIWG7VmJVZnlkKc4kz6WvLSiUY9D
 eoBSuagkv0CFTGOr75HiIizf2ijXagA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfXw59cb4JQ8Fwf
 6n8meGRN1D5B4KoMveL92nU5Mwa01jobMcHALkzQQkINLzjSKkZ/g0Q7lA3+dNZKrR2roq8NctU
 w8icP4eSb1sbkM5Aw9adEj24CAmGqU9csV5bY5U7uLdynzjBy8zlhD0uPZRnlHtMHv110w6ARAq
 5C7g98NbJabu079kDeU6DhCMq6ugXwdVuGpyRVJxwvfTw2cY9Aab0pgKg5wzcMWn6wpMGAPb/IE
 PT5TjndK/QbEMNhQLLCX5EdYceHCtafB1A+sXI+BWGyP8NKcssRNdlLcW2LBnJBN/7HLEflXu5p
 qVXE75AfRqw1TK41Z8mkPrh6F9GNyQFaYAuu4Vf6KDHhyo+sFtVk8ct2PaGOZJktamB2+6byJET
 sRPagSeO6ccOACDVEqXAzvoyPsApJTwWrmSwvw+xE/RR+rDpYECRyhZHvQHGMTfQd97eeBWLtmD
 n1IMWANpu2RJ+UU0GXA==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b046d1e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RGBH_sVsAxb1F4UfViYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: eS8bluMyJE1KBPVH2lJjXXaHi-MAZ8Kc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

On QCM2290 the EUD mode manager ignores EUD_EN2 unless the TCSR
register TCSR_APSS_SPARE_REG1 is set first. Without it EUD_EN2 is
accepted, the driver reports success, and the EUD stays in bypass.

The boot firmware sets that register itself (TCSR_APSS_SPARE_REG1 = 1,
then EUD_EN2 = 1), but only when the device's debug policy asks for the
EUD.

Take the register from the optional "qcom,tcsr-reg" property and write
it through qcom_scm_io_writel(), like EUD_EN2:

- on enable, set it right before EUD_EN2, and clear it again if EUD_EN2
  is refused;
- on disable, clear it after EUD_EN2.

Whether the writes are allowed stays the secure firmware's decision.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 55 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 6743a1c7d717..30ca6ad564bf 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -36,6 +37,7 @@ struct eud_chip {
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	phys_addr_t			mode_mgr;
+	phys_addr_t			tcsr_check;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
@@ -46,9 +48,23 @@ static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
+	/*
+	 * On QCM2290 the boot firmware sets the TCSR check register before
+	 * EUD_EN2; without it the mode manager ignores the enable.
+	 */
+	if (priv->tcsr_check) {
+		ret = qcom_scm_io_writel(priv->tcsr_check, 1);
+		if (ret)
+			return ret;
+	}
+
 	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
-	if (ret)
+	if (ret) {
+		/* The enable was refused: do not leave the check register set */
+		if (priv->tcsr_check)
+			qcom_scm_io_writel(priv->tcsr_check, 0);
 		return ret;
+	}
 
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
@@ -65,6 +81,9 @@ static int disable_eud(struct eud_chip *priv)
 	if (ret)
 		return ret;
 
+	if (priv->tcsr_check)
+		qcom_scm_io_writel(priv->tcsr_check, 0);
+
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
 	return 0;
 }
@@ -190,6 +209,36 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+/*
+ * Optional TCSR check register, given as a TCSR syscon phandle and an offset.
+ * It is written through the secure IO SMC, so only its address is needed.
+ */
+static int eud_find_tcsr_check(struct eud_chip *chip)
+{
+	struct device_node *np = chip->dev->of_node;
+	struct of_phandle_args args;
+	struct resource res;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, "qcom,tcsr-reg", 1, 0, &args);
+	if (ret == -ENOENT)
+		return 0;
+	if (ret)
+		return ret;
+
+	ret = of_address_to_resource(args.np, 0, &res);
+	of_node_put(args.np);
+	if (ret)
+		return ret;
+
+	if (args.args[0] > resource_size(&res) - sizeof(u32))
+		return -EINVAL;
+
+	chip->tcsr_check = res.start + args.args[0];
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
 	struct eud_chip *chip;
@@ -220,6 +269,10 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	ret = eud_find_tcsr_check(chip);
+	if (ret)
+		return ret;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;

-- 
2.53.0

