Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585263;
	b=pmj0UQAxoQUk2GmPN3UrEKVdXScEX4y80wH7lV0ElvGIBr1fCJ2q8bXC0x2/++Ycf4r/
	 voshkFeEf9717jjxFfO5mU6Ii2jOR0c37iMFXk9SIZYrwFWV1agdwy2giMyj/RFdhFDbM
	 AbdMeOeVlKlD4CdcBGJePbKlgWAYRMZDJbca7UFNt7f9nM6n1GJHl3t6AzSjpZl4z8yj0
	 OJ2su1sHr99X0pM0kvJerkeIdEh3xKhQhjvr6a7fuXkqWJDfGVGmoQb9wZGFiVkmTVia7
	 W95N8iYuwhCp9/52/lO1uMaNOtj2FvnHBBKnClupNSvEf6TV3iXZQEhTWDn4Dkp+R6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
	b=FU4WnsulmRYi9sWU7AgNTKuH+noGGoHftvz+UTeDxQNR485cyX32FkzHpBooMEGh6y8o
	 ySeRAGL2lyG/mDBpuXydrZ78fQBtSNT8PGZvLEZw/Xtck2x+RDfu+P6rOr9rx/9kgYpt+
	 3yYe43oEu63yAOkOQPHkLDEeMFKhpQuLLUfAPHlB3ICbSjh3MvPug0oe1c6UelaDKythS
	 YRkODWlE4TupbRBN2+YeP+Ak0JeyK1dNzoYKIXP7GdfBrHINE8p4ABAh99IjrBkPdNhD6
	 CVo2sKnjnUu+eJhyYCRbKuF4rNJ66gQiS7LJhv6eUTREWA0Iu9CeCLkQgj5811Qtr2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PelQBFxs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zzyu7c3G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A4606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2A4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PelQBFxs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zzyu7c3G
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2B70S1096922
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IWzejzyPNKYwR7KBxWNQzT
	DTG+DrUsU5m4+6TEwipV8=; b=PelQBFxsHMPm0jVPzKeOVLfmIjQrQS61hch6Yq
	Z7YflDt+c6m+H69p9HCzzPbUCAt5UWWcM9foFyQaJfKntQ8HO01P7oPRGEQ5p4bV
	PKrVTjYB9E5PvzkHrEWHWIWZUt6w7JcuTUUtSRZF3GKWBb3apTBXG1Bkjmo/OZG9
	Bhz3gXjQK9hLZm+psso/+A2xsWiLSt3gLbHF4XHwvYSljz5WXZ+vy+N22+qAlj05
	sGYMdOFfYnATyB6VcpB5Lmhiw12UsBcIiJm0d+yTndG64l/7u7a6c+SvL2MZu030
	TpwcOXSj0QTORa8LLdybm2Khe0NIEmCQWEE/qaw02rfjsBQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5efftmk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:41:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso3480712a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795585260; x=1796190060; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
        b=Zzyu7c3GH1AvQn28V3yjRy2j0bB6HYb5gAZaXmtQriDPZe5yCY/8bhGTkp4WltzWUI
         izCzFAOZR08RKlJ1RZo4ZI4CXxVHIW4ecgND6wYBWegFDg8eGKLfB4IApi42GiejS1Os
         TEpDgFs7hJzuYwtZkAhtqv/ZZAxOAW9rh4IqAvM7ykjIyyJztyxJ9TOKHqf5htAmCDLn
         AJwsJVIoLLk7gfpUfSg4VbpwKkKBkLtHnuyfxl9cEw3JYR/jjBGxmnFm5FZqO/Y1RNnb
         JLCJJAjoRZWMoTCbBEeJYeNZhnCmi2VLNYD1hWadfOHdZB9TCUIWkljtdnHmOTC9iCFS
         pNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585260; x=1796190060;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IWzejzyPNKYwR7KBxWNQzTDTG+DrUsU5m4+6TEwipV8=;
        b=imPqTGaboa+WmvVQRhiNVy1HRK5x0rOvBhm3+57GdBimLNe+Or6LQFXXn5rduzjRUV
         qaJCDW7Fzkjy9oYJkthH3k5mSS5H+HvXZdq+2LsUEV+4F2Rjpmg/OuzC0i41mMOKdv5b
         RM6MqSwafrDpraoE0nlngIy4PXQHX4aS0EgTK5SoH6VEqYiV0Xmk1yYI4jZAowRzZZEX
         n8eq7dTpckaD/FvGZDBWaBAXh1T5c2GnRY47w5ukl4cnhxuI6fBh/ZPPPUyn/RDoqO6q
         GsybfZ1sGSZIaCYB9PJE16dL0ib6JoWBsETflFwIf+pRkOCJk0n3DHBEm+n+Qo0tbVr5
         eRsw==
X-Forwarded-Encrypted: i=1; AL+hErHF67glBIgOHBHXo9ubhzFynYZ4JHxOWemXg+V1ZW/EuTH9vyL2aTBSXIz/jJGQO2fixljkUcv6SWHuzkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3vUmtH7WY0TZV6iUf5BPchs1iLG0z/i8ND1BkXvbI8bh0mJCv
	YrGNk2xgofxMwBwm36HMW0Ypo9x0c0gOmPxmrrjTd6iCG5V4TmCoze1lajicoRCram74AnAvvsI
	DkW+de1r11MLOm1g/QCI9DYBX2AXlHyQlMJeOMyLez2lYdVGI5weiACyJ45pghBLHh5Q=
