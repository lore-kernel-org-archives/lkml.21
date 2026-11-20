Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186705;
	b=A6jSkpG5WizrWK2fc0Bc0hLug23WPoU6gugZu+BhvmQqUwoqQKriCf3BJ+XabC6HxNrr
	 Eo34fmqOBxTobbdB7c4OLcUZAVzm4SsoK1nxjo+5/B5TpnFDsVISFyfejoQ3rEFr1ZK5V
	 D7bOAoB1F4d/RpFsDrQ5sMrwYq1riRWPh6M27+ihMGcrf0KzgzfSlwMKo93saSSgkwcJb
	 Y3G4YDYxmJOpeBgC5lJZryQA821sAfa8jwJC/4665zcHrSMdfTkxUniBcG4gjWhnd/Ifx
	 Sz7OLioeHRcMhzR47t5Az0YkvHollpJ4/gbw24EDX1U6vhKgWmbX5+Ze1r4uA5judYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186705;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=jIxmtd9iZIt0rb0n6X/c8Zg9JQpUevuLYYf4wsCOBBw=;
	b=RPe389TKgw8AgkUahz5a/64qpEuevEcvYGbhb8j/DlsCNG+tb/resgQzfWwGHarBUixJ
	 NVfjYoaMJiDby00+h3Hin8IWGpxSeslfJ14XEKDzIKaCOMTcB8eLIiCSbrDOe39spIJ+g
	 8qA25Kip9LT0b2mKx6Gv4GkuJlRvQWb2M1SN6KndSglPIVe2kYm43Em0VgYS1WWZQ7hju
	 Lko09o/uLGxEWI7pt1CBFFFAfZOk6KpWOVAoml8GUe3BurQKuXbRVtpxQUHfLBWcsLFAI
	 gQ2MTyy6wghrrshpUPh47W+YDkN+igN78UuplLb4aMfxYNHNkPt0KPhiGFX9ySXMnUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSJcOngF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E2560A2610
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mSJcOngF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3091F00A00;
	Fri, 20 Nov 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795186704;
	bh=jIxmtd9iZIt0rb0n6X/c8Zg9JQpUevuLYYf4wsCOBBw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mSJcOngFEB45cFdlj6UIQPQX588Dn990Jn4xGTO90vpyV9/AbuFQK05YRH4nwwG2A
	 981zvknFMX+1c0Gga1/hh6q1DiILhDj6j699haHxzDixvoz/IJMpv0KRWwxCWOl69c
	 o4QWHaHPE1ujDs19rTOJqvRefvSdU1Whd1fkOET1Ta1d5FR/zdpkP+2FEuHx2FQ8vW
	 hi9tOZQs6dPfhaRUgf4SrHl4v2ldnw2NEaW6svQVn5RsxantEDdoDYK9SLXgmvmXTu
	 PMNBrrsyVPfXR1Lz+0XBKH091s0+2DI7ZEIXVJJdTLSr/xUZfcXfcIrw0gAauXnaEb
	 cLVG16s1Vi9xg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Fri, 20 Nov 2026 08:57:36 -0600
Subject: [PATCH v5 12/19] accel: ethosu: Restrict dynamic IFM2 weights
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
Message-Id: <20261120-ethosu-fixes-v5-12-52d459acdb84@kernel.org>
References: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
In-Reply-To: <20261120-ethosu-fixes-v5-0-52d459acdb84@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

The validator bounds dynamic IFM2 weights as a 1x1 weight matrix, but
did not enforce the corresponding kernel shape. A larger crafted kernel
could make the NPU access beyond the validated IFM2 feature map.

Reject dynamic-weight convolutions whose kernel is not 1x1.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v5:
 - No changes.

v2:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index e3cd28c02e81..1d2bc5d4a37a 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -606,6 +606,9 @@ static int calc_sizes(struct drm_device *ddev,
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PAD_RIGHT) ||
 		    !cmd_state_reg_is_set(st, NPU_SET_IFM_PAD_BOTTOM))
 			return -EINVAL;
+		/* Dynamic IFM2 weights are only supported for 1x1 convolutions. */
+		if (ifm2 && (st->ifm.width || st->ifm.height[2]))
+			return -EINVAL;
 		u32 stride_y = ((st->ifm.stride_kernel >> 8) & 0x2) +
 			((st->ifm.stride_kernel >> 1) & 0x1) + 1;
 		u32 stride_x = ((st->ifm.stride_kernel >> 5) & 0x2) +

-- 
2.53.0

