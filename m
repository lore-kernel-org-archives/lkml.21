Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810550;
	b=UJhuu5WNLjgoDxfMYzdYF7u+8SR6raBzobV6rlg9hy9PDExTKfJJz/4fquzwgNZt4+od
	 gsCzLPfO3XZNFjMH4Tu0iyF1LNsW3X5+90teOaXLsHktryheey991v+chFxuS8wjG7xST
	 OQUWQHbig3SHZkOuZWNmAc13OIkOvqgthuo5J0LGlYFF4+mhpy5W0pCeb0ZlD6ufBqOZ7
	 qhmaHFNFWf9WjGnlbEa/ZVKZgVkV86p/YCmcoqaWGUhChHIA8kbi7Hdxq20cWRbSC3Fb/
	 /PZVydr55kqcGhBtYgJuu8zgoWknpMAseex31i5QGcYn7OBozFBZVxhnTNIEcIgE3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=;
	b=JR/f+yW2rh0UEy1okbQWBtA0HN+Iq70eRbYUD+4PoKInEVV9b1LwAQ6/7QI/1pQ2HZD+
	 M14H/ut3Ja392/P7DgW/nPjOJ2CVTGyU7QLeKQKojEK46McXdFsnVzZR+ZRcQPLTFuIXb
	 MqKWuxff7sgD3b6Tl2qymLYsbwb0fV/W2qw5tVq/px0j031rytGpJYZ2tpgdv1EkPNaJk
	 MUX6RLdHhWXAAUAO8QyKpjdemgMe/BYVHe1TdG44mmhPw09Pd0RlWjJsu6nzGzEdWvCEo
	 i+FkpqA6JhutWWtIwZ+bGRi0xGG8HKbbvQDS1/ZKxEa+sHRGlrpBxwTZ7V52pcgQC+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hd0zUjHF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnCBFtQF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF0B606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF0B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hd0zUjHF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TnCBFtQF
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRjgO1381751
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=; b=Hd0zUjHFc90UyaV9
	FvI74kpFZEacBrMJduuxJA7JpnJa9Kr1MBfKZFcKjiblzgevThnrz394i/77Dhoo
	KPLDysWGNfbCp9dyB/cJe+acmbagwI1huIQACist6e29hxSyZhbf1LvVkZKpcsHW
	RCi19RuCkIG5FlrwYksumJRabch8akoluNcrkx0/zgFdfDxhi2szZtJd+GGpAS5M
	oiPiM+zmV7bJQPJF5zfSOVd2mjAgNpmPUL73DAXR+5LDTaVEUKtRrdauf3VQoIzP
	E7cCTGlOqOffMRX1Av9HnjySTp+CfWUu2sTRpKI8ZAvYKdYeASmxd2AcLWep4PU4
	aIA/OA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s8384-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 20:15:49 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so6693548e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810548; x=1796415348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=;
        b=TnCBFtQFaLPb/1y31LcMuA5lVGjUMqh1PuyStWhGwqHLUTLqacxmriCxJbOHYZkaMY
         qsF59MdsBrVH1HIHZgo2EklqplTnnZZBDi1vEXWRvnat60rjjxtzXgZv8xLm82hZbkER
         u6TWA46M1hQzxTfYnLaZMMFNNNWqdRZEP3zYEYWqkaGuxhKMRticcUt/aSeukA4Hg1EG
         5W3RFaD1wJ/j94lD2TeJThM1APWQMvup9Q3N5+GgCBIBaqtba4iLaJ/X+qYJ8/LVa0iM
         tymFZ93lSY70r14eGw7C7R7zMXDR8zscyTG8NokaAKa9UmAIlEhuXLpmUyBBrnCxOHkA
         bPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810548; x=1796415348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zRhM/O1T4txkzF9sfL+DPW1cvJF0Hj1I6FpvxqvriM=;
        b=nHU1bhkCWDNmsIpR8MEsX65D7K5Pl891tZYZMGk9z10GeJErGWl62JNzEdEwsAu9fR
         SMg9FXwpkOiNUNxwLPpa84XpQwwkw9kZfc2I8udfo727DdtzESGy3dK0i671UEf5GCXd
         roQHzNcYO11wDCMoBeQ5p76SfS9PNDAJkg5EOhArtr1z9PUVNs5uS8WyRY+v5ltg0r2c
         ft3IR6Ac6FG7Cbcyk5BA5AUHRtlcS+U/3SOXdCaE6Hp7HStU+8tD8I+05ApgA8UvtoGn
         XUY0QTVqRL1FCXANLJx9Gr0aQXLXZNC8f3Z5YGSPTBRWYB0lsau3NFWV8gRo+vLe5fNH
         samg==
