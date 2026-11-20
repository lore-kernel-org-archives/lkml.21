Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187316;
	b=E6KEwgylGc83V5gDHEIdv0mKCuU7ZYvOitR3mHhxFFgWGz2H+NDC8XgdDRv9aFtufsZE
	 ZzHAUuTTMKIw00Ureb9LIR/G9rUDBpxQ0TRmVlZJwic2bBt04i7bhnrWpL/lZ5Jd1Frng
	 t6HIBRRbrgBZoGU2l+lxj4MvBXXer6sEkNGxq3NRc1iPtHEBLlNcxhsFob/y63NnUIGSU
	 n0SsPBloAbs2GhNs0MaqJISEgJqfRpRZzEN7PrQF9L6Gg4IU28ixVbheaYWs8ks59gLbc
	 zGbdt188AZog4fUtDNm1BqDN9/C6PzmO6ZBYqQAJi9mTdTKrZ12jbu93Vg23RkzgVFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kGQgdRbWpBx9us3aHKx11XYO1RqzvbRxqXhh+tVZZ3c=;
	b=c6QAUuzIbynCxTSbosvB9OnGDggyyWoACw49OotetFYsWalDzTrTIyUp4lrY3KFveT0Y
	 S69osc50Q6dTPmQnIqOjKYIa9Sq+0QTn0s86fvuH/0o7qdhG2TDLzCKpOV60U/cpIwutE
	 WaydYJlY7Q40tvgNQsICzU4ggz8bNMdVpsCPNr2XtIQ1xeFl27Ws6aC9aJEfpXUAj4RJX
	 ogKEhIjAKwKsvnNCePyGc6iAyXy3jF+hws3bbHof0N0kBY/AAcIWmnxiXbMd73WBIkfoc
	 Gv9xCkayF4+3GJS+Fqnyj9km2UPvWnj3UCy0zSfJIJ5fB+oBGRhKfdhw5Qp4x7PqebQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3kXTBoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gimQWx/M";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0D606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C0D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U3kXTBoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gimQWx/M
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfTcf048830
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kGQgdRbWpBx9us3aHKx11X
	YO1RqzvbRxqXhh+tVZZ3c=; b=U3kXTBoLfHWIsP6rd6BHttPt7nh2Xe/8I0u9T1
	NzOuMrHJ3kCclamj9XXy+EwHw48oRB6kGfQFl7Jw4Kh6DDC8cpcD0yI0w8WNMnYW
	kAQgUL+O3OEuD8W4SoSaTRfH4n40EXXzAXDnvzlammyglCwy5gDWpn3FJl/11Hwh
	15jWkAkWqi1QVjOGoeMjcqWnepRhTjixAP80PiCX3+8nQMt+gjMDSb2GFbWQ/y6n
	gnAtzsgaVHv3bMcfdF5ey4jGZBktfBoL6Vc2Tpkuz6T8SiJyrb/aFzcwYaeTrcB2
	XDgCebefX6BTYJt+7MeNxymLbPrmw9XHyvX0qthjVslwPeKw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2mm4h03e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:08:34 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b3ad0823c3so15653987b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795187314; x=1795792114; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kGQgdRbWpBx9us3aHKx11XYO1RqzvbRxqXhh+tVZZ3c=;
        b=gimQWx/MMaDpvyxXvvlpa4g9+2rajD0IoD59ihPxdPHz+EtTmZynKpuhjGVHnOJ7aS
         CzNsDUnyTVbIdBOasN71yxCvU4Fa5e7nBXts/4iiX78DhMW5fowsTab/vmGoUmLqC7li
         Rw5mwr2/Rdnq83WBmvwG21XHdIIEKOMiA9t+1KNqwb0Wqx31c5l0t4rrh+TQHI4rTQZY
         h8bE3j8LDI9YKsKXsofvRC/VQjpmv+eGR35DqEQLj6rAfLcxpWfZKjdzZmrOciHioSUS
         0Tqbf9/lk2MLoaw1nCjGqXDdJU4oHZLfk2S9jF+FL3DTwTqd2XYghGaaxm5FwbMjzzZP
         6pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187314; x=1795792114;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kGQgdRbWpBx9us3aHKx11XYO1RqzvbRxqXhh+tVZZ3c=;
        b=v2xSkSs+ptqs4CoooCvPVev0X/SiNNZ7R2UbMzLGrKBxkyoYrFK8ksuNCU0A/lCjKd
         vqdiDfbmSnTuF1bbXZpdxWK5tWOk5LPfblkMsu4hIp2DQEOp4IiRN1KzjC1Ddwb6Rux3
         YUxrrDMTfHN7G8wgq4ZQOz5ZRwuo/eDpqdm3+CMB4lnJoa45J0oW+3BmLO6zHWbLGjKE
         a/7PYgv9ByyAoHWE71KLy0cJyNxb7aYCE+HraH+6sIsbQZzCKu4mhOAuwLUKaSgTtoJa
         0+jfcf8Vyf7QYawxq4WsAucfoAW/f2sXRljXnEw7CQZ9ZI3BCFOfCXe+cMtBWo14U1qz
         GBEQ==
