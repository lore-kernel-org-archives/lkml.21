Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795689697;
	b=pZ2wWBSX7+q0ZGEfP+IA9+yU/UaYZkXkf+3dQtndqxxzHKfDH6hagoa4iurw9cFo+tli
	 OFuITwqyaiLQfJGBqJPoxBnh5/924ZyNzjqbI2BIFLedu8eXh6i45+iHaFNLnQm8j/BnU
	 9XP3wpO2VBVSzHv1RkKpsD8egvR1/96sWMURxeOVaYWBoxpgRDhmK7VingTH9AbYHkJlF
	 pZK83H5M5eVx6QqHOJeQanWJkJ6ovCakSAFx1TuQOyIyGEwlJj28RDrHSdmDhQKjaTAzh
	 9KnYgLam0FeqjxwLvwgAknjKkSguOZ2YPyWL1DiYn2cn5myI5qSQg7QiM8yJImpcOEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689697;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=hTXpIfLZ2+j1ow8NmZB6JM/DU4spl29LunD6FR84AzA=;
	b=JaKSSX/zGKIvqbdb9oOICs6nPhbhcysGnUFP99nyg3Y4b7UTQSPmF/1RBz0d9w8ZmCgz
	 QGIDw84R6SVAn7SfOweDcFXMG79gxB6w6S5xcy33cy57lWYUV89jGMtDNWkkrPbwhaMLr
	 2IIFBlHRB6t+n4gEAq7vlkAnslCBdpywAPWiACvOqga1l0bD1KTSZu5w/q//SgXZ71kef
	 roJG382ML0Xa9c6VcLNs57DWLj92uo5AgTtYReBERkm/YUVN3tGTu//mounZCXi7hUj+Y
	 H/UVAUTKwHTZGTDhbNIjxLiCigxmpJEmGVF/0MJ7hxDHEfXG6f5a2z3F9qlP2Cc292A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UMS0jQSv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hTCfTUUg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CBD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42CBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UMS0jQSv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hTCfTUUg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795689696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTXpIfLZ2+j1ow8NmZB6JM/DU4spl29LunD6FR84AzA=;
	b=UMS0jQSvdq2S4rsm9u0skUQmuBmUuNempzXP+ufvTyrjyGBINublJWHvP64XZIU4OBj0DZ
	kxKVPKAaCxwu473DSZuhkEV0M0VRr55c1ZisxOsCoJTXBMZkzxw4ETlC1dzLjXQrE0RHTK
	qBbwQDqYboHEV5fM3VfHFLwdxFdGqvY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-f_LE8l4VPZG9uBtW5f3vnA-1; Thu, 26 Nov 2026 10:41:33 +0000
X-MC-Unique: f_LE8l4VPZG9uBtW5f3vnA-1
X-Mimecast-MFC-AGG-ID: f_LE8l4VPZG9uBtW5f3vnA_1795689692
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c504b52eed3so667284766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:41:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795689692; cv=none;
        d=google.com; s=arc-20260327;
        b=mTi3U95Qpgy0CIKpwK0JsWp6Bs10s2TrdgIRTMAWAzgS3+EJ9wfQCRzOcinig3Mo92
         acE4fi/qddyJ43LXsQGzJ+/YDonytjsVClqDxytCty32YLy5yk9p7Jh4QNONYhUgzhk3
         MaA4/r+SfafcRZ0x4YyG6hBBpEQlwwXSK957VWFourgBTiKwrzAe6NbR/tnRXX66MRrm
         aJK6U2LyDhvSLvlf2AbbKgyrGWiqfScch4JS4ayi4SiUagb3vCHY7pio6TctH0VASU1L
         W9bp/k4VKCXyOGoqIs0AfiWU17Fcqjiu7d0MXjlDxyoodjXVIXEPB3zzbaUQEe5J91vB
         0v5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hTXpIfLZ2+j1ow8NmZB6JM/DU4spl29LunD6FR84AzA=;
        fh=ufJvYGg16bN158LGTq96pmiYUT6QvwXqQ7ysLlL80i4=;
        b=TuPWK1Ao8WvyTVS9Enm3IJWT5BzNsO3+W/sPh+rIjwrdMHNKY/i6g1t1RVx/r1GHzy
         KjRGp2iqUhqyQGjHHC4EkfzYgtZ/yG1SwRSnLQ3yBYNW2h2Z+aM/p/53dDbzapTyBBfu
         LdYm69JwhSYdefDnktu2llnSB9AoxVzu4nv2WXlBHDXow11QEMORzyXIZezF/4dTUlEV
         XI0tcv1W6JADSVoaEV9Yrdo0ISEXZzaNJx8veuI3f+XhFrMjdZpdo08gSqB5NYROpDs3
         fQCPRIlOm05HnQa5zooBecvZyQFHksYN285M9eraGhCo55/WGYlQHKN5/ZfQ5tLkG5RV
         YVUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795689692; x=1796294492; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTXpIfLZ2+j1ow8NmZB6JM/DU4spl29LunD6FR84AzA=;
        b=hTCfTUUg7pr49MvsKLqH2jm7NZjkHNrLsBC/hpsazdUfsEX9BTuii8cQlswoId2ReI
         2P0C0QP2kwAw9l/liHoYw9M1ZQyagy6goIR0x33xX9w/Mo48AV6PtPrkaxf4n/FMQ9GR
         g6GYJiqpo321fytk7lXhWwT3msyRoznvPyVDzRMNrF8xEJXPdmLLFyk0zq7uECo11aNi
         W9/oOJy+x9/KMkj5B12fY4XF0BdsAzmpkA7bDt8MD2fsb6HUv35rzap4U93elGBfPGig
         cdx0pO1yvZwDoiHE5fpVEqhVv2yUGyk/DJYbYapX6dZ2V552tUIlLCYg4h1tLDVPMxE9
         ksgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689692; x=1796294492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTXpIfLZ2+j1ow8NmZB6JM/DU4spl29LunD6FR84AzA=;
        b=S/o8qrMFvHEWkzABaWviMSaq0dUObD8/hZv2ZZ0hg9G9e0TLl5j7Ib0Ba0xGB1x2ii
         1bM++38q+/7f6kTQz30rPVylYg/NUkJFZkhK5WTJir2vpBermS37L3sjKjf1ivhMjjAu
         EZvTCEx5Pj9S59nTIcAvq42yO5yLeH62mwCpFyJc1W1SuIW7X2GwUYCUyP1JGbA+lJ6D
         qYuDeeJ1wAIE3b5JAcWv9KY38wP6lqEGbysGyE7RJQu/Q2izdATOMB/j7zunnovY5I80
         g5713H2KtgoyoFdvLbCfmz9KruBBVvVjbFYL/gJvbhRTaTPSUsnaogMH2IVGp2dORIJ/
         YvSQ==
