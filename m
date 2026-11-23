Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430870;
	b=CFbImtLiZLuDlG/0HzqqUliGZNdps5GyGRcwjJZL11VtO6/3tGjTy2l8EMeXomm8N0AI
	 8lT9fCRik/GoUoMhoj1eQziIGsR+g1RungFj3JuXpiqVbqlmZcFEtSObYPA92bMO0/ZQq
	 uhyAcrwZjY/WbrLoP20BEtzipEVfCL7l8FWSVg7wsPrBjWmg9pJtSC1BZocuaLhbvofJS
	 bNDqtn0k5QTHLvat54wjbBxfX/V8hyU/SZ5DV7HIF4xF5XEvmvtMI6DV6Dz/TrFdAQTpD
	 xqGwC13iDts35pj8PUefCIRH5WL05QSGnZc5LfUyhtO70Jhu1JfKsS4Wp4wBlPpJccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
	b=ua+YKR0ubgblJmkbhgeBhbd6hH2O5Kx5MMwiTJsatWGEK7DzN9ICPAr6PmpX9SQ/xh29
	 wTCwX+E69sjgd2jLAP1IrhEYCrTAIouTpeSww/gofCrqCBeYXq3yXcLBTr9t98wDt6c5n
	 VwjFn7Pg29D6QzOnX5xLUkFatX/Dw6rMOvW9XJ7JCwTN8u1lBs1Gqy/yTC0LuOQcMylt3
	 7uMZtFynQx5rBCgbeXuthzk121tsLtOugMNslFHsL89buSOcSZSzXIHW1qiFvO5aXtoKO
	 w1HcW//WgRoch5BRAckIgliDJwDLE1Tt8t59AQrJu5XU2aA1mB08Ls817pxjNGvcKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/Lf1EU8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05416606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05416606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ly9Q+0CR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/Lf1EU8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G1nW1899235
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pLDtqrroGwv
	OI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=; b=Ly9Q+0CR8Ggwndo3fOEmB9/BA6D
	8AwsQ4j479LV+4erEoWm4CykwVJDXMHnHjkugQFWalTMG+Jx/uY1BURVDe+aKFFl
	UQqQcpXcLPEPCLCwDS0Tehh1G5bV/29YXn9f8GqfEaQCifv4yyw0BkyZ+JPYlhuq
	nFcsJLJLJns1JAesbqxv5BOVZ01Mjzzqyf+ajVVUDhLa6ZN9gY6ixnGLxE2dUbCu
	uYfx/FCWeY4JmpLHAeuZmjzSf3Et60FeUfzvJbdrBuZ9qCJq1ubeDzil+ct03g37
	dtZbVQyuu6MWKAeEfvx9Xc12TbRnDGbmmNYoGlBeiZystJ/lRoW0GzzmKeg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k11f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:47:49 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b7614e9762so2202835b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430868; x=1796035668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=K/Lf1EU89tt1abEp7rmYm2hmd1KyWknJeNMnsgvH+D4AbEd+l0PtGlnmsmDgv3rape
         /MkASRvxZ2OUAV7UEoPwOAYpPD36vlmd74USdGwBYbq4f7/BaWfn9zNyWNCFgABYRbpd
         yb0CMZBuIq1+6b+cNBQhPUBBfZTMUDO9cXnEjWzFYaPAuwAcbHewXnKDzHDfpHtKqHFy
         +/jSiN3QUGKOZc9J7R0H52wHlHgE9BHUFhYGaMeJy7rZbjUnQ7vceCU0JclMGfH14R6B
         4qIMZtrEyzBi55LaFL7XORHI8v6lS6awYUWoS00+kMplFr/k6kKb1qmh4K/oUH/ddUJ6
         xF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430868; x=1796035668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLDtqrroGwvOI2cnoT3bFsaGgFbZltttDlxlbi7oTAs=;
        b=QWGd+B7geZs5IM58xmE2sekk+7XBN/hHA28NDRoKLk0J8dt/Pgti+fWj1GCs5B+NpY
         G7QsspiBn41dQkq3vbITw1ekIKMe8qzq3Pfwa9uoyCu8bWKioj4NTlmtH1I7Ds6iLC6s
         dfCElN6h7yZhy61t9TVQcO6WVZbMP3iRbkY2ipuNWDqjuffl/iC2WVqYr/paRl84Zu5Q
         XfSIGsTiR3OyquBmBnIn0ZKsoeateyA75P+m3FVWINmuZWLmGlBvdrr5vrz7bqAOcwl8
         vI08lnSXcgoHUBO+1uMS/j8aHb1w4fl+akkIvpm6dH2iRSoQpr41YQw0wRBd+eKLvUne
         co+Q==
X-Forwarded-Encrypted: i=1; AL+hErFCf8+Bt3CbIavw4N0dmU8/YG2vTU0lKrhFf0pZ7bAcuzFk0kkul3BaOWCWNR5ANMgFTCWVKm7fX+HAVg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LMjjWgaAESOP5vqtQQuhMdW2RaoukpePvzjpfXfQ4A5kkzKZx
	5kUeGoCC4+WIZOTU9nx4hshCN2jadm+u2kceYKtUpZn7VLarnMLlUBKJ3P45TA2Ys3dmv+kJ/kT
	zDQ/kkhb5p916xtIIxyjGmF438vfQkiI5l5cXTEAVVEI7KoH+7cZ6hWrucKPsPKukZEk=
