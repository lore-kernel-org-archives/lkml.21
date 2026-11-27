Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795742188;
	b=PgO19eEwoXVW5XKD3IiPPITWeK03rW3XHqWZVp6SY/RzoovbYNBzJN5xVu/xkzI1oe1e
	 chRjDtU2Z6RSevmpK9zX0fCcC9GSCFmpgPwlQNV8NhrH+2Pfncd127ufqsiQez3rZcQKJ
	 nN+EOv+MA4BfvQSY9e1+dX+TQDigvqfVP/bnNc27EZveOlimRPyv95tez5q8ex74j/rZJ
	 Z0f8Nf+AfPmERjdkMjI7g7FUUrXc5S6mYCnkB7aqZAkK5Xpwio4ObQLnVUR/Vbp2lU2CH
	 MkukSkq/HySwR3b5cC4HSNTyOZiPbrjyXP9MsubFNbYxKHSdCLckFunzuGN/9Y6ONAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
	b=O3CEP1mvaaa35i4HZuu+eRgFil6ctEwBfQ1GZAK4cFelSVHLJXD4gl9bg1UAUio0Ww6p
	 zWCCHjiquUEp67iLjHr2dK3xuc2TyQmhVRPQY5tPC590opVF2YCIaF4jRURPpD4yITqqf
	 e3JRDlpIBcT6N79SgVmbKBmOhpTPfhe4IplwGEoqOpPttBzQ8u7WZ79fOB4eZUuI1tEFz
	 Si95kMOPNNb1EzXAb6M6ewj0iliMF85ztn3ktQlBdDrW2DPOm7x9nFtDw/7blzam6k9yB
	 5yDCed2ODNylGShlwuZG4oJEzNkqVl5H3Sr9jZL2TEy1OBO5euG4Nrg3vNl2DvhtMSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjACiQmb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265F8606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 265F8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjACiQmb
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so10960720c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795742187; cv=none;
        d=google.com; s=arc-20260327;
        b=iIBqrqUFgvmUKC7KlXkJIfuLn9qHHb6LH3DbuXhxBBDWu6nz8FPBGI7cUOD5U0ujju
         g7UBug8fjRgX+TUBjlShme0l8+oYSGOsPbmZFs96jOy+8LGyythwLFo5AI9SAzIKioSz
         odRZBQ4O0h9cztMoDNDM2NjUvIMw/D4S8+5foc6BxH1Mic5Fo0LHhb8UwZ0wNtHYz0W5
         nCSLF5DHby/B8vDl/lnffLUu5YawfXj30ZPJ+t/XhBy87iuw3+yJrwkO6D4Qm2HOz23V
         QUdvkYmKf/VMoE4Y3/ETwveRE2sQkvJxY/lkHYVMJpvOd4dhw4xAXcQy56lmk45QOQD0
         zVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
        fh=fo8rqZc3a9eisoixNs+2TNXiAud2K+eGjElEAtSPWlU=;
        b=SNcD8r6GlVaMMdgFrQ2NzGioDDwWroqDpckzv1B6yGyv4SlVnUXIo331YkKvBtxBPZ
         Lk7fzOlPdYPInfzrexYbVflBFq5ZhBV5m4GVbM/NACWoEPDNl+wjezNqhRShcQG4JOuD
         xKC1+4OUnHW/JHHl1F6Qb7k85k6K9xxhZEQe5hCS8S0qqTlYtwDQFrmmIwh5kRGuJ/cG
         WkGzTfVyhx27fqQn7wNuA/M4r+Uz+5mOvxJejND2vgMhPCGy9/myNrRNwHXOmOMsOZyU
         8rCBAmLZOIJml8B/JC85EACfsNgsE5E8awDjGA/pdKdMz2opT8hN8bJdk+v7BaqUWa5c
         /45A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795742187; x=1796346987; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
        b=yjACiQmb/PKrdFqXS/mutr6kBPsP1vGmCYqLSE97eXboBzbviACN/BujKGlE7x1Ndf
         mQOozTdjoXimTbRYLMcxVD47jQiA8hZkiQOi0P4Eb6fZCfLIVHeyY9KUC9NeI8Mxk1zU
         bSQihymHqpiucthKPUf75/FDSQ83Ex6n3rizJzs4qNkLXnDjly0FppZsFGLfjU6pMT87
         nqIa24UonGOBw/vVYYr3lRkdUvgjx8FegLKMaPkb0KpNwHPqCtP9pgPmMrkfA+MTFHnq
         6mvNBZcWpKrM/ropu7l4jcZ3beMOaA7D1bMhEfU5kCfi8ics0H2RAp1I6fWJJZAi0b6g
         WqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742187; x=1796346987;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oPod1KuFvBWGJsle2l5lTHqLGq3m5KHrsHkxQ2HP+ns=;
        b=2Q43Ex+yl+93Jbek0EP5X/FAz53dOmjuVXNLIXjMrabbUVxHvH7D7ps4JPYbgNvNXz
         UCi/o/InRFbJmW4MgZXXUE9jb/Jv0lKhlIkSdiC174vlBjEu9HtZDoWisX8TPOGqgIwD
         NlsX4GXqDqvZ7IKod717OMHk6wsTlvvz8RFpPsH0In8PKP//Is1/ZKFmsh/xUG2WcGqC
         eIDDZPApV87T22AIWKRVyA8pjjEhzdZhghQwYzJJ2TtgD2bMOMdRgVkedo/++SN+yYlL
         ZIiJDYs3cOTTp+9smqlxgwm+Z4WqlKPIaVkfUYLU/NKDad0KdZZf/EZWezkJ0OL7tEkg
         wvNA==
