Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458535;
	b=UyqHjzcq4fiRUCMX3EHnSuWHHCdOZva/QyixeSM5ka5J91sOPlQpVx3N/wV27q8jtajG
	 1GTiZdTjGwouSTdoqUSaNrPsd8MXSzBzu776ssHsqujvp4kp73QgCrTx9U6gNgBH8IV7n
	 1x12B6PEwWbyvRzm9uAn6fYZWTClLudhZUqttNrROyI9zUUzPDq3ezAq1uQKtDoZTnG34
	 ze3yW1qL4uiSvM1264XZ2tjaXi69IchK6k9lG+4YMiU4dQk0cK3RRqIqHdv591BZDBSEu
	 D9ckGobjc2QPVg2MG+UYgOLG5EWe7KIgToCBBHMMEqjefgA7GO4dg3gDotvy3dbRfcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
	b=LpQlYGsCg4vSW3vBoajsG+MR6nxyex7thTyG/6mKJmOJHSHQSZceB/OOwe1fB1QX4MKe
	 +IVBuPvyEsfqkw0IJ/zTVH4IVcrzRmX1VOsHdu17cHMM0Nq8mNOBjvo8UkzWAcj3mU0tA
	 u7622VdEU8jX7v7b8axd5D1kwrNCnYEWHrwdJm3zK4x5ujjWISgaO4BA90XKxKpYNbkDc
	 5T4qqIBN9huZNZSJayxkidEXP9VMc+cCb1guJ8DuKfw/J+67/6CNe1GXhYHAyg5RHbeAM
	 zyYeEJlt+wbUlf5kUA3kMVIa4tHRvpkv06Qg+dJXInprOLOSRw+0WksVcxU23HBUdvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="HTazO0L/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad7lawWC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46BE606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46BE606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HTazO0L/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ad7lawWC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnRl3025350
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mHv6aWy9+lF
	Zys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=; b=HTazO0L/4xlBhQ6odS5L8MGOK+C
	arZ5a1Aqn1dfk+LQujZz99ozwUsdHsPLukuDsQr6wrsIecKVr+5fKGI6VYsWBoUu
	UElYVXk9/SVBbHthdoLfN8xTK2SDNJkV955aM3xkDV95tEisEOzbQ5olgOOLsEOV
	zEHvrF3mCX33gXStixKEBCDd6r27iUjLRxI6vu0yXJgSRMRscnmYS9sj8L+5Tx0/
	BUjzJtoxeaNMlt9SKPrSFDjQzUvwU9aS+Dk3h7mV/f80JiNj3DQfj0PSskNJv5pb
	f2M0cjOgMb5Tj3nBzN97dwyXlv9UZh/uni/ZfDmLAUcTwTDINm957Athp8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pauy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so3625222eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458533; x=1796063333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
        b=ad7lawWCPxHl7Hs8uQeqfZBmzeiLC3sPBGvYokv2jwEcy61oekTUcposrd9mx8zNPq
         KUcshBSurYF7npYAxHkjiyBqX3OcBfUDdVpu57y574EC+HeiVsATcbrfjNhZEpqYpnGY
         IW4JRUzODEZc29wCnGKpzUmL6aAQ3UHOhpW6TitSLBPTRaE70VPjrubh+k72HdqAYT7x
         aItWWxWf2ShE6nXiKeAiBdbKxWSI7AEx+t/YE2Qvim518F59f57SpI1Hrg3HeRP5wQcZ
         9uu9yFGEzD1uCydUnvWEkQXwejbL5aLaLT9mWMxI+STqNrbxIiMFiJbDJ7/GECgO1bfB
         8teQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458533; x=1796063333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHv6aWy9+lFZys5gIfbcsPXQP8IxkSSS6gptCgTCzY8=;
        b=ANDYrZdM/sLaDY3LNatY1lX2Tj0ueXEgvIAp0aSjF42aZDk76BXBY9HT52sXLZmMq2
         jDMfvaApEFwWZgYZfolvvEqXC9ZOhb/GYwDR7MbAXP5Q+W3lBUzLZJt8/dKkZ290yjHO
         5lk32LrHUzp+FQplZ6HPWTmV3DHIWuVlrwV75lIr+0fbe5UejgQ7QjuVL4QGUKsI7EQk
         CTzLbi+PbIXovoGgs6y/GjuV0Stctlobks3TduHExGhrOV3VOM7zX0qZA5LDt7pY+Zm2
         Dr9Kn8MMll1/9jYDQycYEYniuyKHXG+HnYdyf9cMYYNvoJ7NYmRlCOAlEGv3pesb1lel
         NFtQ==
X-Forwarded-Encrypted: i=1; AL+hErE2rLyKrN3ZUQwc9gKRsyhzUj+eS3D6o3fD/9ooOnP/zuyRYbkEP3Vka+Mra6eCvtZE4NV/2zHGYtu6Iz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x+OxEpy/4RbwIEU/Jf+bTBjMcHrj745mA6tt7zXg5oZJYJlrb
	2CB44L5JqMqjf+24JTWJDm+ChF616ThbkI3kGK8DaB6ppOP71xftwFlI6C/oxkFra0d0dyoWXcA
	unreigiVx8qhpwr/KAfkFVkG7vz81vjseKSqWkGSM3HtOG5aejiBnzD+ugP7njgvP+P8=
