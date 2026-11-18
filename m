Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994931;
	b=e7Nkeyi1jUL1i543uLtFtKVRLJmpVW/iKfg0xIRkZye00/WNlcl7rHxLyGx8XuAwFibP
	 zIn6zNeVb9bx9YU8AIqS2ZQLVCdQzBzWJCWqmH7oO0Q4cqEOdLcf1lBDC3UGiiJcE/iXa
	 NmS9X/TU83LXvxpJEu1m3HImK5vMQ5EqWgw7KHvCcX8amWWHnMqfY2k/p9EjkPhFsLs/K
	 xCaCcCyy2UqGxWobIV2Zhb+XBPCr2ic+vIP1Jgs8QjaMuFvoalEKzyLnR04fKjeqLAk+D
	 reVnhf4+1jN+qyyjV+rJkz2SlQMif9dcH9YHCWXPlXPlF4pfVHie+JgzM6bXcWcHS/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994931;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9mXyjXS1jYcs46brM3RtvyTRB5vKkyq3un7iIWgKmVA=;
	b=OKNBVlrW/fjmyrmh5RF4h74o93qLGSd3kAae3jcaRmlpOYnQkhrcI0wcL0SgpVhyQ4EN
	 Fk7urZyf+nO/CUd3bsb9qvKJnczTr4HRsAkNW+x9WpL/zakrSkfiijpa03gp/dQ9gjorp
	 7nYm08bq3eLpNZPYZaibi2QVCxi6nLC60AELG9aWnQCUmGVf30q0n2I2V9ObsaLQ0f+p6
	 6U//2F/kkhAlhpNasCc0LfG3ncl1EOlss4MQYd+NZpXX0llWdXc/9EbTXZ7yqZvx0CNdA
	 4zRm4dRKdF1qbv9x0yHWBUWSSlXgsgkkKUEyHj9rL3uNFWt2o471sze49nGHGbvVs9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKy4h2jE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kJ/Gsxr2";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396CD606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aKy4h2jE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kJ/Gsxr2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8QgiW1959674
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9mXyjXS1jYcs46brM3RtvyTRB5vKkyq3un7iIWgKmVA=; b=aKy4h2jEikIYwEB+
	RIcvjdJAg7oVoW3BP3Xk44VDgqfBfmXlD8GKUIOqwj0Z/uy0ke7n1NX8e9b3QdGD
	Fe2EkwgYWAi5IZQ+/eS73NzaDiL8y0D0sQv+sjMsMSM5XLGmUmtEsCtgzpvPon/M
	feiesZBaoeOz9bpbO3z3AmcbKyJslV+myQPj0zHUALhJTHJbcfqqV7rkk9H2qMku
	UeFD48XqHYOLhWOG/IwL5bzdRe7CugOQGJKM6KRb3UKhd2MIiifqe1FbA/rHZrcC
	/hxEsakIaiOf+4tb1r/2GQdPh9CVIQDMmCLw4OHop+gzMUVNA6SVNXSCGwomY4bW
	SCsKxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jbf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:42:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f002ee475cso3693185ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994929; x=1795599729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mXyjXS1jYcs46brM3RtvyTRB5vKkyq3un7iIWgKmVA=;
        b=kJ/Gsxr226+ih6Sp4yZ4Gup3/w3/F6TLuAnyiwH1rLGIX37USSfpXbck9vi3sJlAT5
         Ly+Lohg7WZCVnte0GGjUONj3tAtaEyYU+hV70nIHUF8ei3Hyt5p6mtcCar2wEIC8M8Jx
         jlE0T7oPGJMj6ur0/KlG+O7hdY7EGYMaVfSWXa2uTkWc9Ln4oIQEnHOz+dEmfFt4qLtb
         js57BpwD24YsGIU/jVgGRg/rOHeSuZdqL9TquNgobkL6CZ/cvKzQliE+MTV3jStoSsdB
         YO3V0y9WNnGeZE8pXD/QVyj7HVEbyC9+r4j6rUYhNmjgRVqiaoqSQ9kG+VH5GpXkFsLX
         yOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994929; x=1795599729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mXyjXS1jYcs46brM3RtvyTRB5vKkyq3un7iIWgKmVA=;
        b=cXGppadLqLyoVn31AphdeYNoKYMeQj1NkkPQjiS21w2/LO58xLU7aqMNC0sT+O/UH1
         0XRqBSe2HNMjITl1OhBdIVCF7dXoG1u8AAkPhOaCTUKn96AIfPfvlMbTUhhPrZQ+MfPd
         CvwxhYC0L20hChM82yWYLA/94ts4jtlJrIT0EMD08c4bOqiQ1xFHPIa9rTS6QQHyX0th
         7ObPR0WbQori+iU6WIjyaTcc8F88ZwALbPgfGiB3LfSxpnWRJytdVZfgOz0Z83xjTfTE
         QNxsLaGQbppwuJp/PxW9DW21lG4Efmuq/GQZSRCM8defvs5titogTJdtyMLkEbYCZ4GQ
         ZSCw==
