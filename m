Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160560;
	b=soCbwEF4bPD+tt6au24uMZROjifqwrOZciKXnn4wROEL6C91w3Hbxyis/z6Nx50edNjv
	 EdoYEsUPo2xqK7cjLi2tkSbxeWDjZ3ayufDAQGXD3VHzvZSQp1sJ0Enl9xHv+TvYILA4k
	 cVejIl51FwJbcrLExwWFeilRhIPPoYbmmxYHGJHsCTJ+21unOEs9tSEiQ+LKb0V7i7whx
	 OBXC9aFuQM4gak7vzJcdJsFEYCdozD0SXfmC+78wPOANEtbSL/Y//YSfecdJuTcGQmNpk
	 GKa4lxnlPYeoPq7izJElD+WL5pywPGGvPjWq0EIncyNy4HojLjLW9BuYvwQ/ZXklNug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160560;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
	b=3OSI/efZbcqMTqk/3yqlDZ0lTzB+o+fS0nhs/3I5QSzupypnHkqR+XPbzLFjCpsb4rot
	 XVuslByNS9w50zoN+l3iqiTVqHstz0+ATPgQpCpAQIqr2MFZ6A0rVdZGML7nWJ0ujEuiI
	 rjleeTEmJHbhBZ+APomEm1qIMCDhutps6+Mii24Forv6kBnGv0TBEFm1z0c32mOL87L6P
	 ZYAMuQu8bJugoGcj1FRLLTJYxpOPGwb3WxXdKu71HKtDEoub8LiGcD+08S73YArPXJJyC
	 lN77NzFsQR4twr4+Dj5HfZg2f+TsyeZz92mTDfIMGV3hqWMNN587FYDpARh1jOGHQfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6sqMdt9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHnZYRN3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD8E606A33A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD8E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6sqMdt9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHnZYRN3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fE2r758282
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=; b=j6sqMdt9VG0rG6w1
	RMdnteM9zDl7jpL1TK/myEmc0EpJuDI+JvKhjYJXd4oEECQ6Z/JjXjGSdValQPC4
	o+Kx840biickoJC/Q9b9xB7viUKi3wkTcnGD3O/E3g+o1kn065BDmBE9+fUVau9C
	WxBb26PbhOAKw34PSK1ll33sAWnlwsCs66vuWz0oQTrEm7h1zhYCcjb/l1pthJdD
	3W6Tw+N9jv5OY9TXqHl6/eA4h5VNVFYHkf3T6KVIgK5pXglNEqaMrE9HeffE4bxS
	5Wyp5N7fI7YOvi37TL8zl6Ge37rPat0UKoVFXBU2thh3MKvSg54FHamqMC7rxpLX
	B4Rs3w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5tj6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:42:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so873141a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795160557; x=1795765357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
        b=XHnZYRN3ClA2+MwlQ3Puo+bhgh2kw1wm8PoyywMaDV1gETp02lPvrDntNilfjA8ytj
         e+hYXGO7FB/N8PchCClJInVtsskSs64ekddtVxLrYXlymawmlUgVVYPLcJJydKVmf94A
         kU3m+GKaxLh2CWFxBBrRioAJ07szJ5FY2b95AOCZi+oh+/bUVI5zugzvoC5rG+ag9pYv
         BObtoQ4BPhcWz5PAQjOLhyo//g5YtFYod6C7oUaCZALods9Jyty/wYwC6E5B+YHxYMt3
         lfSCHBHXGXHAayC1Wvtw/IH/bWBFIi9bBwFjDyKKTCRRRNHgwYqCZuVuO34GJeA4yGNl
         EbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160557; x=1795765357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cMy9p57SoBkXCQK9JJ0rBY5bQmP4zq/Gk+sldtVJuwc=;
        b=HzS7Rhhwzqe9aQ7i6Afl6qdocC/TePydFgLhYQlNrnVjS5f7DlSl7zC91KxSITsYDK
         9mXpGBoCHHj0i6ry4J5WUR9BHAuHys9HD6+FV4mtLZEu7dF/CEwelkMSjB/QtCCQG1vU
         umkzXfSjRHQ7rCSpZyxiLlv0ozTcaOaRZIMFVr6o6o6PsWZp59gCEHo+/pYGUNvVewgp
         U0mBmzXl4skETZ6cW+MbUg93QGYbSqgiGuErWXLpOm/HdIcAaP4QY5NYYiEc21IJ9vzE
         sqBmERWeDJsFe0DDgV7j3NdxxsFEsHeYzYfkOjwEONFqcvwEISHDNc0CHZ6qcsrxvgJJ
         BTbw==
X-Forwarded-Encrypted: i=1; AL+hErHebFYVqK6zgK81vslIm5stLN2bfLh+mJxHBT5yQ5GJfqKUunlOHn4jFOegajFkz5eShha+wluZNaUmW5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bFulYxt9MwkQ3VBQLJ6968zHrACw9OB2d9Lmeb09X6DCUfN8q
	4XMaeOGj0+R3w4qRyyuzhx2xzFJtI2DCejDOV2clx1/BYJ68YnK8zCX5USQyAAGfKASLOAcvD3V
	KzhxHz5us5GbXY025/7ZaHnd3yLx4O/GbNGEXYkkeA2nLf/NluA3FwKTaKRTNZRQI+jY=
