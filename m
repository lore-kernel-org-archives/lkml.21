Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453854;
	b=J1sT3+jLIX3uG4YTYlzXjy6JwqVnh1a1cPr64dN6GWOimWoN3bjXJil/fiFAvf7ivwpa
	 w1Poi3L3N1zXeqoLRqwadaMJlFMQnbIlkYK7Zn7/KywRfcMyI6lEvCUAmSNvu6f++Znkn
	 58OPO6tf99FuErJISXcIcgFbEnRUPEFQEeg5DusZ2294t4rTkuaKd7nkFGH7zksN08F+U
	 PYHjU67AcodbdGJBzTw6taMHda72EHLsfumpPyJ5LEAwKsWY+ehYRc6fNxw8FXYStPMye
	 8htPBAFgx8FysucPzOcNrzs9dXdMe6p6hwwdbnPu7ie/jAZirNTiNB3xt0GCzv/+DFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453854;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R+hYscy3U84QnW7zu6bGSQcL4RGK1vCUM0ausGDfOc0=;
	b=JJABMthci5GzcSWd63A9ogEYTj/A6nQXOK9pcL2ZIFwmW/nMf+KPWQMs1FUDzGbOsQSa
	 ghS4lTZR18fAcXYpV+aB+lokZnRzhZGUz2jy7jPuSNdhAUm+iStoXrmCeuMpqrnuhUI/q
	 uKgu2Jo8vXTg0AldxKTSvlZmCRRDZvZHwpaVR8O/lsPSnkvVlIXk1xiEzphgxBxSxwL0L
	 MkBYQgJUBxqRa7Gv4Vlq9IiStJ4cRiZT/xtD0eqbeDZa06J4fAAxX265TL9S5X7lsnplj
	 1c6ZdlhIEHEND3Q+nnrV8sdzMoftckDFWcD8oj1avFQtNTgwXmDdVguGK2AgDL9Yc9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=hSvD2QSK;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C1D606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5C1D606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=hSvD2QSK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795453851; x=1795713051;
	bh=R+hYscy3U84QnW7zu6bGSQcL4RGK1vCUM0ausGDfOc0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hSvD2QSKHYNolGys5Y4iMnN9e40Ri3so19Na5pz94+2LmJbtzXUl/Hl7E6zX1MfJ6
	 1/2xNT7mWn72aVyzd9nJPdip3QQTEjZ/t+SHhcrYRCpk1otYdYUTsIWHte152COcr+
	 7ExIBC82J7oxEC0kJD096fiXsv65D5Ok3Pwtn+2JJKpNKGGJCjnePBqvTmug9OymfG
	 AZwC1/1kL0vChtOTe5bmcmx921L4Y+7KXgyi+dSGTpgcCUkZf9UubhqoJ5x+BVdDuE
	 HG7M+Vf4ItJCI36GZazTM+RpWkv2qN4abeM3T0OZ5mgdk9a2c7KPjPz1g6qdBvNxJc
	 gLOpsRcea0tgQ==
Date: Mon, 23 Nov 2026 17:10:39 +0000
To: "johan@kernel.org" <johan@kernel.org>, "lgs201920130244@gmail.com" <lgs201920130244@gmail.com>
From: Norman Herms <dockseed@proton.me>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>, "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/etnaviv: fix runtime PM cleanup during teardown
Message-ID: <bKXiGbjWVw6RVBUFNVHEum6OPpzcYgrpzQTNKG2mnqCes5jzQJiN7BGGbNyJBjsS6UVFLV7wz3dFm7R8vaJoplZn1FI8WjOgk7Vg3WSuwBI=@proton.me>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 190d6561639f5f1148682b9d8edbaa5cee8ee21e
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

In reply to
https://lore.kernel.org/all/aoQZ3zhnyRuiHJlF@hovoldconsulting.com/

Hi Johan, Guangshuo,

For the remove hunk this is more than a cleanup: without it the GPU
clocks stay enabled after unbind.

__device_release_driver() resumes the device and calls
pm_runtime_put_sync() before ->remove(). With the 200 ms autosuspend
set up in etnaviv_gpu_platform_probe(), that put only arms the timer,
and pm_runtime_disable() in etnaviv_gpu_platform_remove() cancels it,
so etnaviv_gpu_rpm_suspend() never runs.

To reproduce, read clk_enable_count of the "reg", "bus" and "core"
clocks in debugfs after each "rmmod etnaviv; modprobe etnaviv" round.
On an Allwinner A733 (NPU on etnaviv with local patches) they went
1, 2, 3 over three rounds; with this patch they stayed at 0. I have
not looked at the probe hunk.

Measured on my board by AI agents, analysis with an AI assistant;
a report, not a Tested-by.

Thanks,
Norman

