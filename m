Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172036;
	b=Izu6UbfXfsyoPIwNX7jix9g4+NF5WsPWPn/NKaY+zu2IrAayG5GwFWNMOsYjaSY9xx1q
	 2/yNjbEnrQZ3i4sdpG8SQyJprsCKXwjYu+zRPgzIwi4yg1z2Vx6MvhwzL+lVkcwCATgPd
	 vBupcBuy6mUp0W0bZZJKq99wDDz0xjm1ePGEJ7afbM5DthtXaaK2RgTMZD2gfaBMROxAP
	 tjMTIue6/yCHU6rKgaZQRtx5AAAWfNG21j9KWCXriTjxshRgSc+yX/Mixll6uJR1lzyK6
	 rmqHWqwVPub+8acdC+hw6+bS0AOXA1MDvayRbViHRaGkrnKTqwjC+b1jglVmZBHhPhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=;
	b=2IoC9ohFtW2g4Go3QrS9kRLWUzYcLzrhwtVxG3EFiyWdxkNIqnuvbp9Ohs8l2zkRNOLU
	 eXD29DSQ2R2Mes82vNKUNbOer15ZYEpe3vc3wOzhS47Ha9OxaRgYERfKIbVVWBdMEpSg+
	 9so5GkTqKdMdrHDhvDSN723IWMriz30v4E+gGLQ2GyW6RzU2DJxM4PzMoLLe4oKyFcJi/
	 BDSs2Wum0IhZhEL3OrUD5l9sGdKFdTi/5ilcRkOBDVlmWtqbRNY12rj6zugZ5qrWW2BSv
	 eo42HjlPfbQ9sJ2n5oa80KscjyrLz0KtmFmeRbudsVpO3b9WVY1a9gUQp8VQOEv0k9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CDsVIVDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPA61kYa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B2B60A2608
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B2B60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CDsVIVDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPA61kYa
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxlG556459
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=; b=CDsVIVDcGFTjw6lW
	ojABQMtpyTtl++/qTE6KBz11hB1aULRK3VCrkAr54zBTvx7TBcnFsdK6Ev3DBGkf
	14+a+PY+Udz8M3a5gn+CqonKBwI0x8ABhZtzLt/BVxJzcDvblzT8IqCoM0ARCFYC
	zhWMT0lavKGQ9XQOKBnDqWRVO2hJ85KaRvx5xPlziPVSOtGKkn2/76sTJCDtyDtK
	mMzboLFqYupX1VkIQM/py2VOKTBy8a8OjxlK5IH9jQNauItI0uj01jQAwZQB2RKb
	rP8526ejDsb+J/1x904U1ljKsBXAcXUmSz5znBX0k9gRkNuJWcsSaSZ1gFSx/tst
	ObWQTg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhcg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:53:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so857246a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172034; x=1795776834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=;
        b=DPA61kYaVfyEoqv1S6dbCkJfBuZC6Es3cZGJF70wdVORN1MrvV0V8uPLQQJUf8cWWg
         1NLU+3auT8YIPHJCXcEyLpo3pZoPifiAJf6My2gyY6FBnOypRuxRwMXyohD5/sjh+tzG
         pbGdhD9fob6bEqxdomSWq+xKwugbeePJS8LeNQpETuX3pDz666gAMnEyXnfZT1qSRNPe
         UC4H+TM/owXTYDbN6axmjpzOW8V1v2bPvZ/cm7JP0+ZrAhLP5Uylic1wRnWTn3HpCZVI
         fX/V1GVAUtzp75WxfWwMGtPM/Hf3UcgfoOLlJ3gBgjEn2HWpQW69fPIRIr3xEeOIvevc
         ie1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172034; x=1795776834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AzCQrlehxDLRvYPoK3LFMcAPEAt34Ay7ZuowUvIExbM=;
        b=TF4Ew1NbZ3RihkeSBFE4EQfqi+CT0IGGjtYKTWyMobSHSuRe7Tk9wXLPL81O0OAHIB
         pe+xFpUqvrVcm3dc+xdFFPrTgmXP0IHZxPm+4RDI0jM4ZpQvrQi3AYAFjaYGpYkzPdpY
         0X0EheC4YoLLbBmSCxJPqo0E0OjteEQDhIvUOmOzmU0usY2KkoM94qv2Z0miSezXufXh
         QAyEvwic3Q9uaBimnItwyoS6QlGqx3X2kcCVShpAqXj5w85p7x6AuHt1CxQhim7I1kwH
         cWHe0r6RazAMicI24rB264MlLoAAMdKE11awD3J4RZUr+rL+Po3mlWOl9xj9iQE0Xvd/
         IyFw==
X-Forwarded-Encrypted: i=1; AL+hErGQSpwE7x0BbV5e857vZR2hz2D2QQg7p7S4OozAK0bG1zKM/mc4iH/Go9E1w/wKaGYrWX1DJlQREzoa9aM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4YzmhOAdge4XBu90Zv/UE1+NcjwC20Ves5a0//IIyb1M0MqQf
	QeetmzTTXqj1jUebAYDCEEnOr13QuNMW5Jli7cznU04YTwOivAszhV+PM0kHUQTpY5uhueoO6+M
	xLRJxGeM4HztMnt8ErJ2dAy58SVqQoM9gUFGkb2IbFobJC8WEsXfucyDb5DHHZ8Ynqok=
