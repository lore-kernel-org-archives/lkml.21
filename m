Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449569;
	b=AAQPM7c4VaVPzrx0Smh/DFK/oi9qh+tWKNj1rxWjX8/ayT0pEGxJMKj2PNI34iI8yRPj
	 7ne3A/M2p8MuhFNT5xwn8FzNrYQwiH/MqcuIfdpQY1XAp+Pv6ivzSiee3DV+ag7Agi0q8
	 jbLisha3SZUYRgb868VGmHO795XsY2F++b+jgBUdXTY0w2S73haptN51xF2WIsjex1y+F
	 VDp62OzgSSZCWYpGPYuqEaO529JLsdOpgP2LhNVSaFg27gHgB3BI/H0sSCiJKBy+nhrg2
	 r2MGrNx/rjgVtpUMJJ6PtBfZllYiviMf2Owx4JV2RGSmJF47F8RlF6lSwo6929WJlVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z1gOcE4sJDHdxNv2xjdQJHwE41dUt343uBhIQUVlSbo=;
	b=fDOT85dlKuOKmKs8npe6VXjPNpsOZDDb1vFM+MizAvlV7LjYnJuzjUvusr3T8Zsr9w1P
	 01re0JxZeD6DX+tH6H/wM3HKZCyeIyBUEJHjK0Ru+ZkzGKLPV9CmMkjE+w0aEmFESTUT6
	 I5sZsvIeCqV3DVzgsRpBKrLN3IobK5dEESLo+i/GF4aq9wfF3CpNoy1iI5HGQOjwP/YmQ
	 BDAM57WhiYq5bI8qO7T4LWiDh79UoF+ljsZ5LYhRC5ahrwVubQx9C/mm4smSEX1VMOvsi
	 Y1Kllv49kOtndYrHDkVRfpMa9atG3+mYqUoPPQ41XYrCeh+gr4c7kSmswXb3695KEuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyE4WWr2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F396606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NyE4WWr2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF781F000D4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449569;
	bh=z1gOcE4sJDHdxNv2xjdQJHwE41dUt343uBhIQUVlSbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NyE4WWr2bYRyPrtQ0BjND99uXDUVHjV+msu5AQC0qgAw9hX/r+VNrMLcx9T7n81fe
	 KpKL0RkZox1E86XW7DiiT1SQPvuXfKfEN0AX2YJWgJL2HQHwyGXPfkAdDr3e0Sm1v7
	 CTL60zgorXfY0BW9Bs7JUIiB4+PkhBjmBbNpl7PHIchzibkMaGHvn7oFXGHm9tJi3Q
	 F09Dfj/3szF+1Af86s15Tzpu7ffaRvExTQBld/V4GjVbowyoPQojKTPKrCWYtq+y7s
	 0lTKmCxccJgZ15Hkq/OPevcuuZ5UDqD54fOWLadPibHRFirQpl6nSMXqwdJ6tdz2Ls
	 ldSfzOa1P1HHw==
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so2336687c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:59:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGOP8odiJuSnbfpTCCRBUE1g+aMyUOAUWCosqGo6Q8ger3ctYy18Vc+EMxLBDttS4KSwSha/zp8H1FDqVg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9clVEG6T8tfGzeQg8JL+AQtktgYxG8u/Gz0OKI6AG72ZBXOw3G
	mvt5DKbqvkLBK17pELAgouJW046YrkZn7Yxm7cnbyfG7QG3llDl+bkCIcsC9vtce8I/6fNUrX1e
	aKcr07VY2X4Y79F2hkuZVd+sjtR/KLw==
X-Received: by 2002:a05:7022:1587:b0:1b2:6d5b:36bc with SMTP id
 a92af1059eb24-1b5568efd35mr14176365c88.23.1795449568635; Mon, 23 Nov 2026
 07:59:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <confirmed-20261105-38-2e09963f1b23@gmail.com>
In-Reply-To: <confirmed-20261105-38-2e09963f1b23@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:59:15 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8cH0mYNqneRvrLnXoiYfDajs2mC1QDQNLFBbO_h6jzDg@mail.gmail.com>
X-Gm-Features: Aa3M54ouwi-KBChskOnrEwzeqY5DzbDhQkaCtvHg-m39Wxz8dX26BLU8Xe3rDyA
Message-ID: <CAAOTY_8cH0mYNqneRvrLnXoiYfDajs2mC1QDQNLFBbO_h6jzDg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Keep the mutex node reference across
 deferred binds
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yige Jiang <yigejiang86@gmail.com> =E6=96=BC 2026=E5=B9=B411=E6=9C=886=E6=
=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:20=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_drm_probe() acquires private->mutex_node and releases that reference
> on probe failure or in mtk_drm_remove(). The component bind callback does
> not acquire another reference, so it must not put the node when the mutex
> platform device is not available.
>
> If this bind failure propagates through component_master_add_with_match()=
,
> the probe error path puts the same reference again. A bind attempted afte=
r
> probe has returned can also leave the stored node without its reference
> for a later bind or remove.
>
> Remove the bind-time put and leave the node reference with its probe/remo=
ve
> owner.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
> ---
