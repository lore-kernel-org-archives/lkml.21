Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670426;
	b=j5m86f2GUDDn5nZ+oO0JFPn5J8YYerRifoFSREmnxHVY1Z7AJ8g8PgG3ijHeCp+Uz80Q
	 9M3VQSVKkR2/11F6Q6vmoHHGGMJweX3DScBKuF2in5l0ZK6eAcgF4WD8L6XFPFBebSasm
	 HDrSy0gnYFiRmUYm+Cg7mepotHB0fDSOi51CAKxQQP1IhHgUtBxj44ZVMVBWC0WSDxqKd
	 MYZRk1YwLYBF8lrz9MAGO1BeqzMRlBbd0Uw6wy2quxaAx2/kcspRLAGnL5KRsVgnxYibv
	 uB1I+KpIE8C5rOAlqUmxc9iY4tgYrrMMSL7Bp4ZQ2kqLayMLyv+t/b7hZ1ONmvj4LEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670426;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGLxG8DYV9Q=;
	b=Qv1f9VNadPL9lwvZsvh+2MUCGn8Kj4ktyO8rkEriUuNg9wsqVipeD1hpyivgMx0Z4uEH
	 x2fHB+VlimprZpWLUx2fFbZm9S+GUwc3GzpqgrMIFJA3VVCOdhhk+t0Bor4uw1jx+z23T
	 XrANNJx9fKU8zhxyFTZvu2P5hLHsiqjhZDAlT5Kc8TyrekCZyCDV3n8MOA3cmkKkM7UIy
	 rQD2D3rGsSR/WHu5Q9VNYXW/Uv9xnSTEym8NNeskktCQeRZrDxVcuOC/0Wb3tepLs8O3r
	 fvb1NORckOR8yxy80ONBsdhSeSAkyt4DG0mfvOaTlDt1zd8sxDrmt2Py37pLGypix6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HO44ugaj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUOcLTqo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AC0606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38AC0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HO44ugaj;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUOcLTqo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36dQW2176269
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGL
	xG8DYV9Q=; b=HO44ugajir0wS3oGIFabjnwDNWdGygcs7LvtmjxlE4qcf8vHuBI
	Lp1APGgJhNIBVGfNbpVtuk1NFy7A+bgIoreIUW+vUPY66TRXakPKz99nj+6RrxNd
	kDDA95Sg6kLOI52PauzpJnzb7fBwWlDuvQLRqZIqswwJYW0FHIInOxWAdiIT/C+P
	TG6U/CBMma/soV42hyiH45z4a/0h3L8NwX3a4inQhG3bv9yZJAyYlGU1UEu/BFeR
	EyVjVn8Ix76/VG0beRs4/tzohCFlEnXGU0VZX571uiiii88IbV2gt+4Xk1z4m6Pn
	+LHbPhZZRCn6MOW3+OEyPkIpUueF9s3Mfgw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhv397-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:20:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4092b645aso5580198a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670424; x=1796275224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGLxG8DYV9Q=;
        b=TUOcLTqoe9qaN1IuhLDAToodB5Ythj+3dgOCx6cPM0tuXFF3H7gUmtA5LKl9T368Sg
         P/etftsQLU5D46CZYW9ZBBgq7cHxYvmEeiYb2PJiewHIfVw/c2Dk+uOhporni2MZxVqj
         9TncIZIWx8v9d5ggSTVjP5gyRiXL3IZ+1yEcmc0Dmn8x+8HbbxZC93ys/W3JQnM25Pr2
         ay5ftyQiAk9LpsPwoSPcvU9li1T9JfHc8rc1P8qiwgewQogTwY2FjDeoahXfIkQbou9q
         AjVA/L3GJG5z5COvWqgs1AgBVyYeKJKJmD8uku0oSS9yH9TAAAmbUWDLP2Dc8xkvf++E
         Ak5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670424; x=1796275224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcGpGCXO5/dlhHVTOAIAmwtZelovy/2IbGLxG8DYV9Q=;
        b=CT4PAKuCrVa9YfGCRBmMimEyJR7x+PXVFSqHUbTixlla/cA6PGXtTjVEo7GryRWfuH
         bOrIgfMqmBJmxTjf4h47Neypf5yg/jkYjY/8cLOZ0yTLiOoAlAnE6vkLqDOo6WwAMB4J
         2ql3nd74TzN65sRAM5nUVlX4vub2edYkRPpyYS0B35fPpn2HpxGhs064bp3K1exe+2Ky
         VEg1bHK5q/+LEjUQP2/TCjRBUBg6u3o3wlZSOmXXhtUd5pfyxkAN5JX4QNmQ+fH91nXZ
         6XNsivqg9W9ABuJHcfhPpn1qeQblZZpV6ZDkz1SlXAUZlPYd17gHEC+aDh4r6ajs5HzX
         QaxA==
X-Forwarded-Encrypted: i=1; AL+hErFTFPfB7MGy9UWQRR0X7mkWyfSe/Gan1cZDK5NoEGcrGV434/W1Za6rN60QCdHcUqv/nquLutYFcD9Jk+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qBMxbhogOjwHSZJXlFUX4xyKTDVwVqT5Bi4OO6NmEiftR6wag
	x2NMMyifVEBD1ah4u6EPVCUUdtJ//I3y1/r1FYhYpzALYH1BA1yROKclo3lMWOL4d/AAPIWhtRo
	CeWoDaQ469kxInbodDaE7chDZmGcUCB+Kp8wpUaLw5PpgYNDUxWGFzQz5iWsoA6X9Y3o=
