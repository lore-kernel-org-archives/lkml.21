Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638404;
	b=IpKVfMezAGNU5nSUZsz/dUMk0KVvrzAKh/9lZTWvpBmd7B9zi2u5X8KxB9U2LPJQ0wmw
	 gjyVz50p41FI26DUf89pEeeRIhDGO92FcyxjSG+Byc/8dnakX2IiFLZ0jXapKKoWVd8Tw
	 rDvrg+nRTGtPxnCpM7OhgEAKpAOT+UxxA3OtgBkRtj3QjQrqSlpLNf/CV0uTxN98p1wOf
	 tSSqfWxZdgyI7/gJ6WOpFfOyYGuIBQFNPYSxGq6Uiv3kcKS6shLAbwxzNx7Og2+XK5wF7
	 QTuYNJs+tdjiARV8m3tzB4cKafbVLtSF9c1j06/LBMHXUCQdRjXsMuVHKR6QHU/Xl/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638404;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dyItsAdwCo4xMj3bus0BCLCIqJPEYeY2E2MYEhkeGY0=;
	b=0KqOGKOKQOJ0FHvaEC2WDoIm+mR4jMwWGAd0mcGues0AX7vsu5pe3+kdNqgeRlbCSs4x
	 M84bwvqQAR8G+vbPMiK576oWo3HibJCXmTvst4hFLPF7AQIm6VG0j0rFKMljF0gigc5gc
	 LcEs14s7caZUG4UYHQxHvu5W9y9Ex30P+xfTCuCtq6odQQRp2GuwTYr6i2kfQe8Z0hkWH
	 XZcfGMKDybR2Jf5qn6Ai7bFlyGI2ZoNFceNMANPYFjTu/azs0M6foeHvsW6dhC3eM8cYn
	 D09r87l5/+RpaX3vYal9tgYbYRqZfy6FizuAgfO03KLfT63JDjCCKAAscVslL6PhmDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=w+r1rJX8;
	arc=none smtp.remote-ip=79.135.106.30
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202B3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=w+r1rJX8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795638400; x=1795897600;
	bh=dyItsAdwCo4xMj3bus0BCLCIqJPEYeY2E2MYEhkeGY0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=w+r1rJX8pk6m7kRJ7LnO+M/5aEticPshtEPxzXCH7DoKPTB/igFWWyttAXpehAcyy
	 3gzrXEgb1l4yWHYkMvdSTq+Btv2PsRlwgyq2abwyY52SI0be70pgU0nRwDh7XbQrAf
	 qLvmCjc9Zl9Sk/wv6nQL8g2MGj8128zNWS1rMN23pxV4ZOLavVzN2s2FC4UIyTJ/FH
	 h/7zadZw4alrwMik9AMRrFueJlSase7iaFq2on5bm/4KJUmHWl9kHd0pGxuVHsNO+j
	 jIJJmK9nF9lQE14I9EJgONbrGjdQOKcLT6oMIxKfSaDf34qVSs5ZY4BGbuezpX8+qP
	 6RUBOCYxpsV0w==
Date: Wed, 25 Nov 2026 20:26:34 +0000
To: nabige.aala@oss.qualcomm.com
From: Victor Mora <vjmoralesmora@protonmail.com>
Cc: abhinav.kumar@linux.dev, airlied@gmail.com, andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, jesszhan0024@gmail.com, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, lumag@kernel.org, maarten.lankhorst@linux.intel.com, mahadevan.p@oss.qualcomm.com, mani@kernel.org, marijn.suijten@somainline.org, mripard@kernel.org, neil.armstrong@linaro.org, quic_khsieh@quicinc.com, ritesh.kumar@oss.qualcomm.com, robh@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run, shengchao.guo@oss.qualcomm.com, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
Subject: Re: [PATCH v3 09/11] phy: qcom: edp: Generalize power-on path for per-SoC overrides
Message-ID: <20261125202615.74643-1-vjmoralesmora@protonmail.com>
Feedback-ID: 122405522:user:proton
X-Pm-Message-ID: 29c171b79d6c124dc6a3f80b30588bf4c7651e30
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Nabige, Ritesh,

On Mon, Nov 16, 2026 at 06:46:48PM +0530, Nabige Aala wrote:
>  static struct qcom_edp_phy_cfg glymur_phy_cfg =3D {
> @@ -1087,6 +1124,8 @@ static struct qcom_edp_phy_cfg glymur_phy_cfg =3D {
>       .dp_swing_pre_emph_cfg =3D &dp_phy_swing_pre_emph_cfg_v8,
>       .edp_swing_pre_emph_cfg =3D &edp_phy_swing_pre_emph_cfg,
>       .ver_ops =3D &qcom_edp_phy_ops_v8,
> +     .phy_status_reg =3D DP_PHY_STATUS,

On my Glymur-based laptop (Lenovo IdeaPad Slim 5 13Q8Y11, X2P-42-100),
the eDP panel only works when the PHY status is read from 0x114
(QSERDES_V8_DP_PHY_STATUS in phy-qcom-qmp-dp-phy-v8.h) instead of
0x0e0. With 0x0e0 the panel stays black.

Could Glymur use 0x114 here? I'm happy to send a follow-up patch on top
of this series if you'd prefer.

This was tested together with a v8 PLL fix I sent separately:
https://lore.kernel.org/r/20261125-glymur-edp-pll-v1-1-068a4d95a12f@protonm=
ail.com

Thanks,
Mora, Victor

