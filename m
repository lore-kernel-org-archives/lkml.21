Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596204;
	b=zB2iMiyMg9AAahbtAP2xAb6fDmfJwUh2H47PJ4Lhiq12780FOMKvj4K1iy0d6ekuUnoi
	 0zLY0AzPCc7rsBNrXlFwVuS2RiyptJBtZ900oe0GiZkf+2ash3UsVXBNWdzdrai7g9PHU
	 Wx6sb7nyE3D4TS0UPCRekkaA8nRJlgULUeQTE32i7d3YOrGIrHD9Iu7V03kI15l0PXNH9
	 CspHjc5Dz0g5hvDCBmPqsu9YS1OALHD+Us7GuOvILIeM0GkIqUfL/pbD5nPQRRGtLPAVN
	 yQwukmIR7kIDqjSe3tKoAy35Jc9sDsgZhwt6vuw/4lXg6popOwYCogZiJJw/albX2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596204;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=;
	b=M3FLizV5OgC3UoMV26FCVzsglx6JR3rHG7+T7tXFEr9XxLUkPy7G/uCobuWzrhuS00l7
	 LEurDa6KAIyMtHqv/UR/zt4z6TMy4Eml2gnKQMC3V0tTAuPxQYbkBg7Us6/KY2Vb5yC9A
	 Bv/7Ss4/vVjDO44ew8HofbXkFnWQ3xDdHBKwuGIV+4JXYyT2hNZXA3sY+ZrZKGFfFCMUB
	 ojs5RXwhMa6eedBo1ff7czLTCnZRh5AhGF87PCqJk73iL6Pn3qNB9WtWQtgPmwQY9QpK+
	 4Soa0sXAXJS+H423FguB2d7ZA/dF0hQarK1I0mrHNCssBqLA7BndRYblkFP9Z8819+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaL8G4cv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ap+dOCb6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626DF606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626DF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NaL8G4cv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ap+dOCb6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68XTD299998
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=; b=NaL8G4cvrKyYouJt
	d3p2fvzLOVo4RYT+YXmqTROzbYdOVXA6CvYgFP/4BFYEJZxYxOCI+TYrRNvDOUx0
	IsLwlSkWN0qmegaanXRmmCSXaJPlwh7ui56dh9IetTYieN/JZCVHmC1ZrD94f1P8
	awaNnCe4/nxEHDL/qDKVWCaj/zUElRk8Pt5yFbXP099CxooRxrQlak6W8oE/PAkT
	C5Uv3Xrz2n5oxmoVE4U4cAwKL7q4+9/eA16WiglwJZNSKnsh5lK8X3+A/4ydyOzI
	yYvJdW9U+sRjI34+QW4WjbKZ9TphCil9FfrPhAdWLVe03ZoL5GG/MFymyZZSaxJX
	hsP+/w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsq4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:43:23 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so4506351eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596203; x=1796201003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=;
        b=Ap+dOCb6BB+jOWKQ29QeWVnRivxgOoAmMtz8f/4N6yhBsDmgOvncEXWmjCt2qgRUSF
         PHEoVmbjCgCVkdkDrsQHORF6aVX/JYQNw1QAuz4XoWa37bxgWphELJ+KcxuVKqITaLcv
         sKu832qbfIuLectCmF+wcM+7xv6hljf+aNiE8ovfAPPlfkDrDJm6Rat+eHO520v0IR5C
         +ZK16XRR7WcGeEOrM2BL8imuhCjCagVuC3U4eDGCt7VKl4pRlmMvEJJGmOtRPUtjChMv
         P2+LI+oJB5COFVRE4Ka7uuXLRvsNQGor9xdqH23LAWpGZfbBO5fut3NuKOisU+JHMZi7
         NQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596203; x=1796201003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFwa0MO4gFEnpvAeEmEySLh7dBj054jvvE+YExvSwCM=;
        b=aKI95Nh+Dr+svHEk6p2MoaRsEKwNTS91KjCAHsYnO9WqdniE2G/wuYYJ7fVKE7zgCf
         LrKQK6oafIgHEyPB1xLB9cG0KJK8k3qgm0IditKFm7ifPVSb/vGE1bjqfmTFn9LkXaux
         4k+x8fahowk2Jc5K4OWT3kmkr1xTuidrq0pg2DLNXRm/81xnGVderLw58hu1cG/uRH1r
         hJ/+NdhEn6I5F9cSaE1wlPtWrWYcW7/CiuP5z5w8z7+VFx5yjHWU1bRsPpTnIDYit+SD
         bWm+wJdbEuC+HJoKAcZipKKg7jG555+T17Uwn8rf2TUDeoVM9HzQjf4CmXkYzf90kb/P
         Whfg==
