Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417336;
	b=h0IVCo8ztKcem08hQfQOOskmNIhGVVAqXMSgIBsqfpu8rZNDGtAAwyRRtT0NMKp8gmqa
	 T8C53rakkVNhYPBt2PeB+tgUz0pVxcHilBeIY8sG7IMRKIath6hfe1YMjOs7q8a6DaZ7F
	 AuCZ5pCiZh2PLkw8uP5rZUoC3NvJST2pjKTDnbkZaHkbTww5ehyKG761z62S6Tv8CdF9M
	 jtYSW/gReJw1tNdvunWOhmWjH202JW8mPa8wy7VCqJ3JyXRrdC6Qn8XB1JlcQUnzvYVXx
	 3mFgjIGHJSVdZqgYqbYK6nA7Ie2Rf9gLNntnqDS9TpV3j5aF6j4RS2nF+a35fk+uxuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
	b=XBGjlE/Y12zi1/US46p03C9nuJiR3gOz5VNv/zv2znVEabHhbioDqqebXblAXiCVrmfL
	 p/KJH2VGq9LRY1K2cx9DYRXzXUo/NFW+84t6/IaJpJGjcOf2MWCnGmlztAKMXJqH7iNBO
	 GaS8EGIkuTDJVqMRZSQ7YSBRZ4nSlIvyKenBDMRbZ+EOPom7ZwevAna3hVwkwEzRQuyfh
	 mmQpP9+nCBUOjP/WB5D5lH51J+nJGOp+bVF3mMXCIzid9Bg+Yp6PjVhTB8EP1Is0V/Yes
	 hI5drLCMX5Yj8SYZn2UqYrEMNi3YEEfGHqpxTrrqQwZl98G5dacQ5s9yWpp66LgRlxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pyEvdx8T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="L3I6fZ/m";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED3606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CED3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pyEvdx8T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L3I6fZ/m
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PNgn3712620
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=; b=pyEvdx8TkAh/8ger
	ZxjsoxlIAuuAaXkGtM4sz4BZxg9A2nUbz8LVl8reFZLc4odKnOq9xwwneriE91wU
	gtg4Edua1WKbOp+iBDd8abAYCULQYHMDGozVGbS8x0TkMl+uMnKfSgCFly+j6vBf
	VFhsqUCFQafzCJze24GqRKfVCBoIEU34/aTG5+FjIPrWCsSg8oLUs9zymP9VyUl0
	KGlA2ye2JQQlubljzcl5f8yAcTnC1Z8Zbwl5Da+cJK5RsHCP6Edvm/lGP4djbpfN
	fabsOIoPm0n0H2cUVfoPP46UUUVF9EeYpWmw8oDOtZbzZByKmhcGoAuEEQjXPBKb
	Eojj/w==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7404kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:02:15 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso3972187b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795417335; x=1796022135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
        b=L3I6fZ/mCtbjdG9cMavVUIYv3ubH5IBMjlC3ocT6Fu1/d3pWRtscacLyndfcAFV9Xu
         k0CmfNgQut+5iOvrvWuLf7FmTh/g14qJOAeufuv12f/UNxmf57KafF3PTeGTDxJkq9MX
         uy07PvvYD+TGgI9XWXNnmeVbHFfHqHiSOoFVf6mg36+dSBtOH9x5kkFI9+KTBGEJkjos
         r0Xy6Keggx3WW1BvG55h4It87+CTG8uyMjzMxU06nsq3mKigu4napWFCxmATki8EF33i
         KMs3X0yJO1tSokBnFkDVJP5u3NLX4dEtn4k4Ta1mW7ucFJSCZfOvm1FltKFFfAmFGekQ
         iM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417335; x=1796022135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
        b=jRfN3m4uWs7ewWk8otwFmMqT4uUdupo9Bd6OdNBROdoHG8BMNOLBzEr9sK+M+QchED
         aBb3Y0Sqwo0MY3L2XYOA5ZVq9FiIIkh0ilgtTHg/E4K80IFgLxx0DOa8RbKcGGsyio7M
         vY3He/ZUrHMSguDjZsfEuhvuUOlaorNPv4WvCeV5dVHs63WgqCOEYD6YFNWsqbfDAUud
         1sXSkLUsQwT5CI/CHYYLKhiTEYtR0txdn/IVAysEJm2Biv6xuCosc2wACB6zX/dhMlR9
         eCQm0TVp9KqWDnaGSnXg97RtyLgXgIZvJ34vl1gRf+V3DMnhASVnVLPYTPHa1EM+8R2d
         UoJQ==