X-Forwarded-Encrypted: i=1; AL+hErHPX5kxZI0OnY4a3jhsDqe3Gyr43ppgD41hIpvv/ReKrslKGkO3yc/PAxWhXfok+NKVBnAus5iPjUGwecA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZEEua7pn+O7RSebMdyNB02d+sV39d8NHbQYuHEcHA6ZwIns4z
	M1CV04QLNiwlKrd9VJNsEadyGptrVfIq7qeS9/gYTdzzpsBy1vcYZc88jLjk7zFtQg5ZErck6FO
	d8o7RmON2TgXt0hzWkBvqyLVtMqDkM2eHfMPKxEpNLcGQ
X-Gm-Gg: AZFdTZcUupXhWuah9AsaBaIcvLpcUgnM1lrWsLEJlh+JEKgWyE1kXx7nO3DV5plAypL
	1wbmyUeXgPZkpCx78Sb9DDukmHTHFT7aBqOf+aHU6BhV8lYHcQZCcIE3p2RAWyJbkXu3mgXrraJ
	D+dWjegXteX1Jg2QdcStAcriocJHfdsEc83cXVtXLpw+IxXcxjIIbvKq5xAq+pNZibWAbsaQwnI
	wCbGHHTfyaTyuwccjarnnOA78Zfo7THdrin+xc+zktF2f75iyoOxG13UfmNGkUk3q9MR6N8dvdh
	iLIf8fto9gYZdZVRw2nAm250HJa+L74zBeqKrmOnhpSsTEAXwkwT/W9u1dSH7oJHJISJj0kaDBh
	AsneyRwi6lT0u266uqtzwyXYsexQU7umRW9NE
X-Received: by 2002:a05:7022:1715:b0:144:f089:b189 with SMTP id
 a92af1059eb24-1b55691a623mr20952158c88.36.1795742187259; Thu, 26 Nov 2026
 17:16:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-legion-lighting-rfc-v2-0-845726afb71c@gmail.com>
 <20261110-legion-lighting-rfc-v2-2-845726afb71c@gmail.com>
 <9002537db845b7a0a900612fe3a4a3638f06cd37.camel@rong.moe> <CAPKD0HfHuv4vKWeff_uhGxXosuU279qB+kkmXNPXJYL2kxFR2w@mail.gmail.com>
 <47e0364e0de6b9c22b21019d3d7e506defe58964.camel@rong.moe>
In-Reply-To: <47e0364e0de6b9c22b21019d3d7e506defe58964.camel@rong.moe>
From: Ciro Pedrini <ciro.pedrini@gmail.com>
Date: Thu, 26 Nov 2026 22:16:15 -0300
X-Gm-Features: Aa3M54om4nbMxSWNQWs_ctJIhvW8looc3McNT0nMJFNk8E5-YxztbEXgt1ad9pI
Message-ID: <CAPKD0HdL19j1CuTKJT2E0mQbYxkwPzX6=m7kmVx0ZLKp-mJ1og@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: lenovo-legion: Add keyboard backlight driver
 for Legion Gen 10
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Werner Sembach <wse@tuxedocomputers.com>, Aaron Erhardt <aer@tuxedocomputers.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rong,

On Thu, 2026-11-12 at 01:36 +0800, Rong Zhang wrote:
> ...though I won't insist if you still prefer kbd_backlight, as long as
> others are not opposed to it.

Thanks. I kept kbd_backlight in v3, mostly so UPower and the desktops
pick it up:
https://lore.kernel.org/r/20261127-legion-lighting-rfc-v3-0-15c55d9f15b7@gmail.com

> In this case you don't need the pre-allocated buffer, too. Let's allocate
> a tiny buffer on stack.

The pre-allocated buffer is gone, but I allocate it per exchange instead
of putting it on the stack: usbhid passes the buffer to usb_control_msg(),
and the USB core refuses stack buffers for DMA (with VMAP_STACK they
aren't DMA-able). Other HID drivers do the same for hid_hw_raw_request().

The short reports are in v3 as well, without the msleep(). The rest of
your v2 comments are done too (raw_command/simple_command, the
static_assert, errors instead of clamping, devm, comments, Kconfig).

One more thing I found while testing: the controller sends 05 02 B after
every brightness set, the host's own ones too, and also when the level
doesn't change (Fn+Space sends it the same way). v2 passed all of those
to brightness_hw_changed, so v3 only reports a level that differs from
the last one the driver knows.

Thanks,
Ciro