X-Forwarded-Encrypted: i=1; AL+hErFpYkKZ9d20voiwP4xj2Ezt2oGcnlU9t3P529PKtnNc2nmoPmAXWYs20ztS9KfGU2u1Np424RLcxrt5BB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wB6wPpZBw8QAk5JR2VBVW5j5xeCMd4n1tTxquB4Uj7h7DFSMW
	onmvZm/uffaDB/h6QHoWWwFVk2OKGfZAkaN6Me7fBNBmZuI+VgTn8mt1IVctQCZDgHsPi59V94z
	cM1wweAXZWzceAk/rMQbsHy9+cOYnigZSwdcTtjoH3bbvRN6VPy1iwE1uWL907uvmOxI=
X-Gm-Gg: AZFdTZfmrmFBfWiEcOLoE83wuX83veVIbTHXHKbGL1llUZmbkOSHQWzKoOojYLPR0XT
	mViRnb1S5EzAMe2enV5MpMpUf/8qNaXX4tk+NYSRUpWBMYQd91y1I6+AlY48JIFuNsns6zw6ILn
	OV/WlHdcpLiaiu8gcOg8pQFWaS1m2dxKYZviuPV0L4BTUD3ZcyMymsVJQwn5c7+llk2kts7WW8l
	2VOhh6kMpL95fac6G+g5LAkwQ9d8758vtCyk8h/75+Se53Nvv9icETkPVd1bpyP6EBdbF2NXd/N
	bDcGVStbRZepxFA7UCOdgnWcKbZm3KuCg4x6Jr7A+KR94ivOlSMWhp4Ikw85fAHhJBM3omcA+c3
	Z+Zs+8MLVT30C4b3gt6JB49yA+39oX4JB2Yq0RHQY5U6d0OlkyyN96banW72Bjdqt/NsDzksMz1
	5IMXvm
X-Received: by 2002:a05:7022:3a0b:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b5568d861cmr17358899c88.20.1795596202650;
        Wed, 25 Nov 2026 00:43:22 -0800 (PST)
X-Received: by 2002:a05:7022:3a0b:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b5568d861cmr17358875c88.20.1795596202033;
        Wed, 25 Nov 2026 00:43:22 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm60290694c88.14.2026.11.25.00.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:43:21 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:13:01 +0530
