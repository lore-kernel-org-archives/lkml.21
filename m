Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022646;
	b=BiTRt5yMzQTXDzj7zRvJmkynbQ6z0hvSKUYSFDwdN8hf8uP+0fs16X33WyKyM3Ldo+0b
	 CK97DHFGupccYfxmFsosyZ/AAj+xs39CP3tf9++iCFArHvQkHd0zOyuuzob8S7/hpYX2x
	 iFeUABObyhpPe4b26xYOtWY/hjjYrEF/XK79DsXKQryqMTrq6mo80jP9eUnLJBrhNDmB5
	 AEacMSKsohzzSJWbbuB4mWoS94ox8/y1aJH0oswtfHYXJy1c5KMCheQb8SARLgyNf2ZQK
	 HswcqUN86SfL5JVyuNrck/abjZKqHGIDhZWMM44IulAfTPJXElV0cBen++l8ovtz+3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022646;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=bXJhc2GJ3SoNUrj/9e522XwJhUasaZSujwRhO/k1tMw=;
	b=gwyFg/pkD9ZmlrWekQaMh8wk7xfTYIc/tIJ/dkrR9YAY85D5dfva9gzu4SSx+4VzShi/
	 rfuEUSQ0RWj9xkgE9NTVJSZcyhRrrLOSwQy+X99yRtNgNEXn2ZPkYkLtwEjBCYsUjlNgh
	 qcGQP77Hxz/LzkXZ/MnLQ4JQTzgd4r7mS+gXQE5WL2A0Iv9dgG5hhSgfD6K8RLC940dP5
	 8pOenrdaeyCAHJq+18uAttIgS1OPuTVWL49rVx+1aLS+FIjZKG2deiFzcLgE70Jmr5+RW
	 +Sk6zk48sGsWxJHh/WOjCvHUzm4+mdXIKFI67DTSJX9Px8adCt9Xm04LKSWU+Qe8puA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NTQRnXgH;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607BE60A260F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 607BE60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NTQRnXgH
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95AD91A169B;
	Wed, 18 Nov 2026 17:24:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5CD055FE9B;
	Wed, 18 Nov 2026 17:24:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 890A111BC2A95;
	Wed, 18 Nov 2026 18:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795022642; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bXJhc2GJ3SoNUrj/9e522XwJhUasaZSujwRhO/k1tMw=;
	b=NTQRnXgHCWqG7o9tbC42FLXK5PpAFGMnTAI0uUA/GGHoGblunBp2oS3Mu+P53fLI9paj9E
	umYpObsieiuiLzXh31R0xEcuIZ6UzR623o1eQ2vcz9qVbvwY15cNwo8HFD4BJDiNYgnSy8
	+cdvTu/yMs82bG9Ovw0hQcyDQPpnz0Vh7briEKYkZ/yvQouzeHbxFlzlmtPZGaaiwUwoAE
	KvVJPOXZiwiUNCQMFB0P+D/3v3wNDENgbpeQX5D8HffKFbWROiGYQl4LPugxFbXpdAY+kd
	1GGC0yfiCdetKKQbZtLF2Yo65Qat8BSnUIe9qRBN9dgC5PFgmKjZEplanO4kkQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 18:23:52 +0100
Message-Id: <DMYIF16G9BI6.22TYKMLFPA3IM@bootlin.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix DSI host node reference
 leak
Cc: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <luca.ceresoli@bootlin.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <sam@ravnborg.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Doug Anderson" <dianders@chromium.org>, "Haoxiang Li"
 <haoxiang_li2024@163.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261118150045.2414052-1-haoxiang_li2024@163.com>
 <CAD=FV=WQQyw8_bhVi8Y0JbxXB8XP62ivBPUnfrgWGMcLo7qLtQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WQQyw8_bhVi8Y0JbxXB8XP62ivBPUnfrgWGMcLo7qLtQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 18, 2026 at 5:42 PM CET, Doug Anderson wrote:
> Hi,
>
> On Wed, Nov 18, 2026 at 7:01=E2=80=AFAM Haoxiang Li <haoxiang_li2024@163.=
com> wrote:
>>
>> ti_sn_bridge_parse_dsi_host() acquires a reference to the remote DSI
>> host node with of_graph_get_remote_node(). If ti_sn_attach_host()
>> fails, the probe error path removes the bridge but does not release
>> this reference.
>>
>> Call of_node_put() after removing the bridge in the probe error path.
>>
>> Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI=
 device at probe")
>> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
>> ---
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
>>  1 file changed, 1 insertion(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

> I'll probably let this sit for a bit and then merge it in a week or
> two. It doesn't seem urgent, so I'd plan to land it in drm-misc-next
> instead of -fixes. If anyone else feels like landing it sooner, feel
> free.

Agreed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
