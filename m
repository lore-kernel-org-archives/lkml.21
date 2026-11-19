Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795079857;
	b=mPX4Mo2YHu0IbANotaAL3clvrW3UwbiSeZIbpnVSuoYGXywTuDj+roQUgQLkMIMs+OrR
	 2afTLRZWK8K8elyeVLZgqZWar4YANtkeIsC9w+k7XPISCCd6rRCguy3ds2C5rU+Tp0nVh
	 qhV0Z2qeEazO7P6b4mlzJkCBs5PiEeaqC4Z4tbUHQzDbt9w6mNUaTbHLKNqMZzpg96a1S
	 HZKt+Kvgc2FX8gVoKmyHd4ZSN8QP+FWq99ylmj7hkyXoB4mbhmciHm0jFkdGnJqntH9cO
	 g4iyaEK12/klkbrSzMx4E+6muBoq7EPJTSN+KrkbsKrOGm4q9hmUzLrHLh0kFQtwj2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795079857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqGNhNN2NXc=;
	b=k/xqDMq95ULwu4+kCtKdoFtopIn6KJ2WLXW6y6FthrpZNunrs1EotFaeNhdyKXExy3FX
	 QsYOjVnD2eP58A4ca2ufLMYQD3Xg6d3jm4m78o890XM6XpnpnLQ9Gb9cZCpTZkleseIAy
	 vb3R8AWUuv9dNHNJWX+m9xe/EvkG88HpwnA3hIW+9lSBiHiQzG1xfNSjKfsbi5WnRgyIg
	 aXhxxWDEMc7Nbro59bhCFWaHwn+bo7lLezM28SsjfJoEb4z+6x2jjWo9FsrR864Yb0g0j
	 6zdT04EuAbeD3S8ZLuVSFo3URHtSJPazOOImfgzRSdGzBRAgnTCVzlr52TPIKXlnkLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9bOV39p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WpPF8S9+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC45A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l9bOV39p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WpPF8S9+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v4gw1962340
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqG
	NhNN2NXc=; b=l9bOV39pK/XM3+0uR75nrnQ2CFoHFxKyNKqf4Qi1dU8PGeF3Ua2
	UgM0HxrunHWckyjvs3IPc5Gxa7QcE3eAxEsfytNgNia+pDrEj1H2VOfuZTISHd4K
	hXII/yMLT9Wd//xL2Aej3YEp1ODw0RVDhDs2S2dkcPUJ+9KAQ0Se1z+uPuRVGZ01
	26DIBZrKYUN+4ih2F1viroU5xVf+bH5iwKqFVTbAOEfpRe6zo2KbrMeFf3IGtas8
	FzNwmXF2hhJfKNNtiX5ggEzIzTYiq7g6HzE/W2mcQgLmZwq8AMmWEZKXaGNuASa2
	Oid7ZD3u7CLejIekslqDftpufUfa0V4rynQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcugq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:17:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so477072eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795079855; x=1795684655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqGNhNN2NXc=;
        b=WpPF8S9+uHpU34DXlZP5hyU3gYlzj7oD5NRU6SmQSYUSUphS+FZgZW1rcsA6C2l/6I
         T6eHUETD1Gp7tnpQHPC0xkFc08jRQYUY5UyvWjIaOx8DvBUDKQNHQ8Ep/rza3kXs2lca
         pKQ5cQA3yhHFRFpU/O2Po6UcbCbpVPZXOdKytkYLDqGfsrhfgkOj8lTcyvCqioJPNWwX
         sDhVgx4ukc066tC24YY/PDTjS6V3DH5Cym14DFWrzndQqTR2Siph9GBiFmt0bbMfFb4N
         D4fdE8AC3/aWfKNeGhIXMJAgJPJpEKRYyGT97+GbASeK80GfrFIPMiGLfCFLfH3dGoF0
         /xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795079855; x=1795684655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRu+0e76kdX//akRHnnQ8C6pYNUfCVw5ZqGNhNN2NXc=;
        b=LbXkkO6eYgeSzFD6WGCsFq/TFp5VAzmlH9Q6flQv6nkDNtbEqQapaZHRgUrnzGrfs+
         jkJqp2bFFof5J+jLC4U7FSrMbKHKglaUDlzVIIwX3KBKj6Xf4VpDHSfA/JBsyKorZylt
         8WAicTw7P51+KSf7sxRPX/rdJqvzTDdI6X8YxamAlrnPdtad0E64LCIhzdXcgHNSSIwk
         kjPewAXtDjz1/pSYF1yUVFENLpo/oDD3hPuiJEZiwNSuFH1pY0guN4u136o2l75PMy9t
         hhyYAamMdrgIJp+T8KiOzVY8aaaVMfKEY9c477YCj+erh77gvw7cY0Lf51FH+0Q+KO/M
         C5yg==
X-Forwarded-Encrypted: i=1; AL+hErESKMxPNp2KVOYP9rd544NMpgQqu6COL+FC0aM3sxdXmTrhJ1CoyovacDQDjvjnlZLZ/jFzfaoWe1fRYII=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fyHAMobflQGzU24ljALWzFCNAhey3G+yMmim0q9zzQBMJReK8
	jXGEUrrZdxqznj4NtNHXpFUTE/YKtg8JsBxXsErNSJc72gX/VA7J04HJvIXjSEridChuMtk73fh
	hC7gGJ5/JDFWQMtpY2KCOEV9ATU5Z9HnEhQ9aHRWOkneNeLLzhp31vXx4FLnDcC9WJH4=