X-Gm-Gg: AZFdTZf1twH2hgIlZswZ6w4tVz5YiK20E8cu0i+zDtA2EKLZUBNEOkLjrEsvjkmBy7q
	jbKqLBD0ksmSQiFZELBaX4JPh8+aTa651+tJvXwig9e+9nXhARu7hVHvm3YGTcZos6cEusuLeZP
	EGJcve675bGblA/iHZ5ajFQAim5VFq6yRCN73EBD90cxBEwFyahkk8kp0pM5XPH4V8siO4ISbSG
	cmoZ2f2miCF1UylaetnnqEytu1lVwqwmlCuHF7QDWi0FfEklsM1KHDXVDQqkmX859uGvrPzEtqr
	7ussw1NIZu9G9aaQVhP9jJ6oM3+ByVqC4PqPzTo9hIHJ2fSkRC2S8mO1pvsuztXOLIKDttb9yB+
	YWXcx4Ke+8BEAouy4Pwb5mvk2c8dkGJQyOxLUA9uFk4bqUCFYtrAjPlBKZu9moeI+bLq5bJWfzc
	/uVg==
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr18653707a91.60.1795670423993;
        Wed, 25 Nov 2026 21:20:23 -0800 (PST)
X-Received: by 2002:a17:90b:4ec5:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b41c96180amr18653686a91.60.1795670423500;
        Wed, 25 Nov 2026 21:20:23 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm31129371a91.13.2026.11.25.21.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:20:23 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>, stable <stable@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH v4] usb: dwc3: qcom: check for hcd in dwc3_qcom_read_usb2_speed
Date: Thu, 26 Nov 2026 10:49:58 +0530
Message-Id: <20261126051958.2983579-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b07c199 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=87Qc2ugH92rl6A7fmoUA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: t0p0X3-d9yxRwbGHeBbjQyn5TVOX9qGk
X-Proofpoint-ORIG-GUID: t0p0X3-d9yxRwbGHeBbjQyn5TVOX9qGk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX9yeyWvYvs6Uv
 fYLBS0RxHL5edt/fbkSatmuMGJBlgLmle3COWbMRvJDEhMrJL32QyiEtHPlH7uzPsv1hze0+0Vx
 +k6jGv9TjsjuqoWNDFUjOHef60w5vJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX+p6Nawvd+vLW
 C7l3uyRo7hnkTxFAEIkJRBKjM48E1+DjD6A7AdWA+ZYqvsPzLArD0MQzgvXNbzogEFNqzcXyPLT
 CizjdQFU1vVzDcW4r+I7/TKJnnRugjF3EiZY7sFbJdexOC8+WWGaWOjQk5K/hbToYkGIqWbS0/V
 TrU9GoP4Fsgc/S9rbwwOnZhhYO2rQACkW5uMWIhGHWbu/ZL/7JH59rHgaWJKVNqQp3uTPn4ZOgc
 G+VXb/CdFf0+eAPtqHM9mbWGXaLzEsMwKEzq6GnJ6YILF9Zz5MJKEc9DSXIpnZfhKcw644i5eCb
 gn7US0oTQJh94xD8ILa5Da8SjaPZHXwWq3TjFcGBCHFSNI0txvjpxtOhe0Hf/Tn2XBc6zGGp6gM
 me7hh9kcVQd7CfKBDNmJyPuGR0snAR4PXrYitCcB8rUXFliK8mlf0GrKldEhjyTfIkQ3HLFEzXC
 uyjE0QiW3YWKFydi/pA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

Currently dwc->xhci is not cleared if xhci_plat_probe() fails. During
system suspend, dwc3_qcom_read_usb2_speed() checks dwc->xhci and assumes
xhci is initialised. Since the probe failed, hcd will be null, and the
subsequent access results in a NULL pointer dereference

Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000058

Call trace:
  dwc3_qcom_pm_suspend
  dpm_run_callback
  device_suspend
  dpm_suspend
  dpm_suspend_start
  suspend_devices_and_enter
  pm_suspend

Explicitly check the hcd pointer in dwc3_qcom_read_usb2_speed
before accessing it.

Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
Cc: stable <stable@kernel.org>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
Changes in v4
 - Added stable tag and review tags
 - Link to v3: https://lore.kernel.org/all/20261022052602.2335652-1-prashanth.k@oss.qualcomm.com/

Changes in v3: 
 - Initialised udev to null, as suggested by sashiko bot.
 - Link to v2: https://lore.kernel.org/all/20261022044748.2303528-1-prashanth.k@oss.qualcomm.com/ 

Changes in v2:
 - Added null pointer check in dwc3-qcom.c instead of marking xhci as null in host.c
 - Link to v1: https://lore.kernel.org/all/20261014105711.1708244-1-prashanth.k@oss.qualcomm.com

 drivers/usb/dwc3/dwc3-qcom.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 5a68025ccea5..6644d1fcb7dc 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -232,7 +232,7 @@ static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
 
 static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
 {
-	struct usb_device *udev;
+	struct usb_device *udev = NULL;
 	struct usb_hcd __maybe_unused *hcd;
 	struct dwc3 *dwc = &qcom->dwc;
 
@@ -242,9 +242,8 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, i
 	hcd = platform_get_drvdata(dwc->xhci);
 
 #ifdef CONFIG_USB
-	udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
-#else
-	udev = NULL;
+	if (hcd)
+		udev = usb_hub_find_child(hcd->self.root_hub, port_index + 1);
 #endif
 	if (!udev)
 		return USB_SPEED_UNKNOWN;
-- 
2.34.1

