Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709504;
	b=RJt2CGqgaoYg+iutVCb5BbqgNov3+ZlX9tjxXltaF/gkC4kI622mZNO//fYIyx5KNVte
	 xguVKMgCpHkl/8K8tPl1RwXYu6o39sULkALGHh/B0v7w/kp7hZXFQgDol86nKdJF5hSQf
	 UljslnuJYPeT3y76e1xpflGReoWLyGNbHpZr7Q14qnyrPmKK8Gs+cJBgrwXi7k+nYh/xs
	 FPgYnc6wGuRPnTvtvjSZzSrfod3tyeDYBikNrgobbcV4yrOpLwZxoZN75k8wgMq2yt+UU
	 ZEJXtAUBY8cOXZrl5TK8E/WoSLajYwr/xTdfQ05aRO8XshoOesEPoQt5+HwwXohkSwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rJ1J2T0KZjP+N1piV9zXMZIO+JdMps98HsKI1Aw7bHk=;
	b=vuoatVBUloFwP+wOlNLlJ0LahSXkzloYX3xIpXehm5OZAkvLe61SyZ8eaIS64pKRgQZH
	 G0uw9LZrRtQJAZBMfHhTzQ6L59umqifjjphNSc0v0wsyrMlpwCuCmgXEuCDKYO5L7QQW/
	 IuGyrgw8/Jzzhoy2elPpJEBNgtjzSjv1n+7CD05F0I+hvEgy5HkhEzMkWBN1b6nardt7g
	 csZO9FlKBFX+uLF1mIyt9wQ1uxE3PABA1OuC8aRROmukZsOv3nX951l8to8JoBIhz6t3H
	 gYo+GqFEslm7v5DEURctUIeTHY3tgIAL1O1JJ6mags0EFbHzQSUJkxnNJVzOlw9vgUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xo2BhleG;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862B4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xo2BhleG
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so3762227b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709504; x=1796314304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJ1J2T0KZjP+N1piV9zXMZIO+JdMps98HsKI1Aw7bHk=;
        b=Xo2BhleG+abqRQjMhA/fSFjg1DX0D6mg83IZSNux4uLnB+KLs2diZBmvTrTFf8Xhqw
         I0Qo/ATkt7PwCHsBKQXcuJtZL3FbTCc41QrHHEXnrMvC6CKRdA+tRCUisiMoXvvJ1XJx
         8Eh8dmJ373Ab++ADuEbmUNFUrG1Xhtt5r9DTShW9Xo0w3ml8WjWiEdHbFjjprp8qC7fT
         32QFxrgSH0XtZDXpaM5uskHdmFzkhPCyHapLQhjWjz5Vu0hFA3fTAT/ZB3f1p5tyW3Va
         Pt9UdsMdclRWaULk7UYENX6yxB/Xc/ax4rzHXVTPX5dutBuBSKZwUsjzSjKb5zPqAtZO
         ZwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709504; x=1796314304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ1J2T0KZjP+N1piV9zXMZIO+JdMps98HsKI1Aw7bHk=;
        b=HvePALDpkgDI5GrEcweyFKxQ2v81btHkXeTcgON2Y1YG5G36JctAOMOq/x5chba2yg
         2QZBStE0Y5I492AIl139FyhE3n5DO4zhFaqw/zHm7DKv6t9tSXq8mzohTEQYDDvLSr3A
         Fr3MuFWWr6GSu1I17MTUG0gVrsjq6JUZLxPcBo5j7V8zVHoAMwmDwJDLF2nqPZT9ImqX
         1je6Kh9fea1S1b6tAuq8B6fIOgrV7el3XtuI/zrk9Rj+2FdkmLcE6FaVoQXgJI1ik+fi
         As83Ew2xlY3z40l0zWKqGsqQovK4Jgs2vxY4lrHcdXvIhYx6nPWUGyaRst0gkC87S2nX
         NYTw==
X-Forwarded-Encrypted: i=1; AL+hErGkTFAcukWHk7x788/Osm3KZcNO3rYTy2xG5aqFOX8+BbsViXhjPoa+p02xUqK1pxWXByDgljsWvOfVoPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i+QDj07Az+0o8jsmShJrCEMJwdryPJwMn1o/ggzPJadDcNVry
	d0s05Bi7y4MOe4YAxmW0wHaqW2tbNLvHRzyVQLaZ5G2qgteyE7dRrMkTsEhG/xC3Dym68A==
X-Gm-Gg: AZFdTZdTU2ZwArbjLA6uYl37E3nKOd+YaCKLRVMBixdUdyCKw/4SuqWoKBm/rI+dJK4
	fA+zbugHfBMP68BPoyqEQliznJYIaVIHJHAzv7OWy3CxmMPzoJGsmC380B1fsYqK8XlYKUo9Zx/
	IIIY9r8dwA3z+9yMbM4dwvSoAt824VruIQhwJ6YBOX7BWvlf8hSbOuP2Zp6H0jmFCxdkH63VW7o
	WTs46mMsZ2MkjU5sVi4N3VPxgwKmshAHZWWM5B3VuzwUZDL1/QsRo+lE8yWg3m2dhSm+Cm0LxPt
	GJXLFq0zjW6ns9S36WD6oe3EOw/IzsZUwCVCj7mIr+KSM/1E7H4BpD7IL87c6sFyEhT8Kr7fSL8
	yLwoW+9OLiLMjGH1uj+2SGhsEtP2YIykQrunlTbWxQ/8k6IkbmjwpVnwF587k3TKf3BPC8xARNT
	1ZjAIaK4exc6+4sJTT2epmPXsbDFHngEq5366sTqyotQnLxgFbcr7Ajdxc9P6kA7QcnNJdE+83/
	lsrCNOgBlpbMWCJvdkHktFawdhwlxb9Ud+izsq8OnJiomCbNu/syh5bal4EtEpLaTnT0DHDPl+i
	NmmDc9lJtH3nUUF8t34MdPMu1lC/+UMXfojNWzUHuGfe5dPcFXrrcrouskTjMI00cgosVgP5NP+
	Q2SUUzLw3MWYZiRCeRk3tSfXs41rriK7R4KSe3WSTkFFvJvQoWN+2i01xiw107FsfWgCVRNMQmU
	8+vI4Oxg30MTUpyMh88tJuAw==
X-Received: by 2002:a05:6a20:6699:b0:40a:5649:4ec5 with SMTP id adf61e73a8af0-40a564958c8mr1609462637.57.1795709503835;
        Thu, 26 Nov 2026 08:11:43 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm10698001b3a.21.2026.11.26.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:11:43 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Punnay Sharma <punnaysharma805@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight type 0
Date: Thu, 26 Nov 2026 21:41:31 +0530
Message-ID: <20261126161131.962234-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126152448.847538-1-kapoorarnav43@gmail.com>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com> <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe> <20261126152448.847538-1-kapoorarnav43@gmail.com>
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

Correction, sorry: I replied before reading Punnay's patch closely. It
only skips the warning for type 1 (KBD_BL_NONE_TYPE); this V14 G2 ITL
returns 0, so the warning stays with it applied.

Type 0 is a separate case: no bits set, and KBLC also returns 0 when
the EC or LFCM is unavailable, so it can't mean any backlight type.

Hans, Ilpo, please ignore my earlier request to drop this patch. I'm
happy to rebase it on top of Punnay's patch, or to fold both cases into
a single check, whichever you prefer.

Thanks,
Arnav
