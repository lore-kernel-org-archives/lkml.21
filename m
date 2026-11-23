Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449795;
	b=gub2RBXLIEpxZuWM6gwEyRt6ClC8RF1/f20rdtN17kJ8wK+fsaClE+CLof1+LGazc/L8
	 LQRo0Yc9cvBsEIhxcYglD9HS3r13MkqkyhXtt7G8jp6McZOyqOhEu2Jts2srH66NGIb7s
	 N4kfkfjTuIbrHnOn3O9JtuE6bXrM4hbAfKLQSEv+6C0VlsXzJlt9xbbt9fH2WIPaDbH9Y
	 IYvlf5AZuIjzyQtBl4fQxaLQxSazg2NGXyiQ5nzBT0ZkxyG53guKFZzE+fxHjlleS0Ci3
	 pJBTCgJwieSj5h9Qv2PvYJ83v4rAn4AH2+ZYdAnfx1qxi3hxejOUFOb9b0YWoC5dX/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449795;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LA9T27Ncxx+yiFs4glj94r98G+0HTVpceCAL9vn3vWw=;
	b=0PChGFlEcaQbTdpJ6AWukWtHpg1zWPOb4QoL6jqCDMObt3MntLMrnLfTEUwm5YqqbMZl
	 ZQnFEgQaIWfu9mBsougSCJOncgwn5pxjc60k5aewQATXxWdBdX23yKrBNWAMQT9Rlobh6
	 PgBzeBQEDrOhtxBc7EXMm+4hnQL0hce+OFc/NibSxyd/pdI7jyZJC8NqZ1M07gASStmqP
	 eLQrXb203CAQAaVaIZiBvCfi00DvxyXErOiWyvpGzdbJ7kvSfH7Ib9tzSeDiYFQt8ukeK
	 J1ljX5CydTU+9yolpUJvg3ZCASaTz2mo3AEwMDdi6oMp+CYs/iYspc7noZMhg6UsgbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqHVOFQr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1593C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqHVOFQr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D021F000E0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795449794;
	bh=LA9T27Ncxx+yiFs4glj94r98G+0HTVpceCAL9vn3vWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iqHVOFQrPft4VbHPO76CWA1BpOC8W4aQgOxO3192qIaqhDWkCGOtIb0zf/9957cRv
	 OY85scrKfWlovZrSWtNcS3a9Q8U73Hfbm+coaw4eyVUB9BpYXPP8ufRQ1vqSyifmnD
	 GtKhnQioCnsdrMqz0NNrpXa3I+lDjm/djiJOxcaenqqLRIsMyoPEbvKA0iIOmQ1Mqh
	 E31X06nJhd3iS+BAkIES0Qj+kIUKrBf7FuZhY3tvLO7x6ZOFXEiTju2n2L6cG8mxtq
	 GvbRtan+t8cXskamWaKeYYP9GvQgPhtp4s9+xxc2Rc3UJiBh83g5C7ROESeB/qhE/k
	 2vch88fK6Jnqw==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so4811538c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:03:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHF8gOzX3AK9pbhWR55vz/wXljGY6I0+nonyYlnw49KRjXrfgdsYsLzjvnxZr5DX/lG7lMCoPEOhzIGHOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+or7xAX2AyqpFRZz0kRwKJ7wwU2Pk8xGcAudoVPKrtDX33Px2O
	xEa6WG2jngvuQofp5hpScvqVE0DQGVMV2Xon8m3f5sgtY0qIN1HDQQqOi3Acyff7y1Z3CY/VEoc
	UK5fx6Hsa3N+PzeqYTyYI2qvEtkEptg==
X-Received: by 2002:a05:7022:f118:b0:159:2c6d:fcc3 with SMTP id
 a92af1059eb24-1b5568d34cbmr10453148c88.33.1795449794126; Mon, 23 Nov 2026
 08:03:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106103932.1219696-1-fshao@chromium.org>
In-Reply-To: <20261106103932.1219696-1-fshao@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 16:02:57 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8GoSOkVYeH6qGYxidNJaHF+5sOBs9rbmNNT0JTRRyUhA@mail.gmail.com>
X-Gm-Features: Aa3M54pCW39BI00fZZY2JtJokM0N_1IJyOAlnAV7U4nNlRDiy6OFr5lwg7Buxk8
Message-ID: <CAAOTY_8GoSOkVYeH6qGYxidNJaHF+5sOBs9rbmNNT0JTRRyUhA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Validate gamma_lut size
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fei Shao <fshao@chromium.org> =E6=96=BC 2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:39=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The DRM core checks that a gamma_lut blob is aligned to
> sizeof(struct drm_color_lut) and at most GAMMA_LUT_SIZE entries, so
> shorter blobs still reach the driver. mtk_aal_gamma_set() and
> mtk_gamma_set() read up to the fixed hardware LUT size, which is an OOB
> read when the blob is shorter.
>
> Add mtk_crtc_atomic_check() and reject gamma_lut if its entry count does
> not match crtc->gamma_size.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 2f3f4dda747c ("drm/mediatek: Add gamma correction.")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
