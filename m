Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458534;
	b=pTFdZtjxTX8dDC3eBXlRBDKHTgorj1JJieeybhNvUjpzRxpP4J/3I+1pa8PngyFc4UtX
	 N1+pR1qr6FuJFg1OY0oLz9i+ZJuqsJR/8aWaC/keAGlpmhUY13K0d9GT5elAu4Ttjudem
	 Qgx98Fmsx/WytTWTzbXd50WuTbe5+fFOCTS/QiLXyNiV/1A/pQCl7VS0d+0Rsp4Ygh/nD
	 8x34HVRT1oN8hNjL/lEhYVB/gCzZtTGq6gw/qKh/KhESkgD5cnwrrkDKlnkQBqR0gbebo
	 OJlAuD6+k/Z19orXh+x5li5kMse/8hs2aA0nHW9IYagXcIXCojMPKuhhiH0H5a713zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458534;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
	b=rbTEXS8KcrKbTu7WdKIKzuY0f+BYNGchJxM/0qLmNHD7sutUAR3OwgN7I04orumXaw1D
	 qUxyJ1/l93n+BGvh02XhfcHjRKHIkFpZIIuW0WT+ZFDgqJ1OJW8byBB+kkxQbf+GoGNf6
	 TT90LDGhDCOhTFrlGkAQL3l238/7JfIqoRpddRwJklrbjcCEqspp+3xWaSI6LJZNOaisI
	 A+glBxFsdPfPja5HLMzXO73v44a16ZwBxE+kDXSnk3Mqtn1WY6s9V7Ye3J5Iz86dvGkGz
	 WcCm1tLKgbVN1ZGlwA1Fhaiz2bO1IWXh+BsmeL7fdSnVsffMkmsTrTTX91A41a1q+1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669DC606A6A2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 669DC606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgmcNHRw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVfKytR7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3PD3475231
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lq2ckgeFeyG
	4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=; b=QgmcNHRwOTYFltbEnU8CT6eWZm4
	WXkbo1fYHF5B6WuTtNV2ePmUKqi/DuCVN3/pVec9kVHtH65Mc+wbqHnDno2lAZmz
	hoYYCMciPSTtJ2ZV44G+YejYZKwrGjjc/0rPGuDm9MlAF+Xmfe+CdG7mkSMresh+
	1YHX5ztPz6VE8AMXQU7/G7JXDePrPCDcUe+0UD4Ajd62YKiPFuswrEC53TSj1W6T
	zBSyB/dF7BO88Ucssq62fXRYMNeRNSafS/CrAFcdBtyyqu6OtoMW2Z4Ztddvd+x/
	sg8dcebxjggFGd1GnTBiDla8MUhhRinwCf4bGrNoC0EANF5WXcRmqAmnIkA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tg5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so9766176eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458532; x=1796063332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=PVfKytR7uyik7EOhP3PMKvv2wSoWbchKb7P5srh9XzqXBy+D4JROiV7AP/Eaf6zJXk
         d+ac3+FpunoRRZ+FYoRUEvDqQTTbe+/4NeWVNbMNpSGUq+xTtQvLBhmd4b4iT/ssPRHa
         LUeGqC0NKd7OmsbhunKBDGznH3+3Jzi8pAy9lkyDC/qyf93ZcRAq80q28fvlHNIwf22L
         C0qTc6RkUVoWuHIal+Inm+yS4CaElGhhnFSDrjX4VCPvFduVdfk5qk43kb9Ytr0FkVik
         QbkJVcjLJJ7d/LQUnqNGzPvejSF4txn6besl++DXs+Is6yz7OgzjSAiGWLBINy9RYJQg
         1TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458532; x=1796063332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lq2ckgeFeyG4ruGkCS4DwzZ4m7ssUVEezBWNCadpNus=;
        b=mRvBA/b7xmx3/Zd+JcDZsfzcbDq/SA/8NR6Bo3HjJFBc2wcccle6DkyEYoMAN+xUQR
         8+SJdGr37rsIm8Gl6vV118tfyTk+91sbJHQfJslu7TrCSc5nxvHWEujdO6eovo6O42kH
         2qKMdojov/+c62C2LujHM1WbHx2xrcO8q+GMC8Fd9O3bg2+CbftU5KovokMKXT8qI5pb
         ecYHO2z1nN46Wx/A4j1oBRAcTCiybig2DfFnu60NGREeejfz0xvWnapON+Qc4qVuyJ+o
         wNAwJL18ZjLw2GZjv5AFLntunPXZ3/4XriwyOTBYc4eLiLOJyLuD9CzKsq4wrm5i1wiN
         1a+A==
