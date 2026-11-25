Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585277;
	b=J7YftKoLUaxArPzo9MwCHEXe7vn0nTUBgKtUYKcn3c5FdfWKH0Ava+ECby7qR3fcPP06
	 df5Dyo8LLClPSrIcSc4lxnK4Fp1OqTl7LAYV8EqDmYZSqnkmx31yw+waqxL+RiO8S5/f2
	 t4JyO4FznxhpGVJpVHI8pDAULmNLp01lrmfAVEvhFAtSK0FlIRs0Ygs0WsrtOOgzQj8F5
	 qux87QakfU5D6ERW4ELkVO8rkKpLi/cnhqx2CAGwJ4yGk8VtxdCbQlIt4rXn3SmCXn1hY
	 2BCzRll+4e5ktR8MRZdZc/SGSMr1Tgs73gBl/CUFAJWpZJ5dEPv4WYxhN47etzM/ZuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=;
	b=mcti2nn/jh3koxINiJDXkWF9fremMPgRdODr6Z15wXna3fH4smLIhtWOTrQgLf7dBegJ
	 mTnV2E6nMd/p5vwGdFA3WhnH1BnHt06C73sRBJdMFXExdd7mZ2c3S7YNEtwZbFkXw/Bzl
	 TUmSbOtxFVCp33Mgm6jlah+NP7fu84rBJb9pHaZX/ki8M0PQD5mdsdEaMYq5HRWvKFKEK
	 AGuY+ZD6GEk5eRcR9A+lXNPYZfQ01FM4IqI8h9n3L6A3KbhrC17+VEYtr2JZXvsDlBbx1
	 kD62VUywoPj6bkV4OPChYwP3TnLnLguWCBqYF4WyQSk5dXc4Lba8JhvYRKftVLMiR4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AusBAkfM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCBoDKKl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E681A606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E681A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AusBAkfM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LCBoDKKl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B34v1096864
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=; b=AusBAkfMHl1r+Pey
	GwvG4cf7cTlD4JHKr+tNZoG6HHX9yxfzpFOuCDkuNM8T+LVM2t5BQ1dDgWmAQMIB
	i1ISQEv60vTzZ0MgncFv9DhcH0/XJz9zp+nIpbZD6lo+RtMyItC7ndbujQyxO6Nb
	0nAyqAs04AdHuxR7TU5C6GmFj2CBU1gIbzF1APyQGZNGTu09J+8wDhOGP41xC8zD
	B04HJm4GPxVQGJUsFdiuQLpIrvwoQ0dbaan8nwZvO9EqM/8tdjYaWDgT54cjDFLG
	qSB8Ou7ZeJt83UQ1SuKsNzvhiy3Ft2O0CXr7ZMOwLF3/OHsLgb5+p6mmRb9mKKsx
	ECqwFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efftmmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b41b099809so4719901a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585275; x=1796190075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=;
        b=LCBoDKKlEpPLxttzRJD9cG3vu0X6hWaSXLwIX6w308XLhYIo05T3bvUK86bIWge3aJ
         8DQRfLprRpi/QQqO1NuBnUR1Tgus/e7JNeCmVy09HFCRRfNtIB0Tu5K9vv+7nOuhdITe
         HjPsfN4blPOzSAQhd9qlMZSGcZsty4fJMomuzAhUxPhHmdcwK2hD/SXbszVi1SmRpfHv
         IUklut4bhPQodq/sb7moEin4ygtuGrxbaE0UHswhtXeQOyZTkrjS1WUp2yOskaOd/8i3
         KRVomLymggbl6jn4rMBqlLdUhpB88yglQ81XUyLQQMe23S7mj3pjN5On29VyZ/Q6U2Cb
         j06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585275; x=1796190075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pM1+ScPXqw2BSd7iFdjCVQ4DP95QrCl2A1gDu8xmMU=;
        b=HqtWyI4K9llxyZ6SyF7tCLXeH8cDEy6PbC9EXqcU2mDlRlceDsElB8nIJiW73UkGir
         uyqYOpRcsRMF3wRPGZuGgpgxdZkSy0lgSzq+jeaDRsb0MsF6XLc0KW+9lL7a+D45TY4V
         ifDY8oGg2kHMV8g+TZ3JT+Zpalkx4xzUKM/iJKy/tiw+oGtmhVI8dphda0zfE5w3Zyyl
         7fVPFp95nEpB/Rn7t2B3Z2/NSuqUXiLocjU7/K5kfCVm9WLytpwfx03yDKg3Fg/owWI6
         ofj0zxpNTIMKLGJ/3he9j660vrHVtf1ISiDKJ0yKciQIr8sKbbA44cFmrl9uQI+CONPi
         IUCQ==
X-Forwarded-Encrypted: i=1; AL+hErEgpyQEllI06J80EWjUzLNFKNpdyQdeCSDTRiYlAomaIpCaWDen2j0UhtkKiu28ZYWIo7P5pVkDKiNn6DY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c3v6m1kyR/jwK64ZTw3n732loZI57M/hSqCUaYk5wXBECF3h3
	GmFXgsHyvKvBJa0g2U5m7vuu6FbDQQcZ9jZ8gENFBaZNoOhMX4wEx4zruAyppcvhxzWzMDd0jb+
	C9+/NtTmwuGrtBJBi56ui+K/LmbWSOHVdOGj3snYPKprICFW2dbEtR8vjf7AQD2nFDDQ=
