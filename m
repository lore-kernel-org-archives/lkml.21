Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956546;
	b=QMx4iPihdK5AUidpSX9pF6OLcDDihO4F5ikHhq7//MdUwAk7rtAV3qndfOaNzvlJz5mE
	 f+GFapZGA9YSrB6RkugMqDryevZlakEEiEczt+VZ+Lb6JGobtD/xiSGBbfHTYekJ9ueWf
	 jCAY8/I9ZqquPUaRRwi87mTkKrDspnpuu77gM6/AHFyZ41g/04Rr5Pjo+ZWS1Ib1ZjvZ5
	 ZUK413HdU7fXgH1O/CdBvISTlKIKmIKoJ1hK6d9rzp9ZX67gYjOQMbw9/m5GQd0NkpO4s
	 aOEkdfzEo1G9mmY214SvsUFpa9tdRuxB+aL2b5Vc/L+jKLFGihCcfyAs3Beogfp72hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FcF6/mMa7sW8TIX+FKOeb1YgIUbWY9PFeujmnoH75RA=;
	b=F6zTEKnwFfaN2zSsl1qfvxr7nScf3NzmhWXpbDbOv9WeKYNr2qgS03fRvMl1V3PF56az
	 LNpHCIYneabty6Qe8ws64lL25WqrsrMEBBirRpctqhFtLdhJgPPF+5EpCdXjNLzSyLARx
	 wwMoYxbK2RnfaB9oXJ6sgET+XG1nuO80AW0IOWxVki1/LGLLr5yPZvhddBhW+Q/dqrClu
	 B5b9A97M9j/KbHckgfz3ey8/ChRiGhrVQhRQUgyVtoXAB6B+KCcNmMpCHHhWZATIVxwAJ
	 mR78DxHWM4ODXbGSL3H9mtKSru0cep0KKyW4BE1g2RWsU7OIQ0XNcQX8I6UxbudFq0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HfOglICI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQf8SYgE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A67606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A67606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HfOglICI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQf8SYgE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf3A31886441
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FcF6/mMa7sW8TIX+FKOeb1
	YgIUbWY9PFeujmnoH75RA=; b=HfOglICIsRSkSfLgQvZZE3yX8DDd+qn6fy4rgq
	pR554VRFd0J1+WpQJD4MdlXV+itPHw3d8zSN4wbF4fmHLhYwvjpfzCFx/lg8Buzw
	c6RU0nf3JCax7wW0WZrAz1ACiCEQjGKO7cBWgUuMpMIdPdM/4mQkros3xPAdl4On
	BbEkzBiPqHSMRQaTKq1tkOBHop0dgH4xbZa4MVDNObZG70u0ImmYgqEaKCB4WENc
	lHPxb/FZe/s+9w7KW0uFzE6N//zjH+Q7lc42NDGh7/2pocxLulLRTF2LAr5zL4e5
	9JszoM/aV15tIS4W0jQfLBmTIyfThPPTL2wLQ8u4fGDnCq5w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvar40v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:02:24 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so1010063eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956544; x=1795561344; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FcF6/mMa7sW8TIX+FKOeb1YgIUbWY9PFeujmnoH75RA=;
        b=aQf8SYgEcmq/ZazYY/4IUIFkcHjf/hACaJYrvFUwSGz48FqE1DZTED5z3xiWaXwtdt
         KYZiJcXPjWU800LQyrT1w/M/aZje27MCjD2+HluuSlHQIpYaKi50RMpwFX8L7b0sM0y+
         DN+vt7BXPbIyuVu0LymbdS+UhBo2wKb+GfgS3txl805KVEqv/AX82ZIDCmt07MkutTZ0
         JgOA5BROu34+yD7NmKlqXE5GvSBwdrGL7OzZcw/oVgLgWUWrCVJ8tqpIEbPB5qWxcjD5
         U59ilxrqpIkWa5i/dOB0dvU5er/0qJO71Lr4awgXlUyku7bBLQ/ZeXn4mEPpQkxswhtu
         XtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956544; x=1795561344;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FcF6/mMa7sW8TIX+FKOeb1YgIUbWY9PFeujmnoH75RA=;
        b=Xa+NghGd8GWsBw6RVrG3uiXigoL3ONlp86f35nT95eWZccBCzJpVwylK+e//POrDb6
         OjsmxAg/9BIzhBR+LdpViQAxiTjgVBn9aW6BY7vOmgMS8trsdijRriaZJ8n7+2pcnAoZ
         aVBis8qB4JlB0UqUM8o5FjJMoDrGI7UcqhatUk3nnWIEvs6d84yjCxD4Rf+TKrGmNNPU
         z1VDrRbNdqSw7wzGqsfOGPHg/qD79E98GS5eYNw4uFa3r5riMYedQHaSVaYhE/oN2DX3
         g4n+uzf3qLrNtb6LrvwNY/OvwYngZs9Noc2X5CvhXSa0J4oBm6WZcy1AFXDaUV0f7jZ8
         4kKA==
