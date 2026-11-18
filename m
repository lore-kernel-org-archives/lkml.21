Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012455;
	b=wrr0m+sJHr0VHY2qsJGfhfdN4Zv1HdfsswCcVfElSox30BeTKJBld54cDBQ7M3q06nqI
	 A6MgEjfNy6UMrPGyMKKqcFMtr91JFrgUtztCWrUyB1A0sHZVJaMkx0FFG2ZMRtr2u5PXo
	 dFYu4aIAQdrmv7PlpawvBeuwaqtQyNKMQsNDQ3t5MJShClhm07U/mwRH66l51zm3hltqn
	 Kzu58qk0wjfcOlPRCvdxo4zwxRpGsmb0bWKQbl/bLL0s4GMj2i9SY3cNMbVYic+nDBZSN
	 GLPFeLZDyUrr8PCIyWgY0e7Tx7Ra7rQr0Rz9Sh52uo122nZV6hgycUC6nnb8d3nR00Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI3P8bc7KM=;
	b=mDYQQPAwK17qdFdxtpDlN10sLDy48XPtons0SDiOjJrT8B4Gc2XA23Qkwg6neaeV5DMi
	 oarVoxPcMN0YnplT/Mu/e5/lRiecCfuPoRIiE+kJ88LKyU2/Vz8Of31NDb0RXtdtH0l4D
	 3xTqg8oqcBehEZtPHhT5zfcWg3X9BhMFKHylrzyEqoEu+O88n9uhTZECTulGM/Ed8Rt0S
	 9X6Uf6q36XlkagP9g3PdLvvh5WlSLdwFkcSiccpQIi3Kb0FUJslvA33pe8CCIcGydqn1H
	 7pgp6iXsPrOhNw0DK1oPCnyqQkvp8az5H91R8RobrZwilEQjiJoDD9OdHCkZYX7kI5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPUPpxr3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUvxuxd1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D746606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D746606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPUPpxr3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fUvxuxd1
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIE4dMB3648065
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI
	3P8bc7KM=; b=WPUPpxr3uQL+rRWpzEY7sSkIS710GUkyTcc8ApwZZ639QTSYTck
	ErtIYqdtzVAahItynOuZD+UwokgG/nQUldGvvA0tRJTi8Efleyt3a9PRdEHDJY76
	tTkSabUHUtcKrhi8KyF2jyP/qBDQ+PW9vNSaRReBFz8ST3aqTb83kJmxvHcJqNiO
	r/4eh0uaA+RQIcq//7mDeumIBdhwk24rLg9ymuCG1oqVBTyCn3VdFYb1ooPw9gZF
	IrgF6piCE1rCpcLEPCrQ3vZbc8IFmw1DYJO8AZ/PNMjdRalZ0LhSqIAWrT4Hx5v+
	nEdasrlzWs6Q/Pt152SRwLKV2O+6fZOt30w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcr4eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:34:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaf8ea208bso9887825ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795012453; x=1795617253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI3P8bc7KM=;
        b=fUvxuxd1eWme5/TavmVlNpqp1AaKL8rtZRysGzGusf1QbsVvjDBUwqNoeQRl/fSmPn
         HFJSGt2i+fuCvsUo5TRE9moGZZfBP/mx8WibFP4WB4Z0qD1esbCUv7htVM83h4+fykCY
         Rqu8FTON4tazROpjpNLWzqY/vi5AvYhUo++8rVyDQYTUoekCwoFxWkZXWNHGAvlDtVyc
         /WZPmcOobLJINN95UQDSvdVOl27V/WaJtAObr5vzPzKG7CxM6hlIkQjXt0xnDmcnXBr9
         JlZN7rMlZ2ZeBh3LCUNCJlX89lRlwLMluQKURUQZ2Bbm9CNl4W4Plam1Hiiub6y1EUzH
         czUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012453; x=1795617253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haPwdd7A48YpDgke39xoby/moRx8yUA2nSI3P8bc7KM=;
        b=dMxTX7J95ljIbtK4laxQql4QAzDZft07LrZkK+2gPf+us1XLQhMku95bvCI0U2vmWW
         0Y9nyEOaHowwV1wnqc7sPZeyjTOlTxgrnJgUuX0BJAUGxY1FX+eLnmIeXCOF6Zs78cwY
         Pq/KKFRKOnDsaH53IBFxdyt0dm3ZOGdwutf0U6C0A08uioO10kkL6TuNvK2bXviHFxi1
         Y1eBbY3xq9C8fG8ZrL6Ja+AwAGC6DJPl2Qnc1DN14FofrtY+Rfip80DaCPz2bx5cu+Z1
         pUxXQ473ZrOnincQXBVsfWEmkwPnOpw56wiLLhm+2H6xPPtZngROExLJQJLxhI6EMc4A
         6Yow==
X-Forwarded-Encrypted: i=1; AL+hErHCu/WQquNDniK/XGUDj7/um+Brk7L3VFD0PylncEKmyqTHIHsvQxIKq4DASA20ytNdCaPT1uxknorPPnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FR3S4klPG+x/ipKaiDIkw2QRI4sB5vjGN5jF9/TqLFMGvPlCr
	a6edmvbp1cVIV9/uI3DqPraP5BtrPidU+YShVp4UBoRZDT+9dQXU3TDuKlFIWq4F91AkMGh/EVI
	R+1xz6HM1m/BVDVGeCjkOqaiY6FqnL2+DdxMylc+NOUblZI+QX6EDs/B2XTwJE9lS6bM=