X-Gm-Gg: AZFdTZf4WY5epfQDaFujMN3uTNxkFCd1A9YffBZUwjlx1WwlTj8cTUOIq1HaVIEsG6B
	+/FAuKUzkQfWx2ol0e2PpoeH/6HvG5USyztGw2r55LWuns2JxII4Idt2VNP5gH+LV6FVBSffrdT
	i8fINzx678kwDGhdyLGoPhVFwz0Jp4E7ZwrFuoLmhPaLtIKgUP+1DqcxTXUFF6S0/iJZrO8TTs8
	itxlI/dSPscmdoWnqB6mi+S6o5gOCPRazxP0WU1wzUCm5qupUBX7jK4hEJOYeGgOElSbPFQadvc
	uMW368Mh6Mz8Z7bd++ea664B1nNcKOwZukg7TJ38HILEn2+Pf79/tCFh0zCwVgwSnl2fA9lUbJP
	598zM+uDGCCKnClaQDcR7OfEiJ+AojvsLiPiX7McBcUjI5SrIOhzdHECwMWa8IOlA/BrI2nvv5m
	Y76nGea8A=
X-Received: by 2002:a17:90b:2416:b0:3b4:c66c:ba01 with SMTP id 98e67ed59e1d1-3b4c66ce8f8mr3546450a91.50.1795585275004;
        Tue, 24 Nov 2026 21:41:15 -0800 (PST)
X-Received: by 2002:a17:90b:2416:b0:3b4:c66c:ba01 with SMTP id 98e67ed59e1d1-3b4c66ce8f8mr3546438a91.50.1795585274577;
        Tue, 24 Nov 2026 21:41:14 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:41:14 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:10:25 +0530
Subject: [PATCH v3 3/3] media: iris: Use firmware reported count for output
 buffers
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
Message-Id: <20261125-fix_dec_seek-v3-3-66c9889def2a@oss.qualcomm.com>
References: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
In-Reply-To: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=1538;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=xyePRasdnpLsafhfZYAx9HOTRZfG/52xPinQP+y2ocQ=;
 b=iPakmyqAO5AduAaevjMNoFxhFbaFX7qUHZiYjhXidrOhyWzhIML7MtHw5cow5op0EaQK5rDOq
 7k4/USEpMHCDHAL/vKyO9BYDcEvGq4Wus3UhmjPlsGulp9LfqqF0bZS
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b0674fc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ngQ_FiyG7nPeVDEeuhEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXwpW4YNFdYHwE
 MN8Ont3mnmtG6ySLL8MeMLEdzsaaL87H1IMV0wdZwcsJE22syfyYa9dIYtntLo7pqG9BpfigYpM
 AntYdajS5+hpYOSAzjjwqw5TGmlWE05u6ZW2vBph3F4SnzHLGC7e/OIgG8WZtqkWzCOdA4yHgN8
 AebsyZVUjHj0IswwGRcjry3EXx3LBQ/cbwxPZv4Yqae0e6xPgl4ZWLBtq4Sr6Jqvw0Nm18MtEL3
 AB83QHQSHlyzWx8LnxO0DyULcBt8/HQIZMWlCmQSylN/mjXHBlqzA41iNB+lC8H/cnIWEaz3ppH
 S2gwGYGEp4VAMxRAAohTeRMgZmOEf1BVqEqfjaLb63Vn2swEIRG88cfZQSWxRDpzhJBgiD4jj0A
 baxwX2u++z6fe2Vx9hdAjkCKf4rxI2q0c2ng4jg+40ecLSMqXE/k5BzIeuUVgjyZfRq41FvRDPR
 i2jcCJ7N3Kmj0ssn2Vg==
X-Proofpoint-GUID: Pv_FrGgVx5EShoaztkmYhhmXje2tHPmz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX8ByAXwmItMFp
 pOTyvq25Q7B/QQoLw3j4HgHg8YKNeAC88ByOT8GgVWT7Peucs7w35eWy+9PDuWaIHfR87wLxo24
 ud6nCOw7vT2htagIkO6xVF2uqOkQSC8=
X-Proofpoint-ORIG-GUID: Pv_FrGgVx5EShoaztkmYhhmXje2tHPmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022

Once the firmware reports its minimum output buffer count, the driver
still caps it to 4 for VP9 and AV1. After a seek, the output buffer
count can be lower than the minimum required by the firmware for VP9
streams. This causes the firmware to report insufficient output buffers
and the seek operation can fail. Use the firmware reported minimum count
without capping it.

Fixes: e1f5d32608ec ("media: iris: Add internal buffer calculation for HEVC and VP9 decoders")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index a8170e5fa9e6..57467c952f42 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2375,14 +2375,8 @@ static int output_min_count(struct iris_inst *inst)
 	int output_min_count = 4;
 
 	/* fw_min_count > 0 indicates reconfig event has already arrived */
-	if (inst->fw_min_count) {
-		if (iris_split_mode_enabled(inst) &&
-		    (inst->codec == V4L2_PIX_FMT_VP9 ||
-		     inst->codec == V4L2_PIX_FMT_AV1))
-			return min_t(u32, 4, inst->fw_min_count);
-		else
-			return inst->fw_min_count;
-	}
+	if (inst->fw_min_count)
+		return inst->fw_min_count;
 
 	if (inst->codec == V4L2_PIX_FMT_VP9)
 		output_min_count = 9;

-- 
2.34.1

