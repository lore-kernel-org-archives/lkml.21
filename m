Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510403;
	b=guGFUuoG10b9XhJTTcv8FcEcx17F+UkQleKIfePUsIkVDHSRuCuz6/UTBoV18R6j673l
	 J34mS9mqQSQH7T+bnKP1R5XnSAyWKQ8E1LvE7C5fSvXQxRKJtzbNLCJiaGRAocjVScCS+
	 T47JyfnYZOj+N5JVlemaIvPPH4fX3o0feedDlU2HXmCpIwTFMkwgSItPDM4DvhASaLg7k
	 jvmZ7yEMF9nrhvEl4XbX+jihjVavvK6a99TE3CsCMgxqbMtjsIbjzbhJMsBwSTyQwUmYP
	 D8IKnzvPKYWjc1cQckLs6f2nvKLmqas0BwBroqNRYWAZUq1JVmfgioEjhIePCWgK1yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
	b=ywa7R1S/FSmqPrWKeK4faLDb0OMqMSw38Wc9b9BCpDf1dbuKNB4cNSJoieX9jW9qNjW3
	 GYfRuUf0okxedhyWr8TaPYzrQnqW3HSrriq1mP8uQMzb22Bbozye9NgZYrG5llYzDlRn9
	 FosHLACoJKBe4tF/v9na1HKm2VFD6utJdfYwBe9obREOJ8lT7EiXg6XUFwmbFBppaXTQA
	 /BFaI97VScxOnPb1hE6Hx+P1V3/4OvPcg7bzIv/LmcVYFfkXDGqugq4f1gsSjexDiU1ME
	 cXZDZLA48jPGqmMcDR9Glc3g8n41Yby2rHECuSNQX3EL9QlFmMBLaJhoCI91fDgK6wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDkerN3T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnVP3+S3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7A606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B7A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aDkerN3T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnVP3+S3
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8U5UC016825
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=; b=aDkerN3TbfPjXjBs
	ym+aRZ2ea7amf2Go3ROmVp5dfToS3QkquGPKRqXNLaQ1yA+Gq5chlIq2XQY78KbV
	7B4zkMfEWsASMTzmG5E3DxS7PueaQKyxCXiEOW7oUgWmYJi9hfcB8ZW22LXlMZgJ
	P7Bcxzu8cYhNLfShYPvpTXc/l3S4JYyPqO48Rd2j3jQF1NpXhmmrzhTNNzWcqV7m
	aaAzMlDEKWSbgAzwMsRrosGRa3Nzc2BR9hPDDg0BI1iOxIzIZs5j8nreHTPVx+Mx
	A1sa5KOp5J4eLWW3HWqcettQbfRyVv4rOTBYs+xB230xzcpK1VuFMW7rtXFVcE9c
	OcAGDg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9ntu7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so2477609eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510401; x=1796115201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
        b=dnVP3+S35BxvcF8ENYvSsR0OzbNzbLUWySm2Frcirph4JUH3HtLcJ5509Sux8BBJzJ
         fYuUYlHvZwRa/mMAM3WvQ69EjQeWCxZaszexPDUl8xYPWXIJQK5qLBlY0G2W+8icT9IO
         Rq8pv3zq6VgPt1M6ntp+RsQwXdXIExddO+J3r3JdAIm51wfqQedFlh8siV+P0dMHx8e7
         5Fsb3rkPv5LnPcP6I5MVjwQemhHqncKdtVcsOP7gvbnmIUWdsVz840lB7ec2FpO7utap
         E1LvHVV0OKQ5alpH7eB92EPpE+V+VzbTscUt99aqfPVF1bXnjf3fiE1NQueWjFLpcgL0
         dosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510401; x=1796115201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgk6z0ZbGgZGUwPRiIMepzhygLrjToSRy5+RkQrNTkg=;
        b=jGaa3gmvP5ebHql5qMS+9wuB/N2ZoPeFxqHYfKJXXG7+/mwKUOp6R+xV+O4CUSuCoG
         yB+36YHcVFHHcT/k0EPEHmQSbzHo2cOorVmzz6AaUNJCsOOMCqZPqbA7bPPix9ks+Jqa
         o8/VzLXRh6ZU8+Jym3hxCNhRS6/53ELl9I7MViYAcRsG9RkNmeb1GSVoeL/kzw73H1L+
         FG0LeFznjsc0+U4iUyDbXzAFf0Dx8dUyxEombBkmWcYCLuawizTQu4jIwSL+7HBfAUe8
         JL6/PSZp1MGWQyzZNgtVg5cZH1G5/zPh0XFJSx1EBeu4bEMkGB/gADmhS5m7hbtKZSV8
         82dA==