X-Gm-Gg: AZFdTZc4TOSPitsEi6J7IuhM2ot480cidEoh/3u7Sq8k8EPWUH8OEhG0ZNENKjVXaqo
	yBRSQUD/lcXUap1jLaKHIiCoAU7WwLqYH8G4aFGwrACnofL8O7qJw6IQ1mJEZwMoj4EdhTvs7QO
	Jqx8nG+WfLL2YscEGCRuGgpMq3pjueDLR6JgPxP27mU6iJuGtVsL1SSHCf505hFHZlWzsLeAqA3
	0E//S9ZQbZg0zLcXFFKc+LlQ8MY9qDD40aTrGwChDrxcqn/nZ5xpgNCA5fSu806Mdhyh8tnrVfj
	rykdUaGtwZM3Y+q5UKpJsYNTaGOcVmOKodx+8I0dTRZcvtNCGT3ch6NlS1Wxf6eucJjyR3rPL+6
	ODWyI0ZXa+eRHAreoP1MD9Idh5UP19ZsHxyJT1suBlRjbsNyVOgSAExgYyjyu4XQqj4AoUxcIxp
	Ros7FwY8PmkAKgEWNIe0YQRQ==
X-Received: by 2002:a05:7301:6407:b0:36a:270:ce76 with SMTP id 5a478bee46e88-382c39a3142mr4345507eec.33.1795079855043;
        Thu, 19 Nov 2026 01:17:35 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:36a:270:ce76 with SMTP id 5a478bee46e88-382c39a3142mr4345485eec.33.1795079854581;
        Thu, 19 Nov 2026 01:17:34 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3848dc19705sm3625057eec.23.2026.11.19.01.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:17:34 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Christian Cortner <ccortner@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v3] phy: qualcomm: m31-eusb2: Add register XCFGI_159_152 for SE0 recovery
Date: Thu, 19 Nov 2026 01:17:31 -0800
Message-ID: <20261119091731.301966-1-peter.chen@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afebeaf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=z4GiM80-XcyTzbghJJoA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Crdu1B0IIM3Evn3-hsAN2dvRI0Vyv17Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNiBTYWx0ZWRfX6JGc8Z/O4WI0
 C+P6pAtYJy7j55ahzRO35oOryjeNGk5x9ZAEXqY7dS3SgcaE7iRRx+q5A6nipdnSIHYaWa2E778
 MX2/eaEZeSkafylOrGeQPM8lauQC9gdv0xesmG2lzaQYLoZdo/JIuJTTXIyYAXMG+ehK87VJisX
 +2mmZGgR8MOHjqqTz0Sx28DrfwXKysb70wQGRdv4H2Xc8tqVAq7ES5tSTvRsNZnPmgJYoN6rs+u
 /0htyYltJk3ddARBX4a+cjChYjzF8UOGrezawZV5pbL6coox5es29jb2IdrTwfK4PyX0dDKzWbj
 Smu5PeGCQOdhyt1F+EigdEk25aK6bKCoVJ9HEH7zS0BsXtx9qUUKbkL1Lh2Fve7oX5YcgyHi4Qr
 JMU2o1IzbTeGCIG1mPDKwi2LJjHUVtDfDLuk4X+iyOVC2E5aoD6KJ1T2UysBF60FEJo12si2iZA
 VjgB8Fv630KDi4fQysA==
X-Proofpoint-GUID: Crdu1B0IIM3Evn3-hsAN2dvRI0Vyv17Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNiBTYWx0ZWRfX7xOpYXv8sW/y
 ylkIPfFGWtMvEvBx6SY1Kgw3kc4xzg6cIfSr3eQcnlhQVjC7GR64+gzbAUO9exX8C5Nt5SC0kdT
 idYTGPwIk7U0ir0J0uBHnQ5vGwctXl0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190036

From: Elson Serrao <elson.serrao@oss.qualcomm.com>

During PHY initialization, spurious pulses from external devices can
interfere with speed negotiation, potentially leading to abnormal
behavior in host mode. The M31 PHY provides a hardware-based fail-safe
mechanism for this, controlled by bit 159 of the XCFGI register.

When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter monitors
the SE0 state. If SE0 persists for more than 2.5 ms before entering L0
mode, the PHY treats this as bus inactivity and resets its state
machine to the default state. After transitioning to L0, the PHY
resumes normal operation in accordance with the eUSB specification.

Add the XCFGI_159_152 register definition and set XCFG_SE0_TIMEOUT_EN
in the PHY override sequence to enable this SE0 recovery mechanism.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
---
Changes for v3:
- Rewrite commit message in imperative mood, drop "This patch" (Mani)
- Reflow the code comment to use 80 columns (Mani)
- Add Reviewed-by tags from Krishna, Abel and Mani
- Add Tested-by tag from Christian
- Link to v2: https://lore.kernel.org/all/20261027015545.2758784-1-peter.chen@oss.qualcomm.com/

Changes for v2:
- Add Fixes and Reviewed-by tags
- Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/

 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 275df38256de..70fcfaa8ced4 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -56,6 +56,9 @@
 #define USB_PHY_XCFGI_7_0		(0x15c)
 #define PLL_LOCK_TIME			GENMASK(1, 0)
 
+#define USB_PHY_XCFGI_159_152		(0x1a8)
+#define SE0_TIMEOUT_EN			BIT(7)
+
 #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
 {				\
 	.off = o,		\
@@ -88,6 +91,12 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
 };
 
 static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
+	/*
+	 * Set XCFGI[159] to enable the SE0 timeout mechanism in M31. This
+	 * enables a counter which assumes the bus is inactive if SE0 lasts
+	 * more than 2.5ms, and resets the state machine to its default state.
+	 */
+	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_159_152, SE0_TIMEOUT_EN, 1),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_39_32, HSTX_PE, 0),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_71_64, HSTX_SWING, 7),
 	M31_EUSB_PHY_INIT_CFG(USB_PHY_XCFGI_31_24, HSTX_SLEW, 0),

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