X-Forwarded-Encrypted: i=1; AL+hErG+4xbZjBgxdnxIw4g9Y7QTi+15S4edoaRqngI19e+3kJEOIE7CXROZIScLLhczLkJoIl1ChW9t9ss7dxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LhYsqzKxJ4Lm6vi83uNJamoWk5mxNKuwAh0kN4s9NgeXK1o2s
	jNRC3u4gzikNldwgMv6Z0g2yKblc9psu7Us8yyU0YXVQBLhFmdQ/eoF9htXPvexub/atDJRxV7x
	juurbodhAr2tZ5ZzDNQHxp9Wi6mJWN7B7DQ041Eq3fAkOC5b/8iloJbEWZYn7I+cvVMo=
X-Gm-Gg: AZFdTZemnBcXSDQOmS4l/q2BzVyXfm1VIr+UcfA5Q1JVvr4vBTmjNgcNObR8k29nypN
	wkaiLPMcuIC2OeILrEm+KEXqwmb+Ft6qXLvGPCJxQD5PewGV/qcvCnSWfrAyi6YWZ/42qtHCn21
	tIdxBGf3lJ6ApZcRy2Jafg9KZ5iYc2KglNb8gPRWCA6SfTXaD0uDcv1wdP698NUgwKpi6L3vKc5
	jjYZGagTCN9ke8flDB5fKg7LExCuzP0hsdDGzupE5ZVLLMC3QNIH20LxnhGtDzBcn6yevWcZRF7
	EparCYrMzVibnuWM2ZgAj7puXCDJxT2J2ws2yPwneBhCLD6jz6gIFrpUx+jMBT7EQFaUjjHyjTH
	5E4ey+e/6EolUSN48PEQY9QPqPXEMqctPeRUk8Ueb02HBHacTYS+eT9UYnWlQe0BmMmkntmNL+T
	f7amtUgzPIOaKfEM6bd5RdEP7tBt2/sIPerZsERD2zZYSgTnEM
X-Received: by 2002:a17:902:c401:b0:2ed:1b02:f6f2 with SMTP id d9443c01a7336-2eff720d319mr22885675ad.6.1794994928659;
        Wed, 18 Nov 2026 01:42:08 -0800 (PST)
X-Received: by 2002:a17:902:c401:b0:2ed:1b02:f6f2 with SMTP id d9443c01a7336-2eff720d319mr22885365ad.6.1794994928171;
        Wed, 18 Nov 2026 01:42:08 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:07 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:44 +0800
Subject: [PATCH v3 5/8] media: iris: add VPU5x internal buffer size
 calculations
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
Message-Id: <20261118-add_iris_for_hawi-v3-5-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=6922;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=1iTevg5lazYqflHK/fI3sxgAn12e7AjwLUtkMuuMM2U=;
 b=T4QqutOO8f/G9y362oYN5xF5avOvFQXaqR1bz7XxNptbmnHfg72odj5ln3q8NoK01wubL+b+Q
 tU4JRrE6vaxCNeHYmUpU/w7qj+evv9WuJx5WgevJEIJZ97eO0nvZZ8T
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd72f1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TQKVwlwO4xRIBFL53c4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: IRJ0KGJ3Hfcj73HVshhqenOhGXjW2Ndm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX9jn8GEk3s2Iq
 NbgLNqBNObHqNAlbidjgmV3vEw8JBp1Jh5vHrWNnxhVI4e+Uui7q30xVsbIY4KajUQcnMYrwqv1
 5qabY/yQcOpnFQASggLSMEU+uNLQ4AC0gzz/VwcxVE6hR9NOyiS2yT97pE0NcMdJB62dxulUYbr
 80BEHB+lt5oumYaREHuBZuF6FahsMZn7ngfVKRYViH9EKW+8yYLkbuJIQWc7i6VvGoo9H//4zH4
 CewngPb/k4yyXghkkRd6ehkFoVYCanJspYfFkECdWJGqmZRfpCJVcyLroBR9qNmTNP5S1OMoPyE
 SYS8yicPzbGqzrgQBSjOhoHstBuhLYDfgOjT76s2Elp8NH1Ia3nA+rQAb7OUrvcBm73ooXftNs/
 9O8oghTfuGK6wCmMfEYvB7NK2bIUe20oFHmsf5d+pvg4KKkYknKnMgb84nSM5KkIUPnkFeHwTpg
 nu9P6u6KxMwXeeTDnYA==
