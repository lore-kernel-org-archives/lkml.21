Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442178;
	b=t1p31KfqkdWOEP+T3BX/ti7zQACfRkxbKZPPO9+kqBFTVqEkbEXMt5qmXpuQrhubbOLp
	 HBaBF4MxNbU+MAPUy/V/4REhcwEFyfS7/x8cElTCJbKsnDofGKEOFTgRytG7yfgWcEqQ0
	 1B/MahRsKSAoEQnFk3eITsamaHGyNdAybB2wQuYqSV2ixLOfDsLEn+HyHiMKvUt3HvX22
	 xR156DQD1rxTjHkNap8NasET3wCiretjF/ITnu+HABpV0c80HPmHUUGLbrau0+hv3o5Uy
	 LMiZ67S1GOcQByZnFL7GZEz7DAJI4sn2lBjCHjtTc5Tvf4SDNU6nQ3h0Doq0CtMsqcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=;
	b=hSG3wXsQhb3cxPAnjxjm6nbUA1hfM+WapCO/ErjiVwrP/iXNJUIE02iVEqKfCqPTRZga
	 S4ZOKK0PuMlRsB95AMk2/Gykflx3d0hVGMmhbqzEdMtSa4Tz75PtRxk1Lg7PUzv1bXZL4
	 T1KBzY3JkOVyM78KWkA9HDInNysqjXKo7G9GsMW97+uRUbq/v1wzFRWxOMiOwymA06wbx
	 tF8vSgsJptE4iKEWPGpz/puj69azuuNqQ10TUGY1kgN2A8YflhskyY0TV8IzNPhBPFu9G
	 MnlTjHpnv2xr2Q6J4gcPMXOE9eCbR1tc8sp+T8FW8jxFT322/Il4k8pEPX1WFwM0iQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWRyANkg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFUBf6t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62DD606A6BB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62DD606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWRyANkg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFUBf6t
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLRc8446153
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=; b=YWRyANkgd+upY9eN
	x8GYfyuWfYQNwlVOeyYaisbNxgEm7+4kDzlWs3+ljIdpEXcfNpfQGVAL3nDVaE7E
	DqlNrig6WW7QYXvCxB7uJqS2lvq9+CMiLP60JvassDtV0jcivDxciNgZqqJSletX
	Fi6rmOErx3+nMHPdHtvG2IWQJWWkY+AEvqprPOeAPe4t+xgQRwOHJG02H61ujdLg
	csPhpP69yqRQRlbIaiGlPGqS2AA4mxAWW5Cbxy1YIuMO9ACDFYP9L6hVeTibn53l
	YdIffD6gaJ09cVfAU5zNevjBRbNSdXkSp9EsKj09ZbMINMbhhxmeN3Y1Q78p/tX/
	xc/tsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741n8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so854465585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442176; x=1796046976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=;
        b=InFUBf6trzgIwBCnPI5YKA1Rv1Yi19wUes4p2rqeSsdb8KXhQc06JbHCDHDRwWu74B
         ZgBHg57GfioDTCiI+BxJQJ0cQxmDsghjK6KxtuPUQCSR3PiCc3lN8lv6JAbp3H5gBRTM
         g1cpvuLD4E4vPDxhbPpeshsFnbilA68N66mJn3SpjaqzSP9LdVFtlzi9OBoiGpR3CqVb
         JvkZAv8q1GZntudzAsyiC6/IiXWsnNA4XHkujJwYjkWnMFsPSdchvGhWRKoxXep01wEx
         rPLVSr4UONQL1sR6+yuYvZu+sn7wb9DoWrrErf7KKb7cs6gEtg5DS2TVVIKee/HxmDat
         /AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442176; x=1796046976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=;
        b=Crs3d1hs5HMq61V5dqKru4p13nPKt/mcUUX3ESF3fg1lTHKIl1k2D8g0YvAmzasWVE
         9c8fE8ra5IQotm3VZCwzII5S+Fm0wFcohDZSUQeKLG7ao4aQBbo9tcUZzjIadQyxnFYW
         r39aiUFsVr012tO661gpghLZlpYkkXTVHNcwlvvmStOUqYJS2pStwksBEofWaYtLFYis
         mWcWObnMmmcSinBlis6V5X4VOc7I/s/j2EZTWVFzhoXHXGwGF8gqWWDq63zq8sAYf4md
         o1PQz65cMvIM1/Ot4jXOwPm9iyY2phxopISL8f/p0+3i9NrUpLTw/D36oDphelQV4Pt8
         rvFg==
