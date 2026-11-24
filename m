Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542430;
	b=T06rCa9DFo84FYy1Y2Ym8uVRz9mpvCw+l7cPunlpBxZMlt4ilEnqfHMDTIZC2kNq644C
	 MMuTqfaZnvCiDKz2VIUre7z9xNNJU4CS0PARh/r7ymdVWQ5VFdUVjRu+7vBBUGn7O8Cgi
	 xg15Uc7jvJWuRfl75W61NZJiQG0utqvhBBueHXo9mE4noBlZNKOW2su3hLzM9Uy74s62O
	 rv7CLCp71nPSkJV/EvwkDrNlNHAlE6JIpa7ZvdborgtlTpDeQmOavanJuPr626V/efgo5
	 nh0z5Lsk5Uz/NOf3RDPWbL0QEZkrQaii1ZaPWC1jE++ZxguycTquJBdEhGg4IyFD+xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
	b=Von2UhW0ztVp8o79rPoNSOiuXM50aEngL2iQ7qJ+un/fPbM7A9i18QvjCGQmSBjGYeF4
	 JdXX7ALKb6aRLIHemI9iJC42AYqf/KplGVw0blr1vphWBgg+BwhtnW93BVzwcX0V9R38m
	 x6P+aIFJyEE/RCHZg68eK4vzAymeBCtWvWlf65WqVEM8w2lKgj1m+vJJuq43zCmB7nA9y
	 je5jURJo3De/eF5CxDlnqUsAcyRr2VmiU1jv87Z/rE+Fsez3M4wxixa9HwJEojOixuqja
	 Ok4bt6bhtiQSkAp2BTZnSXi2fNssl8pTR5sN3Bg4hjPsmF+GQhRxikIU5l020V1wNQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MNs6LN3/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZJsQ1Fo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907D1606A68D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907D1606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MNs6LN3/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZJsQ1Fo
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOHQXZ02852905
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=; b=MNs6LN3/lG7+yYHD
	4I+pmw6gq5biWDVZybF3pSL5Y8yvHq8GMXNkJBViJJG0c7qhi4cpsFwKAI97TW4q
	sOtJM6FXnBa4LDnZiCrMIsN8Z5oeMsXQSyr6SfwrPmnvtmrLg59TvRAateI48O8+
	yIdHnDehRmNX8NzJKhFXKvZXJRCVOWmH5kgJCjVXN0R30gGEgiiRWXnxXIG6pSLl
	ImlpVHCjYXoESluFnKTAf6xfIvn0uq175VN4JxWfXZVwNFKpXb8+8jkfW8bcdkbz
	uK8dBe8JAb6vLv07jQNAZF7Ox4mg3c63iBHM0hDd6mKYsHfg0NiXHi5DKv8ixx3O
	BBH1LA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5f00g2yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:47:08 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c83124d530so3971718e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542428; x=1796147228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=bZJsQ1FoaVIgKZbBM51qzc6a3py4dYf+5W93a05HEwF051NprRArqZ+ow3K94l0dZ2
         KKL/MXtCuGapcHIUaylyVp6OAT2zUZ9fSPOUKeudD3LJB21LfigaPUNTJSH+v7K6m52n
         Gh8MrgNHgraewYEISTt7cAw2S5tn5tEn1ZIDO4wLkFizeU1V0X4qh0vr9gmSFrRHr+jD
         pdmcduhcWRQEc+IPU1EvU6Hny+1D4dpKm+F7Qyc+G5sHx/MGq05Wxuzfi0JovbkJ50Gr
         epqGedB25Y3tKt2FYERv+vv1l9YaUxq0rMpqWaF/Ehb1WSnLngvfHpT3P2Rzs+Scwv9l
         IQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542428; x=1796147228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wewU4YhwoHM+23LFA0ZsEWBKZr1o3y1gc2SPKdBGIr4=;
        b=SJfTD2Der0xHW3wKvvt5vEdvRbzTJuA1aNMu8YWgP9FqMJsyWu8aV02ucrki+UNopJ
         qU49JySCkBUQ+Glrn/W/08/CCKx4UQWRVF8AqlGZbbD134DxGFgKHxiqtkQrCaUnkgTB
         4vj7MCQ2Ec6pLou/8dcIEoVisUTutFhDTifwq6dN2l833ehOcsrX7nM8RejdK2x2C1is
         L81Va0e4Mf8J46ljRIKqDHIQP33c5Nlq4bRm3y1GR+tehMk1TZ4gWnWe3NiyRc2EApEA
         8cPNx4cri5DuPkXV6IFTI5402fqqkKH8qLd8jDFvBS3OORQkLw0u+Tbdtdcj3SlmUc2N
         oNiQ==