X-Gm-Gg: AZFdTZcbJNlD9ulwIoML557Pcf+U/BuHIfnxlAcnsC9OtvS1ie5SZWOSqSfyo+Qgt5m
	VfYhkk0G082BbkFbiFYRAbaU/m9yWkhZGN3+/Qm3Djkr9n9t47Msmf3nqL/U8R610F+drI4PPVT
	Kj1cN4iUx02Zh6AMxjtXPZ9KUOFj4/sdO9vVLGN44nUyPRu9O8YLGwa+Sz8rFFSC1CmURsdtswN
	zq+5lwhh2rxQH7HAJAYxBCagUBN3AA4Yqc1JjdQRE5n59XPEsChsazD7GWM5HdD9pP4hmNiloDJ
	gL01Z7PO4ZIOyUq1ZA8k5yHxiD+pXmq4mgYH0IYVDwP5IJUhVISSUmTTgXsfrjSMbwvYDZ9qssV
	yWS4MymFoHrBdCe4tXfeVGHahLWtSIbY9G9GLWq7k5QIPjj4WeV2zRgqmEmSjaTKahQV4eBWK7V
	ItLg==
X-Received: by 2002:a17:903:2303:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2eff7100c4fmr28398865ad.1.1795012452841;
        Wed, 18 Nov 2026 06:34:12 -0800 (PST)
X-Received: by 2002:a17:903:2303:b0:2ed:391c:1de1 with SMTP id d9443c01a7336-2eff7100c4fmr28398475ad.1.1795012452346;
        Wed, 18 Nov 2026 06:34:12 -0800 (PST)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ed0d2esm15326095ad.10.2026.11.18.06.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:34:11 -0800 (PST)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: m31-eusb2: Add register XCFGI_199_192 for HS disconnect mask
Date: Wed, 18 Nov 2026 20:04:05 +0530
Message-ID: <20261118143406.2351999-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: P4CROlWySJIHDI7J__P6mqJsdQ92Wr2a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfXz8vsoTk1z6iH
 WPPw79JRYopH6Vs/g5ilUAvNWs5jX4k5H78MiLaaDaAjbgs/iAW+5AKtvBTXD9OF28OIcCmp7Eq
 2xNbvLBDIfFNy4f1J8bf14VAh4Xu0ug=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdb765 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=LxLwC_4Rt_vGV6uIXdcA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: P4CROlWySJIHDI7J__P6mqJsdQ92Wr2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NyBTYWx0ZWRfX1924OSJp1ACg
 IRQuCR/TZD7zzDkUVbSqHaO82KtOHUy9IhVvPfcGbjx0oHc7upoZjnTQqht1yDBLIons8+SqFhO
 N9nEZvzwDCZXc7P4ztPIJP2QRgdgQr9t/ghilNGZO+SMFTB7RFr3VuZ4o7KLEDxvZ1Sv1nLeVtY
 XlZx0WcJmHWog5H/IDJTqKvNOKZPXXxGc2vZyz3JwXd6ydkLg08FW63afGSWoBp1V6DhymUljSW
 eeZq0DKpPOP/nGk1njHOw3lsrgb4WZlucDqTN4hFbnLOvhAqaHeCchyi/Xc8xTJiyvVn+FJVjro
 cmsw/4r6Rkff7BU9O0jp/kIObTZua5X7CNXZZ7KsorhDLxL34+McrVAe6OnFIOqK23WYXudCERH
 ouGw+mD3PA3zGUETtKOIBbN87NNPFsbVSadnBUo4P4t92XIarD7QEXgH0gQU3Dna03XDRIkeSZ2
 SCBAQJww9PgdANC2fvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180057

In USB 2.0 High-Speed, a device disconnect is detected by the host PHY's
analog HS disconnect envelope detector: it watches the differential line
amplitude and flags a disconnect when the amplitude exceeds a threshold
during the bus idle/EOP window (a disconnected cable reflects the host's
own drive back, roughly doubling the observed amplitude).

While the host itself is transmitting, the line is already driven hard,
and trace reflections / signal-integrity overshoot can momentarily push
the measured amplitude above that threshold even though the device is
still attached. With the detector honoured during TX, the M31 PHY latches
a spurious HS disconnect mid-transfer, showing up as false
disconnect/reconnect events, re-enumeration and transfer stalls under
host-TX-heavy load (e.g. bulk OUT to mass storage). The failure is
signal-integrity dependent, so it is intermittent and board/cable
specific.

Program the XCFGI_199_192 register to set XCFG_HS_DISCONNECT_EN_TX
(bit 196), which makes the PHY ignore the host disconnect status while in
TX mode; disconnect detection continues to work normally when the host is
not transmitting, which is when a real disconnect must be observed. This
register was not programmed previously, leaving the envelope detector
active during TX. Add this bit to the reset sequence to suppress the
spurious TX-time disconnects.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..4e7ea41720d7 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -56,6 +56,9 @@
 #define USB_PHY_XCFGI_7_0		(0x15c)
 #define PLL_LOCK_TIME			GENMASK(1, 0)
 
+#define USB_PHY_XCFGI_199_192		(0x1bc)
+#define HS_DISCONNECT_EN_TX		BIT(4)
+
 #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
 {				\
 	.off = o,		\
@@ -100,6 +103,15 @@ static const struct m31_phy_tbl_entry m31_eusb_phy_reset_tbl[] = {
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL0, SLEEPM, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ_SEL, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0),
+	/*
+	 * Set XCFGI[196] to make M31 ignore the HS disconnect status
+	 * while the host is transmitting. This prevents trace reflections
+	 * and signal-integrity overshoot during TX from being latched as a
+	 * spurious HS disconnect. Disconnect detection stays active while
+	 * the host is not transmitting, which is when a real disconnect
+	 * must be observed.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_199_192, HS_DISCONNECT_EN_TX, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_UTMI_CTRL5, POR, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0),
-- 
2.43.0