X-Forwarded-Encrypted: i=1; AL+hErFqbGz/B3I1ORcmivXHl5wXK2N289MGdLK89alae3Tkash0LqN4SBE8dkm+zt3NWY7SOOqcYhWmGsL8RaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9drz8LdeSPu7rLvzrdRTkiFN/H2bDC/Tq1RvEppzX2cEBjkXvV
	Q/9Le9/MaRD80RO1mMZR/8YXvhJR5/bPqwBQO4oDcGku3LbuC7oatopxDBpePE5edOzDoqDAdwB
	MFDuViab+1EWCuSGg0Nz4YU+9hD2sKGaE62DPW0xBymq0Sm2PHFTNQfKDU4lCK84LpBY=
X-Gm-Gg: AZFdTZecx8k2tAsf3pz2P8nBTmuIm7YKS9dNVN4bKRm+KlSrt88vbJAgWngevKKaKtz
	WWsYclgM3W/vlGbdXgrDa6ztDrVlyeHvAx6g/7CTvJIYtMnjqiWcsvrhNUmT7j0wIu5qzdRojhh
	6KLyvjOuFJpudIiODblNiLwhYT/JHTWoJIaG2IcjY5RuPXvbJd59xp+VCQy1d/QZp8/mOKoXkk3
	frNkUufKnWEtsh8BRpCDFnxM8Y8kz7qL5ILeV9mlXoOjxD8QtLfD94LXA4+Z09venfvJChWbhL3
	eqjCTBj2AfHpTfdYsmT7MMglIt6VhbxUZ82A7/MzMcQPXpM0ZS9GZBoTpvJNjJF7ZNNi9Hick96
	uCHa7bDNGknl/nB3HVi21ATsyIH9ndaEXiETmwgT+jXGEk7teRjx+6bNGkQ9xF8D0T90TyeRyvt
	lBO/NpDGE0PHrMLL3S4+mgj6/CcQ==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643555eec.23.1795458532086;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr17643507eec.23.1795458531488;
        Mon, 23 Nov 2026 10:28:51 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 2/7] usb: misc: qcom_eud: add sysfs attribute for port selection
Date: Mon, 23 Nov 2026 10:28:42 -0800
Message-Id: <20261123182847.143892-3-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b0485e5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qXh0dugIJu6lbCvlF8UA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX6mjbieaG8kAV
 pB2ppKIQ9JF4Bz993W3IvmA3SDpY+08SKaE/AYik7+HHN8AWGPe88IP15Qlhc3rY3V+e2kWpmPv
 TTjeJJ7B1mfxxztDd3QZUHFuZlDa551cTYY+wxm6a0Qp2yg5OiA9I5yrKGv9BTFNLIXj5Tw1UNq
 VWHIjsj7+BRwpvJ7KbDkRHlhnjUqYmYiLqOLuuiHNdRv9PmECnrbcVf9gagY1EsDTvrnHOr8Wv4
 c9kkPDlJ5BNG+KPizHGnOamCqE+QZjUkRKFYjpdBxag5h1TfNoPeF4cIrYqJTXXRwFVbSOz8F1x
 BkupkdLG+FS6ivEHi5Qm06w7ehzUcF/Px8O7g5fuzbe+0M6+eh6+nRb2PZfMzyvederhcvLp47j
 ygraOqpQpBIUONEHsj96otMpCWXKY6CvWdT5D3UuypO+OZG3LNkVb0uY/JXM9A/0ADpOh7sD6NW
 kVB0THVBh7ImBQp4UIg==