X-Forwarded-Encrypted: i=1; AL+hErGyLk2OxRtpujH+VttzkskfZ+jbm6cy5IfZKuCxGNWNfGoWhKodvbSBTCjzr5Wk+lgkJfc7Qd3ikTQGoVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Xri7lFinXMLYxMFOt+RoZY58PmsROYePiWRzPMDBdhNuFjG2N
	1BwWoC7fV9+msgvhKfWjM7Rrngf2sBrMyVHtiUVYeTCJ7XgSRP47uOTSrY2EylO5FmfZ1aWifIt
	o8L++Zo8bpDJXVmObW3I821DpI19L8TtYAt9Iq6MSK38bZ3PHXJET7Zn4xxFGNPlMlF8=
X-Gm-Gg: AZFdTZf9v3gkmlPWjb6u+8W0Hvy1/B60uKgcgeJJPRL378ePs/SoZhqK0jdaeoKoL/B
	3HJNUoN+Z1IlqiJvtMTIC7gXGymZ7R7tgW5Kyow5oB484GSVIbkP/Qxu3yEAqUp0dDSDd1prZDp
	aTbMuwh65jA2EhKgk9KmNNs25nyRe0jITtFKsHqgO2c3Tl6Ia83LyQuBFUH2Cod/ylO36ZdEJGD
	PF0wewALdJNUoGvbzltZbWowF7UrfS0/2v1K/75SX18V5SMNKSRbfiMcTm8A5oLWmdfvGkFU47j
	KMz5pi/SuHWvSb0N8fOf+amsr+IHpPF9SEHIjIW2s6mqfDz5XH29JoheOVM9JYGuS8KsmCMyCVn
	Qo0DuM9Bk/bDaXHOd/QPTgyPzfmSRLNuNIs8/obBhgNy3qvJzImhnd5cEEjI50oh+Sm4CRtq8K2
	c8mYNx4RIELtsF
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr9297807e0c.13.1795542427710;
        Tue, 24 Nov 2026 09:47:07 -0800 (PST)
X-Received: by 2002:a05:6122:893:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee8af4d132mr9297784e0c.13.1795542427090;
        Tue, 24 Nov 2026 09:47:07 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm7396418a12.20.2026.11.24.09.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:47:06 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:46:51 +0100
Subject: [PATCH v3 2/2] usb: misc: qcom_eud: set the TCSR check register
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
Message-Id: <20261124-qcm2290-eud-v3-2-4f31aef8c1c3@oss.qualcomm.com>
References: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-v3-0-4f31aef8c1c3@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 87NNmlHRKSXAFGx7ZA-sLDSVNmxmA9rM
X-Proofpoint-GUID: 87NNmlHRKSXAFGx7ZA-sLDSVNmxmA9rM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX0jVS38EFHCZ3
 C7gdZyjHoYh1V3CJpRhgcwl9xw5sOTKLnsm2aqv9uOFavQCix9d1xdz5sfMpccQf4pK7wScY3Hp
 z32HtU4Oytz/0cXsEgrtA/yxGPwiJ4Y=
X-Authority-Analysis: v=2.4 cv=JqtkP84C c=1 sm=1 tr=0 ts=6b05cd9c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RGBH_sVsAxb1F4UfViYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX0L/yumL66cL6
 ksPhBvbskfEduCmjouI8oIwQCh4Ksy1LkdXKG7i4zJIr+xQawjlJu419QwBdqcIUCz+xaQVAiIp
 GyAe0vV7eUWEF7sQEvWGTBepbylmjsTu4I/Q/7EsKPx1YoGapyzVbeWiejj09pY+y4vRnxkqoZE
 5Bq85cQyJhAe8Fyy3qCfKNya2/baRzXginn+ERdnkERYyWoppaHSLbdgtW1NrVSWsFEs7x75V7J
 h3u9b+2ydRGUGpo5h4zJ7K+WjGI5IV5qrcZ/1tUVafQKBRxsNkDiyQc0TdmPDwpnB7ZVYxQP5Po
 lyQsimwLdjepMUCt0WyzUreuhetTS24MAoPMZRXVtHRpWkJmNp3NzxumouAO7CIWV2W0Uuf7Cg3
 rhiQUBHtUz9pL5k6rc8mOmiE5XzkeWecaHdJEOW6mE9nHzcXyn+/6vlKQB5MeYThWu770hpIWs/
 6xGSxTyoX3Tb9YwdUJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240069

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

