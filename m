Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795031001;
	b=QmCi/PgAMDCzdjCwQsqL2cifG0ha3TdNILwGQhAqoutNX05qFsfDSvBBAouxhB6tgpGX
	 5WY2sbkUg5pV8O2xocExmvcmUeLO4vlpT80TofHS+1PrDRjjYKyfoWJzAVE/IFhoaiFZf
	 AeqCWroG9EGm5Wg+vd+b8aEFnh0UbI+MelFQY9XChK3yV3LFSQ6AV7pfiabE67Hujm6Hj
	 2PgXRXkLxNeAa47u54IVk0VzqEcqWOJ7/ANq6J0vC1uu3xF0LyrbFReKINRKcj+sYCjUC
	 71MwomY55M5uRONSkBIFSyfRYhnHH3XiflxHRwY/uzm77UE/YSoBoJBY8Qp76NL4REg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gifZMvAE7DM3i41UajDclxs+czdGYhGHD0kU/nIld8o=;
	b=UhWOXZGd6PQX1vmVkEWcaRTtApXoGkgnDg8Gh5sNcdP6OegphsTtZ9xFf/dinb5T36Fr
	 jlgBHULcIwSQILX3iQjCA1Q2YmCHX/YLObQqYPHSXJvJI15bIN8PS1l+ZEnDg/6+mY0aL
	 F6OeN3oG187zTxE9khn6cgMJU/ZCVvKv574KreMRfBJfa+89XJHaxI4/eGSg2s94Q9PEf
	 LykgrigjL9GGZWLcTopEwzDikwFLTbY+lJnC4BY6KgFRtnI5OjBKMwllU2B2kKFXLllab
	 eff4x/1bfu9ZzypX2+tf0QVqU8FSW66yrssntSMpyjfpFgL57tgJzAvUb8VpFjGFGFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouuDRfh1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04292606A7D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04292606A7D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ouuDRfh1
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36dbde64409so2546971eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795031000; cv=none;
        d=google.com; s=arc-20260327;
        b=CkLDidQl/LUM3C1g/Id6zgAqOHZ0WyfOZkVXvqZkgpqWuP8InYD8Y13B+zz/2/1dvk
         wJHe3hdH+4CpmWlnTYI7NBZ64DXfDekPKJtv7ZfZ0yO0rqLA3zmCU8B+YySTziieLgwM
         9MnUfkWBmKEU/2z6dmxOOyFnBG2Jzj79JdCeVTgC9Nax3ZP3SPLIPuHgzBpKXDrux7Qu
         3NDD1ZsEXfpjDN1QakIqEvqJy57fixLs2PYc35Yqj/6+gagcsImypAxsOrIxOPgDcid4
         +zGJ0u2VCxqsExVuAq5IEX+Zc1A5gLRRZ5ciqPLNokPcgFU6pr69R/05NvBoyWcSbbdW
         i2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gifZMvAE7DM3i41UajDclxs+czdGYhGHD0kU/nIld8o=;
        fh=yPCxWAEDw4I1qD9vkg0uG3Xx+G9lHyqV2AdrZjm6Km4=;
        b=svXu+AqHUN7ld4u+TNfEx8NHnmvxEPSNbiBTep37reda5UgCD5EwqODUpIQtavAvGe
         oG5FyWpYW0o/ap81qW72VqLVqS685dFMgWgT3gCHxflvSmcbJFX5gziA/tkExzGzM/in
         1PR2hbwP7sNY7Gka0O8g3zNU6AANoNl9eLoBBlCKc28mfxuYHH8dJH7+Ki9jgsJLTh8t
         gdy8QR+6GOqbH9tPTAllP9jKfithhNW8n9twI+WLMc/M4zIPOrZh8wWw4vDqIoGjqq4w
         f1SHltxnNWLUylU9Z/UZssHfpnNGED+EcOp9F0w2XTWKG/+Fzb2plC2CmoovROze8gu/
         s5hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795031000; x=1795635800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gifZMvAE7DM3i41UajDclxs+czdGYhGHD0kU/nIld8o=;
        b=ouuDRfh1MQo+d5kevIX31wn8qBVNEHnPoyDA5ZjrFWZVxblY7AX57oGUo2f6mw2UhT
         10BJwgORUxxNyL/wYd6ruIl8bSbqaR60Hq7QH5oPhZiFcfxeBhdz3ayjl8xDuukrJbiv
         QIwxFN3AFDzDWV+yVbZoOLXXwHLm4VTcfcwGBGC+FVwINfkQzm9WXb9rOHcv9NvikcuX
         SNAPdPTyOrd9j7w1Qt+WwoxYB4yMeBxB9rGQ0Xkg/8tYY/krgWZDzpBu4CD0OocVMWRE
         ZXkTuj92ei+RjZ1cdA7PNBqi7v4lsTz7XgQgspPrp1lB47rN5v35nnKpbxkBfn18XZ+b
         OMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031000; x=1795635800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gifZMvAE7DM3i41UajDclxs+czdGYhGHD0kU/nIld8o=;
        b=Ke2FxePTezirVzcbmbuZNBZamVksmkqWbTIFY8fJkEWhF9NpUsPV1r1OJP9rCaB7Km
         Hh9BbxED5KAZ2UA5FlwJAA2OF/2A6CRji/HeSpDT5EOy3mJITaxun+1NnlIrubHPlN/3
         pN2IYUoc+/aAUUEwkueSeYcbMu85SgpDj0arBEjCezc/EQjOi9biC8Ydh8/C7gRm+yX+
         LFNTpbV/y72k57GcKxQgmpcUmWFDdPYOoui8l5nVuDEvty8h+9C7hLUslqO7p1qP+d0i
         bzqeM41bBj34GkZ/FftLTerOgZU9fmppAsIH3b1Ukpr/X68Gyh1vi4JLdIz3JEVIOcPL
         0+hg==