X-Forwarded-Encrypted: i=1; AL+hErH5CqoTNImsg80LTzpPmRTDCaVbUK9cAwMYDmat+l7Nlv+uI9+D17jAX0HzvjNxmUUTrol41qBOfEYyhi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SiS1WyECtbb8zK2CzNW3Jv7RMU05zC1Ua9erWwDk6S727yPz2
	tZTZS86dqL0uDObW4/SsdwXUzEc8FJ2H3XMWEc0u5oBgeuTjeT6uX0Y92Dff3l/z4NRM8+j3Qa9
	PPT9i93nwUwDciLuVPYWx4Whd86g4lwC0d+bB7Xa1XV3cpFU3wtp8HBZ8W+M/uWI2re8=
X-Gm-Gg: AZFdTZf/v/c6y+MXnv4/WgGelTzHpXyNqh3oUoL/NqgWbRmrmccWUSFIpnVZpSUb3YB
	paJPBAgr7eChLMIwbPzVEI51mmuZEO18o4HPCUHoIT6pZ2VoeWKKVCccSDyHB+un6xC4YEb9D3e
	glxLxgDLGvQ/g3RfEu+yWJOkdwgPJQNZZ79rEWDfBkdXuTlLN7qnUVMNPWh0voESSI8uGRO6I5Z
	yisOfqtOvg/iTIhnrJAspPliakOyo+GqRqaPouwkDEB84Imvjn71q7MbAcaKy81wlG807/gHHZv
	rF0vW40U7E/6X7OjA6OHSt8JIToXn+5ja13FC+LYpXADTlAqrgKzcoBEk9AgJLwBZllyheaFpCU
	YouAOgrXO72OUZ1S3F4FCLVUmggLjfWbU3aNI53PetTclQNcv07iwliY/O12yzYTeyQE61VGYj9
	JMB+pHhQLruRY2Ot+9rE0t0E9YLgBvvQb50TZ/SAAzxtc66Qa4uLb3E1LMR8/kdw==
X-Received: by 2002:a05:6122:209f:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ee8af0c762mr16859613e0c.4.1795810548069;
        Fri, 27 Nov 2026 12:15:48 -0800 (PST)
X-Received: by 2002:a05:6122:209f:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ee8af0c762mr16859568e0c.4.1795810547434;
        Fri, 27 Nov 2026 12:15:47 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 22:15:25 +0200
