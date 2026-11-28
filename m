Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795851902;
	b=4dDPYOVHPTeK44OA6a1NYPVuEOCBnhyTcHzdtb755/swwF/dgi+4ajEQ35UmdIEE86ih
	 ay/6QoQpxgz3tsiY8mSIywyTLYONNnk0OKCwls3E7Fi9ea6UQ1bYOlmBSu8ffuGJ+6M1G
	 xGOuw7OGUFycROs/u16aMicAqMauGXpajpC/X0ZkKzkTZDrt7tdti8GC4oORzal/M5Nbw
	 n4YWauBlkEnwp+bs8I2Og3qNSAfeMRegx9g8HpedUuMprulvz7FTu7+BjELzbiN7I8xp/
	 qh8RIoWZhDsIagyHijX9KwjVtkY9eOwa8qKqAD0zMwAj+ZfRDgfEW/g924/LRdtVpmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795851902;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
	b=rLwAwo+Tc3XfqfVHZ9EA4WlHawugdqCToFY/iVYaZ+OAuZC97qBaGc6heFX9FKftpeXV
	 ociTSld6d4A/+y2dKubBNwAPQgJBt7NcGSOmla1g1V8m7LS9lYJ3IsbzvDyJNXG+kY367
	 pWV2tb1dV1m+lsgwzE4cx1DYGuNkHrxfu7cWIH36FFlTBze343J//DkV99zpOV8ysE8vE
	 tWIHYPWmBpcI6XXQJ697KIYFuQPuE6PgBDR21/7raZa1nSFU5lK+L7koqceaNgv9Asfb5
	 y1QdF0OL0ZVyL5ujqLR/hPiYjZkHiezUuy953IrtyRXqQnKFJ48ruO8mmnxhr9nAing==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eldbdYe8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAaKlk4d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9660606A323
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9660606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eldbdYe8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kAaKlk4d
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS4B2kU2224149
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XSCbnCPHMeRDuEhGRMEEnn
	sMEwBvB/NgQ+oiTuIUzfA=; b=eldbdYe87ZT5sW2D9rVnaA/lNs6LYmCYelUOqk
	64KchP0loPaabylQZHnG4zYMduUD/IvKJo11KkerxzGeiOi7dmflBJKfzvvhnzkp
	pGjx+baL3/tAmOpVxD4tcrfO3O9X1AoQQNOe/3g+F6AEoG0C8MVkbD0vZL7EQlGQ
	6HjraZ4UqzX6EqV/SznhIMEqzgY4IpYe/F3MyjyZCCtBdP9bjC7j/ZBP7kcJwNfE
	VRpOUyUQNbs6r8cGnY78x3VJukUlC72wQLIkcn9HQLAjpCxIsbtnRmFJQXfFSoW3
	sIlvVMJzVuzfjXOUo+K/jGIl+RJR+gU5yKgd1go4K2eJrhTw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7manrrre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:45:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so5912823eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795851900; x=1796456700; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
        b=kAaKlk4duvZDiQHfGKRR3xbV7nFWcjd9/UBjnWJnrlbdJh8gmLbiS6iihyH9LA0Y93
         C0Vibrri+rL05Jndb7/m2UCu2Dhl9ZkpTAinCxyP/rFSIauBrsumLS9zwfcWGkmtI0xx
         17T2IXdpS9Xm/nueaWNf/sTrV6hIWnHwECjNp1TU//N7muXTrjVfP3JzETQ3tC2QTtrs
         veP6sKXlEoUUu7XN4HmyQWYe2TYBHRx4EBkuExvePjWBVH/o1yQRUUMjmKKu10FK01yo
         Kqaii/EqoREctOXarmWD9d3QsefDndayyOpw5wBHwwEk1IO8YYtmOZyhmV9zSn7fvPRA
         qA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795851900; x=1796456700;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XSCbnCPHMeRDuEhGRMEEnnsMEwBvB/NgQ+oiTuIUzfA=;
        b=Ye9yROcTmPZJTLVCyyMco0YV45N8Xc0gzN0Jkb0ycuz+Fs+mJmbS3b4E35lwnEkgmW
         f51erbnlnuH0ScoTfCdX9t2m7FR9s88WOdp1ZwIQQfU8MhUxoNusexrwHRNM+Q7+JSeC
         vTUl6YbadGkLKeJIiKSrRhsdQA9LKuoSEAzOS6C31wBW4Bnh1xGyqfECegyniL8e8Ohn
         4l+DWdCdO/U2wMqR83QAlo6X6QZcFatlzmFLZrNCC1XY2iDgBXROo35cQXC2lsnu0ttK
         4IWd/7zDlI8hLlcytfVxJC6M1158GdimVbFLVJQg0dkOy3W2qwcO8BhsKOZXCKGNdhwS
         j6tQ==
