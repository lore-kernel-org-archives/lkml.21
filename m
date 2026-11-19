Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088770;
	b=D4WPFW/EL5x7L4aqGfk0C7xZMzjKRE67ersMDhdLvTBN3/6k9YgrC/JjLJ5zT1m+xwN3
	 A/ZrzYkyGvfO+DfXwxNPlighByFWmDGvm3r9F43hXNXvvqp3vIwCfP7Rd7V3+a4FjPekf
	 mMop+v0n0bDqgJRiGtqeNB27tKwzc3y9OpKRGEHzFEGu+hzcNM+PLMQtbBcNPY/TQ/q+D
	 hnQIhprxOPsMiX0FYlEqz3tOWJfwNwEq+KZHVXwbU6KkVDSrbiGUCe99XVd5X9a+GlJ4E
	 alll186oSlMUuo5uG789zF1XYEppFoxO4JHe+AjumSvmSNh9JR7Q4qGTUlMxU/zTdSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
	b=xeIp4v9Ffa3NkxSC1UkqNyA5/vCos5Do3rh9e3Ga1exlC5hyWJ00QIedyCgm2SujOgu1
	 BiCiz6f1slahtJtkUGR/0gama6A9L/ZpZIWnEn7EW041EtZ8XY5ey3EIGgPcoKebzctxi
	 THLNxQUeq9Jth+ozL6/iBR4anTo4J6eN4+igQCF9+Kab8xTqyoHjDbhvwu7i6kaS4Rx0i
	 FskvsghaAbLuf5sjT78WYpW93dElGLbblKuw16e9pjiSczxbM7sQ3bXsvoobXxgfAX1Na
	 w5NuavNDTKt1Bv9zifKUV3PAjtHZrd2U66G10//I3qUF5tLNJNBHXElTT8fhcjQMNiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk2Wfyjq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI2l5OzQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF2B606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACF2B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qk2Wfyjq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AI2l5OzQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjxIE3583622
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=; b=Qk2WfyjqOsdNzhvy
	JUjGzXrMV4EL89CcRva/75hT2gBy53M94wYUM7rHhZ3eBrgjmQlQr5BwtkwIlSbI
	z/JAcVGZNQgWTe4ZRg3hbXsrBhLWzAxaXRTXnESpvAQXeq7sfe+J5pQLMu+90hRh
	j9ok5yYH2OWHaOC8FGp37wo4CWmcNT01v73BCKXbOYniQbcPW/W3yMigODeUitf5
	yOLOFZgI8BscbVg1iNsdomdMihqi/zF7j+4tB9uUJ66RCamn4F/LaL3tdaKSQTFO
	YFCWKV74TgAxgV8KATWll+H1myxvX9GUd814A9THrPhC94j5uOBN1PN+SpA8eI76
	Q7rH8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymgcr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b40e7f4fa2so388539a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088768; x=1795693568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=AI2l5OzQsmStehqqf7FovbWLHt1lGdjFm1vkzqJRJdhh6uFcElkdkCoZq4V29CqPXG
         hw/HTmdx/WZVcqr95jI3nFjigjbZvEwYxVjUHUIrzgYdhYCaxjy4oiad5PaLYn6wd+Ud
         ZDahYoCBuu797nXhZw0GqO6c5jgAE9YYOzpJH9XO38Bw3fAh3H6xMedpC+hD6qnIRbi/
         Xio7YWZc5yrSoW6lLK/kmt+RLtf4KMY5WVIxvLgTyOuziAckFhFihn2Ja/34KerIg9ux
         O5XElY6Az9p7SZLJ7Lq+i/eb0QsmFz2JU07ucXumWL0MUp6V8zBs7Xy9ehS3EUCShC87
         GLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088768; x=1795693568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJi2Dix00w5C88YTCv3ugKsyJiJdnkq9AkYH94vYW1g=;
        b=eK/lvhgjDYfb6e8jbyeIp3KLsomfwEY2Rdz4ZBsiE9yoO176Pg/2NhZF6BXw9lz9tK
         hFkLWEuUl1pke2UG9+skFZu6N553ud6NUb2s0FpxWw2m3OqVHcO6B7Cr3ZkjG3T4nvbE
         3bSkOcsWq+tm+EYoVjSH90ZvLXx1K9v6off4U3+aO+qK7UOsZnZ62PsiNAEeiLdPYKf8
         Nki26U1W/u+EDcV+kQ3RkVaw5KmAbAT0QAGabOoHhXzPLvKfWoSNDJOmm/VB0InNT6AI
         pC/lcTAnohzltTruyHIEyHkJQ1jA/dalxIpUPhwuy6VKcBJPmNsnqtcH8lk+wX0NfxDp
         dSJg==