Subject: [PATCH v5 2/3] media: qcom: camss: csid: Scale the clocks with the
 CSI-2 link rate
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
Message-Id: <20261125-hawi-camss-v5-2-d48c4feb1c2e@oss.qualcomm.com>
References: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
In-Reply-To: <20261125-hawi-camss-v5-0-d48c4feb1c2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795596185; l=10252;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=tpveFD6IUE1BcjgC1cRdIYcwyFNUjPZnwFV4YuwTebo=;
 b=szYJND60yPQMmbvDHj+qskOF1RvoxboTcfZiCFm44NO2JMs2G3iWI7PPksls3mdZvUjzEV2Ye
 lDwytHVVuy4AhKEpcNMILOyPePGW7RlBtKru2VqKU+wX+XMie6kGq4s
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX/qbXKVfnQ2Jt
 8b9u+U3BoeSxsXVU1tKNIbzALKEB6Mo7Nb/wcf0x+O5U6+OiDAwIxBzOHNh1hlRrQkUJyWFZgRQ
 ZypngkvcdI+WKRiZtnwjJWNFp6VF7rSZB4ZNwR438x4lovVN6/LGOoegG87L0udmbbK61BnBFMw
 U2vt+tY9wjf6LL2EirMqOHfY2jPuupzeBDezFG3reaV23+fJe+aaB69R/gfoclDc8XYBdlAqRxa
 H+3Eqkt94H8b84UwmjNSKRwYWQUuhhGqv2nb7QUbiEsgFfgtqHS5vyGKz3rQXyEepQPRJwpK0tu
 ub0lBlEbLeSwFS7jQgJjHpGDS1zG7bdThkGQluiDOYmFxDK26cHnTVoNYccUXo29H/JwJZC/W5L
 ZjSUCV/kc72VZ/fi9DoTIqHgNqjN4mwPDyQpG8cw1e1iM47U6A5bKyzeKUT7EAOIF8XK2F/z7zi
 f9ffyXuUernLq4vpEzw==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069fab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1mbsq_4py20XrWrvqusA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 4_xfKwx9rkLqI2ZdDnw8l8RQ6vhZDiPU
X-Proofpoint-ORIG-GUID: 4_xfKwx9rkLqI2ZdDnw8l8RQ6vhZDiPU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX8ozZV5IHZLL6
 98vOfMV4xFPMeG7ysZFAeJgOt0BQ0dZ0yDPc+jECTLlKEUf9+TBy5cl9RYgvSxrEBbkZ7yWReic
 uBGGWCLrAFjJCcRFYlKbckbFt+rf7C4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

Only the gen1 "csiN" clocks are scaled with the link rate of the sensor,
the CSID core and CSIPHY receive clocks of all the other SoCs are set to
the first rate of the resource table. A SoC can therefore only be
described for one sensor bandwidth: the lowest rate first breaks fast
sensors, the highest one burns power with the slow ones.

Compute the minimum rate from the link frequency for all generations.
The CSIPHY passes each D-PHY lane to the CSID over an 8 bit wide
interface clocked by the receive clock, so that clock has to run at the
per lane bit rate divided by 8, which is link_freq / 4. The core clock
must not be slower, hence the same minimum for it and the cap of the
receive clock at the core rate. The clocks are matched by suffix and
voted for with clk_set_rate_range(), as the CSIDs of the recent SoCs
share them.

Up to 1.8 Gbps/lane the selected rates are unchanged on every supported
SoC.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 208 ++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 39 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..e6546fa9cf1e96bc9ec65eb1e6e4eb0144cc01fb 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/string.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -532,72 +533,197 @@ const struct csid_format_info *csid_get_fmt_entry(const struct csid_format_info
 	return &formats[0];
 }
 
+/* Match the core clock of the CSID */
+static bool csid_match_core_clock_name(struct camss_clock *clock)
+{
+	/* "csid", "vfe0_csid", "vfe_lite_csid", ... */
+	if (strends(clock->name, "csid"))
+		return true;
+
+	/* Named after the CSI port on the SoCs with a gen1 CSID */
+	return !strcmp(clock->name, "csi0") || !strcmp(clock->name, "csi1") ||
+	       !strcmp(clock->name, "csi2") || !strcmp(clock->name, "csi3");
+}
+
+/* Match the clock of the CSIPHY to CSID interface */
+static bool csid_match_phy_rx_clock_name(struct camss_clock *clock)
+{
+	/* "csiphy_rx", "csid_csiphy_rx", "vfe0_cphy_rx", ... */
+	return strends(clock->name, "phy_rx");
+}
+
+/* Match a clock whose rate depends on the CSI-2 link rate */
+static bool csid_match_scaled_clock_name(struct camss_clock *clock)
+{
+	return csid_match_core_clock_name(clock) ||
+	       csid_match_phy_rx_clock_name(clock);
+}
+
 /*
- * csid_set_clock_rates - Calculate and set clock rates on CSID module
- * @csiphy: CSID device
+ * csid_get_min_clock_rate - Get the rate the CSI-2 link requires
+ * @csid: CSID device
+ *
+ * The CSIPHY deserialises every D-PHY data lane into bytes and passes them to
+ * the CSID over an interface which is, as per the CSID HPG, 8 bits wide per
+ * lane and clocked by the CSIPHY receive clock. That clock has to run at the
+ * per lane bit rate divided by 8 at the very least. The link frequency is the
+ * DDR clock of the link, i.e. half the per lane bit rate, which makes the
+ * minimum rate link_freq / 4.
+ *
+ * Qualcomm recommends clocking the CSID core at least as fast as the CSIPHY
+ * receive clock feeding it, so the same minimum applies to the core clock.
+ *
+ * C-PHY maps 16 bits onto 7 symbols and needs a different ratio, but CAMSS
+ * does not support it so far.
+ *
+ * Return the minimum rate in Hz, clock margin included, or 0 if the link
+ * frequency of the sensor is not known
  */
