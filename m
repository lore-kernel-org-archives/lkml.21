Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370051;
	b=sqMEOpb15ntAdtOdH5OwYkdbHfgRov2OtynXG6dj+HKdOavyjmMH6/tJnq/q+tvlA3QY
	 52wXpe2CCDS5IA0jn7ghBNvsRDtEZC7q1B0GVCEu1VMiAgoyc2FX6wqC5NJIGM6OefcNn
	 JC5jyv6835/0das3K02Tm3TNTUU34k8XNwmxHNEiP7WiW6tEtiymu+bK4HqEyALYIQwsg
	 urQTZQ+5A/psvJwykF0Q534VmQYty/UVT4OrMaMQpXfJGMT7DqlavpR/AdbqTGP2GotAe
	 xY9YIOyaviJQHpJgAE0wTlz+FmehuxecVKeYXfUPbp0jNewaXVxvny2M2mwncuhcAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370051;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lqr2my7RK1rlIMbBVQfce1d8JLq0RXfqlMr2oVJYgIw=;
	b=NcpZVhAuqNKLBUceJZUf16YR6fzj64EA0Q4cEWv6VKFao/TK9fE2Qqn+4fjqlR7lnfVE
	 TetazgPqrXcZZuxpdc2yN7A+TWUBYfj8QstmJm+pliHtN3oknIm7g8XTBJBiseTIV4iBh
	 /OA51pG1a9mc+dxh5hsgEWup53xCG8C850F0GscFuejAxIzDj69DIO35AA3wQwr9BQ5+w
	 rWFC7DKx4Q44kCFiwqk6ZP4kgVdaY5sA3YifVx/BClByVs9eBRidKak7RyAQyi0Cbm9OD
	 LT8lZU5M3F4BfuRB6BHhIFea+4hi+E1IcT44D5f0eesf/K8k39Tgg/yN1Z7Tfgkw8hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eo4HcbdH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49152606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eo4HcbdH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD991F000EE
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795370050;
	bh=Lqr2my7RK1rlIMbBVQfce1d8JLq0RXfqlMr2oVJYgIw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=eo4HcbdHgBVpemzOYf6oy5CgelFnR8d3OVCpLJNniLJk3xN5NwmFhvCdpciT8oVDI
	 C/FQPq6UA1SqdiAZZToK/b4nxVBiYpEVtfnAifv8JTeIXmz6On0l5/WsJl9oNsP3P6
	 awxA/khgreVTcq/A6tSEnSKw/daJ01cXNa6wmeYGMEiBKudPvDi/ooy20J+ntFPt58
	 dKMhLWld7BcM/bIjhoA3dcZ0xMdgMAEJCR6kmKkc1XlhqPbmbRvS52TN00TcoGvZTx
	 tJ3xd+3I3s35BMT2Il98iyTwjjuUwysNC/5nQAWLziGHUCfTAOaY/TWGXLvyb33Pjq
	 nb449gghN/cHg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so20195501fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:54:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG+N4g5/Yy6BWSCSK/8DhIQzwKBz9A5I4sQ70oFLpbbzcTjg62fVvtdONjWTk87MKkkGK93Rjba2CmYakY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bWNiwzGAOn+m/5eYkBMivwiqRsRnbSbg3oOHfbGHA+hlXZfrX
	cAibtiBFt6NRGo8MiukGfoRd3pCtoKxDabfqs8bxm/wTiOA+vHjf3hZsd5CkMcn9xM1LOc7KfWO
	MjX5TCTtnf9mzXS89+3rfj7MlfhZGWWI=
X-Received: by 2002:a05:651c:1593:b0:3ab:4eb4:5ef5 with SMTP id
 38308e7fff4ca-3ae7f9d5e95mr25703721fa.9.1795370049024; Sun, 22 Nov 2026
 09:54:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com> <20261119175437.2520400-2-jernej.skrabec@gmail.com>
In-Reply-To: <20261119175437.2520400-2-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 23 Nov 2026 01:53:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66dXR=Z9FEcudG8NL_miWWH4uRvwg-RYpkTJnSrx3NKwA@mail.gmail.com>
X-Gm-Features: Aa3M54o38aETzb2mUkHD0BeP41inxjrl5JHrW3hwDkzzKCE5Y7QgUCWC98J_8iU
Message-ID: <CAGb2v66dXR=Z9FEcudG8NL_miWWH4uRvwg-RYpkTJnSrx3NKwA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/sun4i: Reject fractional source coordinates
 without scaler
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 1:54=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The layer code programs the scaler whenever the source rectangle has a
> fractional offset, since only the scaler can apply a sub-pixel phase.
> drm_atomic_helper_check_plane_state() with DRM_PLANE_NO_SCALING doesn't
> catch that: it only compares the scaling factor, which may still be
> exactly 1.0 with fractional source coordinates.
>
> Channels without a scaler would thus have the non-existent scaler
> programmed instead of an error being returned. Reject fractional source
> coordinates on such channels.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
