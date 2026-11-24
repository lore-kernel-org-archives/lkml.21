Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543232;
	b=eXstqX2jPd0A06dWoOBO+qsMmgqz2k7XnLA9ubYX/xCQDoJJk2eSfNQI4hj1n+lVO+GS
	 r4HoiI4aoE7eIwfDTW9dTVPiIM+qXnkqhOLpRBxBwXzsW1gT07D7pzm6OUsY36wXEP9CC
	 NOktdZ83VkrC7DXFF518W0/f3K5BERxOWcDqpkMw+MdXF+E90wMAm1oSv4j6nwiPjcCZS
	 iErwt2uSTqzdoSHMVSLXXGMLfvSYOML6G5ZWav03HHkIy+kOMwLAl3iYxdEX2fXs7xM/m
	 Yj+JyjEk2WBcoV35WC2RGDT25SFjn91yWumZnedrLG8kqUpMZAMx03+rc8gWIQSBdzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543232;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WFgX3x5eyxWwyTxwugRpUhXKTL0HEYgKi55nzSl82IQ=;
	b=Ry0XHUcy3zlQBz2Z8JjNYxPGOA+azBOBHj5hrWIj/cp17nYFzfcsccMUGDm+hPU19HJ7
	 NeN39lusIU6+BRHHExeWTdPzgbJ/xaUBSePeK3XzB/FdExPTulgEg1DP0x/mu5m5Gb7ZW
	 5UD60nK2mIWGEHmyHDTYe/yUUAkvzIerMEq6XYKQHjOFsxf4s4htaR61sbA0/WOgA1mZG
	 NN5UWSTotaO6eRtctyd9WZ0FRfBk4cypgdYIuFDM/Cia+bscLeB1UNBxiyotxWXm0Rven
	 G92quX6bgevUguyVBFPrFD071F4ZGxvFiv7PBB7ghtBlzFDxpYNwQJMl4xuwvib1xLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=DMPilbVb;
	arc=none smtp.remote-ip=185.70.43.102
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A470606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A470606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=DMPilbVb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795543228; x=1795802428;
	bh=WFgX3x5eyxWwyTxwugRpUhXKTL0HEYgKi55nzSl82IQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DMPilbVb4kwszWRaXXs8RUgLpD5TddAlBgYCekXW1AhNisfVYnnfI9pKENQfCcb0O
	 8+b2W8533inftOx8RGCVI+9pup7uJEC8mPZ8eMm4V3av/3wSnG/CpEjAtpaqlR2tZF
	 hEs1LfXH36OzyvuY3dFnD+sf5huCH5AoI8SSq1illJaiAwJAPV0D5z7TiR6aKd09wV
	 oe5YiSSe5hofWmla658pwyF14Icv+SQbwTAiqsqzFB3jEJfCzTybTZfxp8T/BHg1HV
	 SH2bi2WSb5ZmAEbDTZQO0uqhsxfrqBbJ5Yd8M7Uz7J+MpBHJNnCHewCXA2brcMylSH
	 U7uF3F3QW1D2w==
Date: Tue, 24 Nov 2026 18:00:13 +0000
To: Johan Hovold <johan@kernel.org>
From: Norman Herms <dockseed@proton.me>
Cc: "lgs201920130244@gmail.com" <lgs201920130244@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>, "christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/etnaviv: fix runtime PM cleanup during teardown
Message-ID: <ySgHadEeohoYOvbeB9Lx491WyBk6wXL4K-5n9o5_hiC2pAVbZ0NkOyMqG8VXQEUncvhhEivrHxGc-Js9m3vJcKrqvxOIL5tBm4z6rjtEMhc=@proton.me>
In-Reply-To: <awU8xkTrwuJyKJbA@hovoldconsulting.com>
References: <bKXiGbjWVw6RVBUFNVHEum6OPpzcYgrpzQTNKG2mnqCes5jzQJiN7BGGbNyJBjsS6UVFLV7wz3dFm7R8vaJoplZn1FI8WjOgk7Vg3WSuwBI=@proton.me> <awU8xkTrwuJyKJbA@hovoldconsulting.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 4675662c6a9cbc669dd988807e83ba879c8f3f00
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
https://lore.kernel.org/all/awU8xkTrwuJyKJbA@hovoldconsulting.com/

You're right, I put that the wrong way. The clock leak is a bug of its
own in remove(), and this patch only hides it.

I tried what you describe, in etnaviv_gpu_platform_remove() after
component_del():

=09if (!pm_runtime_resume_and_get(&pdev->dev)) {
=09=09pm_runtime_disable(&pdev->dev);
=09=09etnaviv_gpu_clk_disable(gpu);
=09=09pm_runtime_set_suspended(&pdev->dev);
=09=09pm_runtime_put_noidle(&pdev->dev);
=09} else {
=09=09pm_runtime_disable(&pdev->dev);
=09}
=09pm_runtime_dont_use_autosuspend(&pdev->dev);

Same board and test as before (7.3.6 with local patches, rmmod and
insmod of etnaviv, clk_enable_count of the reg, bus and core clocks
after each rmmod): without a change the three counts go up by one per
round, with this they stay unchanged over three rounds.

I left out etnaviv_gpu_hw_suspend(): the component unbind has already
freed the command buffer, and the resume only brings the GPU to
INITIALIZED, so it would do nothing there.

I won't send a patch for this myself, but I can test one.

Norman