-static int csid_set_clock_rates(struct csid_device *csid)
+static u64 csid_get_min_clock_rate(struct csid_device *csid)
 {
-	struct device *dev = csid->camss->dev;
 	const struct csid_format_info *fmt;
 	s64 link_freq;
-	int i, j;
-	int ret;
+	u64 min_rate;
 
 	fmt = csid_get_fmt_entry(csid->res->formats->formats, csid->res->formats->nformats,
-				 csid->fmt[MSM_CSIPHY_PAD_SINK].code);
+				 csid->fmt[MSM_CSID_PAD_SINK].code);
 	link_freq = camss_get_link_freq(&csid->subdev.entity, fmt->bpp,
 					csid->phy.lane_cnt);
 	if (link_freq < 0)
-		link_freq = 0;
+		return 0;
+
+	min_rate = link_freq / 4;
+	camss_add_clock_margin(&min_rate);
+
+	return min_rate;
+}
+
+/* Get the lowest level of a clock above min_rate, or -EINVAL if there is none */
+static int csid_find_clock_level(struct camss_clock *clock, u64 min_rate)
+{
+	int i;
+
+	/* Play safe with the highest level if the link rate is not known */
+	if (!min_rate)
+		return clock->nfreqs - 1;
+
+	for (i = 0; i < clock->nfreqs; i++)
+		if (clock->freq[i] > min_rate)
+			return i;
+
+	return -EINVAL;
+}
+
+/* Lower a level down to max_rate, but never below what min_rate needs */
+static int csid_cap_clock_level(struct camss_clock *clock, int level,
+				u64 min_rate, u64 max_rate)
+{
+	while (level > 0 && clock->freq[level] > max_rate &&
+	       clock->freq[level - 1] > min_rate)
+		level--;
+
+	return level;
+}
+
+/*
+ * csid_set_clock_rates - Calculate and set clock rates on CSID module
+ * @csid: CSID device
+ */
+static int csid_set_clock_rates(struct csid_device *csid)
+{
+	struct device *dev = csid->camss->dev;
+	u64 min_rate = csid_get_min_clock_rate(csid);
+	u64 core_rate = 0;
+	int i, j;
+	int ret;
+
+	/*
+	 * Settle the rate of the core clock first, as the receive clock must
+	 * not outrun it and the clocks are not listed in a fixed order.
+	 */
 
 	for (i = 0; i < csid->nclocks; i++) {
 		struct camss_clock *clock = &csid->clock[i];
 
-		if (!strcmp(clock->name, "csi0") ||
-		    !strcmp(clock->name, "csi1") ||
-		    !strcmp(clock->name, "csi2") ||
-		    !strcmp(clock->name, "csi3")) {
-			u64 min_rate = link_freq / 4;
-			long rate;
+		if (!clock->nfreqs || !csid_match_core_clock_name(clock))
+			continue;
 
-			camss_add_clock_margin(&min_rate);
+		j = csid_find_clock_level(clock, min_rate);
+		if (j < 0) {
+			dev_err(dev, "Link rate is too high for the %s clock\n",
+				clock->name);
+			return j;
+		}
 
-			for (j = 0; j < clock->nfreqs; j++)
-				if (min_rate < clock->freq[j])
-					break;
+		core_rate = max_t(u64, core_rate, clock->freq[j]);
+	}
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for CSID\n");
-				return -EINVAL;
-			}
+	for (i = 0; i < csid->nclocks; i++) {
+		struct camss_clock *clock = &csid->clock[i];
 
-			/* if sensor pixel clock is not available */
-			/* set highest possible CSID clock rate */
-			if (min_rate == 0)
-				j = clock->nfreqs - 1;
+		if (!clock->nfreqs)
+			continue;
 
-			rate = clk_round_rate(clock->clk, clock->freq[j]);
-			if (rate < 0) {
-				dev_err(dev, "clk round rate failed: %ld\n",
-					rate);
-				return -EINVAL;
-			}
+		if (!csid_match_scaled_clock_name(clock)) {
+			/* The remaining clocks run at their lowest level */
 
-			ret = clk_set_rate(clock->clk, rate);
-			if (ret < 0) {
-				dev_err(dev, "clk set rate failed: %d\n", ret);
-				return ret;
-			}
-		} else if (clock->nfreqs) {
 			clk_set_rate(clock->clk, clock->freq[0]);
+			continue;
+		}
+
+		j = csid_find_clock_level(clock, min_rate);
+		if (j < 0) {
+			dev_err(dev, "Link rate is too high for the %s clock\n",
+				clock->name);
+			return j;
+		}
+
+		/*
+		 * There is nothing to gain from running the receive clock
+		 * faster than the core clock, as long as the link rate is
+		 * still covered.
+		 */
+		if (core_rate && csid_match_phy_rx_clock_name(clock))
+			j = csid_cap_clock_level(clock, j, min_rate, core_rate);
+
+		/*
+		 * Vote for the rate as a minimum, as the clock may be shared
+		 * with another CSID which needs it to run faster.
+		 */
+		ret = clk_set_rate_range(clock->clk, clock->freq[j], ULONG_MAX);
+		if (ret < 0) {
+			dev_err(dev, "clk set rate range failed: %d\n", ret);
+			return ret;
 		}
 	}
 
 	return 0;
 }
 
