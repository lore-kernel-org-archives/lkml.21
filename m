Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448493;
	b=l/8gs8w7PZBRgEThlRKy64z+uM1LPQOvFQuLopYwUBp7lei+bkwxZY8wHJM69b1aJdmK
	 ZGBuEp0al3K6HmmLZOnzH6iSj6yDH475cbV4Lq/aBvUHlEU4D92+MhD4rfUQnLailj+Aq
	 vG9fKvB5+LggPTiEiJQD93IzzrPyRpgLaXEpZVTnUdrOx5nI6xEbk+BuhcPnJBzAoZxtO
	 SKlWfbshaqn7ao+dm0UiAK2i3zzv6Rmhq4TbBR6VMc3BuSG4RVOIl9VPw709wekcT1jvO
	 kEFn/3wkhjX+uP6IjJLlPRgfSvHGsGJ1I3ndFAjnHEhty57p2YT8L4BZ8o/8BuUi1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448493;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PwBm1IcM1lfZmkWEHC9cN+WkeWysjbiIwKr8KptSUas=;
	b=KbJ2GcDmPS61IEtHzB81V6p4iz/AwcTaWGDac9zlIF1VxSPqWmQnyJBQDfodUoW+oBL7
	 AbBr83zWRfiK+rvaiOb7wUU5IhohOccYpkWcxh3Q7BuQ/CdPM2pC2EJeYwJWy2Pt6HOtf
	 INZ0tR47okux+uYbCXY2u+nxv7jTQZul/GI30L07xuCC67VwmiotS70cYrHsbPWc0iowP
	 HLxbqDuFJeW0a76BeFXg6yC8cUdtbxo4bYhpS4LgdArHBqKQf9jHoKg/cw5qTF66KE4ag
	 ndKbXox9a4SwqiayiVm++9BwIgTtpe3X820VfkN+6wGgiaRZyaH8+puRQPnvyLvP7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EoaoBPCk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF51606A33E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EoaoBPCk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7841F01561
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448492;
	bh=PwBm1IcM1lfZmkWEHC9cN+WkeWysjbiIwKr8KptSUas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EoaoBPCk5xlBbmcyZnLlAayGwUrD1lH9GkXZhVLwd6R3Sbgf2pWTuUc9fFkkVxG9O
	 KRsYj3ZKAn7kTn9kTc9iRxnKgtcsfKXKyMRvxxnGSb7YazKCjk61Ci0xhQiaJZS9fo
	 fDQ8//zpVBzA4XdMhhCmFeCwA30Tba+zOhWZBFICu7otJSlmUfDnupMUU8KPYNosGx
	 r3QCPtpAWSkxvgmTf0bgfhYQTjDgZYtXg84kooCVq+mv2rdPABnwLyXLooKHyWZcAf
	 Yvo8/3Ot1a0XbNJdFolHsyfzSTYGxbCzi6wfQX92YFIfzQJ9Ev8og+OKFGisN0E4X/
	 9oXiOA8PyZrJQ==
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2761c69fbso2291584c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:41:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEw8w4Ng2TgV3xJOZ9F3eYGB0x1LRC7Bp6TxHggoC3HiZlroGjifQ1ZlM2XnGaGUImGIY5FZbrT9sCK8hM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vbjk5vu0f48osCosEESclbwiCBH7mEyo6GtQC3rt2UacFClT+
	eyNxhF5S9hcydN4HX9ywSx31D281AnHDSap0irGKym9+am9LY9jIK6RBS/9jiucX1KK7F+erneM
	C4lZS7xnp134+CwxBeevRtAI477+ouQ==
X-Received: by 2002:a05:701b:450d:20b0:1b2:4378:3545 with SMTP id
 a92af1059eb24-1b5568e825emr13210367c88.21.1795448492121; Mon, 23 Nov 2026
 07:41:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011004248.1117649-1-agentzoan@gmail.com> <20261011004248.1117649-2-agentzoan@gmail.com>
In-Reply-To: <20261011004248.1117649-2-agentzoan@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:41:18 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8_90si7frBxHCtBqk=V+nr3WhkYbc8YYWTcAq=oL40eA@mail.gmail.com>
X-Gm-Features: Aa3M54qUVOXJZJP1GdyNU65SHuNK_sE0j5xy6sPPN1MXY2yoHWIA_tbhn9S-dUs
Message-ID: <CAAOTY_8_90si7frBxHCtBqk=V+nr3WhkYbc8YYWTcAq=oL40eA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/mediatek: mtk_crtc: Look up connector routes in
 the CRTC's own mmsys
To: zoan37 <agentzoan@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

zoan37 <agentzoan@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=8811=E6=97=A5=
=E9=80=B1=E6=97=A5 =E4=B8=8A=E5=8D=8812:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> mtk_crtc_update_output() finds the private data of the display
> controller (mmsys) that a CRTC belongs to with
>
>   priv->all_drm_private[drm_crtc_index(crtc)]
>
> but all_drm_private[] has one entry per mmsys (mmsys_dev_num entries),
> not one per CRTC. mtk_crtc_create() gets the right entry from its
> priv_data_index argument, and the two only agree when every mmsys
> drives exactly one CRTC and the CRTCs are created in mmsys order.
>
> When a CRTC with connector routes sits on an mmsys that drives more
> than one CRTC, the lookup reads past the end of all_drm_private[] (or
> picks another mmsys' data), and the route component taken from that
> data's ddp_comp[] array is bogus. On an MT8189 board with connector
> routes on the external display path (CRTC 1 on the only mmsys), the
> first HDMI hotplug oopsed in the compositor's atomic commit.
>
> With the route tables currently in the tree (only MT8188 VDOSYS0, whose
> main path is always CRTC 0 and all_drm_private[0]) the two indices
> happen to match, so nothing in-tree hits this yet. It triggers as soon
> as routes are used on a path that is not the first CRTC of the first
> mmsys.
>
> Remember the mmsys private data mtk_crtc_create() used for the CRTC and
> use it in mtk_crtc_update_output().

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 01389b324c97 ("drm/mediatek: Add connector dynamic selection capab=
ility")
> Assisted-by: LLM
> Signed-off-by: zoan37 <agentzoan@gmail.com>
> ---
