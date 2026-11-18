Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007320;
	b=Y5HuXdEA7BipHwb6XxeFdzbDYCQhXhU48MYaD/Fuf5VoHl0+m58C7FURlvrKiQNwh7Up
	 CIV2DVigrSwJl5BTv8s2yJB2m2l4KAz50Oq5kn4PUhHM/AU4DBRmcn5381XZZeIRh8Qk5
	 oQtH86c3z89SIH6QTBi6Z1Az/yc8wwu5jATsvnFtnOQ6J7zFH0qDWHZ7bN4FnmyLBw70x
	 aGxJc7ATd0YRhPRZrNJ38VGXW8R7iYzIepynoUr+67TKnN2+vAdZX7H6Hz9QlR+wY51PU
	 BLR/wfIc8MYVCpD7sOdmXqsr/dcK7EzJrmkUH+kyejTybmOoqSgj6prVMa7Qs1CITkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r7iSbd2TueejGnIqUEPWs0leIgatCchC8EEoeiFyk2M=;
	b=NFX/SO6gMXnrx8xu994p7u8UehfgSewjygFUC5Xg30SllQ82KckXbsm75ZUWohel5QdN
	 VwEqpsomZp0qeIGPqwVFedfUihdBcq1CuSgSxEwfxo4ypHwXlL+44u4bk9O6zy+T7txeU
	 zWlZ5CEdmFuaLYBqY52v/ZwYqrAMc+pfB5n6K3N+e44oY1+abmTcgXLAyZCB9ZMRyBW0i
	 HeE/Bv/dkskiw4o01Jcb50P3R8QMBctQS23WUbMeUvxrjPX3zGFfI1JtnVakUitVpFkai
	 C4C4htjPPcYu/XC7nkifdkJj9TyrMqq6nNKTCduf80H9asQgwWWB4RP0S0Ene5fKXbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="J/Livr0m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGznMeV3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8C2606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F8C2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J/Livr0m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HGznMeV3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICeewI3344959
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r7iSbd2TueejGnIqUEPWs0
	leIgatCchC8EEoeiFyk2M=; b=J/Livr0mgoCmOzoWzzm5YLuoJcPrXHbPGCh7TR
	2SbqbG0OvwwVGWMKgzegY/2r/AjkDxq3pnWsLRUVZ5Yhi81uyl4RXJceNT7u+WIe
	vO7deMcvDbOc6uHnWFU3lQQ1EEq+eWsee+7Gd4HqRAaUQqLQqkODJhmuq1vIcKk7
	8bg+oumzbaEh1lKQ0XcIqt7+ezaLgJy84gcx10+Imp/r3KMs34uwugwoX87hT2ij
	Zt+AFwk7qvom5atTnhT+WGpOdYo5CMWl4qHqL9e95rl/nlO7sThie3t1NhYglTPo
	3iBobjMw/Wvg9G9Vn3Z8C3rs6Bxhw7beCotCWFeTQtWPoi5g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8k4j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:08:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a0747175so175762a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007318; x=1795612118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r7iSbd2TueejGnIqUEPWs0leIgatCchC8EEoeiFyk2M=;
        b=HGznMeV3Om1Eo3gf1T9WhAOuINdwnhjoz6y/ZRngzfGwt8TuGOJVBTO9w2K2YLGzwL
         CIBq/Y04fB4qWvrmVVyl0MNNYJcR0tlqQ5HmGxuYQoVyKvPt81mSsqjK0m9yhe2J/mK4
         6/Ed+Pau+p3mA4+h80I8cD7kKE57qs/8+/nEQn85D6F57x99aAqcAfPQLoq5WRNjugC4
         y4flF76xewO6UoY1I5i7lyYD5w5WmwC2jSfxTxuMCc2U8zQb3CvuxYfndoeLhv/QNAGL
         0aWNLESeqN5gtwyX9KKScliiHctQbr8J0ZMObdphzsoz9ZKyQt2HEUhJEuLJGOFv5TIY
         z3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007318; x=1795612118;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7iSbd2TueejGnIqUEPWs0leIgatCchC8EEoeiFyk2M=;
        b=2VgjYrN77YGgvm8wFvmWHN+KOM4oO+ZvKSH0L2EFWMFpZ+DFbGySrnAaDq6Yxy2YX5
         eO3B6O0Mxs4FP9O3tid1OdsAbjk+k8zTdBGibwuX3TXncP5vUtGKtVXJ0X245djKfbOy
         OmJLsERIP2GAmW8TZPGULYMZuQriyfX4HrdVuvRi4kYPDnOSTJr6xw69RG8Oe5ZxZ6x0
         yr1x5quM3XXIxCOjjok9VxMCH4clZWsD7gRvVK8I7CU9FLNEcUwm92el2MuSy+O5Q/ez
         BQDFnqeGleZ96jh15tBanCFGiP3TzvuuXWLT+yUNp0n+HqpjvWcy7Bcj3JlXZQj/YMiv
         HyIg==
