Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017028;
	b=2erY0eU8CUWpgojxhSfoDI8ALKBXlJLnkGYvuZM0P3+7W4163oxPJoN7aITuWqwE7kFS
	 9MVO+cEqedLR9gt4LS6SOYOAKR3VM3sEFTkFsEIpRUxHvYsYw2b2l74XywpaDnwJfdsMU
	 38mwFqUDgq7+ZXiGd4mfSdw/cwVQHtTQPkmhxQvwoa8Nwq6WZOQzwhQoIE+QoG2JSJlyi
	 U0HksEn8hIJZm8zwQT5m5VVMxJURPGNDGtzAGvN6oNbLlMeM9wNqGQb8aW43AWdwxIxUw
	 rpdo1ggDJTGyBLgii2x3b5Ih9tzSieu6vy8EJIu/1pDHj/8QskC/eEUMta3kjp/9EhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
	b=vRNm1CdhA3CxesBZEe8LgbkmX7WDTx5xMlXrOvoCBvT+Ybal2vrvHcOThNWQjexpVz3s
	 Ecj5sang0P7PAmP4GpkON98ZH7i9Wz1/vPknOEs5BfmBOgew2UiFxEEiZa48A/AEuLcuC
	 56T/uZRynsJ+7OGIQA4uf1Y3b85Ll6fRNqP8pLtRs43HA8a6LUhNzNuaY7zRL/xhtoNOG
	 TKGD6H6rqQPxmcCCNM3oeRyr8fxxHC7ATMPF7W+DK3kkZfo5P7AJUwHOSWBPVlX4cIkLP
	 ozhtBZZGGlyGNBM4VshT2lcK2BwWNrRbxGUwfq/e9IGVdECh5UqMuQaLWSvrezdRBGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSO35Hm6;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90616606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90616606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MSO35Hm6
Received: by mail-pj2-f6.google.com with SMTP id d9443c01a7336-2ee1c8e6fecso3367755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017028; x=1795621828; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=MSO35Hm6I/4kMAm6rw/yxcLf4rXYh1V8nShplW0798fPwvqCSiPt6Q6viUQuxOWdSa
         DyUQrEukZoLJ6rxQwsHQbvzI89LmfNKBmSjiwWbwXEHGbmhvAudUjl+7HahYcdqoE67W
         VB2ehkQHIxUfqpiD/4BlgAuK1gu1LrsWI7Ml1ahXovIaXVDUj5OMvIjAvFcc/XOG4iFt
         eH9VteH5wHSfuh7G3AayJU+egp6im8+fKsbpPe2uxVWftUhmK2dIJtsxDzVeP5hPU67D
         t1h5lsPSrR09qZErNDCpKhBFmtChIoTnhCdgYBkJcW4iYINPBhjETDS0Q7y08j9EJLcj
         5PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017028; x=1795621828;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lLupD4z98CK9UrD3eQfsjdZUJgyZTecsH4A98HzZRA=;
        b=H42lktbsuAphcT8W5PScUQ8xRxgOaDu48g8AzE/mgnyh8Skip70wTJXJuOZCH5/KwO
         4QPBuV1JY5D2LlhNYd5AeNHCpfx/vR7YraDE7uj8P/xf45i1g7m0M4gh3R4OZInlG/sX
         8WOzdbnEzZVVQjzRT+79UKJplDi7XiNKvelb/kAazIKM5d5PMFgvd1E6r81d6GSWHdC8
         O2XR3vQM8n3ijxo6onjioBlUoUqb15Ii8joCgFkJX0GZXlfdQLy1Dtdo/pOyRniE7P3E
         w51VgHNbHs45mUtKL7EKPX6kc2p6fZDCCjj+Xo8tfN81erq6JlMJjJGvC6J4grNwieLx
         bYgA==
X-Forwarded-Encrypted: i=1; AL+hErEbivp6pt+uX5JIdr+O2VQrRydemnCArEKzU9A6isskA91nUJ3rG83hVSF6+jSnu7eN96dq54Ns8aPezVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lAmSJwS3KpIMBcWpAa1Q4/Mmd+bVIYFy2fJ8Fti0wuSBj7T+6
	yVf/fH+fLbuIVYC2x8qc9QdxYKu1jAcGbYE5bjpOUVAoTvyzr5xXnRpc
X-Gm-Gg: AZFdTZf6i4I4rBdBJxyihEk1uyPnD3wVSA3/WNGtakHMNbuo8zjRkJQdy3cKmNw4J35
	3WlUngVkh6RZ+j7lMISsdgwc1hWpXZccxVNGHqeGo2m1jRHkPdqXhv+bExUlymKp/tflstZaL8Y
	Em64X2+Vs/vVP4PrpZI4dxoqh1uCnXQ3+aSRD7y/ZM3GHLljzVY5VM+5OUY3T+ToW2/Kn4atpcL
	aFVu1IAwVLN0Jy1Djo2iJKQvocSMVc1ok1riGJOppugHBkSyTgMpr5gcJpyZQ4bPyGOQBLqjKtn
	cAgM8rjv9MjBuXQfWdUJL4tP23Wgq/DpqwXQeWvXYEoOJp2Kg9V9iEIGk3+pN9O0pj4L3jG7YH9
	wsrln5gIqtNg+ce2kKL+zpI9WyMIZqHOxPhLF6wXTOX10xrzI9xv1/pw/iVRu9OTvcHd0sW0+Uu
	UZJkmLgYkEsaHx8luxcd7SBL3VmEtV5UjIrC4Lb+/+tU4JJdFc55MwxgUgrvNb466nUYQxtv5V4
	KEWgnm/mbyjkUymtaKdi5I8akVJo8Jt2+yD56RBKIdZObfrnQbIbXkvS240GLuSrxU1Mkawg75m
	6WU=
X-Received: by 2002:a17:90a:dfcf:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3b3d07c9ca5mr3201351a91.43.1795017027692;
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Received: from localhost ([2403:2c80:6::107b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534ae0edsm193214a12.21.2026.11.18.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:50:27 -0800 (PST)
Date: Wed, 18 Nov 2026 23:50:21 +0800
Message-ID: <aee275aa2ebf093d8518e53c5d264064.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 11/17] drm/spacemit: add Saturn DPU DRM device driver
In-Reply-To: <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
 <20260809-k3-display-v2-11-327d7910bf71@gmail.com>
 <e492222feabaa5c72229c93ce75f9500e4346da1.camel@icenowy.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Icenowy,

On Thu, 03 Sep 2026 20:07:32 +0800, Icenowy Zheng wrote:
> 在 2026-08-09日的 21:14 +0800，Cody Kang via B4 Relay写道：
> > From: Cody Kang <codykang.hk@gmail.com>
[...]
> > +	drm->mode_config.min_width = 1;
> > +	drm->mode_config.min_height = 1;
> > +	/* K3 user manual: each DPU scans out at most 3840x2160@60
> > */
> > +	drm->mode_config.max_width = 3840;
> > +	drm->mode_config.max_height = 2160;
>
> This is for the biggest possible framebuffer instead of the possible
> scanout pixel count.
>
> The width here should be based on the maximum allowed pitch of the
> display controller instead of the single-GPU maximum size, otherwise it
> won't be able to drive two 3840x2160 screens in a side-by-side
> configuration because this will create a 7680x2160 framebuffer.

Thanks for the review. Agreed; will fix in v3.

v3 will take max_width/max_height from what the RDMA registers can
address (a 16-bit byte stride and 16-bit image dimensions), and move
the 3840x2160 limit into the CRTC's mode_valid.

Cody