X-Gm-Gg: AZFdTZdKQCXfgfEO7twP8O2yaxnAhNdzyY4cmOXxOAcN7fqNbErJWuDzwZ9op5NWIDw
	/BzfxJ9RzwLg36F94CDWAcpTqEoBCDEePgtzXOWbTyLvCzUz4FCgHeGzaoSfSDz6loP/xgPDV+l
	HoPtIxvM0/5QqEvp7GZ7yn8qkhRhrDmPo+3/+kvE9yJJU8oJT6aw7ay2NVaZ707hOA+8lv105Pn
	2sGtvoRUOdPRA2MtzPz0a7RmGJxeiYITTLoS/bvy/oyMtDNBXc+MEzaE38VM7MM3Mqv+IcrN8dj
	hznaoTvk8Z8iuwgBy6h/sOZ3z71jjLbhjdDGtl0HbfAZ2KddmMSBs/5VLfCf4o9BWCj6L1tbAix
	0sH8T7QkcIVNjtfdwrAbX43EVsgRbfnObG6FZslDD2Vwy5W6BtUKkKCsnpzDJKt4YehRRdYRRAS
	E7aIoBJQ==
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625592b3a.45.1795430868081;
        Mon, 23 Nov 2026 02:47:48 -0800 (PST)
X-Received: by 2002:a05:6a00:2da7:b0:898:e7e7:c0df with SMTP id d2e1a72fcca58-8c87cf2ad15mr8625582b3a.45.1795430867614;
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:47:47 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v5 02/11] usb: dwc3: qcom: Disarm wakeup IRQs on system suspend without wakeup
Date: Mon, 23 Nov 2026 16:17:17 +0530
Message-Id: <20261123104727.1539149-3-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX3oOxms5OOxro
 YxBemV+QFnPYlKbkPmqcwpPn2lNmj4jRmK5nk7QbuuZF+/cpi04W3OUXsS8R9mg6sqFAOtXJndZ
 sHemJ3eMgyDwm5Ap89mt5G1KBND3NZ4=
X-Proofpoint-GUID: 4b7upCtmviCF-MROgBhYIyKjJQZah86O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfXyFwO4U0E8oUl
 LsgqPGOcBCyVVjxbqjfnOMJc/D5royPARP128vHSBfd/wxmbYG9my9f3YCUpexrhYsa17dpWe2W
 D2rsGVT1npYJkFE1A69igqU8eIN+awOzp3pSo3zuyaPrbDySui4LPzqrOLPcm9wGQo1yD83dDrE
 oqa+Vi/cyBXmIpsCVX5LvMaBcczu7/DrqaNYLlh5GcuxOHAZ8239DOg1JTLdhPJUuSw7KfXI0lg
 m+RSVpCFtckRvLOB1/bzMNAQG0m9RvLNveotNm4O+Jc9mYVwgJ1T1pjf1WaS1h+Cfwca/QGudUU
 g0U/HluxvMyf3mp7rMDgScG84JFVUVaSRcsN+vZ+tkeFcJsM/JlNZKdRaQTtDXg9mRFBoRDD5wq
 9CF1uzSIe1gcR+juyE1rVxmcbaiYYpWPHjAn7GN9LoR64+mSm914oqDXQjchncj94oh7WglkUZA
 WISDLyyvHPyIwoCBN/g==
X-Proofpoint-ORIG-GUID: 4b7upCtmviCF-MROgBhYIyKjJQZah86O
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0419d5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=f_oCHbJux9u68P6T8RIA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Runtime suspend always arms the wakeup interrupts in host mode, even if
the device is not wakeup capable. If the controller is still runtime
suspended when system suspend runs without wakeup enabled, the
interrupts stay armed as wakeup sources, so they can still wake the
system. System resume does not disarm them either, as it only does so
when wakeup is enabled, so they remain armed after resume and the next
runtime suspend arms them a second time.

Disarm them in system suspend when the controller is already runtime
suspended and wakeup is not enabled, so the state matches what a system
suspend without a preceding runtime suspend would have left.

Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7a7225b900b3..18db19cf2065 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -350,8 +350,16 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, pm_message_t msg)
 	u32 val;
 	int i, ret;
 
-	if (qcom->is_suspended)
+	if (qcom->is_suspended) {
+		/*
+		 * Runtime suspend arms the wakeup interrupts in host mode
+		 * regardless of the device wakeup setting. If system suspend
+		 * runs without wakeup, disarm them here, as resume will not.
+		 */
+		if (dwc3_qcom_is_host(qcom) && !wakeup)
+			dwc3_qcom_disable_interrupts(qcom);
 		return 0;
+	}
 
 	for (i = 0; i < qcom->num_ports; i++) {
 		val = readl(qcom->qscratch_base + pwr_evnt_irq_stat_reg[i]);
-- 
2.34.1

