Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088760;
	b=v16UF10l1rjciQ2W6lDmuAp/K261YMDrMSKWoiYNvLrw2gbmm2hNN2PbOcksPURXxTK2
	 xkUU/gp7Fp/61P4mo9ik5tQaGwzwFuM+8rfSe35rR3v1VDN0AWjzbSLGWnQDVRog29kNR
	 Hf5BNC1XP5WsXwe2PU8zNjN9TSkwl2YlnAUmq9mP3LwijhzsJ3xVL8VE1dMawZ54+Ix3o
	 ea3ot1Y0gUNCgL/Jd6M5RCloIoyypAdVO7T05AjdidK35b9hpSo4n9B6DBcjtbM/OK1cd
	 5Xm8O6/xTvNoL55v6XqtkDc1WxxOdqKzQJpBH64n5/XGDlF0D6xVawjSKMawWFSpB8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cl2K1V+C1GydrvsfniG7BfW1zVvH/YWUHlDDFm15Zm4=;
	b=lAxhFJlKNZZf/x0OjciGQyms4LYZXoRgSE414MqD2E3fzhrxFOEfu5k5gYDL+YuIMLK2
	 +L0JFUNu+zHzOcorcRhoHKOg+Y3qclk+8NwQYj+AuKwgtj6L1iiLqGFOzjENYEwz5NGHH
	 Xn1jCgAMpPciM+X65kBv5ow5gBM+ZQrVFKIpno1S+0vQmX0cK1oPkSUdX3zaEkCiBb5Mu
	 CyEE/+aOYm3uQm7o35EVQqy4tf1roYBy6lyAuOWeuPCQHnAZlYzrRKQCsRM7Jn24tWzi9
	 14ipC15DcOOOtsy4sBxiyHYVn32z45GtJDW+9nF+D7rrOcWHvU80Dvn7YAnk5CHTbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=os0wq+nK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGLaGV0G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B34606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B34606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=os0wq+nK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RGLaGV0G
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjxLm2842853
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cl2K1V+C1GydrvsfniG7Bf
	W1zVvH/YWUHlDDFm15Zm4=; b=os0wq+nKvUOWxHdg/7HlQyP3T2DhzMkL9h21Zf
	6FDiIhePHOdDBwsltzVGClNMqFrK3m3uuoMP7Zc8pw2C9fgfojgQVQexpEIf0Mik
	AzbZCdEsUd7NRDXxlK7TJdIE0ZRm+NkF2N2sRgln2zC8mLJjKPC4nBygTTf13mK7
	JD5w+uLEjCywqgdbU8Q1J/6SBVx6oxfy8JC7sm5qwKbQbxLKjvFtXLUyAS6q4kKU
	gP9PobKfUkXfkuk9Zu0gyOGygUfGXtyzWH0MmVlB6VnLsfGKYFYUMP8OafUk6s1m
	f+KZGfaWZRjLCw7Kdfef+UCLc48LpLYWQVuOVslYgbaBVdqw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rjqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:45:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so1956227a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088759; x=1795693559; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cl2K1V+C1GydrvsfniG7BfW1zVvH/YWUHlDDFm15Zm4=;
        b=RGLaGV0G9BqZpfILaO7XjweZ8ZfmP++nY+XetoHBY8vfdcj3Se4BrOww7H8mRSPBt2
         1zH2rFuu7vydn2nnYARHGylIIvPnRaEWpargcQNvyTMovSpwy9I5v20c913WAwjiOkxn
         Zx4Ah6rxrsS2jG1SA9ZR+5BdburjFoMkVDXPhR+6a5mOq6qEtEOGRDMFjBUcw4qRxep3
         rXyswispz/67+pUzRtdHmZpaNddERfy97Lr46B3Ky9GYo4iQmVXe0mAI5sF/41ajEs63
         ZU3bdZ56+qjTHHwwR4nZhplrgoC5C2zLp8IItySeIYjbvKkcoorazktzlQvMnD2uUkBW
         RFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088759; x=1795693559;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cl2K1V+C1GydrvsfniG7BfW1zVvH/YWUHlDDFm15Zm4=;
        b=Fo15nEiFsXWtXcxO/H/0HZ7etrmKPI8JSES/Anc4R56rs703WGdUYUICxSoMy/tfeM
         GL9XbmcIcr/Uphf4kgjkvGH70uPs3pwoHcq4kOxT6PtW7lzkT3DDsfrNBE6wjUdYN0IJ
         Y03KrJTxKGtlNljpnsoInmhvb2e/YWzrh/2Xzl+l8FBoDACIXkFyCHqYFOa+DUcJPHPV
         HvfVmWOi7teqKLhQPuQ/dOhviAmy279qyzdfRy5KKFmqM6hgTWP8w6A9ZYli6U+QVauW
         DJB+RuRnkn7A+wyWnQJXz2gJ61wu8DKCPkPasApZ8GlLwg/jsDuFmhDvx+0Qei02B8HR
         i2sA==