X-Forwarded-Encrypted: i=1; AL+hErGqC6Nm175XIbrCsC2o2dgoiX5tbXy9YG3rcrA0X59S78gYDqZml3GTPP//28hsgYmenuhvCkVJF0Dv+9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kJ/Ser00H3EG+4FcH4Fruwm5RPGtKwnujFmHVdRyvJkxmlRd8
	bG/2nCJ1F2K5ZiEjT5vky2eF3kLpkPTJ7VJfj3EQD9/ia2dt1C3cMUYnaVTuzyIqZMeR/A2CTnR
	MJP7VRmv41mSdL3J4UrU3ONUD23PW/WW6+ZjXeBbKeJQFiExbcBaXsPxAxzjl5YxmIpI=
X-Gm-Gg: AZFdTZdQq8yAnw56rewCgVTpj2iQHqbfywM7NhKdzgpx+RBw+dP6jx971hA7PR2au2b
	c3CHflf4SxRXj/ADlJdjuxpzOcodTC83/03k1zXXShM2Q7mtDq6Z+0Si8nl93g+BEX5vdyK/8/S
	D6Gd93u0TzYVKSIKUNB/8wHmty26xTZGDVbRkndWaSEvbz2IY7XWWI2NI4huu99CKzrtdBJAcJ3
	3s5iDCfeMtWS6bGcViVc6+etjDQQuZsx8qo14dmL7bAoVYc+9wxlq1Ke1bWzoFCmrsU9fdOumFG
	4kRL09sGqGnQkMQ+ASeuQqA+k5IkreDiyvLabAsIeV7iiZGcuIpmOS9/HcUMy+J66f3Zmorwyt0
	vj1RKtmn6bfdQ20VLp//GdqY53gIbEjhOG7SreVexPRO3242mco/OtNPqg0F/gyMp4kbx0kySqX
	cm4g==
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr15110421c88.20.1795510400324;
        Tue, 24 Nov 2026 00:53:20 -0800 (PST)
X-Received: by 2002:a05:7023:a8c:b0:1b5:4d7b:9ea8 with SMTP id a92af1059eb24-1b55692849fmr15110391c88.20.1795510399729;
        Tue, 24 Nov 2026 00:53:19 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:19 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:06 +0530
Subject: [PATCH v3 2/4] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF
 device IDs
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-2-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX8dc7GgjWdbbF
 N2ipMiTBPF5LWosweZdPdbo0twcIzjfHpVVvAmDQ3zn7mrH4j8LMGi7khWAaFLpl1+FJO3LcjkG
 OGCRRFjZNjFGJD1I1/9/JOp4s+B141Sjq9oZYurYFUjQ7eAuSJurSbONfjfcYlrdshlcQ6N+Ppw
 wHNqFBzk+4/AhxKfUIsY6I/Yu4qRpgzvAloy3i6/QQZgPYR+rLps4r+cGiQRFPbQW2STdPQZF1W
 4sOXTJVWeFxXQ+vJk9CGghPh8aHkuCrNDljRBOKd6LR2MF+VIRcUqFTVthPPgjE6RNUdnHZXw8L
 0YfA4sj+BlQWOy5Iq5CCv0fSu46QaeYG6IF59UxjgYpr8Hqj6RabC/bA1C235Q3yGfONg3obmAD
 gAxaKlqFg39yzoBLhYb0wYfqIudIogl8z1WPnuYE7EcnmcF3GwRP5O3VTxkcYBUkx3iE7P5EL1B
 LEmi0MtbLJZqZZU7iPw==
X-Proofpoint-GUID: j0U56ViqNW0F-DxN5em1xvhJ1G06Ur3_
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b055081 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=nKNncH1Eii2HH4qo_fQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: j0U56ViqNW0F-DxN5em1xvhJ1G06Ur3_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXz9KP0SuuHpyF
 3zP616GC1Uhx531GuXOWkoCdq5GBX7fY8bCPgZp8Ga13J5+RPCItQ3Rhmoz24tkHzAOsInNW8sD
 gBvpdbR2KiuXyq88gkXtF0I457ycRuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

From: Akash Kumar <akakum@qti.qualcomm.com>

Add compatible strings for the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers to the of_device_id match table, matching the
corresponding dt-bindings update.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 96d0557a862d..c560d4539302 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1556,6 +1556,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);

-- 
2.43.0