X-Forwarded-Encrypted: i=1; AL+hErG8VgTCqQs+XPF8wHDT9ulDmAtPRdYQvviidMI/9q3FMqPWgXRbehNu4o5/Up6v/ccbp5LHO+vms5LzytM=@vger.kernel.org
X-Gm-Message-State: APuU4Z89KaVEQOBfV8OwaZU66YkdYArOJEoVjniVD2mpBV3jhGhSDGHn
	3EKTVMNAMB2RwLDCOE/kP9a4u/e7jPfGMN5a81zxwUIedkpCMYBKU4o3oAYaO108KCw7YOajsQA
	lL3cxfzWohH5/akA/CbDJgIImRlqoz9XrzYhWXmw7Ka5ikIScZQxptwiHQZpykzPIkJQ=
X-Gm-Gg: AZFdTZfn05H85z5Z4KXF0VEc9vzF1MtiDS/WzT5EoM3fCrS9uG8uBoH8JWjupO9BMMS
	KjlfXovaQY7lFRHuEocDSQYfaLqhmIx0SRTvxROInlFMaRb6GD3WAO/Te+9woCv0M3kNjBUodDG
	NZfig5jkfB0b8RB4+buhdKB2IixOnOEYEbOnrpBoyFilQ8/9n9hRavgpCOHZ+TuRWnp+pUzLWXE
	ccvYpJcymKacTCmXD0Iu2CqKBrFbr21j66fmadcUvG7cGn9sS44dy+s/Q/9AvsnkccvS0Jl/d+C
	TL8LfQn4xNXgFks4+YAWehm9aILUSzWs8VuJdOy+y0mRu4TG2jkoh4NRSrKWUbIVum+X880mItE
	7iLCaCgisbdiH3xU0vgecmwLoHXV8JzSs+HuoWbaRju/n+ciCQuuEeLoNwS/Ex+SGtJp0SUwWna
	zPuF5UfaccM1pQxYTqJqEuk7n/bQ==
X-Received: by 2002:a05:693c:26c8:b0:36a:1bd4:628a with SMTP id 5a478bee46e88-3827f98f30dmr764138eec.9.1794956543718;
        Tue, 17 Nov 2026 15:02:23 -0800 (PST)
X-Received: by 2002:a05:693c:26c8:b0:36a:1bd4:628a with SMTP id 5a478bee46e88-3827f98f30dmr764065eec.9.1794956542520;
        Tue, 17 Nov 2026 15:02:22 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72eb2f3sm1330120eec.18.2026.11.17.15.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:02:22 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:02:21 -0800
