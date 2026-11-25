Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795650515;
	b=tYt1GIb+tdWbhDPNFfDItMPekvKdJaMJ5ESHepvcsVPUHpDbLsV/CiR071HIe/kbW0JB
	 ypP2L8+ggzJ52jrLSGpkJQyS99h34MxkDdKM3bPMFjvitzvJKcMwjFod+MLdUeBH7dr0b
	 5iQY8GVvHgXzwJ1FsAymYXG/OZGQh1sLP7A+O1dwaJ2wOhqeJ7drCPWQfBoiOjx4A408k
	 5SRRU7WmV5Ae+H9m+qtCoZOiQfNE62+IBJH/eG6/91vqRgyHCxPTq5Fi/x467+unBuY4s
	 sjPdIT1gYPR2KsKQANQ80wKFvDoB34t6E8rL2KoA3BtN6GSWcyr7R08TPnMKX1Q74tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650515;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=DTx/h20UDlrrJsR+uyfD2CGTZInGwh7R/wLmVCKWLDs=;
	b=HmkEhiXSSR/ee2+BVwCQPPneUpoBz8iDL9/lFtBt0+8QKZlIZvv1pFUyOg2Q4TnlvjK7
	 MtllsraAVdpzYveljnmm91uhUze/2mEunKX7hIKiItebL5fWX6vk70a/pW9hVPBNDTgvP
	 NxEYd7ZYkbtQmH+falwhnZPY48y2sYnxEMkAhCD6xjUd0su0z/c4BpHlIPUG6d71uomwu
	 nS9eJvuQ/OKK5uvkyMG6r+adYWyjA+ssBJ2BqngD0Q9qcQ1WHvxWrzKRrRCFLBJvbE6nh
	 SVlmEAI9O6QLvBUGXwOV8afHD/j6VpHbKIzcsVsPY/HQNeiuzvVraBYshgINt5K/oZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftZspJUI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77652606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftZspJUI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795650514;
	b=ElA3+xkol5Gcia/2sPDk3/dvJUJzXk7x5aPf8zuSyyE2QvAMbEBI3gD1gIjxm8ybXSHg
	 wUnWLFC9LVEsNSje7N3Pmef2cjBh/7uC4C4pTPJ+r6Xu/+5l+8tZBNz0XRkjsujisQKX1
	 Bm9FoITFUittT6wBUm1FglR+LHnchDZruUQkMB/uBetKH4z2iwtRUiEXRtSJWW6Wjr0sl
	 6NBjbj8ZdcOvj+fDZm9EvlNVArGLc2nrnnFnQ0oRVtH8jk81n4JtC3n02PUbCeJgYL2vn
	 v3Hyu8IEflmosdFF8zQE7BFUNpKPLHvpaAIwH8aqaUxiax5+zQNEWQWOEOs/V6F2hnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795650514;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=DTx/h20UDlrrJsR+uyfD2CGTZInGwh7R/wLmVCKWLDs=;
	b=3HUUd+mO0S9B8+z1AMvrLMCE6QiO2aSYdzvMPzwR8Em6Savvza6WE4rymEzwUXzIsDko
	 TCsRvl20yMFB/Pb7d9uRmFXs5QklkamLjL3PkPm3+502V0xziDMR7fiT197XLAEtJrT0k
	 b10sV+C59ZzlV8zR2D9EJUKLkBAU/4dEx9f78SvB0gTZDDFt+bAvCKNKNf30MbpuMugHG
	 bzowdjK+YSyMfCAeqq4aR0Q0+jweCn7F2esPIq/VgceF+KKBL9aRenAkUxCrGwVg4rQVj
	 kfWS/P6RmKTLmKZyi4hJTcU4OJurat8NrHLJAXOB/gcRMju4kZcSva3YalsUR2JjgoA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF2771F000CA;
	Wed, 25 Nov 2026 23:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650514;
	bh=DTx/h20UDlrrJsR+uyfD2CGTZInGwh7R/wLmVCKWLDs=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=ftZspJUIKCIpxCKKWmsnJGVmXzTA21RX3hiFMsiQDQfpPhl7mXu78bOjT/wkBWyqh
	 ZSjZbdI21SJXli7rcrF631LhQg/EDaa2nHttlVXoagz70GeCAliHA+6CQsSE0GzWbF
	 R1D3+Rq18Pi/nS0pJFTncpsmU0EXph6G/UylzjkKTbL01bh+ejzfnHf8yjnhFmyRwA
	 P7EicbsAbpsk1M7tyQEYeEOu38UXSVzCKVa3A0rBvGdBJYIOq4Lq/NGZuFnAWKvMWC
	 EkxSxaweQJgPf8FXYqG0JMvTE0qehucB+iG/21MLw59NRskt+TwPt2Vo0G52GVTjVa
	 SBnKdljAK3New==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7B56E4D0B6;
	Wed, 25 Nov 2026 23:48:23 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: mt6358: fix MT6366 VDRAM2 vosel_mask
Date: Wed, 25 Nov 2026 23:48:22 +0000
Message-Id: <20261125234822.94684-1-iasnezhkov@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650502; l=1559;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=NR5lTAGqEZZZ+e0evyu7yj4VBUXqt2FNsTxclnP6kJ8=;
 b=U30rDd2xT5dzziJ5z1nFS+q2oq2JPjQNp/vgG3PCxQ8HRFoChmiCTmCUY5fbDqPXvN9a1EY65
 vOV0au3HUU4ArN+3oNOWH3Xs7QsTAftTpHXQWWemy0OL/6BJ8GVJStW
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

mt6366_regulators[] declares VDRAM2 with vosel_mask = 0x10 (a single
bit, bit 4) on MT6358_LDO_VDRAM2_ELR0, even though vdram2_selectors[]
uses values { 0, 12 } (0x0 and 0xc) which live in bits 3:0.

MT6358 in the same file (mt6358_regulators[]) and MediaTek's downstream
MT6358/MT6366 regulator driver both use vosel_mask = 0xf on
MT6358_LDO_VDRAM2_ELR0.

Change MT6366 VDRAM2 vosel_mask from 0x10 to 0xf.

Found and drafted with an AI coding assistant while auditing MT6366.

Fixes: f0e3c6261af1 ("regulator: mt6366: Add support for MT6366 regulator")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index d6a0ec4..1d62c25 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -604,7 +604,7 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 	MT6366_REG_FIXED("vrf18", VRF18, "vs1-ldo1", MT6358_LDO_VRF18_CON0, 0, 1800000),
 	MT6366_REG_FIXED("vaud28", VAUD28, "vsys-ldo1", MT6358_LDO_VAUD28_CON0, 0, 2800000),
 	MT6366_LDO("vdram2", VDRAM2, vdram2, "vs2-ldo1",
-		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10),
+		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf),
 	MT6366_LDO("vsim1", VSIM1, vsim, "vsys-ldo1",
 		   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00),
 	MT6366_LDO("vibr", VIBR, vibr, "vsys-ldo3",
-- 
2.54.0 (Apple Git-157)