X-Forwarded-Encrypted: i=1; AL+hErFY7RBuBp82nU4jwyANwOHSId9x7nqZBvD3PGP45hLMm6VrV3hhMXaR9vjURlwfvxx02F5DoF3fdPdm06s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IO6yv5VH7kmcqnKyPiOFVFibeLDArEV9XjIqHSmfONgV37AeE
	9GnH4fZewV6Lu1uRUsvzOziPDoksCRVI7xMtZL/Zk55Rz5mMZvUqSGt4aoKmnyO3W/+SIsjc4QQ
	YDtUfTbB+S0rsnEVBIdLfkDEZrT95z8b/KoXZ+hSs9Kz6pSxm/pmWffPTC3eygtqizmA=
X-Gm-Gg: AZFdTZcSrknC0NT5Y+jOOwyly1alA3gCjXDJl70OAYIyFn7K/PEpz7g3vEN0FK0JjFN
	CIi6Jzc6Sp3+SwLuhXnnczLPwjuFpzrZvQ1UQKlngmgHldC95pQAIZZdSfzDlqHyo/+w+obXM7D
	FCwzcF0V7sR8+HTrvvDU753k/7uQhhXKQXy2bkzPzl/T0XEWnBjGqx8FXwqTwoy1xguwn42F4xm
	tXtn0BdVmR4xWmRiEKHB0ng7o26VKRmpZFTAAKXyPYYnLiGfQCXbQpkyZCaw2WjiS4UkbQFFVaT
	yy+Va7EoNPcqWX/2dRqke5e7Sg4+JfcVtYRICdpvFogiddcZ028Kvzmv+uDcZoJ6mOr1jslxbDA
	jIly/1Sy4t/4tDyUBu7mVIZhs0dT25iyDrUsoh/4uhH0RuqsFY/60nbtWq/PB2nfvO0EC4RJEL/
	EQs8ekRUaL
X-Received: by 2002:a17:90b:1e4f:b0:3a7:fef3:8561 with SMTP id 98e67ed59e1d1-3b3d07dbd94mr4271671a91.5.1795007317746;
        Wed, 18 Nov 2026 05:08:37 -0800 (PST)
X-Received: by 2002:a17:90b:1e4f:b0:3a7:fef3:8561 with SMTP id 98e67ed59e1d1-3b3d07dbd94mr4271618a91.5.1795007317212;
        Wed, 18 Nov 2026 05:08:37 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:36 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Subject: [PATCH 0/6] drm/msm/adreno: Handle unavailable GPU SCM calls
Date: Wed, 18 Nov 2026 18:38:24 +0530
Message-Id: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEmj/WoC/z2Ny2rDMBBFf8VoXQXJGdmSKSX/UbLQY5Sqsa1EY
 4dCyL9XTko3A2e499w7IywJiQ3NnRW8JUp5riDfGua/7HxCnkJl1oq2k1JqbkPBOXPyE492HJ3
 1Z669MyC1iKAtq81LwZh+ntbP44tpdd/ol031lyh4Xevc8oqxCYnsc25o3v/X5lwCP11WyW8tF
 1yHLhgjtOu9OmSi3XW1o8/TtKvnYxM7S8i3T1qGpgdjIeC+FyAMdOCjVkKiV64FJUME5TWgA3Z
 8PH4Bs4/WqQoBAAA=
X-Change-ID: 20261118-adreno-scm-fallback-8cb94180f48a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=3878;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=awtkyavlgGWSAyT66OKXjEU1Y/a4zWSTFO6WDgjxs3g=;
 b=toWvvhXbS/Ng5gSxCqKuAZwLZt9WHZ9GgsEw7XDOrR9QDHIyJqF0l4LHEtvxa2PuQft/9SIvo
 yszVULaBxLhBtZ2UccXL4xWAf5SGb+a5hFj96qD1nTJxRqfnAqzd8gn
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-GUID: tOWfwbIH2kPwcaxJUks_5A1Hg1Ami5Jl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX+AA/z5h542cF
 VXub9P95rSibqf3TEsvc9JG41DPoqN3vR1v1eXvJDbk0EBQPZP0EfNgR8ArCz21+JHBKLGZn0rR
 u6mingXD4jxnhVC8FUYHr17s9QhrUvI=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afda357 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=APfxL9u4uAOGEWhvRr8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfXxB3HAmDVVlYb
 FgxY47RlTlMAjxCwmR1pKvYyolKVH8p4nw7jFK3ZuvxYDng+j5LUA1lwWNba1a1XwQfoW1b8Z40
 EV1cgoRoxXwCQaFERX44snbNrkiUhen58PEJC8dHuKDKDglp7VUr019S8hciuv9wJdayBMCx+ou
 gBjhgwENRkd22Dw+ki/lAMbWT3o4BL6LeHG/62c2LlPBh//piC63NmQK3BFuUWSEOdZxawcHrNm
 dV/mKBbRT7FfrIPe55vAiprQl7X7Im0blkJpc2uy7WXn4ejj+a80DdK0Is6rDvd+IW4qKyo6YaD
 rBrNs6HeeV2LFharM1SRfO+jw+ceWDMaU4Zm9RgIAVTFD1/lyHI2rGum7I6k0zfQxsxZZLdnvs6
 LaxYyjQHvLAzXkDQttzsm3hJyU+N/3mqO/xcta2BxZxmx1apNXvkE+oH1xj0h/2YQiNE7nagb+8
 KhxetR2A3X9FH9HuoYQ==