X-Gm-Gg: AZFdTZel6izHAgXrbs++Kdfjezo/1+0iAvIUHBByjN+zfg2fe/K86/4nGV5lrfCuvKW
	2DFsKF+c+W6LBwN5QqKz/+s5OVoaIid69UcvdegdP6u9G1zUADuXXi+J613PJ/8ILVb7O49SSFn
	EQb9cA9ftKlFTJbiJTvodhwVq1nbST4n2gY/TRG3393hP2zYT7vg6xQTn003hHoB+rZLbNlN40k
	IbsicLDGdr/rPRmEGyabnevgzx68jfugp42eDQBEuwS0nsbr7h14IpUKlvwvW2Fi3B9SxwDW4Hf
	ljYmfCwYWn31XnLYCyWoVXPEi7DP2lfUCFTIerJ40O6/5c2F3AkUtI0ZWAfaW38Lnf6yLcF7kWO
	Pibf6p+DuG3g1oPc7sw3EvF6FvLCm6j6sr2dKGtikEU+5WL9IM+1nbuLR4gF5AU4/Hsx2BzFcdm
	xo4JyHT10=
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr1934251a91.40.1795160556548;
        Thu, 19 Nov 2026 23:42:36 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b3:bd07:665b with SMTP id 98e67ed59e1d1-3b41c9325b1mr1934237a91.40.1795160556149;
        Thu, 19 Nov 2026 23:42:36 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4323bda5esm119935a91.3.2026.11.19.23.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:42:35 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:12:04 +0530
Subject: [PATCH v3 1/3] Revert "media: qcom: iris: use disable_irq() during
 power-off"
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
Message-Id: <20261120-fix-disable-irq-safely-v3-1-82f9561394cb@oss.qualcomm.com>
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795160546; l=1357;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2I+5QsaOpqK8JscQ/rWi2t79eZPugQinEc5cxAOStn4=;
 b=Wx127EyMvAjyRjgOqzwVx2yiz9pX6rf5qhqKWF/CjT1DMOOOVo5WYVXRERHNye62A7GbjlstA
 Aav2wVNPDkTDr1vrSR7/wTS7Ftb3WXVj+fTKhuPFjETmPEWHdhPHRV0
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX77XdkYfF6bsw
 gAHX2LvCiBrZJCobtUznA+jXk563FCnTBpzqZFR3TK6Z/SadRIqIKGA67qfKCvL/qxzN7VF7edX
 wLe6cOcxGBbOFPEb2/3QFByOCmpjpE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMCBTYWx0ZWRfX0kEQw3cxnJHR
 bCc2XfHEayLKiJ2itVhDEmv8nmhvAS1OShHsdjr3jYylD840ZN+WB41icNc4PnkXXr0kBgPq9+g
 DR84I1FPUA+Q/QMg5iGYEpY2iW43kbsmI+6Yo9Z8+ygrTUcWIiUWCr2XrNSqFYYsRyZ1pGXovwg
 N7SyRIH1BYgI15JICAyzaInZaTSOxv4ahjllVB5ROM3V5I5XjPyvMitro2eEqd4GHRNdF9EWzFH
 6lNVPIQNXkSY3gzDBoE2BSPiGxzfY+DGW8ydLkN3J5n5qq8Ho1Aw4aSsAZp6TSanRhZ4PpK2Mo8
 gVtZXl6Qo+2Zt6SRfqyy8pBs5pT5z6kTvsUxcKnQabEJDiBOow3wNVPrhFVEtk7BacYR4QZIEZv
 /KLaTbk9ROfv/pS5uHSWNU8xurMCkChAEoUph1oI3H8hsjsN8P1yQiJs8Cq3gYxColYi08cS3aV
 mtI93pZh8tvHua5/7wA==
X-Proofpoint-GUID: vJYgzOw1XN5-yYNXSdttBqcj_u6s2nQQ
X-Proofpoint-ORIG-GUID: vJYgzOw1XN5-yYNXSdttBqcj_u6s2nQQ
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6afff9ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f9qQdqNCIvW5R771ZgcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200030

iris_vpu_power_off() is always called with core->lock held. Its callers
are core init, core deinit and the runtime PM suspend and resume
callbacks, and each of them takes core->lock before calling it.

The threaded IRQ handler also requires core->lock to proceed. If the
handler is woken and queued around the same time power-off is entered,
it cannot acquire core->lock because it is held by the power-off caller.
disable_irq() waits for the handler to complete, resulting in a
deadlock.

Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..1e183fc4e58c 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
 	iris_unset_icc_bw(core);
 
 	if (!iris_vpu_watchdog(core, core->intr_status))
-		disable_irq(core->irq);
+		disable_irq_nosync(core->irq);
 }
 
 int iris_vpu_power_on_controller(struct iris_core *core)

-- 
2.34.1