X-Gm-Gg: AZFdTZeRIA+VT2DzNODFO/T01UTvvCbwmTHETStuxy7LRZXZ2YI+MEnd4g6XdQqjRxG
	XngZmRhYAbJ4a3LMB855BqERC/LaK2dNP3ILVulo4+LohTshhBDuCi2/AktWLKHhB+GDNmNyACY
	0GbHi5rOeyGlzA/WRkKZbza1BP4YwcmZUD+/9jJkM5ei89kJSIc55LtSnq0Mnrs1jJjDsXm3sLh
	hDquXNqF1ZW0Jrj+AQOFHtw+dWrDJ4Uec9OC4Q24Myn51L06i9rtoJMTIaS/VjtC63ZAXn99oTw
	VKG5O89qFycztLrron+Ioph2gABfo7FL0P2U/7QMFNxEAckLHZAtXPg7D99ZUmN+bMIGx8EsgEF
	YJDDpofS2ma8qsYmwlZStFN5ViT2YlI9qRjap57ou/v/eZYF/GJUWwSqdLfKz9vR1i+fIb0yAmp
	5zMIStMUDPTel22biNYSHnclAOSA==
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr5145935eec.1.1795458533219;
        Mon, 23 Nov 2026 10:28:53 -0800 (PST)
X-Received: by 2002:a05:7300:a9c:b0:386:a8a1:9855 with SMTP id 5a478bee46e88-386a8a1ade6mr5145913eec.1.1795458532595;
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:52 -0800 (PST)
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
Subject: [PATCH v10 3/7] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Mon, 23 Nov 2026 10:28:43 -0800
Message-Id: <20261123182847.143892-4-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4p6Uuaz-gaukro9g8XyfAz-K9Ar7R2BG
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0485e6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX7hoxA3hjL4zi
 mYvUiaJ5Ig2sKuJ3Vx0QIlekfvE3qpRDdALq2FdTGrTwcOAwMUNuRD3iQsZJxA8ynVeaqT8USwx
 uxscZpYXhzekMG+kzyMU+8YgBvJDdRk=
X-Proofpoint-ORIG-GUID: 4p6Uuaz-gaukro9g8XyfAz-K9Ar7R2BG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX9GGvCufk0y6g
 wyDJdYW+Kn79JP5Ds1/yzePj4yfH5MLFoxGrP/dgLMuG0DMBw36/btG1a9zJLBm9FUmQprhdcaa
 fqS2UHJh3BkJZo4tr2zp1semzaK6GxYB75baLA3WgUO4vmOtELDV0CoYt2eXM9jJ+hlO3gD95/X
 Zt4/oTL1uqVQew2u3eepTtLFn8X5ky0HtE/WRAYfuuJiFvPO4359s+7YDf7JC8E2qoIm3aFT8qE
 9ggJpQ8SMQHenk56ShqB7n0+uneVzzI4oFaV0+E6S0SFUHiiDlBRivvUfXe4iivC9t5gacAr9Lb
 VRYB0UL+2ikJp5ot3QxYTx2Yvcs/Jrn01OIN1YUDJR8zARG29Q4w3O7S9dkjUVbChuHA2Dc4xuU
 sYafbq/8vwiUgjn7zrDOOs8MCUx04NVC9uDS95VThWT5Jc6kmJ0CPNXz9THz3rwrbSEdMRuWc+1
 LagKG536GEmjmP/WSKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 Documentation/ABI/testing/sysfs-driver-eud |   3 +-
 drivers/usb/misc/qcom_eud.c                | 129 ++++++++++++++++++++-
 2 files changed, 130 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index fb927a003596..f20b82b5a38a 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -20,7 +20,8 @@ Description:
 		  primary   - Primary USB port
 		  secondary - Secondary USB port
 
-		Writing any other value returns -EINVAL.
+		Writing any other value returns -EINVAL. Writing a port
+		not supported on the current platform returns -EOPNOTSUPP.
 
 		The attribute is writable only while EUD is disabled.
 		Writing it while EUD is enabled returns -EBUSY. Reading
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 3e4647acd5aa..037b074318a5 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -40,26 +42,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -76,6 +136,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -131,6 +193,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -228,8 +294,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -258,7 +370,22 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->port_idx = readl(chip->base + EUD_REG_PORT_SEL) & EUD_PORT_SEL_MASK;
+	if (!chip->paths[chip->port_idx]) {
+		dev_info(chip->dev, "secondary path not available, falling back to primary\n");
+		chip->port_idx = 0;
+		writel(chip->port_idx, chip->base + EUD_REG_PORT_SEL);
+	}
 
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
-- 
2.34.1

