Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585268;
	b=t0lbCd8oV2Xr59edWUBLI8j2khnHEsBe8hYMOkDA5daP0vslyUj5az7+YNfJTA9Tokle
	 wMPEwZUYLcvz7D8SNOVizFrAdrm1KWnWxrT+uFSD+1Ek7MigY0YhQe/rE+WtPqkLfbbEc
	 h9cwputYPBuebNo/Rx4AHi/MMdhXwohbR9xHpT9jeHqoABGYgSmkLjRftULWE3SA8BW94
	 IN/+Tw9S0rk+nvMyfC8VX3ph/f3fBkUilts80Is6zZ158u1+x6XL3ZaWBJoDUtuSXLMqw
	 f1k19UF9gloz+PY9WmhkmD8i3lLfbx4EkM2/darUmLg75dcIH+i8gjqtcShrahKj/FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=;
	b=D9WL3HinX9GuHZXCidBJpVr/oHhke+FyygDIWnocuKxHF6AOFBA/DSwDUQwJ49OLjcNe
	 82FBc1exKsIS8CkFVJqIwCq4ijEPRQ5We4Z8uhwnGeN5wmzi6/DokJTspK0b8G5vZKxXf
	 JHOXlKR9PcVuBzym6uDVpgyqnPzwSq6TArOvn6wdQcR+Zic3Som4myYYgp17CJq4/uGrJ
	 XDwKm606U4/ExtWP/xBWzm8WR1crCh0EFN0wAIoKLx76EzdlEpm546UNbcGmWG8QkyOXF
	 w4P64S6gl21Jwt1QsAmKIn6nuFyIF6nOvBPn8IxFQUcrTXHK7XU1d8LQktG1sjF3G8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg4Wu+oM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/4Rn6+B";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBDF606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCBDF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dg4Wu+oM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/4Rn6+B
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BL8c2741937
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=; b=Dg4Wu+oM8DDozcut
	Wbt6+cx5bw+Lol7rvkP8MKVII+Hfb/eQ9rRXm1nTKF9EHdJESskdnDCR4Gv2dPal
	vpqLMU20u39AoTTRCw084x2P0xhHx1bKCFL5eFupIUOC50Fdv9EaID6aXkNBWJPI
	VpfV6hbzn8MrxOgJb6iNB0jmBFQKSC93Ue5gS5H0zlyMs3IwyrkeNlUCl2Fik/j1
	UB1QtrIh/0nbgPxBbozL5fZdhSZFgcS8W7IqjRM3ieItP95Z7Gwb40jJCdM78JC1
	E+FjUZEkqlB2qz5qHyuzqXXhyGA6OtSKTjW1BMJuJ7fSvpxfMOvni50WCSeUwg4Z
	vdhDHA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsahch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so4329988a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585265; x=1796190065; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=;
        b=A/4Rn6+BksppQG50CyP4+NLIMZaMftMf5HlUjB2Zg+t3GyYHjJqhuKn8HuXIs3m1sB
         tb/els/jOOeVh+DkpYn52ItEzms+/fXw4nGk/4iZLMfQit7gG3sB3aKBzlKNpyybM1Ds
         0eZWDU3zRqUz2jBEQ6wzsBbvKxeCZructF2RFzycoYAM+tEKUWFjWjinnSFUY+z01MRK
         GjTbxfvwSODy8iCLWtwFo0AZLxHnubPZUitKf1d3+xR8XD0GgtGx/xAxqO7C74RJ7i5q
         w1e1re0PQB9514xSpfVtYlAdxF2CIiH46Tn8/0jRRn0pUAXdJ3Bobr07deAznU8wPCTL
         3rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585265; x=1796190065;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R8SgQ6hwW9qOw09sW8J5tLP1YofqQz2au4lfK+740o4=;
        b=peK/+ny+LWYacRBjJFNj1zVz8feVsaPk0p4BHYwzAM1C+lPxBXNUrkud04Qe8xBUnZ
         ZRxPXGje+1gUqAJ5tclJ7CydZtMku9Y1F/EDLwppA4wz2QuR/7BT32B1zXZQ6hbUj/Hw
         /5Zl4m3VVQullcqZ4WsNHpUkeW7ACeuvGsBAeznEUD9gJpPcSrEWwvTWifhH4tRHxAfc
         PdR7c7Idvq0pof07wFR98bObGB1YCZTuLRO5hkabDd+5ow8qlQCLo6obdreAMafh/dR3
         R4g+zcB/HYP07PZ1Yo/5vwVrDkO2mnzZBGCFDfdAIWJTLOSuN1C13Ga5zN12nNfAjvf3
         6T+g==
X-Forwarded-Encrypted: i=1; AL+hErH+JBd+g3+xlPAt3ZiLTr+iDP8AOaSushKdbzdkR2fORpoyo6O2aACTwft0aW34k6iAEqOcAC1V3rRF6iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TV+yUnWsDQar3UG/ttHIFNYBnVbWG1f0tLD3cunU+eJPoH9jp
	+UASCoGRbJ8/mZeobTg2wH7/g6p8rTvXZucVo8SFk05uAg7LD2BffucHptDrkxtIjk+d3IesSEK
	hhGUNmYnNmwMQbZ31tbPG32lOvSSOXrc2cyaF3GjG8/71znJPYtD5B0fEiAk5UnBx29o=