Subject: [PATCH v2] phy: qualcomm: qmp-combo: Differentiate clocks related
 to the USB block
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
Message-Id: <20261117-qmp_phy_usb_clks_v1-v2-1-6e960853aa69@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPzc/GoC/32NTQqDMBCFryKzbiRGa6ur3qNIMHFa06rRjEpFv
 Huj3RceDz54PysQOoMEebCCw9mQsZ0HcQpA12X3RGYqzyC4SHkWcza0vezrRU6kpG7eJOeIibP
 K4kvCr6kS4Ju9w4f5HKv34sc0qRfqcZ/aE7Wh0brluJ2jPff/wStiVVJprTNUIo1vligcprLRt
 m1Db1Bs2/YFGWwh488AAAA=
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afcdd00 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=zQS2rcLGANSAm0HkUrAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: gAS0knBuz3uRNJocmGf4ZKh4vEyduxVj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX7EL9sosANAsR
 1t+VG2iJ+PwTToONMUYa0z9blHiWAUEkVamZmmZ1oc5ycP7Q0SM8VJyfc0RuJPePM8UGiPK7jCo
 2sI1OAk5O8vaPWxcGUXf8V2jgsAwXotPHn4GNJhoZlZLVWPqxrvIFV01q3h7BMuSqXKxwNbExHN
 tQGG+20wbfpAUGcGkmGY8ieGwIkqypDaLMK7aAkU09QWp2BVLJIF8M9D0jIG8anFQFbd/WNAPTw
 Gz8SZHXxksf4LouDRFl7L9DicqMGxDLvsCupcLvqDktluTUyTTCBIEQkhl0dOqESoIv+RM/iFOh
 0VehzXOSSU9QyuIHo5sMJh8VKvtbFUEoKX6islUojverdJ0irKurXIovZFuUFSpcldmPcbLhkz6
 80Q0Qm8rfPERKGwXISCYf6VIosfY8R3onbPgBp9ROAAxxaqJ/QJJMoVDSa11VAU6c+BWKdsZwHV
 OAuqDEUcOWGdGDssQDg==
X-Proofpoint-ORIG-GUID: gAS0knBuz3uRNJocmGf4ZKh4vEyduxVj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfX3BFSsZ28TBZW
 865Ezk7lqyuhmjxLHJiAVYKr/CtEDbdDoiU1boQDBYNIDeRZqFoCnlbOaDLhBxawtaJiVZPgtAp
 McV6Ienfkb3eV4e0DEjWm9Q+0pMfVhc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

The Qualcomm QMP combo PHY has a USB and Displayport block that is
sourced with different clocks.  In situations where the USB path is not
utilized, and only Displayport is active, unnecessary clocks are enabled
and not used.  Split the current clock list into USB specific clocks,
which will be enabled whenever the USB initialization routine is
executed.

In addition, move autonomous mode control specifically when USB is
active, as its primary purpose is to detect RX detection and LFPS
signals, which occurs only when USB is active.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v2:
- Added proper error path cleanup with the introduction of a new set of
  clocks.
- Enable/disable usb_clks accoridngly with the usb4 path.
- Link to v1: https://patch.msgid.link/20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 76 ++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..bb9eee2f3f0b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2619,8 +2619,10 @@ struct qmp_combo {
 
 	struct clk *pipe_clk;
 	struct clk_bulk_data *clks;
-	struct clk *p2rr2p_pipe_clk;
 	int num_clks;
+	struct clk_bulk_data *usb_clks;
+	int num_usb_clks;
+	struct clk *p2rr2p_pipe_clk;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -2668,7 +2670,11 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp);
 
 /* list of clocks required by phy */
 static const char * const qmp_combo_phy_clk_l[] = {
-	"aux", "cfg_ahb", "ref", "com_aux",
+	"cfg_ahb", "ref",
+};
+
+static const char * const qmp_combo_usb_phy_clk_l[] = {
+	"aux", "com_aux",
 };
 
 /* list of resets */
@@ -4455,13 +4461,20 @@ static int qmp_combo_usb_init(struct phy *phy)
 		return 0;
 	}
 
-	ret = qmp_combo_com_init(qmp, false);
+	ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
 	if (ret)
 		return ret;
 
+	ret = qmp_combo_com_init(qmp, false);
+	if (ret) {
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+		return ret;
+	}
+
 	ret = qmp_combo_usb_power_on(phy);
 	if (ret) {
 		qmp_combo_com_exit(qmp, false);
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
 		return ret;
 	}
 