X-Proofpoint-GUID: c0J-xKhnU797YgJVQkq8ts2mI2t8Jzby
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXy5+B4UebawN/
 2CBLtZW8toN6bVjmXDxBD6+mF6I8pUgGvoQFqse6n05lqU1IPyyJvcxeMKyAlmFKfmJpIYlQneJ
 +t1aD0Qt0aasegsdi0FDT3gsT3z4NEg=
X-Proofpoint-ORIG-GUID: c0J-xKhnU797YgJVQkq8ts2mI2t8Jzby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD can be mapped to either the primary USB port or the secondary USB port
depending on the value of the EUD_PORT_SEL register. Add a 'port' sysfs
attribute to allow userspace to select which port EUD should operate on
and update the ABI documentation. This is needed for systems with dual
USB ports where EUD needs to be accessible on either port depending on the
system configuration and use case.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud | 18 ++++++++++
 drivers/usb/misc/qcom_eud.c                | 42 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index 2bab0db2d2f0..fb927a003596 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -7,3 +7,21 @@ Description:
 		EUD based on a 1 or a 0 value. By enabling EUD,
 		the user is able to activate the mini-usb hub of
 		EUD for debug and trace capabilities.
+
+What:		/sys/bus/platform/drivers/qcom_eud/.../port
+Date:		January 2026
+Contact:	Elson Serrao <elson.serrao@oss.qualcomm.com>
+Description:
+		Selects which USB port the Embedded USB Debugger (EUD)
+		is mapped to on platforms providing multiple High-Speed
+		USB ports.
+
+		Valid values:
+		  primary   - Primary USB port
+		  secondary - Secondary USB port
+
+		Writing any other value returns -EINVAL.
+
+		The attribute is writable only while EUD is disabled.
+		Writing it while EUD is enabled returns -EBUSY. Reading
+		the attribute returns the currently selected USB port.
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 73f9fac22e19..3e4647acd5aa 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -23,13 +23,22 @@
 #define EUD_REG_VBUS_INT_CLR	0x0080
 #define EUD_REG_CSR_EUD_EN	0x1014
 #define EUD_REG_SW_ATTACH_DET	0x1018
+#define EUD_REG_PORT_SEL	0x1028
 #define EUD_REG_EUD_EN2		0x0000
 
+#define EUD_MAX_PORTS		2
+
 #define EUD_ENABLE		BIT(0)
 #define EUD_INT_PET_EUD		BIT(0)
 #define EUD_INT_VBUS		BIT(2)
 #define EUD_INT_SAFE_MODE	BIT(4)
 #define EUD_INT_ALL		(EUD_INT_VBUS | EUD_INT_SAFE_MODE)
+#define EUD_PORT_SEL_MASK	BIT(0)
+
+static const char * const eud_port_names[] = {
+	"primary",
+	"secondary",
+};
 
 struct eud_chip {
 	struct device			*dev;
@@ -40,6 +49,7 @@ struct eud_chip {
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	u8				port_idx;
 };
 
 static int enable_eud(struct eud_chip *priv)
@@ -104,8 +114,38 @@ static ssize_t enable_store(struct device *dev,
 
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t port_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", eud_port_names[chip->port_idx]);
+}
+
+static ssize_t port_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int port;
+
+	port = sysfs_match_string(eud_port_names, buf);
+	if (port < 0)
+		return port;
+
+	/* Port selection must be done before enabling EUD */
+	if (chip->enabled)
+		return -EBUSY;
+
+	writel(port, chip->base + EUD_REG_PORT_SEL);
+	chip->port_idx = port;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(port);
+
 static struct attribute *eud_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_port.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(eud);
@@ -218,6 +258,8 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