X-Gm-Gg: AZFdTZdoHWsHXJuUSlmjh6NkELM7VRgVKlVS75PaDkh9ZhzKymYukBfzBV3V2YpnhGT
	oR8uUF4tIYxDUd2tzs0CgtISxMIbh/Shv1jFR7T4bUEcW2zd0SW4rs0jFtFPRwtUICXG958OtzE
	ZFUvXoiqbq+HrNee76tKG0o5i9w7nGS18DPkVLdDMIuPg5yHapdlB7YXBcAXe4oSgSHbhFoIBBX
	E6wUpVIrUevkyES+Hu07RtW2XO2UFVj2BhvO2I85b+eBXkzQ+4q9uXQzTBmCCfLfUq9HeU+O4V9
	GnmsWRtUHuH3tMALh5D4jFq5oN7gKv9jVxgwUddHrrdoBGYi0Xgd4NHp5CyTyJQGTlpYqLBtXx/
	rQS4cVGAQRd9ezVSOwl4HxHfEtXej62h3wljMr6rk0UNKLrwPIVECfsCyEQ+xTj3OYDwwC+l3NY
	Kr6dUI8+U=
X-Received: by 2002:a17:90b:2e4b:b0:3b4:e3e:647 with SMTP id 98e67ed59e1d1-3b41c55f771mr15874079a91.0.1795585264732;
        Tue, 24 Nov 2026 21:41:04 -0800 (PST)
X-Received: by 2002:a17:90b:2e4b:b0:3b4:e3e:647 with SMTP id 98e67ed59e1d1-3b41c55f771mr15874061a91.0.1795585264213;
        Tue, 24 Nov 2026 21:41:04 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:41:03 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:10:23 +0530
Subject: [PATCH v3 1/3] media: iris: Skip redundant decoder input config
 params
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
Message-Id: <20261125-fix_dec_seek-v3-1-66c9889def2a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=2753;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=HbJHii63vZuPsEL3D0WK9kORlLRtexqycHmObvJrerc=;
 b=VmTJ0C+QAsT40DxE6OqPP3TqMkhaaZQc4pYwL+tyLtGZX/Iw8wRFWnHMSseFNfK6bx7fuO9Ve
 dMGRdffwoYcCJREIirXL2Kq6MJfNTdBxi5uhhFDFGzqWR8EYQIiS3U7
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXwwVLW682PwdQ
 tIjy8Jfu3eR8G2Kuc3zBtLhWsz03dDcZlFQlF1AUkqlSnwznJdK2KypbVwO+EAImFPNijFjxTHy
 RF4fV6QhOqau3LZIPEDogtNoTRfRbS/8CROpPT2rzu+E10SWmIPnI1+cfH0gnW7j3lYzrFJpiQ4
 ddYo/HCkjfp4HlPH6AJkxP6Dhi05IhXgtw5Wj+H2cLnYRmqsCOQpznJUZYEhp5wzbGvs7N2LhgO
 QuC/CRTzfqdRhiHCqDjZmt+2wTqbNliz+qS8eNDORPTaPxHT0u69fk7/CwNe4FHgmYsxd77icwu
 NhFoXV4mvtPpXGeE5nQ0oRcVYdjWNs8nZ95FfKvJ9gg7f+xEE2SsyoW74c3u3myGK9E3y37n0u1
 uW06qeiVcd7wkvYoyF/0BcaQYFj2KIZksD6AfG3gBR1pg4c/eVOFpXJ4LJJeiD2GZAWfDPjZ5sN
 5lu/VSFCZJCAiWiZt+A==
X-Proofpoint-GUID: qBsGlzbiaj9OpQJMeyAIw6aIRLzdB0nG
X-Proofpoint-ORIG-GUID: qBsGlzbiaj9OpQJMeyAIw6aIRLzdB0nG
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0674f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cPfzbt1C_6B9HWAkqhEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXwsFv1EfYbdc/
 jo/uvdkX3tZUFgUFnuw/cuNkcq2mbN51ftjwqumqsG8ggRtXn3EVAfusoUtHbOvHBOVn3wEwXKb
 5/5qos/QEZUQT4ilG29oFGlVZVc42AY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250022

When a decoder session starts, the driver sends the input configuration
to the firmware on streamon of the output plane. This includes the
aligned frame size and the default property settings. The firmware
parses the frames and raises an input port settings change (IPSC) event
if the stream properties differ from the programmed values. The capture
port is not started at this stage. The driver forwards the event to the
client as V4L2_EVENT_SOURCE_CHANGE. When the client then streams on the
capture port, the driver resumes the input port, starts the capture port
and decoding begins.

On a seek, the client stops and restarts the output plane. The driver
sends the same aligned input configuration and the other input
properties again on the same session, and the firmware raises another
IPSC event. No PSC last flag is sent after this, as the stream
properties are the same as the ones already running. The client keeps
waiting for the last flag and hangs.

As per the firmware, the input configuration parameters must be set only
once per session, and not on every stop and start of the input port. Skip
sending the decoder input configuration once the input port properties
have been programmed, reusing the existing ipsc_properties_set state.

Fixes: 025398e9121c ("media: iris: subscribe parameters and properties to firmware for hfi_gen2")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b..fac61ece177e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -668,6 +668,7 @@ static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_firmware_data *fdata = inst->core->iris_firmware_data;
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	u32 config_params_size = 0, i, j;
 	const u32 *config_params = NULL;
 	int ret;
@@ -693,6 +694,10 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
 	};
 
+	if (inst->domain == DECODER && V4L2_TYPE_IS_OUTPUT(plane) &&
+	    inst_hfi_gen2->ipsc_properties_set)
+		return 0;
+
 	if (inst->domain == DECODER) {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
 			if (inst->codec == V4L2_PIX_FMT_H264) {

-- 
2.34.1

