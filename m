Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036875;
	b=0OL30/4TBxadkS3L+plEGgWg67zQkPOX5Vlo8Z0ql9n/nETNRIeSlp3dn026Fv6a/+/8
	 MGHhljehW/oqhyo3r1UO3UaUY+0M/tpNGVaFZTPFH5TwnP9ImVIyGTg3hxg2x7hxKUhrA
	 ESmtqr8AlTlAYmNNARMvbLzSbgtvufZXr/BDMXy6tan66mWof/AL/GlV73dKjVS77fx+L
	 CCHiteHNbGvoQVkHHRSznh2FQkGEZvG8hEIGp2u/Mtazljhfor5gT6jvFUbfSGYmzZZL3
	 DBQQRM2+nfHnR8oQfOoeovnkuEbVoSttB/pzNi9h1zyK3YNO9JJhM97AzW4tHYeFrbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y30ni6xyjZkpdJ73if1NkuwLR6cF+n60eri4wMvHUQY=;
	b=J+o7lOUf82QpIsEiRIA5yh8WZi6S+HZ+JZq0wDmQrXUn4rVvVNRtsQhveSNvy3XENYYO
	 Pc70tLB5WzQbfMnydK4iqF/iaaYRo1Vb8Ynni6UMh+QfATrQ18viASYPKDkSC7P+nOmeO
	 VMJBGFVmXeksOEum6w348+/4ndXhyZ0ClBrzo4dGk7NQ0uB24floWZerrPew8J2JR7y+b
	 DX2rRQYVHfxUyKVTqkp/kVP7YTFa+w0NWEKqFPYJ3Vcjo8jEQhtc01QX/pVH0ooyL0boR
	 miDkeORQ54MaPyXhnH2/Xd9eB0/6PqQqHrAQCpF6/YxDBltNZ5McKl3IEEPLT8BoZyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APyPR0Xg;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5096B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=APyPR0Xg
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-497614c95f0so952704f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036873; x=1795641673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y30ni6xyjZkpdJ73if1NkuwLR6cF+n60eri4wMvHUQY=;
        b=APyPR0Xg5bZjKyQCMXK5P8hlBuoWJEEwoQO1f9mdnNRt6CJxOtDjdc+21WMb0lqWQ7
         cIrM1xftI0NuBP9BViF/tGTlLVxIDXnH2C6OkAtTX9iq7pwtLxczvLPJxrtcWwkntFlq
         Ey8WEkRzSzR03ee+rP9+aDtyh6LDjW5y/Ofo/f7nYF3fNZEeWWMVXfhdFe1v6QReZqMg
         ELo8BoKYHCdP59g+LFm6x88FVmUabk5AxgX6gL8Fp+Wd8VIVTLPKH/n2wHU1HQs66Klz
         GTILEv3+WNu98L76zOGoHLqXDvHJeuJZUxFUXsof4yws9f71QR13qGEVSrNkYF9RfGr/
         Wvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036873; x=1795641673;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y30ni6xyjZkpdJ73if1NkuwLR6cF+n60eri4wMvHUQY=;
        b=KsdLNbPwrvBwxzpElizsJYJzVxmkC/j9+XCHb6nWG4/DP/yqQcokaOpNblOp4a7bk3
         zr8M3mszIVawTND31oTDfL1e9A6T+TOL4EclrXsqurdknsk5HRiXrXMipCWWwdpV6JQ1
         JO1XQnHY+RN+pncjfrXa55wQXPmTpyUbKG+g0pDZ4G+Kaqbl1UCLeibygGpJ0AlfGdiN
         x1yOz2FxfweVQTW5V8MhARJISadxY0ZosXujteZeFpqCBpJhNyM2qslUll+TF/IxSSJ9
         FeoRDJqDX6tXV3UyA7QTLJZqjbo8Z9CToriMGJ/VVRVK4hZVGeVMDvapK9zprX8rb6Jg
         WJVw==
