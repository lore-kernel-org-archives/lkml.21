Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795924;
	b=26vfHhNPK/HhCWCvZVSAEnCtBxkyMWJd/Z3kfZEcqqaN+NngqLsvUyJ1xA8YF/UuVx85
	 +gw/XQyk2FtB3v5Oni3kY28v9TgWLk2R2z8WeUum3d0uICBzRP/TnzLVLRheDXpsVfVvE
	 O2ocZ9FfwlfwFQD/vv/9z6CdfhfSRIVDql5bCsQVyKDyVjtrm3BUusgfe5UI61eu1NLgv
	 UQoURmq1nipZDceT4t6xpi2rJsLOkPapIluB6TZvYJP9Iq7vEDR0oYD358iJh3NKy0FqO
	 l5oLcJYs+JsWMXgVIiV2qn5EKx4EFGo6MQX+o/uB0yso7Oh8Ac4bOZLN3ApH8maS6PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
	b=d/n7kFC2UU3KPzuPF7goAtL7sEZkSrLnJmuvvTulkh0seWqlSenWHFXw1NaA40bzGC7A
	 rvZzmRGly0/M2rE5c0jlXtnph5j2xLKMjcQduighla+dahSlDB42okp4FLXYy28U4vPzr
	 drvz8HH7ntVqUbmo7zDUC6L/yBR61i85ejH1lwYifuY4i9mUuVM2egxUmX5loq+HZlESB
	 gKEjOglMfaXz0w6TeU5g1G4faI3yPstmP2v/P5K8illrmonkuvaJOA1xvtdq4c9XTGxmS
	 KL791LHx4FtmPDNO6hS20kA2nedHPbkqPb9/iDNh0qThyArU9i7o4igNTGfN6kUxTkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Op+TaJqN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy29BqEZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF9B606A336
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF9B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Op+TaJqN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xy29BqEZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpYMf2211621
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=; b=Op+TaJqN86K7uc+a
	CG+aU3JjMprxZWOI8BU+p7NqK9+O9loTLA66hPVTPSQevla+Sy3NZizQpMixC51e
	7J4fcRmzIRvjBi88dvsqx3ZaKjOXltnQtQ4BAmAcgDAwKUEugw36ZcZjqAw0EWH7
	0LxRqm6dYpbtsoOO126aqa4AGpo9R1ZLlteIX8IU6iI6bY/VpPr9xi8ZA0aYjj/Y
	K7YBmKvPDz78i0fK+JYR1dYdDT++/Xjk1gsH5oCqrD9701S1tSXM7ob/duc3CVlq
	Pmsihsp5TiWWxpRbBLHdHitPKKHvPoVju20rtg/OK5O6AVttEvbRoJgpHy4/ULNw
	59snKg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ur04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:03 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso8718520b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795923; x=1796400723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=Xy29BqEZTOG1INagFr/2rZIuJMjyI779KDxKvT18MU6YjAzk8sBLbA6W+HayDQ3JTn
         IC8pn+BG8U/Ql+3biOCVJ7/8qWjhCl0vZ0Um3k6ihNIjLSBk61JIIpV/9UwTeBESaWyp
         snTU0SiCDQ00Sokt/b+eoJuMWGllOCfFvkn5ZBFsKia88UxdLTfhDftW7byLVVeYaUDY
         U2hMzr8X0/3xMfY+gyd82dhpiuH20ETUTHduTuLOPncNQBkEwniXplLc8qOBA6+8iK8f
         OFKte3IGRw80IuhGoSlkMsYNsxoiUQl2oPMSVTf9w67a1iFIXycJkYsH6e3kuNu/zOJ0
         kyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795923; x=1796400723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzNklxLlUJ2kPgRWVekN/AIYjtsWuYGK2u9HeObTvxc=;
        b=pnCg67o35FuEoLthwUczlUF36jZFUFE2UjSWTVJScrNWEKGzm/Ca2mpXQ+gXp9Qqa8
         KrffyvB0UlMtaPcsnAENJqM2BJLvgKFHr2QUVPInwKUA27yGkK0Cbr935aH3poPkzXXj
         jTU07ByT8Veoz3oNQcxRAMHPRE762U7KCnpDFGicW/tZ/67VvB+O2HlnLJpQnOnAF+4X
         MSMFWPiBuGUU3LeQ/9woZAeWEsI4FKtOia55DLCB7NqNAJxNit5e6Sd7Vg0Xp+guTgwj
         1mpdZJvs71LN29YRsxpZV+23kFYLWEQp5RtOyyEsvoFF1htE2uILP2MAtbJahHz4E3mC
         8U0w==