X-Forwarded-Encrypted: i=1; AL+hErFPdfXTvg1xSRyRanWUD/9ae/NwP8nA09kSDK8f3D3VzNVLfjRCMsLD+lgMfjK/87DUeT2ue4CWslI120k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AYhVwLlxVOSJ6UXI4r8dQrSOagLL5Gyidc4uWeaJDBgjypANW
	N87cW2UvMfDmq8uoX831vMM+lLyzpaAkc9ULGjXuf498z7o2EYm26u06Rn4Kq9FvLTg6Syt0mZ8
	GIBjvqgLRrmZD42OgOLKncpprdSBqbGY+6WWr9KhOO3mBvdzq0kLuV2NzbYh6ayoZzgY=
X-Gm-Gg: AZFdTZcaG+63rFQIHChpqlylGJEV+XUmAfvXM0H/z6sFHeWokb5kNIDbgWC5iLeJ8px
	c/h388U5uBC00Vmm3ttYSz3chjAcnrKbsyDIZ+H2/xDLbiQwLf2kngsVT/WBYTCvo7R+cEXBJlF
	4tUJ2JTH6Vbyulk4ucSiFWIGm02EU/J7ZwD1qEGdIqZqV7q5RSuwEhjHsL9YFffX2TemOoC11pa
	poPRoLIzYcMu5ZL38l81gK0aDZvnFpJhg7DJUKXVm4GmFNda7bcJUXm2jiNgyULmJvcXTaeeogp
	u3ZMRQWR7QSFObn0NxVaVwgvoUMP/BO0WCw6pgkmO6PGBqkTwr5xr/8oXbjdsUAqU4UE+8sRVCC
	ehke1QqHB9O0YpMt16rxPV1G67pGz7vMJsb6rgCvD1UnTaA1j8DhDWcKJnSzxIad/FMYN63Q2Z7
	LNJ28fZTM=
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1235309a91.55.1795088768174;
        Thu, 19 Nov 2026 03:46:08 -0800 (PST)
X-Received: by 2002:a17:90b:39ab:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b4062542fcmr1235274a91.55.1795088767648;
        Thu, 19 Nov 2026 03:46:07 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:07 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:31 +0530
Subject: [PATCH v3 2/4] media: iris: Disable the system error work on
 removal
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
Message-Id: <20261119-iris-handle-unbind-v3-2-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=1393;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=mTtJUAW16Pa3NLyR5lT7gqKE4xsReqod6ALEVe9NOI8=;
 b=qzfbVbNGl926ns1jwU1eo1xUOzOesUEsM7o+cod4M4Q0qd3oUHRbO/obYdGhiGQv54XoopBD5
 5zc28B1tTIyDRgxNQSjQm8M9t1GmHC4teno/zUH2Gr7apB5AWqmwdpZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX+8hEO9zr6kHE
 /nLyhFhmoVHrr5YXdeiPYwkaB48sFCeEzFXqhRAwSTc3glF3jwyz04eaztYmlOoT2DX8RaSvnmw
 c7Jl6qsTQQOUiNLGIcWGSmVMCGjd7/0=
X-Proofpoint-GUID: m7xmeMHCqLHriZ8PlErZ2xwpQaBhtWY3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXzKEfAaDXwzoC
 U4agh1uemYv+ReuiX9UvoGHkjA4hJcaOzzYECqnwwvnkIPGBlMo5k9Skxf9mHNrflEHbl6jLZNy
 ogtdkFURBAZekY+UpJlOkejl8DUpXgXX2xzOcKCH1ob/skPyv/MAJdvbwWoumarmsXDYkyDNf9O
 ZqKa81YfitB9VfcLNMGrY+yd9SSeD/FPhGGIFdEyHvMd/LlL+S5xMt+NTFDHb78PeuMTpokwNgc
 HuXwN96Dvpmyd1o7+tzpK5RrcwER4Fr03HwkZzAbS7TFcLrXMFI5DrsIqhDtMAFBXNqccl4N61p
 34R3VoctDjuELFHRoVMwyiRiT1X7ps+EXmWPIh1F0FmTy90PBDefwjUhkPjfVBsLY4+03sZ+TOe
 5JyBwdCmF6WfC1PVv81A7RXfhz94wL1LQdf9ecT8y3C0d0dzCjfl92+IOLY48MsHASTqpfoq9Lw
 nVf03EiwAe7xW/UsgQw==
X-Proofpoint-ORIG-GUID: m7xmeMHCqLHriZ8PlErZ2xwpQaBhtWY3
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6afee181 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bZa8m19-NPAJ73ByzVcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

iris_remove() calls cancel_delayed_work_sync() to stop the system error
work. This cancels a pending work and waits for a running one. It does
not stop the work from being queued again afterwards.

A system error interrupt can still arrive after that call. The
interrupt handler queues the work again. The work then runs after the
removal and uses resources that are already freed.

Use disable_delayed_work_sync() instead. Once it returns no new work
can be queued. The work cannot run again during or after the removal.

Fixes: 452480931648 ("media: iris: cancel sys error work on driver removal")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 343e44c6b9c4..6f02bb629867 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,7 +251,7 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
-	cancel_delayed_work_sync(&core->sys_error_handler);
+	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 

-- 
2.34.1