X-Forwarded-Encrypted: i=1; AL+hErE1ki04UdUekbr+qL4kH7Di0M9pIQjnW0gAPsWJZa5uNg6R2nhSgotljgYTqfPZaK7IpII907PEYvo5vdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LvCTd8hOuML/dxz/a37vEc1iT+vyCXDMqXpem11Akh2wPNGYr
	Cz9j36vlbBWweZl6KBky+BncYdu1FTZmgAHor5G6cTWoSsb7m/5kTDtiZwwJ6xFefBimN4AqwCa
	z4BEXxwP0yeYGaGTzGHpglFqqK0g2A8bdYQe/6tKvATvDJIObj0enFQyJjfgeFb/AImS9tC5Izg
	fv0QZK1+RvO9DrnodqbN9armXW4B1KSZGmSobQMPsg
X-Gm-Gg: AZFdTZc7GQYU4MIj1xCu38h3r1575A/gscTckgkodLV5w6I7DVDSwnHLMnRf3/Nnykm
	mgj7dok0H3/04xhJQWZqjIe6CZqbaQP67R76XW2a6H64TYJ6N5/EPJVhOrPbUtXHT1Mdhxbp60f
	aCEu/oKuB0nsyjXjkrHlLaQevTUIUSD/vBayZfK6OrCtmoEenVdeSFAA==
X-Received: by 2002:a17:907:6ea9:b0:c2e:856:2a08 with SMTP id a640c23a62f3a-c513a3a6598mr1792624266b.1.1795689692541;
        Thu, 26 Nov 2026 02:41:32 -0800 (PST)
X-Received: by 2002:a17:907:6ea9:b0:c2e:856:2a08 with SMTP id
 a640c23a62f3a-c513a3a6598mr1792622666b.1.1795689692194; Thu, 26 Nov 2026
 02:41:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119054917.184758-2-ltao@redhat.com> <85438483-9843-4b14-b3eb-57a074275911@amd.com>
In-Reply-To: <85438483-9843-4b14-b3eb-57a074275911@amd.com>
From: Tao Liu <ltao@redhat.com>
Date: Thu, 26 Nov 2026 23:40:54 +1300
X-Gm-Features: Aa3M54qXSxe4Tv3kJZhv4-GTyuCU96H140dAQ2Bw9YC_NOs4WSOucEjet7OYzYQ
Message-ID: <CAO7dBbV5Baw5SRCNCys21u0NwJ2CCJWu2Av9wzGUHUmMxaE0bQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pdev lifetime in dm_test_conn_init_ctx_alloc()
To: "Chen, Chen-Yu" <Chen-Yu.Chen@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
	simona@ffwll.ch, alex.hung@amd.com, bhawanpreet.lakha@amd.com, 
	ivan.lipski@amd.com, george.zhang@amd.com, adrian.betschart@cinemaone.ch, 
	rodrigo.vivi@intel.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Wed, Nov 25, 2026 at 11:31=E2=80=AFPM Chen, Chen-Yu <Chen-Yu.Chen@amd.co=
m> wrote:
>
>
> > Fix this by allocating pdev with kzalloc() and freeing it through
> > the device release callback. This ensures pdev's lifetime is managed
> > solely by the kobject.
>
> Hi Tao,
>
> Thanks for the report.
>
> The lifetime problem in dm_test_conn_init_ctx_alloc() is real, but it has
> already been addressed in amd-staging-drm-next by commit 370bab028b38
> ("drm/amd/display: Add more connector KUnit tests"). That commit allocate=
s
> pdev with devm_kzalloc() on the device and registers the unregister actio=
n
> with devm_add_action_or_reset(), so devres releases the i2c adapter befor=
e
> pdev is freed.

Thanks for the info, I didn't notice the issue has already been fixed.

>
> Your patch no longer applies to the current tree for that reason. Could y=
ou
> please rebase it onto the latest amd-staging-drm-next and confirm whether=
 the
> issue still reproduces?

I tested the latest amd-staging-drm-next, the use-after-free issue
doesn't reproduce, so my patch is no longer needed. Thanks again for
your review and comments!

Thanks,
Tao Liu

>
> Thanks,
> Chenyu
>