X-Forwarded-Encrypted: i=1; AL+hErHGxZL1wOEhidORKySaHcn14eQQJ4PHB/MRfG4oScjhYW6OABIyCowxjof6DLesyqz/6FFRoqwtGTqNnpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ppwe9W6bNNCHTW+nSEbyYaQbwVRG3renIxSyaIgV/9C4lv+1U
	tfSXh7a3ZIHwQN9Di6onXUFeugihjvV2znLEXxNHWs0CxsDt0ohVcXM3VuijXeBoo8GQS6DiJmv
	UIDEQBChmpFL61GKjkbPHBxo+QE+R7qpZ3NzLjSXVu8zher+x2T12qXrh669i4wsy3dg=
X-Gm-Gg: AZFdTZcX7mx43fwwI2I0+WVPmcDyfSvwhIY8Z3kKOSDtUHEpt9jb/X12Vsy0BT0mx78
	06bFonDcbuz+0B1kp7JraipYUJlrrt6m+koSBpGjO3uMM0GpMiljwgXhVBjO2V/Nr+gWoFac78e
	EK+Pp6Oi83LN2BUUd1TEZcq4Ebp1ePv9BxdTlZ92DSsENA4e1PfNzfWVRbLL1O4r0oUZkUhShLo
	pQqY38Jj6jrFDvKcHsJ59VezR3ZgHWPcUOQdK43YDsy+z3QStJjeGgysKxkiCpANUW0P94UN+/M
	TiAvJr/nvb4STcL3SHPxcUImkl33DremJl2AZnDbqBBdDNvQQYsvswu5PVS9/q6J1u05eVCbZ7K
	GnxVZRfTgCsU9PY/OHXJSWws54D/vDuDvH5dBNF1KAXSbrH31UTdLCDjVIwHLs7ba21QFCTEHtB
	19wbgTp1agQYdQZhKVNygEf1+7M/aEXK69y1Fkb5yXGPgsJPkGUtrCl4528HNyDJpQJ5zE0dfn2
	6ZsdGjpI1sOB/AaEVgMa0MzEVuj
X-Received: by 2002:a05:6808:6411:b0:573:f2e:2bf3 with SMTP id 5614622812f47-57a0a30b35emr25153145b6e.17.1795795922651;
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
X-Received: by 2002:a05:6808:6411:b0:573:f2e:2bf3 with SMTP id 5614622812f47-57a0a30b35emr25153087b6e.17.1795795922042;
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:54 +0100
Subject: [PATCH v3 4/8] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-4-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8rlEhGLfnMxw
 jhyzJhRCXrMXxOBCyNAopZxrXCN6o5/kwrSvUgrB2+G2LcJYwVCVuZVX2JF/120QdHb8AKSK7+G
 WHFcUDsuvIK0jCw8utOrfpO41ljxZVQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX/2okW6LwHWQ1
 bBSBMJv3bx1hoDukBrsUjojC+oapP5QYESELRYpF4oHms+tbFb/7dnRZoJEq7+ZV7Civ8XyomBt
 WQvAm84Y7UhYO3tzvQKralVXqeZBU05U4fkRgOuzXChFh/+aCx+Ti4wpu7yHsz0aJRrgt2jRR9a
 WI+1WghIFID2WULsIpqM2yuEc2BnSLeMGB6mK8/aAeK4H6PHPV/KlHRWUgVbZq2JTLfsBy8Csg+
 LNjUairb2PMS4QE023FFSrUo8OVXvx2ur5vsff5o46xs4A9vTRaqiUAXk5rpqs9S6JTAjnu3VSC
 UwjM336J/gziiFSHPSra+GDaEjE1dstVfAtMcvo0LxPczsWC/UJeoFkTDBNyWRkvY4gUGmaLSB2
 bH0krU8p7+gMRGhTeqrvC/OsJis1mZeXt+m5Xe8nUvran7Usw9zIVMM8YZq5QB59WzZIhIxKLc4
 AIl0+ZL2AqJqzw3nxcw==
X-Proofpoint-ORIG-GUID: ScHJ3IePox9X54RqtrknWHowqSva2s8r
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09abd3 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ScHJ3IePox9X54RqtrknWHowqSva2s8r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Implement the sof_ts operation to read the CURRENT_SOF pair
instead, and let the CSID core put it on the CLOCK_MONOTONIC timebase
the event carries. CURRENT_EOF and the PREVIOUS_* pairs are left alone,
following the reference Qualcomm Camx code which only interacts with
CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 85e9eaf78df75f95d5f44f83b45dc7a3633401d0..47b0881e9c9942eeeaef53d8aa6b466ca21a366a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return ((u64)hi << 32) | lo;
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -459,6 +473,7 @@ const struct csid_hw_ops csid_ops_gen2 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