@@ -4492,6 +4505,8 @@ static int qmp_combo_usb_exit(struct phy *phy)
 	if (ret)
 		return ret;
 
+	clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+
 	qmp->usb_init_count--;
 
 	return 0;
@@ -4547,6 +4562,10 @@ static int qmp_combo_usb4_init(struct phy *phy)
 		return -EINVAL;
 	}
 
+	ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(qmp->p2rr2p_pipe_clk);
 	if (ret) {
 		dev_err(qmp->dev, "p2rr2p_pipe enable failed: %d\n", ret);
@@ -4606,6 +4625,7 @@ static int qmp_combo_usb4_exit(struct phy *phy)
 	qmp->usb4_init_count--;
 
 	clk_disable_unprepare(qmp->p2rr2p_pipe_clk);
+	clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
 
 	return 0;
 }
@@ -4722,7 +4742,10 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
 		return 0;
 	}
 
-	qmp_combo_enable_autonomous_mode(qmp);
+	if (qmp->usb_init_count) {
+		qmp_combo_enable_autonomous_mode(qmp);
+		clk_bulk_disable_unprepare(qmp->num_usb_clks, qmp->usb_clks);
+	}
 
 	clk_disable_unprepare(qmp->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
@@ -4749,13 +4772,27 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
 		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-		return ret;
+		goto disable_clks;
 	}
 
-	qmp_combo_disable_autonomous_mode(qmp);
+	if (qmp->usb_init_count) {
+		ret = clk_bulk_prepare_enable(qmp->num_usb_clks, qmp->usb_clks);
+		if (ret) {
+			dev_err(dev, "usb_clks enable failed, err=%d\n", ret);
+			goto disable_pipe_clk;
+		}
+
+		qmp_combo_disable_autonomous_mode(qmp);
+	}
 
 	return 0;
+
+disable_pipe_clk:
+	clk_disable_unprepare(qmp->pipe_clk);
+disable_clks:
+	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+
+	return ret;
 }
 
 static const struct dev_pm_ops qmp_combo_pm_ops = {
@@ -4788,19 +4825,34 @@ static int qmp_combo_reset_init(struct qmp_combo *qmp)
 static int qmp_combo_clk_init(struct qmp_combo *qmp)
 {
 	struct device *dev = qmp->dev;
-	int num = ARRAY_SIZE(qmp_combo_phy_clk_l);
+	int num_clks = ARRAY_SIZE(qmp_combo_phy_clk_l);
+	int num_usb_clks = ARRAY_SIZE(qmp_combo_usb_phy_clk_l);
 	int i;
+	int ret;
 
-	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
+	qmp->clks = devm_kcalloc(dev, num_clks, sizeof(*qmp->clks), GFP_KERNEL);
 	if (!qmp->clks)
 		return -ENOMEM;
 
-	for (i = 0; i < num; i++)
+	for (i = 0; i < num_clks; i++)
 		qmp->clks[i].id = qmp_combo_phy_clk_l[i];
 
-	qmp->num_clks = num;
+	qmp->num_clks = num_clks;
+
+	qmp->usb_clks = devm_kcalloc(dev, num_usb_clks, sizeof(*qmp->usb_clks), GFP_KERNEL);
+	if (!qmp->usb_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < num_usb_clks; i++)
+		qmp->usb_clks[i].id = qmp_combo_usb_phy_clk_l[i];
+
+	qmp->num_usb_clks = num_usb_clks;
+
+	ret = devm_clk_bulk_get_optional(dev, num_clks, qmp->clks);
+	if (ret)
+		return ret;
 
-	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
+	return devm_clk_bulk_get_optional(dev, num_usb_clks, qmp->usb_clks);
 }
 
 static void phy_clk_release_provider(void *res)

---
base-commit: 6bdfbe223ed4735073c299a6645ebd3faac3f51f
change-id: 20260930-qmp_phy_usb_clks_v1-25b9374086b2

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