X-Proofpoint-GUID: IRJ0KGJ3Hfcj73HVshhqenOhGXjW2Ndm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxRo2Ak0kuHyw
 cVJLrtpCogKI5x+Vge09iBv8sk8AQCp871W3z/Zf/mS2id6rD2oqlQIwUzVeJp4uqtPVCbq0fXM
 NJbxQjIp1dAqd7WDPnrudFY+Ru8/ztQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

VPU5x firmware uses internal buffer formulas that differ from VPU4x. In
particular, the H.265 decoder persistent buffer needs space for SEI
unregistered userdata and three-dimensional userdata, and the encoder
calculations use a larger lambda LUT size.

Add a VPU5x buffer-size dispatcher and a VPU5x-specific H.265 persistent
buffer calculation while reusing the existing helpers for buffer types
whose formulas are unchanged.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 93 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.h |  4 +-
 2 files changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index f322dee4ec56c89d163deab068df98c1125724e4..c7143a66327513b60ec9a3991833bddbec8b94ea 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2248,6 +2248,54 @@ static u32 iris_vpu4x_dec_persist_size(struct iris_inst *inst)
 	return 0;
 }
 
+static u32 hfi_vpu5x_buffer_persist_h265d(bool rpu_enabled)
+{
+	u32 slist_buf = SIZE_SLIST_BUF_H265 * NUM_SLIST_BUF_H265;
+	u32 frame_info = H265_NUM_FRM_INFO * H265_DISPLAY_BUF_SIZE;
+	u32 tile_info = H265_NUM_TILE * sizeof(u32);
+	u32 per_pic = NUM_HW_PIC_BUF *
+		      (SIZE_SEI_USERDATA + SIZE_SEI_USERDATA_UNREGISTERED + SIZE_H265D_ARP +
+		      SIZE_THREE_DIMENSION_USERDATA);
+	u32 dolby_rpu = rpu_enabled * NUM_HW_PIC_BUF * SIZE_DOLBY_RPU_METADATA;
+
+	return ALIGN(slist_buf + frame_info + tile_info + per_pic + dolby_rpu, DMA_ALIGNMENT);
+}
+
+static u32 hfi_vpu5x_buffer_persist_av1d(u32 max_width, u32 max_height, u32 total_ref_count)
+{
+	u32 comv_size = hfi_buffer_comv_av1d(max_width, max_height, total_ref_count);
+	u32 seq_hdr = SIZE_AV1D_SEQUENCE_HEADER * 2 + SIZE_AV1D_METADATA;
+	u32 per_pic = AV1D_NUM_HW_PIC_BUF *
+		      (SIZE_AV1D_TILE_OFFSET + SIZE_AV1D_QM + SIZE_AV1D_ARP + SIZE_AV1D_METADATA);
+	u32 frame_hdr = AV1D_NUM_FRAME_HEADERS *
+			(SIZE_AV1D_FRAME_HEADER + 2 * SIZE_AV1D_PROB_TABLE);
+
+	return ALIGN(seq_hdr + per_pic + frame_hdr + comv_size + HDR10_HIST_EXTRADATA_SIZE,
+		     DMA_ALIGNMENT);
+}
+
+static u32 iris_vpu5x_dec_persist_size(struct iris_inst *inst)
+{
+	struct platform_inst_caps *caps;
+
+	if (inst->codec == V4L2_PIX_FMT_H264) {
+		return hfi_buffer_persist_h264d();
+	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
+		return hfi_vpu5x_buffer_persist_h265d(0);
+	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
+		return hfi_vpu4x_buffer_persist_vp9d();
+	} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+		caps = inst->core->iris_platform_data->inst_caps;
+		if (inst->fw_caps[DRAP].value)
+			return hfi_vpu5x_buffer_persist_av1d(caps->max_frame_width,
+			caps->max_frame_height, 16);
+		else
+			return hfi_vpu5x_buffer_persist_av1d(0, 0, 0);
+	}
+
+	return 0;
+}
+
 static u32 size_se_lb(u32 standard, u32 num_vpp_pipes_enc,
 		      u32 frame_width_coded, u32 frame_height_coded)
 {
@@ -2575,6 +2623,51 @@ u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_typ
 	return size;
 }
 
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
+{
+	const struct iris_vpu_buf_type_handle *buf_type_handle_arr = NULL;
+	u32 size = 0, buf_type_handle_size = 0, i;
+
+	static const struct iris_vpu_buf_type_handle dec_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_dec_bin_size         },
+		{BUF_COMV,        iris_vpu3x_4x_dec_comv_size   },
+		{BUF_NON_COMV,    iris_vpu_dec_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_dec_line_size      },
+		{BUF_PERSIST,     iris_vpu5x_dec_persist_size   },
+		{BUF_DPB,         iris_vpu_dec_dpb_size         },
+		{BUF_SCRATCH_1,   iris_vpu_dec_scratch1_size    },
+		{BUF_PARTIAL,     iris_vpu_dec_partial_size     },
+	};
+
+	static const struct iris_vpu_buf_type_handle enc_internal_buf_type_handle[] = {
+		{BUF_BIN,         iris_vpu_enc_bin_size         },
+		{BUF_COMV,        iris_vpu_enc_comv_size        },
+		{BUF_NON_COMV,    iris_vpu_enc_non_comv_size    },
+		{BUF_LINE,        iris_vpu4x_enc_line_size      },
+		{BUF_ARP,         iris_vpu_enc_arp_size         },
+		{BUF_VPSS,        iris_vpu_enc_vpss_size        },
+		{BUF_SCRATCH_1,   iris_vpu_enc_scratch1_size    },
+		{BUF_SCRATCH_2,   iris_vpu_enc_scratch2_size    },
+	};
+
+	if (inst->domain == DECODER) {
+		buf_type_handle_size = ARRAY_SIZE(dec_internal_buf_type_handle);
+		buf_type_handle_arr = dec_internal_buf_type_handle;
+	} else if (inst->domain == ENCODER) {
+		buf_type_handle_size = ARRAY_SIZE(enc_internal_buf_type_handle);
+		buf_type_handle_arr = enc_internal_buf_type_handle;
+	}
+
+	for (i = 0; i < buf_type_handle_size; i++) {
+		if (buf_type_handle_arr[i].type == buffer_type) {
+			size = buf_type_handle_arr[i].handle(inst);
+			break;
+		}
+	}
+
+	return size;
+}
+
 u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type)
 {
 	return inst->buffers[buffer_type].size;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
index 9a1011a91cb6da0e8e7c53425b88f7e7069c4c3b..de941baa990950d7191926c65ee5c859b5edb3ab 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.h
@@ -67,6 +67,7 @@ struct iris_inst;
 #define VP9_UDC_HEADER_BUF_SIZE	(3 * 128)
 
 #define SIZE_SEI_USERDATA			4096
+#define SIZE_SEI_USERDATA_UNREGISTERED		256
 #define SIZE_DOLBY_RPU_METADATA (41 * 1024)
 #define H264_CABAC_HDR_RATIO_HD_TOT	1
 #define H264_CABAC_RES_RATIO_HD_TOT	3
@@ -132,7 +133,7 @@ struct iris_inst;
 #define SIZE_SLICE_CMD_BUFFER (ALIGN(20480, 256))
 #define SIZE_SPS_PPS_SLICE_HDR (2048 + 4096)
 #define SIZE_BSE_SLICE_CMD_BUF ((((8192 << 2) + 7) & (~7)) * 3)
-#define SIZE_LAMBDA_LUT (256 * 11)
+#define SIZE_LAMBDA_LUT (256 * 13)
 
 #define HFI_COL_FMT_NV12C_Y_TILE_HEIGHT (8)
 #define HFI_COL_FMT_NV12C_Y_TILE_WIDTH (32)
@@ -325,6 +326,7 @@ static inline u32 size_av1d_qp(u32 frame_width, u32 frame_height)
 u32 iris_vpu_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu33_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu4x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
+u32 iris_vpu5x_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu_ar50lt_gen1_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 u32 iris_vpu_ar50lt_gen2_buf_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 int iris_vpu_buf_count(struct iris_inst *inst, enum iris_buffer_type buffer_type);

-- 
2.43.0