X-Gm-Gg: AZFdTZecjKYJrQZhNtokVDYiv8aSCW28hfUhumeDSli+qqy1oCyJtirk+BjPlmHq5Na
	cs0G1Ck6WXoysZxkRfSpZnc+azf6YThie56L4iaMSoWXPL00gfCiTBGNMXhr5L9uqkh2YFFr3CV
	GDEqIVtBqwbI7bxC50XFrdTpQaHGschOcM2HyToznYNLCuBrYT2UhEpOF3ohN4xfc3JfMZoHNHh
	8yglaRBj69+IhueuLeiE2MQipMtLPMCssLoF2iaCAZ/duCrzjLEsXIy95lWcONLvaB2YvC83vdJ
	L6qC01Wd3hhBWVzvaLw1H2FCX5fziCYV9EEv4W+uVmSNeJxTInhBqbX0hQSoSHra9HRdW2eN/SK
	jEySpbeBGXC0ttWfDdFsdSZmO+3FOd+2YMkl8wwxE3YRbJPR1PnoHVbUAcTTVgZ7jeXTOWlb/dP
	HnO+iP1JQ=
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15040181a91.25.1795585259586;
        Tue, 24 Nov 2026 21:40:59 -0800 (PST)
X-Received: by 2002:a17:90b:2c87:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b41c911819mr15040158a91.25.1795585258996;
        Tue, 24 Nov 2026 21:40:58 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm28897957a91.7.2026.11.24.21.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 21:40:58 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/3] media: iris: Fix issues exposed during decoder seek
Date: Wed, 25 Nov 2026 11:10:22 +0530
Message-Id: <20261125-fix_dec_seek-v3-0-66c9889def2a@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMd0BmsC/3XNTQ6CMBAF4KuYri3pD6C48h7GEChTqQrVDjQaw
 t1tcWFidDPJy7z5ZiIIzgCS3WoiDrxBY/sQ5HpFVFv1J6CmCZkIJnLOJKfaPMoGVIkAFyp0VYg
 sl3VaZCSc3ByE/cIdju+MY30GNUQjNlqDg3XP5Z/nsfeH9pwyqjQ0mimRbwD2FjG5j9VV2a5Lw
 iDxgxcfg3P2ZYhgCM6arUq1krz+Yczz/ALmo1MGBQEAAA==
X-Change-ID: 20261031-fix_dec_seek-2fa92563b495
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795585253; l=1626;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=2+EGv3Dw3R5Ib5DU2qEGLXEeWvVqzP+A3VmzdwAXxgM=;
 b=PCZKBNddRv7BpXZ8ccxWSOVBequD4bYshmluZJ305PfekzAESPiv3PccdlmBmClQSEm510zDh
 RH9O96QmuaPDr+yDaMuIW6oTkDAoetWoIgitIE7ELA3faZesFprXI49
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b0674ed cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfXxKqGlg1PKtK7
 xmAjrDiQDaLBk75Tq5v92UgnL0j8Y4ZB63KCcbMJOR1iR1N6IJBYM5VGYgosrrA+9V3gQkHNiO5
 S9kJpIQ05PjASHAzoa2T2ZP5xUBDwC/Vr/vJQ5hW7Ba8XYiKuztfctIBROV8WIBwfFxhbJ4LCXa
 QDxeVHdXl/7zobnBsmUem0tHDPA4mCbge9vW6C5rvsu0fEMXbt401XhQMXL3NF/L8mPI8HxDrvz
 1fAfCuArTIyi5YGX1fSa95Fhiw6tKJq+SWOjs8hqaO0bPueV8vm/E7iCsrNkjZOCKw9liMdXUS9
 QaVUrYueRTq4R8esAFShAyeUzz9XpfQS6IdyLBuH+zmajB+l3LQZxTKwpWpUYoh8FD6YTgPTKLu
 wUYa5iQ1x/HfPLCe2n5dwrlPGkL0xDtExIRtPLdaQwvJMDaJN28uemiaDWTrzxK0m7TrLBQsSLD
 eSSHpm/kNNaN1vieBdA==
X-Proofpoint-GUID: JMTEb0-omSur0ExkEEJujZd05ljsldkR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyMiBTYWx0ZWRfX5zjx3rQhANi+
 cDRd505MFlWuR5yMkma15HDTk7gXIXdqtfOyu6DxE93hOKxJHKrJNDUIN7diL3vkP59EQl9WAM8
 oBY0XmwmS1uSs0LC6O/z9cQE7+HZDRw=
X-Proofpoint-ORIG-GUID: JMTEb0-omSur0ExkEEJujZd05ljsldkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250022

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Updated commit descriptions (Bryan)
- Dropped HFI_PROP_TIER from the AV1 input config params
- Link to v2: https://patch.msgid.link/20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com

Changes in v2:
- Dropped the TIER_AV1 cap instead of removing the set callbacks. 
- Link to v1: https://patch.msgid.link/20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com

---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 11 -----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  8 ++++++--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 4 files changed, 8 insertions(+), 22 deletions(-)
---
base-commit: 3dd8c790a7b7027abdd568e36db5e82ffaea7c77
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