X-Forwarded-Encrypted: i=1; AL+hErG+ts1dHUCfNKHUr8Hl6yZICD0WyXaJZv4gF/0i19hN6suNZPF4AFGbsVLdFgm2qOaMXzItynmtfZZDbp4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qr2hPtuGT55r2ugkthoBVBc26ZkMgL+sOoP9++ut5LNxP6Pjv
	Dme0p8w/jv80q7W4iaATuM53lI1M0T8jS0BL1d0DQLK0vQgph1f8yKjlpKU72BIxeiLGGxzxXM5
	NDJylO8IPcOoZF/lNynQLh8wqk4Kx8GNktH0Y3qb8xd41jKVEBXTsmoy88vhhhwKLEus=
X-Gm-Gg: AZFdTZd3KsKWHKwCCUDn2euly/vWh5D1Dtb3awETG8orsLyMTJUP0/7XQcuz7pvxYeW
	q9iAasHnPyCYpc5RsqmCRZK01Q0wi6EV0KEAFyXjI6zpyV20ZcqPj3smgiJnwER7HWgKE3uP/9w
	4TCssAoHrkkO21UMdz2lEpCYhSQMwCSBM9atcCL3gu1xZaUky/K1ZNdYlkAluxEatXCCISMvmuO
	gZS7ZoaV3QfkucXlOkrr0uUIBIYQ7/yIxcmSC+1lzgYExCaoew64Wgd0/Paw9dWcQiyLdupInYB
	oxETrcmUlhCuGkhT4BDYtlNPKwPdBu1z7u9Rv0qnqOl4UgRrXK0FSHN8b5qHcic9U0KjR429gTh
	LJrEty7TXK+mt1DIrLCO3D2xpZ9Qoe584bLyLCwmYUEjOKjGbU/68xLN+Ba6N0Pgm1Xyml7RzgK
	RpfSDrts0=
X-Received: by 2002:a17:90b:3890:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b3d07b032dmr5632893a91.49.1795088758800;
        Thu, 19 Nov 2026 03:45:58 -0800 (PST)
X-Received: by 2002:a17:90b:3890:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b3d07b032dmr5632867a91.49.1795088758281;
        Thu, 19 Nov 2026 03:45:58 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:45:57 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v3 0/4] media: iris: Fix issues in the driver unbind path
Date: Thu, 19 Nov 2026 17:15:29 +0530
Message-Id: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFnh/moC/22NQQ6CMBBFr2K6tqQtcQKuvIdhAXQqY6DVDhAN4
 e4W2LqZ5GX+/28RjJGQxfW0iIgzMQWfID+fRNvV/oGSbGJhlAGtdC4pEsv0sT3KyTfkrXSoSih
 KBChBpOIroqPPPnqvDuapeWI7bktboiMeQ/zu1tlsuUOgtfonmI1UsgB7ceC0xbq4BebsPdV9G
 4YhS0dU67r+AFDEpzfNAAAA