X-Forwarded-Encrypted: i=1; AL+hErGKCFtawQU+IfjyYtaXS3+E+tSrcbUuA/pY09xZocZJ+TUSd3z8xgBlDDavWUB/R2/l9IFOg/qG3ubf3ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yNJFXjaBizSG0AGJB9EiLAKV8u/MnyFuaAooE9J4MHRLyk/+9
	g+4tP9QAw9rxSHcZhuF3WJguhwOlZTBaaYF9k+k3zuHg8WJT7OkCORR9Ke/U5aA7mftu4aCubKe
	VAT12tWPymp2JwWC1QmYmfIAA0ajCwH360/XN2HN/OO5TiVGmF+FfYhrrPBi/WsuTwyMPl+i35o
	Q2+A==
X-Gm-Gg: AZFdTZfmEneKlXMsVthotU/kwZnkKFZJY4GLfc9RzqY9qICxvB+O4ZP104GD9z0WklO
	HyuKT7Cjlgf/xg9w5zPhawnw+78q432lHkbMqJjRlcjSQUap+/tTliR9TkH5eVWYC9a3hwZtDW2
	XTGRt7gxSHpoFEhRf+kxc1yh3p+a6MgpIvPmbUMcjZjhlGhYEAb5oOtEu30vnZB8OO57yhR+9fH
	awYOxpUwQOP2lkgjoGEhGkeh3D4V1/0IPhp9l+6q+RQv8AbYiOfjbWSGKsto1aDqHnOgETpKjxt
	9vERba52WSeo++EFj0ZrxZTPtyWUaRtdQ2sJmWdRboYda6FJTUwH0ZaHBMPKtB4dyio/VX4aUwx
	wEzG0dAQ/ar1IjwxStK+wjY7SqHxXiBTRNhM1ePJL+HbOQCqeNjBewBd/bZCHxdodUtmPRA4kjV
	Hu12/kjX1GyvaCgi6v0Dt3QloxYw==
X-Received: by 2002:a05:6808:199e:b0:572:f8ec:532d with SMTP id 5614622812f47-57a0a927e28mr11458645b6e.23.1795417334566;
        Sun, 22 Nov 2026 23:02:14 -0800 (PST)
X-Received: by 2002:a05:6808:199e:b0:572:f8ec:532d with SMTP id 5614622812f47-57a0a927e28mr11458602b6e.23.1795417334124;
        Sun, 22 Nov 2026 23:02:14 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8817213b6e.17.2026.11.22.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:13 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 23:02:05 -0800
Subject: [PATCH v3 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
 lpg_pwm_get_state()
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-3-f911edd40a31@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795417325; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Bnb2so3/IwoLbKEtelemwhyUAsH+oEhrfqUv3ro2zRk=;
 b=BWcOshcISQpzbqHudIE5kDAuvxuIyaC3/EeLxUN1kmCnDJUgGZ1U5To2CRAeVXdNzlWsPeS3X
 0ysWKD+WCQZB6eDMl5Tk/3ZcOyDsxRKl1Lzd3t6cOAnduEBFnaUAKod
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: lCVIqJW2LEl-EQczh99RB_33_9eACjAX
X-Proofpoint-ORIG-GUID: lCVIqJW2LEl-EQczh99RB_33_9eACjAX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX/FAvZZLxMEwr
 wBCIxPBNVp3mh+3Ia9KETugml3oZSOmLWvssivN6oY4s2HLED6XFnxwTY3cKQdAskg+vUOEC/SB
 o4qwuXgaJLQcVzx0F2xDHnSYKL6hewU=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b03e4f7 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfXwnlCic/hq96i
 sSTTFAj6LtBtAZY6ohf+MZ/nzJY1mOfrf3I1fGxSfCCmwD79ZErxSoB0KTa8TO/f/DYyYhNOAj0
 1JuF0iyvoCgECtS2KDbFkOOPSV8l7pnwNAGxQI/txV/zWLLuWIReSiWsHCE3Y+YLrrfyGaQKs2A
 LaaLRsSNd0o8Jp13CFnth5HtXB3Mdz4K88Br45ZTI23feJNOf8badphujchAOKVq/uXdWsdNa80
 TIISEhqQuGghe4fFft5DbFsoTAwD3LUONN3+D9avn5QbXppCgZ1s53giRVvB76Dt71o7i47CFI3
 cP44A3S6Pvzm9l9QGz1oeEW2+pA9/7aejatuuLt1MSsChSpVY74v31e/4G4iv/Mi3Rlptk7hDJ9
 hFvlQUebCDcW5/vcPNcZRRQfO/lLwxwEKQ3aAbNoLg7I3hiV8408yFZb4cqYl90b7gKwMQoQV1r
 oq7TTeJneedf1LMFtPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index eec942f2af6c..06588cd0b3ae 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1470,6 +1470,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