X-Forwarded-Encrypted: i=1; AL+hErFO68pHWBsNpbkPAGED3kzEzqPrkYIcfKw2qflLgDVxcTR23RpmbL36gVX8ObBUkLkynhqryeujfD47/AE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/duns7nYpi9MlyBS+OurKKl3BxLw1HvfwKt0wJsQZbBdgrQXSM
	tRDT/Z8Fnr81gCtpM1xDt77mq5jUCJ6f3RgDNkJkvSxtiJMI9Cu1Px+kipqtYqNwthtPF/kR2+9
	MLXZ1uCzYDxPHKaB3DBkL84APHw2SLXbnG3/dScTt1bhUSEkC8xCXgmIqaoO4kfqw2q1sHxuIPC
	Y=
X-Gm-Gg: AZFdTZeMuboqWJSEMBvFYNzWBkEUbOSSMBTu8uK1IJ3vVPBceVI/dTXNR/WVXj4Ou5Q
	GClo3RNVbDhWVWaB0HIFFT4urvFgfb2Rnjglw3DTn/e6csduaCbsK18wQjNu5G8zqCij4vvcyKR
	75gkq8BE2eshFyJXgnAOKwwJaHmwElcj4y6CleVjkGzpvHNF2QLvHCvLu106C+mC8MjzbsdHhoO
	/MiBA7NgxD2+YZ15dtcDzFeHKhuGRZLZoi6eYt4hckcJqOwBzK/ZDdBaUDvreNYASAAanPIDvjT
	KeTWZNfRL+EEwcWdzDVf9nZ6IzUn7d6VOADorkIGCOO9QJ+ZYOyxxEah2vKQLVDsRNs/15L9JgR
	33eaNbDFsnBQeDx7Ck8DdXrCoMncbqgkIttb1vxWi3Jr/fNIxqFPsO5TDrQ==
X-Received: by 2002:a05:690c:6b81:b0:8b4:c71b:e4e5 with SMTP id 00721157ae682-8b52047231bmr17494907b3.25.1795187314295;
        Fri, 20 Nov 2026 07:08:34 -0800 (PST)
X-Received: by 2002:a05:690c:6b81:b0:8b4:c71b:e4e5 with SMTP id 00721157ae682-8b52047231bmr17494737b3.25.1795187313647;
        Fri, 20 Nov 2026 07:08:33 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm5905971f8f.32.2026.11.20.07.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:08:32 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 17:08:30 +0200
Subject: [PATCH] soc: qcom: rpmh-rsc: Write the sleep and wake sets again
 after hibernation
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
Message-Id: <20261120-soc-qcom-rpmh-rsc-restore-hibernation-v1-1-3ffd45c9c55a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG1iAGsC/yXNwQrCMAyA4VcZORtYK6viq4iHLYs2wtqZVBHG3
 n2dHv/L9y9grMIGl2YB5Y+Y5FTDHRqg2KcHo4y1wbc+OOdbtEz4ojyhzlNENUJlK1kZowysqS9
 VQO6OwZ9PI3eBoFqz8l2+v8/19m97D0+msuOwrhu/DYdliQAAAA==
X-Change-ID: 20261120-soc-qcom-rpmh-rsc-restore-hibernation-e536287de56c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+is71aRCqJ9UjXAHZyXlWJyQXKsk4j80c5NYO/6FxT8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrAGJvj43d9otqGZDe57IkVQbKRCe8B5HTri02E
 +8ZsF6hu/yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawBibwAKCRAbX0TJAJUV
 Vv0FD/4sosFz0qESwGl6Bwj1dWOq4Ljsb5d5ICBjSHrvcC71WFS+/WWl7uZipSdl9DvaUPKp2/n
 m0Srfx9VmPMug/lRd5UBWd49ey/UwdPkXNkqswPljowut6RhMwKPrTZwTyRf4RXEsjrQDhi5kwh
 NgiTTkuaca1Opg8munp5ggaH+mCTUA+gfM5v5OJL3xkqDwTu5xwCkrxDnURUu+nNG9h8WHacqE5
 9IfhdCJaSBy4WfU6NNVbcDKYfUKApezC2DiroVwDmQhuWKjk5SpOeqkDURMBsnOONnDMrZ+D/+0
 RneFlERAUWuubJLc+mRxFxuxoBfoxIsikaCws6MMOnxus+Uv7mBVD0W+L5xJwnJc0uNjbhsVcvu
 QZwEN+ByW1Hcim8E7fP9vtu8qNYHJL+E+mYOizQOrUgpzS+cSVI9OPmKQgNZ01g1qJ/fP0xRG4Q
 1mUpNnucdUPsgy4Bje3I0X9zKixNLFdIyDDrHBZ7qBhxshMopj9GapsCaaXP4L1sEnkMxmuBWRs
 uZ0WvfEO7K1jPYkVpkkOJONqgWiJppqs582FA9WbsGTWal4vv2c0uWFAQAq5lSTqT6GxdwgSuS3
 okz+ZuR06408RZEobpUxadGMvxtKunUPhwfiUNrinAhz0zQkPGsCobOlaQtC4lDtLu7ukmR8eia
 7L00Jo4xg5dkmNQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: d8Yz4uanR3xJn60SkoZrg3XOwgPvpfHj