X-Change-ID: 20261013-iris-handle-unbind-fe09689e6696
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org,
        sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=2349;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=/P2Y5/7trPmYQVLg1UXQyZX0w+9QilRr0lKIvkPBL4I=;
 b=hI5HHtCMwWBWfndFvyi4JmCSexNKPJH8f92JgZvqylo6fwdxs7rwn8DIgeMb5h4Cvy/ieWaEv
 pRjpuL1CmhUDoN2TZdiEhJqKAOihI4188iUL/VfDrsZubRsC2TSjbn4
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afee177 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=6I88XT8292Qb7oD-W5sA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX5xjE1XhSjz0B
 lI8c5eza4adp32CZXGnOn/uC7UpT56gsWPGCE4W6QPMxfrhQkM8dEqmW39MKBkbpWbzRY/2t9Sp
 dz8Dy4GvpyjjXwRVE6kwhsc647xQch20UyIIYu6/5d6Zfjn+oV9CI+rY5WFwnfEXmeqO4U+o1ND
 /LfzM4AXTXW6hDS8tvPoeOMdJG0msEZZnOgf0F30i5sRcARScBl63XWjmcsU+aqF18YbYARZEnr
 qwZw0+r+oVkLaQi3wMig9zULa4u72cKOMNzFIfUXx59RaB+HNm39ILRvF3GdCo+uA0PxVByN5MY
 s/e6Z0jcSYDIVDuN+f7nSP59sHePjS9g2G4JVmUXPJ+QIkwayoNNv7gFgpeLisOQxE4JnYuR2zb
 xZiWZ+ZPhV79NWZB/kUNE/2n1o6qdN7AWIbBGPv7LwE4GypCWvMl72neV8usTuswofsvv5PW3et
 nhg0MxabOdaG7wJbMkA==
X-Proofpoint-ORIG-GUID: p8i_dIjdNc0v6Sr4PpWUuIGZYOq5AkKX
X-Proofpoint-GUID: p8i_dIjdNc0v6Sr4PpWUuIGZYOq5AkKX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX13Aoez89Jf+5
 HJZouNtM03Pr8tGO32cdmUuSun8ZKX1RNZOKlsNHlfSNzesk7+QnYRJdjGW3BCkvmIJMGuZm+O6
 4xsvXlGlJ/QhUg5DqEMzZHBZP645jkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources are freed when the unbind
completes. That leads to use after free for the running sessions.

The core and its device are now kept allocated until the last file
descriptor is closed. New sessions are stopped as soon as the removal
starts.

The system error work was only cancelled during the removal. An
interrupt could still arrive afterwards and queue the work again. The
work is now disabled.

The runtime PM usage count was dropped twice when a resume failed. This
happens for a command written after runtime PM is disabled. The count
underflowed. The reference is no longer dropped a second time.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v3:
- Ensured that runtime PM references are dropped before driver removal.
- Dropped the unnecessary interrupt freeing change.
- Link to v2: https://patch.msgid.link/20261110-iris-handle-unbind-v2-0-86d5f6f1dea8@oss.qualcomm.com

Changes in v2:
- Updated the commit description of patch 3 (Bryan)
- Split the interrupt freeing into a separate patch (Bryan)
- Added a new patch to wake up clients blocked on open sessions at removal.
- Link to v1: https://lore.kernel.org/r/20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com

---
Vishnu Reddy (4):
      media: iris: Fix runtime PM reference imbalance on failed resume
      media: iris: Disable the system error work on removal
      media: iris: Fix use-after-free on unbind with open sessions
      media: iris: Wake up blocked clients when the driver is removed

 drivers/media/platform/qcom/iris/iris_core.c      |  5 ++
 drivers/media/platform/qcom/iris/iris_core.h      |  4 ++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 20 ++++++-
 drivers/media/platform/qcom/iris/iris_instance.h  |  2 +
 drivers/media/platform/qcom/iris/iris_power.c     | 24 ++++++++-
 drivers/media/platform/qcom/iris/iris_probe.c     | 66 +++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_vidc.c      | 20 ++++++-
 7 files changed, 127 insertions(+), 14 deletions(-)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261013-iris-handle-unbind-fe09689e6696

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