X-Forwarded-Encrypted: i=1; AL+hErEaZgu6i/r6IQhmGR3hmGnvBOWKmm9aHfo10NIVc56vaCjJZMfW4r5EfIgIjG/xbpzgj+8o8neSXpI6SDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JlOSPm8SrLjrm1rdUNLhrykTaBHA8YoZ3gXEgPuVm+4UDl07W
	Ih8K6N6yXEkJLsNpEuxZGWGWrhV8Cmb+hyOGQZIg9ZFfWjVj7C1f45CUudNgVE0El358JGlPm8y
	aW2aiFpDoNE3BF+XJRTDHkzVYxzyjzYPNlnN1QIjLu9yZFs/cT5e0nnkr9WGOqOqtDeo=
X-Gm-Gg: AZFdTZdoLsSHbDth/jNQrXienWn8XwKq6b3Mm19s8/TwYspnKoSP1lSr7pGCYShYbyG
	zB62pw6ZUNb4qXp/9FVIJqbbAbBoc1t65wAY1Ocg7U36z2nEkHDWaOoVzY/e9C8fu+y56fMB+2o
	6lsBKQvMZln1651obhbcnINIvV4Np6y6WqLMXXoILRoKHu6RHHFzfLZXxuMhyonYzvhgsBHktLm
	/CVMnhzXz1ma8f3F4cqNc06vMiunT16wkKVfrboj+jJyItuWDgf9Ry2R/Mg9GoH1TMu7clnQuxY
	Wbyv2flmdL+bFi9dRcBeTVdWYuZklLUk0YaB5V3qwOKmQDcIrEW7ChkjsJHW978Kk9r3/BALVBJ
	HlB18hp19u8gtUtw6qij8Kr2ck13ZMBULj/hCiDd1m4ISfzEdXfBe2zizmMF+sCdDMBgchT4ja2
	HxE4I=
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr28521334eec.31.1795851899613;
        Fri, 27 Nov 2026 23:44:59 -0800 (PST)
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr28521308eec.31.1795851899073;
        Fri, 27 Nov 2026 23:44:59 -0800 (PST)