X-Authority-Analysis: v=2.4 cv=RZYFmFtv c=1 sm=1 tr=0 ts=6b006273 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=T-_UO9njPLxEiKD2BxsA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MCBTYWx0ZWRfX8khRSdpqwhjp
 OY0RTwrvaNRt0C6h+1Oe817SsbwSoXd8kHBIPHgRUOtmxgD6Jmz6CFvzU9qjOI0bVuyN+gs8MSn
 4dVwWuKfg1qk0RoqhXOavwcqw+e/1HY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MCBTYWx0ZWRfX1a4i/6tEV6xM
 wr9oK0dWAU9PVQu53JeVXaJt70pB7hS72tHxnb41MB0RcWOBgkB3HZXZVZG0meqbpNVjcs/DG2x
 e6HclFSTEYEtItDK84eeA2TKr+BMXisJ3iWK+d50EHb8hxJwxXB4LdcQPmDObmJpdcki5UBDaBh
 ngYtHbW2SOhreCGqo9LwuZBr/+Glyc0ozeqMHYaVyHt9XfP1ApaEgyoy09sEIb7uEvPaaAKmGPN
 2Br3jZQNiVqSZYsBx3ajmjDt0APNmOUX7xUr39ENwUyfDjQYwBE/JvG1UWVhwp5rVLx/RZGLvJl
 JGKAad1b/zP5H6blUz2HlGD4s+SYSSX/XTEVY0jDcMAp2w8RdNtA5s4SNi1qY5ihdCkH4mynJJq
 sdaac6A3laEpzI4Otex2DVPWeOP4TQa0KYxUvcx3laIrS0Q4L/e6sTtcCEXk40+/ftOLKS6UQQA
 5MeLrsUQ/TuH08uHKDg==
X-Proofpoint-GUID: d8Yz4uanR3xJn60SkoZrg3XOwgPvpfHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200060

The sleep and wake TCSes are written by rpmh_flush() right before the
last CPU of the RSC power domain goes down, but only when the cached
votes changed since the last flush. A hibernation image is restored by
another kernel, which used the TCSes for its own votes. The cache of the
restored kernel still says the TCSes hold its votes, so it never writes
them again and every power collapse after the restore applies the sleep
and wake votes of the kernel that loaded the image, until one of the
cached votes happens to change.

Mark the cache dirty when restoring from hibernation, so that the next
power collapse writes the sleep and wake sets of the restored kernel.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 02b74c510c3f..3f89857d9d22 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1169,12 +1169,35 @@ static const struct of_device_id rpmh_drv_match[] = {
 };
 MODULE_DEVICE_TABLE(of, rpmh_drv_match);
 
+/*
+ * A hibernation image is restored by another kernel, which filled the sleep
+ * and wake TCSes with its own votes. Our cache still says they hold ours, so
+ * rpmh_flush() would never write them again and the next power collapse would
+ * use what the other kernel left behind. Write them again before that.
+ */
+static int rpmh_rsc_restore_early(struct device *dev)
+{
+	struct rsc_drv *drv = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&drv->client.cache_lock, flags);
+	drv->client.dirty = true;
+	spin_unlock_irqrestore(&drv->client.cache_lock, flags);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rpmh_rsc_pm_ops = {
+	.restore_early = pm_sleep_ptr(rpmh_rsc_restore_early),
+};
+
 static struct platform_driver rpmh_driver = {
 	.probe = rpmh_rsc_probe,
 	.driver = {
 		  .name = "rpmh",
 		  .of_match_table = rpmh_drv_match,
 		  .suppress_bind_attrs = true,
+		  .pm = pm_sleep_ptr(&rpmh_rsc_pm_ops),
 	},
 };
 

---
base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
change-id: 20261120-soc-qcom-rpmh-rsc-restore-hibernation-e536287de56c

Best regards,
--  

Abel