Subject: [PATCH v2 1/3] drm/msm/a3xx: report CP protected mode faults
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
Message-Id: <20261127-a3xx-fix-me-v2-1-839408d293ed@oss.qualcomm.com>
References: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
In-Reply-To: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+geKBFg39jc42lSGhUHzJ7znn8vxsTpvFubSIenP6p4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCeTotaSyqqXnFqCiPhSQ9CqNVoraO6tLNj98/
 XYAigPtnLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawnk6AAKCRCLPIo+Aiko
 1d6DB/43fdupC+YfUjJito55k/+MkyO2SkJwWHB09TjFQ3JnVxmLfMPVfyog4cOdh15VPtNDSUD
 3nN99aLXG1XncAxvtWfmyiZ2OFNAuiJLibze25T26yPPLRU7MdW595uy8GjoDlNYxTl9ur8d6Je
 hZRegMbyifgFyeclevAN4r3ZeRmTPqUhZCe2s1R3DH2NDEKfvAStET/kzaaAT4nZ6tWnhw2XdRf
 yDO5YcTS2yhNEnOjuP/c9kpRRhlhA9abpRMUZRWArOipnxjONMMQzwDGSxU0pYbYjw3TeI2Z/YR
 miGVojtzYfJ5HQTt61c0hZUZkquA/zrzgOzbvZ5fkGlxg+3r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09e4f5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=mspBB8xj_tKF7Wn_8mAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 1GiwbIW4B2T4wQcH-a1XEPNXe0gRfrHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfXwEVn5aFEtAbe
 vcOVdpse2NvsX199rSDBdQODpyD4LuaZlYBUr2mlBksn6b4ya+Mvl2HqJ5rk9VIpci/vFMsgMza
 wIuiJxViI94lSFHGFwvmMH2U/qdscnX9dismDiXafK3+2uJ/tD+yXsB6VgXe5nLKkzvDi6Qragk
 nCihf+OPbrV6eqwt4rE9qHpdmlSRgBHANsCiqHms1Z56wW68E2CVN4BqgSkYPJ82+WwsbjiuGU0
 LPLJFCIm6yICcco7KcsBY69AIL6vFRUP16lE/MiQQ89zKMp069hTM/lWRPWPJY3cO8BDLe35v3O
 CDcC6Fo9eNKpHL+vDXlG07P4jIq1ZcVn3RQxUi/2oREDEDkgeG6oL+xYtGRrkui0F7cWl2Sc/Fr
 0qTcxhBUtb7voLqXGLuTOi8Ru0UqVsCXGFFNo0NLSZeGLXclvw7beEex6W0VgHa+kS98RZt37Oy
 1o5W3cp5EQsQOgmG/wg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX3ZZ/GYkuKiiE
 yk7WLMl0MfPVglS6safTxHlJPN0lJihEE8ACLCu9YeuK+BroGb8TFoUngbVR1toYqK8u7npyxOt
 80xMpDSZFghj3mSSUwloaR8UL2lNaM0=
X-Proofpoint-ORIG-GUID: 1GiwbIW4B2T4wQcH-a1XEPNXe0gRfrHj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

a3xx_irq() acks every interrupt without looking at it, so a write to a
protected register shows up only as a hangcheck timeout with no hint of
which register was hit. Print the faulting address the way a4xx and a5xx
already do.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         | 9 ++++++++-
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml | 5 ++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 160d302e16a3..bd4b3ef7bc12 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -419,7 +419,14 @@ static irqreturn_t a3xx_irq(struct msm_gpu *gpu)
 	status = gpu_read(gpu, REG_A3XX_RBBM_INT_0_STATUS);
 	DBG("%s: %08x", gpu->name, status);
 
-	// TODO
+	if (status & A3XX_INT0_CP_REG_PROTECT_FAULT) {
+		u32 val = gpu_read(gpu, REG_A3XX_CP_PROTECT_STATUS);
+
+		dev_err_ratelimited(gpu->dev->dev,
+			"CP | protected mode error | %s | addr=0x%8.8X | status=0x%8.8X\n",
+			val & A3XX_CP_PROTECT_STATUS_WRITE ? "WRITE" : "READ",
+			FIELD(val, A3XX_CP_PROTECT_STATUS_ADDR), val);
+	}
 
 	gpu_write(gpu, REG_A3XX_RBBM_INT_CLEAR_CMD, status);
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
index 21b00a17ef3e..fd2faf134e5a 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
@@ -758,7 +758,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x0445" name="CP_PERFCOUNTER_SELECT" type="a3xx_cp_perfcounter_select"/>
 	<reg32 offset="0x045c" name="CP_HW_FAULT"/>
 	<reg32 offset="0x045e" name="CP_PROTECT_CTRL"/>
-	<reg32 offset="0x045f" name="CP_PROTECT_STATUS"/>
+	<reg32 offset="0x045f" name="CP_PROTECT_STATUS">
+		<bitfield name="ADDR" low="2" high="19"/>
+		<bitfield name="WRITE" pos="24" type="boolean"/>
+	</reg32>
 	<array offset="0x0460" name="CP_PROTECT" stride="1" length="16">
 		<reg32 offset="0x0" name="REG"/>
 	</array>

-- 
2.47.3