Received: from hu-gkanala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm65140367eec.1.2026.11.27.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:44:58 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 13:14:39 +0530
Subject: [PATCH] soundwire: qcom: re-arm the controller interrupt after
 gating the clock
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
Message-Id: <20261128-sdw-qcom-irq-v1-1-d053ac530faa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGaGCmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyML3eKUct3C5Pxc3cyiQl0jA/PURANT4xQLSwsloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAHuTjtnAAAAA=
X-Change-ID: 20261128-sdw-qcom-irq-207ea053d898
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Oleg Keri <okerixx@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: s5ycImk6P_t34Qcu_Yd81Audnzqk--Vv
X-Proofpoint-GUID: s5ycImk6P_t34Qcu_Yd81Audnzqk--Vv
X-Authority-Analysis: v=2.4 cv=Qc/zLcbv c=1 sm=1 tr=0 ts=6b0a867c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QX-rXmrizRA3L83J75wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAzMCBTYWx0ZWRfX6bXJxL3tJiya
 v0QFE6JCw/6XeqxJhqMiJsAoM6x3jTsCCkXRn/sc3svxHyLIUt4m+p1j4t++oBNJ9e0uUpm1NBv
 XgZWYQL5OiigxR6o4ane0Xo6qBJY6i2ctN9fZsYJK/BmXcEsr3yc4dyeYmUtip5EEE8uRfi8vEh
 QQeaKK8bUPikuMEOQDcjm9eGBmrx5v6vA5A7WDTn3+o9roIst6Mry4aSGqkxmB1O+Q8bP6DIVxW
 FcdsZXdkEkk/iDU1a9eiI6eo0dgbhJlwhOhSYxugi38Ez6ITFM3IRQWeUhnn31eYIHu93QpEWyZ
 U89kA0H6xp06ajtuXVILLAwHmCYrS1cp7Hz+uCqGxuSAyJdryq1cZOXi4t+ANksFgnoBIHMrXc5
 ehNDn0DrPyoxdpTiEZcSZfS9q3igoeeumJ4do5W5UyG2NBYbpsiY9Sh/NidwwbeoI+Zut1cl7Di
 PuLeIhMz5ooJUkUXBvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAzMCBTYWx0ZWRfX8ZRjJGqCVG71
 RYt8YDMCxy1oBrfRdHmTG9H15fcAD+rwrM70zS70fXQDRX5oQw9RcKaaeVl28jEmWyUDsRRkmrK
 efuJCMMQXLn4QwjWGcASXAVshS0t2eU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611280030

Commit 6c067677192f ("soundwire: qcom: disable the interrupt before
gating the clock") correctly stopped the interrupt thread from racing
with clk_disable_unprepare() in swrm_runtime_suspend(), but it also
leaves the controller interrupt masked for the whole duration of clock
stop, which breaks peripheral-initiated wake.

The driver is otherwise set up to service peripheral alerts while the
clock is stopped.  swrm_runtime_suspend() masks only MASTER_CLASH_DET
out of ctrl->intr_mask before writing INTERRUPT_CPU_EN, deliberately
leaving SLAVE_PEND_IRQ enabled, and qcom_swrm_irq_handler() brackets
itself with clk_prepare_enable()/clk_disable_unprepare() so that it can
run while the controller is runtime suspended.  From there
sdw_handle_slave_alerts() takes a pm_runtime reference on the
peripheral, which resumes the controller and restarts the bus clock
before any register is read over the bus.

With the interrupt masked at the interrupt controller for the whole
idle window that chain never starts.  On glymur an SDCA jack insert or
removal while the bus is idle is not reported at all: the alert stays
latched in the codec until something else resumes the bus, such as the
start of playback.  Platforms that do not describe a usable wake
interrupt have nothing to fall back on.

disable_irq() is the synchronous variant, so by the time it returns any
in-flight handler has been flushed.  That is all the race needed: once
the clock is gated, re-arming is safe because the handler enables the
clock itself.  Re-arm at the end of swrm_runtime_suspend() and drop the
now unbalanced enable_irq() from swrm_runtime_resume().

Fixes: 6c067677192f ("soundwire: qcom: disable the interrupt before gating the clock")
Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
The commit this fixes is currently only in linux-next and has not
appeared in a release, so there is no stable backport to do.
---
 drivers/soundwire/qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a4cb62897192..05ef7bb2c5f7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1801,7 +1801,6 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	}
 
 	clk_prepare_enable(ctrl->hclk);
-	enable_irq(ctrl->irq);
 
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
@@ -1893,6 +1892,8 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 
 	usleep_range(300, 305);
 
+	enable_irq(ctrl->irq);
+
 	if (ctrl->wake_irq > 0) {
 		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
 			enable_irq(ctrl->wake_irq);

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261128-sdw-qcom-irq-207ea053d898

Best regards,
--  
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