X-Forwarded-Encrypted: i=1; AL+hErH/hiQ5MWO2WWIldjs4hjvjOot3Jw9//5EK5CQ6nOezG7JdfLQFIQ46dUjvKsIoTnfRZCzczcvQ6zTeI2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OM4I4iS9L0MnJr/aTXZ0MHJ0+yESGKhTa+FCsVZuy5g7FPX89
	MYFqSm4573Nw158jsUlbB6jEAV0ihoFwiajf7/aKGrG1kWxTFJqdQrLB
X-Gm-Gg: AZFdTZcmUq8Q4u5YMaQPTeSu1x/KZn4WbuiflNQXVoyGKb2RycJp7lhQpGa/NCTyzug
	u8374eAAAhEsRYb2/ogyDWv681xPrWw/rbWRbPKxDdCfF+6zK+ERmXIFEVVBQrETmXcBl8M5xPz
	+5PoP2U0lRwnTr7/AwMrAC+xmApT1LZUF2pICjeP7+K1izwBYe/kYBQhumtWx56uaxgdfpAS5JL
	KnxdUwOBYrpDIbL5c/Sm66QY0rb5EzaHuWVmyg1CLdrpolUr4kWjv7nOkJs0E40oe+0rSJHuxb6
	1vK5d8MQpizo2RITgiAN4VJWYT7EN9Yq0wg48EfOvU0WyYz+DVeYZ0rFJUoHFNr1Q+iRzGc+5Ms
	1t5Uq80HFT/dnAUFfLk3ZLGS3Bl1tDE18eKH70uOj9VjkbPtR3ETpwv23EZ3ZrHsRBAsz7py5rt
	jZRHUessXNJ1Ubl11FWF41n7oQ30Myh7YHhnKrWw88QWBkm8G8uVuxbRFnC4euGjHIAjZ3+aGZF
	5viJ0VqmtuZk/MI23dDCB2lPs0czDEGsvnst28DTkQSfRjEVvNr8EOWzrsmmy6uABAnnGqEbPap
	H88/AexGVU56kybq85HgDf3q5vHoCLlkooj11PNo3Yt+1w2k7MCva/Y=
X-Received: by 2002:a05:6000:46c3:b0:4a3:d77e:4659 with SMTP id ffacd0b85a97d-4a633a63f73mr5867941f8f.6.1795036873420;
        Wed, 18 Nov 2026 13:21:13 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm6763321f8f.33.2026.11.18.13.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:21:12 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] drm/tilcdc: Implement state readout
Date: Wed, 18 Nov 2026 22:21:11 +0100
Message-Id: <20261118212111.150938-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <avszNevIGlq-SKmp@houat>
References: <20261116142707.1299360-1-maximpedraza@gmail.com> <avszNevIGlq-SKmp@houat>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 16, 2026 at 05:50:31PM +0100, Maxime Ripard wrote:
> Awesome, thanks a lot for that. I was working on sending v9 today, so
> it's a nice timing :)
>
> There's some redundancy with some work I sent since v7, but it looks
> pretty ok.

Thanks! I based this on v7 and missed that v8 already covers patches 1
and 2 (the install hook fix and the panel bridge readout), so I'll drop
them and rebase the tilcdc part on top of v9.

> > - The U-Boot mode doesn't match the one in the DT (16.94 MHz pixel clock
> >   and slightly different timings), so the first commit with the panel
> >   mode does a full modeset, as expected.
>
> I'm not quite sure I understand what you meant here. If it does a full
> modeset, I would expect to see some flicker?

Sorry, that was unclear. Nothing happens at boot: the kernel keeps the
U-Boot mode and the logo stays untouched. The modeset only happens when
userspace does its first commit with the mode from the DT, which is also
when the logo gets replaced. On this panel the switch is clean, even on
a slow-motion video, but other panels may show a glitch. The real fix is
for U-Boot to program the same mode as the DT, and then that commit
doesn't need a modeset at all.

> Yeah, that's because I wasn't supporting partial pipeline updates in v7.
> It should be fixed in v8 onwards.

Great, I'll check the comparison again on v9.

Thanks,
Màxim