X-Proofpoint-ORIG-GUID: tOWfwbIH2kPwcaxJUks_5A1Hg1Ami5Jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

Some Qualcomm platforms run secure-world firmware that does not
implement all GPU-related SCM calls. Two missing calls can leave the GPU
unusable, in different ways.

On A750, A753 and A8xx GPUs, a6xx_gmu_secure_init() asks the secure world
to program GPU initialization registers. If qcom_scm_gpu_init_regs() is
not implemented, the call fails and GMU resume aborts, so the GPU never
comes up. Separately, adreno_hw_init() relies on
qcom_scm_set_gpu_smmu_aperture() to configure the CX SMMU aperture. When
that call is unavailable, the aperture is left unconfigured and the GPU
command processor cannot switch pagetables.

The first two patches add an availability query for the GPU init-regs
call and skip it, with a one-time message, when the secure world does
not provide it. GMU resume can then continue. The kernel cannot program
the protected fuse register itself, but it still reads the register
back, so fuse-dependent features such as ray tracing are reported
correctly if an earlier boot stage programmed it, and stay disabled
otherwise.

The remaining patches provide a software fallback for the SMMU aperture.
They describe an optional aperture region in DT and add per-GPU register
lists for programming it when the SCM call is unavailable. The fallback
points the GC aperture at context bank 0, points the LPAC aperture at
context bank 1 on A753, and disables the other apertures. When the secure
world supports the SCM call, the existing SCM path is still used, and
platforms whose DT does not describe the aperture region are unaffected.
DT entries are added for Nord and Shikra.

Patch 1 is for Bjorn. Patches 2-4 are for Rob Clark; patch 2 uses the
new SCM helper from patch 1. Patches 5 and 6 are for Bjorn.

This series is based on next-20261116 and the Nord GPU v2 series [1].
Patch 4 needs the A753 catalog entry from that series, and patch 5 needs
its Nord GPU node.

[1] https://lore.kernel.org/r/20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
Puranam V G Tejaswi (6):
      firmware: qcom: scm: Add qcom_scm_gpu_init_regs_is_available()
      drm/msm/a6xx: Don't fail GMU resume if the GPU init regs SCM call is absent
      dt-bindings: display/msm: gpu: Document the CX SMMU aperture region
      drm/msm/adreno: Program the SMMU aperture when the secure world can't
      arm64: dts: qcom: nord: Describe the GPU CX SMMU aperture
      arm64: dts: qcom: shikra: Describe the GPU CX SMMU aperture

 .../devicetree/bindings/display/msm/gpu.yaml       |  3 +-
 arch/arm64/boot/dts/qcom/nord.dtsi                 |  6 ++--
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  6 ++--
 drivers/firmware/qcom/qcom_scm.c                   |  7 ++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  9 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 27 ++++++++++------
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c          | 10 ++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 37 ++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            | 21 ++++++++++++
 include/linux/firmware/qcom/qcom_scm.h             |  1 +
 10 files changed, 113 insertions(+), 14 deletions(-)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261118-adreno-scm-fallback-8cb94180f48a
prerequisite-message-id: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
prerequisite-patch-id: c05f94606aaf87c23ee9f615c2c003fc6a76ee58
prerequisite-patch-id: af5ae392810d6e5e6faea17f4de1f2d067894d37
prerequisite-patch-id: 9b506be1f9a910d8da57d14d42d45ab2a2a52fde
prerequisite-patch-id: 5c8cbb1bd55d50d3f816c0ddf9c2edf7c7ec4195
prerequisite-patch-id: 01f6f94a2887d2217b5e27b84638f8ee375070ee

Best regards,
--  
Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

