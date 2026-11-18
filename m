Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986228;
	b=ZJ4M5Lu8C+y7jTaR2JeSsVvfEA43Am4Keqv1B7zyQO3g3s6WETkhxS0IHPjWb5dvY2BT
	 ZjqsRIPhdq1TpK4oLi8Q39Xy5SdNUxBkakaOTpSg+OWhe8WXN9H360u9Kkq5uTLKwV5Kf
	 WEADbZAAzN/vBQaRzkrswS8J3fixo1y75ELE567Zl2UXycbxnYujzsYHh8//f/goi53HX
	 60b7tLThPN9U7pu02mllgslsM8ewfyCAG/hQkHQ/or+kIW5mPSVOhVHlOz4TiwtHD1+6K
	 30rvfPsS8naSWdpgUNwn0aBlcdoVieBUWkp0brFE+GYNZZ45Y5B/wjtEE3J7JCRJYaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986228;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4HGkfAVus6YcI7VI/ZJ3dJp8pV2R3bXnKS6/VIEVFFU=;
	b=u5EXZccw3IFP4Y6heuTsdbFZoLnjy15QrHuxGX+e9/7HT9RCzkMFLCWeQXWZCQ+eA+sp
	 Lca7hFqob+l1JABJQt/K16hU4S2pcB3NUW5mluxZLjM2GiYhCBV1wzQk+X1C/+FZ3Nd6V
	 ilkUvwl6j59uJyCH6NWE8ZoJY3XWPOCkS5cBa7vqZkoJ2E0lycnEfq9uUupBlonALOmgO
	 fKitwAPd3B5KpBMU2xCaCxkzRgmcZIJZUnVLxmrjoZUw4ArySxLQ+G5OD4LJRjtrclHzn
	 Cy6K4yRaTZicGri08Q0gZ6lfwzxeNHlUXE7x8CAh4W+kbfFoGJtsaw1xB482vKYmKUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsgEYDzG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1610606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IsgEYDzG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10611F000C4;
	Wed, 18 Nov 2026 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794986227;
	bh=4HGkfAVus6YcI7VI/ZJ3dJp8pV2R3bXnKS6/VIEVFFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IsgEYDzGQiJjT1qC5qKJvbnaQejQHzSfn5/Z57XccP79WXXeIuiPHyJkbxFCfZK8j
	 PFP+95Kb8AiloI+ZoPZnPlasyoJ8MkgN/1DmcYm0rf2vDlaHvU6jB5MPgBfysXiiQX
	 Sw6FHkbsdFJkQY17WYDmzTgNiqzsiDDBo+1m9SJECuYb33sDqf4paki5NnbasMDkiI
	 K1VSR40o3IzmT9aHQLCPEJaKTn2ier7LOQYKB9sITakAyF2+omw/KqpiaxqHvizN4Y
	 rYfxSauwTnZrDFwfDR8L/K+LAGxfSI4+NnA5NAS3f9UTbPKs6Vm03z83HaNnSHdyOC
	 2W4+bULle0z5Q==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xTZui-00000004UkN-33Gh;
	Wed, 18 Nov 2026 08:17:04 +0100
Date: Wed, 18 Nov 2026 08:17:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel-simple: take i2c adapter module reference
Message-ID: <av1Q8B27DkF8Iv2W@hovoldconsulting.com>
References: <20260716132334.1565183-1-johan@kernel.org>
 <anx_MPm2Y0RVwZ9h@hovoldconsulting.com>
 <avw_XKo3EzosfyIh@hovoldconsulting.com>
 <CAD=FV=X5DTqanxUBt9KoVh_93u9EUQm8_B2mnej=+-nxpA81gw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=X5DTqanxUBt9KoVh_93u9EUQm8_B2mnej=+-nxpA81gw@mail.gmail.com>

On Tue, Nov 17, 2026 at 08:24:53PM -0800, Doug Anderson wrote:

> I took a quick gander. One thing I notice is that earlier in the
> thread there is a Sashiko review [1]. It seems to point out a valid
> problem here. I'd imagine that if I land this patch, I'll get a
> nastygram from Arnd and his RANDCONFIG testing. Am I confused? Is
> Sashiko wrong in its analysis?

Thanks, Doug.

Yeah, I took a look at that at the time and I believe the LLM is
mistaken as DRM selects I2C since forever so the driver cannot be built
without CONFIG_I2C enabled (and you'd have the same situation with
the panel-edp change merged in July).

I started cleaning up the I2C mess but got pre-empted. I don't think
that should block this change.

Johan
 
> [1] http://lore.kernel.org/r/20260716134901.05E221F00A3E@smtp.kernel.org