X-Forwarded-Encrypted: i=1; AL+hErGG8qasLuFbdttjzeDoJXSoe3Qt5rdAOfxZct+zJErlG8YLxaCC7WrrSmaBl8x8WP5DMMHi8wXznHQooPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gRGpn8OhXdt5wKm8UKx8Q5IU7O61fvsdPY6CoM/Cs20hJWg+/
	79MZmFrjK8t5Pb6Sf7B8X/CiI4bOaGyAqB5vG1/zwnxr8s91EkN9DLkWdqo+uyonphUt/OQv0nZ
	aJ1TlRLWIB0MCvir7qLYKnAqkTrNT3ZA=
X-Gm-Gg: AZFdTZfliaokRsw6u5jEmubkiyKLqenc7A43pXjHZrXmh9s8EQEjk8WY8k3WKbUwAa5
	+0oGZ/qriXGWyaXHVXnOiPoeInHEse6G1ErH5Ti6Fjz1J1U4skIvBZGC/j8ZVIWFTOcE/cs6bkn
	GNpvws/IUbqOzTPtaMbrbv/GMj0oJAPg3dyvp3HPf+1GPdgoqlPZ4LgPaiFyprJo6L16hWRWfOQ
	K+KU7KqD4wP/A6RI0PpPklciNuQE8uZG89smrQ6wxvWAMpteTBe/74ARRkbfMkbPfNASrW7T+GF
	TTWKSAuIP3FDOtWQblgPnpmWgCUoI2zHupxYVj+QyiFcsDBORi7YEa0Ff3WQU7TRVJDIbp/To6L
	qpsgTtBZJzSpuNPW2awQ+GwPsvfcJwyfmK1ekQTQ=
X-Received: by 2002:a05:7301:70f:b0:383:d3d1:f315 with SMTP id
 5a478bee46e88-383d3d1f937mr474934eec.19.1795030999696; Wed, 18 Nov 2026
 11:43:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com>
 <20261028164539.3471833-5-henryzhang62@gmail.com> <CAPY8ntAXPpJbid2LXc6r0g-sr95uQ3hckxVqa09qPNMi5JSp6g@mail.gmail.com>
In-Reply-To: <CAPY8ntAXPpJbid2LXc6r0g-sr95uQ3hckxVqa09qPNMi5JSp6g@mail.gmail.com>
From: Henry Zhang <henryzhang62@gmail.com>
Date: Wed, 18 Nov 2026 11:43:08 -0800
X-Gm-Features: Aa3M54pTP0o_BnnWER0uO3IDxUQCM8btgNOU7uN-a4NdycqUs6X2Eb-qADeU9BQ
Message-ID: <CANTW0yo8CSV7StFmb1pB09sSQexJLV38weo5N1G7B8GJEpx7fw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/vc4: dsi: Serialize host transfers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 10:43=E2=80=AFAM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
> I'll agree that there's an issue, but as it will affect all DSI host
> controllers it feels like it should be handled centrally in the core
> mipi_dsi_device_transfer rather in all the drivers.
>
> One for the core DRM maintainers to comment on. A quick check says it
> would affect at least vc4_dsi, mtk_dsi, mcde_dsi, and cdns-dsi-core.

Agreed: serializing transfers against each other belongs in the core,
if the core maintainers want it there. I can look at that as a separate
patch.

> And your use case is genuine as panel-jdi-lt070me050000.c does exactly
> what you describe with the backlight functions are controlled via DCS
> commands. It would take quite exact timings to update the backlight
> from userspace at the same time it sends the power on init sequence
> though.

In our case it is easier to hit: our panel driver also lets userspace
read panel registers over DSI for test tools, so a second thread can
send at any time, also during a modeset.

> Do we need to take the mutex in any of these functions except
> vc4_dsi_host_transfer?
> This driver will misbehave if you request a host transfer before
> pre_enable or after post_disable. It's been on my list for a while to
> look into that one.
> But I don't believe there is anything in these functions that would
> interrupt a transfer, hence they wouldn't need the mutex.

For transfer-to-transfer serialization alone, the bridge callback
locking can be left out of 4/5. I will separate that from the recovery
requirements in 5/5.

It is 5/5 that needs the bridge callbacks locked. Its recovery runs
inside vc4_dsi_host_transfer(): it saves DISP0_CTRL, resets the block,
restores what pre_enable programmed, and writes DISP0_CTRL back.
Without the lock that could run while post_disable turns the clocks
off or pre_enable programs the timings, and the restore could undo the
DISP0_ENABLE change made by enable or disable. The lock also protects
the enabled flag that 5/5 uses to skip the recovery while the block is
off.

Transfers outside the powered/configured interval retain the existing
behavior; this series does not make them safe. 5/5 skips recovery when
the enabled flag is false.

For the next revision, I propose moving the bridge callback locking
into the recovery patch and explaining it there. If serialization is
handled in the core, the transfer-only patch can be reconsidered. The
recovery still needs a vc4 lock shared by the transfer and bridge
callbacks; a core transfer lock alone would not provide that exclusion.

I will wait for your review of 5/5 and the core maintainers' feedback
before respinning the remaining patches, omitting the applied 1/5.

Thanks,
Henry