X-Gm-Gg: AZFdTZcb+qVUybgxiYIZCvc6s4gd2ziqLVdELnGTYMU6RXeNX74yVkTAPgEaEXjH45i
	iVMDZt5kSouodSBuRzp9jN8hkRs1DSZZS4S24UYBZDdwWeL7Buya6vsLUlaDVPysHFkmL3wdDGC
	rQzKjWKkRCkgQsL2OhWAN2b8smoXAW3OyBdR/CWOBekCFKHVJFIccCPOODfqAvKehvtaK8+kQH/
	oXVkvbOHsAjc1UaIGUaff9tMTRmJUbHUulFealBulEtTnN8DESPzhzKGL4J0dj4B/H5FY9aoDbL
	Y0Y9/gzDuVPQvmVYNkPkhzxUGXKs5XM+uUmRdU6evFJmby/d1Z6O+tLehtdDg8+p3yqFJNWr2po
	aOC5dIw9guuDGb2ob43pZmAe0QL4/yQvFjmZCIoLyU0qIjBu6O3zXzQpN+GtUQUyNL/Qgrv16Fx
	s3ii1dwRA=
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr2320780a91.23.1795172033843;
        Fri, 20 Nov 2026 02:53:53 -0800 (PST)
X-Received: by 2002:a17:90b:5287:b0:3b4:d22:8601 with SMTP id 98e67ed59e1d1-3b41c8fa9c8mr2320752a91.23.1795172033343;
        Fri, 20 Nov 2026 02:53:53 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22888esm1559604a91.3.2026.11.20.02.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:53:52 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:23:32 +0530
Subject: [PATCH v5 1/3] tee: qcomtee: Register qcom.tz.tpm service for
 discovery
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
Message-Id: <20261120-tpm_qcom_driver-v5-1-3d9321ace107@oss.qualcomm.com>
References: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
In-Reply-To: <20261120-tpm_qcom_driver-v5-0-3d9321ace107@oss.qualcomm.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX2uMEdw6e1JAc
 xkK3f2mn+WIp4DEXB6wCFnUFMBRp58TGlTDA+dYmgzyaFR7rSUBckapr8q8Aorvvfv1TwD3+lQl
 rSqga2R5BHbkkuepumUcIwInqLY2nMLccaArUedmYcpezZU270sFAcz8RcRXAYJVQ3khC4Ev/MI
 +QSq4lFUIoH4XN2yjTqFo0ndPzrCtvwBsGE5BHZCJqE/xHT9fiHysUPv4dvOctDl2X7rTbW/DeV
 v3KuZOT2jFMwG1/UWZYWH6EBWmfhXJY8jQ1RxakwTOr3QQaJasnTqugsvhD9ZehtARRwK+qjmhX
 xGj0loPFENIeFbwa7UnU+oRsuQB9Po6SekFUTuKyM0ofxNX4pSg9GeK6b4fi+DVFVpRZUw+jmnz
 jyOGP+g6SF/sFjTbyJcpBzeMkftWK8aTs6l1xhjF2Sesj/0F5XOgnED/jgRXVusx74gMK0mgFip
 UuYtdFTEQBTH6yPdbmw==
X-Proofpoint-GUID: ZRxOiRxjdNfVkrV1-6eQVDlkZ91-41k4
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0026c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cMdrFq0U01fV1n6vpx4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ZRxOiRxjdNfVkrV1-6eQVDlkZ91-41k4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXyOT25d9Kho27
 gA1gBosgpi1twYcoFCD8LyiiyNt3rhFnhro3/+BWmERpDODOI7LWFddqvGoqPacPKTLrUdMVsnA
 5O6/9IXoJplZf6w7YpeI2DBUA2Obd34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200043

Add "qcom.tz.tpm" (QCOMTEE_TPM_UID) to qtee_services[] so the TPM TA
is enumerated as a TEE-bus device, allowing a client driver to bind to
it via its generated UUID.

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 drivers/tee/qcomtee/call.c        | 4 +++-
 drivers/tee/qcomtee/qcomtee_msg.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index 96badaf98795..0c9fec95c9aa 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -747,7 +747,9 @@ static const uuid_t qtee_service_uuid_ns = UUID_INIT(0xe1b48857, 0x6154, 0x49f9,
 
 static const struct qtee_service qtee_services[] = {
 	{ "qcom.tz.uefisecapp",
-	   QCOMTEE_UEFI_SEC_UID }
+	   QCOMTEE_UEFI_SEC_UID },
+	{ "qcom.tz.tpm",
+	   QCOMTEE_TPM_UID }
 };
 
 static void qtee_release_service(struct device *dev)
diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcomtee_msg.h
index 9278a361dc70..9fff9dc5fffb 100644
--- a/drivers/tee/qcomtee/qcomtee_msg.h
+++ b/drivers/tee/qcomtee/qcomtee_msg.h
@@ -106,6 +106,8 @@ union qcomtee_msg_arg {
 #define QTEE_VERSION_GET_PATCH(x) ((x) >> 0 & 0xfffU)
 
 #define QCOMTEE_UEFI_SEC_UID            413
+#define QCOMTEE_TPM_UID			81
+
 /* Response types as returned from qcomtee_object_invoke_ctx_invoke(). */
 
 /* The message contains a callback request. */

-- 
2.34.1