X-Forwarded-Encrypted: i=1; AL+hErFwEZAMaT48aJjKe6skJkyKcApOFjycwviYeXYVW2pNy8aEtK8ShCK7CEjODIeRbaXc4NZg9mmn2muOawQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6ulZ+0pAy0E0GP6f+BTiBnCBsFa0OjS/r7dOcKfS9vtlNqM1p
	saiRyvqUaH4SulAfMbxh2iVe5SE5iUZX30FKA4wrEcB+tMhxo29dSK6+3BNcdSdNGm+8LWSZjbD
	SYJlVo8zB2WgIxy/WtE3bMPDXBzFND4kxWua0bojVwm+F1hYuTSEp4YGpSbYngpTt9cM=
X-Gm-Gg: AZFdTZdPYDLovMIkxcyEjcdZn32xh/duyBjDEuNJavGukt41GEMQXhZSztO2OkRu7b+
	t9iKU0XxGcTuG0IewKm5cNNcKI9WJu6htX06MJRZRJmZzucpie2JRmA0VQbdNNwIKcxX6S784hO
	VyxIdUnd1gEhlXL1fxok5og9zBWJLmyjId7jMHCJkA+gDd9dmjOK0xE7fcPS3aBnMb5pQbibCSy
	vwPO+m7f+EkAWY+ongNbKsIa01E8x6Id0lwXUafZlHTofZrBzyGT+xsmiLqdpMYk4guIxzl2s82
	7zRj+TK7b1qev3TfX1AgSqhK6kZ6wtvzfA7UQ+0cxvo1CXTR4xp62woh16Apob42jYV15PfjwRV
	GMHvhHbUaq6nC8FB7QX1tdExuykEbMoCg3H6/pGzulOk5BP4AW0H5JotEYwpO3EebLYJmkiIt4Z
	Imq/zqsIdB46EUnBlDtPY+RJGyT98zg1c9tmClPcHdBthVDIvOGkHXkkUSa1ban1uBJ8pVrAyq3
	lySPf2YMyGR8byGzEjQ7pRP62j/
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr1951679885a.35.1795442176147;
        Mon, 23 Nov 2026 05:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr1951672085a.35.1795442175472;
        Mon, 23 Nov 2026 05:56:15 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:14 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:09 +0100
Subject: [PATCH v9 2/8] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
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
Message-Id: <20261123-monza-wireless-v9-2-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: H7_L0rYa-BG2jtq9NL3Lkicv9uxv62uU
X-Proofpoint-ORIG-GUID: H7_L0rYa-BG2jtq9NL3Lkicv9uxv62uU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX7Gt24HiKnK1s
 ZrqY/pOlC55inMAHdfIADtL5YYCx0ih+7I1IQHf9MoL3XjbLftA4zbUgR3pqXI8L28k3uJwEsFR
 gyGF3nkTT3ypBcyTD3Fcf9oPFjrDC78=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b044600 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=I95fhSNaEobLycDSJJAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX4e2Z6a2eEy6Z
 jkpHNn5bUxIA2xUcOvdslsFizqoK/ADW/cpo5R2uKwHnqjzvlf9eSV2ruYN9x2+XrxXFSI4GnW6
 fb9c60RHrX1mKE2c0ujRMoVy2qH1P/PLU2JIXbFy9xmtXuEkoiAIyixQbE+ckKGZqH50LYdhfeg
 yCNLmIScTf908rtEYZ34P9XUVtKSXcGEoKdy0kZzgXtYV+a3uo5QNophP3aMAVMFjvlJ2MlXWRN
 s5I6ZkdMyr6z3d7ZevOAa1GgUADQjV63Bfoi/KhfA7owoBaDRopoOqobKYwGy/7X2aMb5zdp6uX
 FSa6ke+kZW8M9nU1b/MmJGjkHsCpeQM3Ql9lkCpMihmcel32myA2T6mAffezo4nNPEkv2TskAfV
 BbX2q+AJUVj5ST/SiViILS3VHyRpNYYQz6c3JlTtsIbUxeEg1hKQzhvhAVQn5QsCk7SzrXOqYDO
 CZ91pLyMja7bpYuib0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index c4e42c9542adaddee17e256eb017902ef565025f..5544dff9d10b5064797d41294b126fbc229a8dd5 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2477,7 +2477,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2584,7 +2584,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		     data->soc_type == QCA_QCA2066 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2623,7 +2623,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2641,7 +2641,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