+/*
+ * Drop the minimum rates the CSID votes for and take its clocks back to their
+ * lowest level, or to the lowest level the other users of a shared clock need.
+ */
+static void csid_release_clock_rates(struct csid_device *csid)
+{
+	int i;
+
+	for (i = 0; i < csid->nclocks; i++) {
+		struct camss_clock *clock = &csid->clock[i];
+		long rate;
+
+		if (!clock->nfreqs || !csid_match_scaled_clock_name(clock))
+			continue;
+
+		clk_drop_range(clock->clk);
+
+		/* Round first, so that the rate respects the other votes */
+		rate = clk_round_rate(clock->clk, clock->freq[0]);
+		if (rate > 0)
+			clk_set_rate(clock->clk, rate);
+	}
+}
+
 /*
  * csid_hw_version - CSID hardware version query
  * @csid: CSID device
@@ -707,6 +833,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = csid_set_clock_rates(csid);
 		if (ret < 0) {
+			csid_release_clock_rates(csid);
 			regulator_bulk_disable(csid->num_supplies,
 					       csid->supplies);
 			pm_runtime_put_sync(dev);
@@ -715,6 +842,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 
 		ret = camss_enable_clocks(csid->nclocks, csid->clock, dev);
 		if (ret < 0) {
+			csid_release_clock_rates(csid);
 			regulator_bulk_disable(csid->num_supplies,
 					       csid->supplies);
 			pm_runtime_put_sync(dev);
@@ -729,6 +857,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
+			csid_release_clock_rates(csid);
 			regulator_bulk_disable(csid->num_supplies,
 					       csid->supplies);
 			pm_runtime_put_sync(dev);
@@ -739,6 +868,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 	} else {
 		disable_irq(csid->irq);
 		camss_disable_clocks(csid->nclocks, csid->clock);
+		csid_release_clock_rates(csid);
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);

-- 
2.34.1

