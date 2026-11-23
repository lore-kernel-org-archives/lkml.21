Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446404;
	b=vUhe99weV3o6C9hchkH5JgKJtkOJKhPC2p5S2yPVcNsKz4D9WwG6YJzp41ZuDQs/fFZo
	 waBz0/kflFqC092L2un/6gOA9Y+PCCaoYKW+n8EoKxikc5cep8p8vDUOL8kst2V53VZVI
	 4D6Opg07hM5AxeTEQpkwAZoZEVppD3ICqH+hYrpVD5Ywq7SJAyvICfZ6LmnQve2wOlT0i
	 7vPiY6gYeZLy8e2O6LZe8SCFBL88hzqusWCnPl3sbFrVdh60esQ80hJywR1IVEmcr4K7X
	 hKv7UQF64YvYwGeifXTDpZT6B7/eUl3cU0toPJiHLJLTLbU4uzY9VZh1Z8iQgKnje9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
	b=rG+kO9yIg4JgRJQH2ep+9vD1UIhkflYd3C6u5Msz+MMoMya2tThiQ3RSsw0q2Qx/2jBv
	 H1YgCXi/zBrO1vbHD0TAD2Lu4iv9ZD+JSys7PabFiU7WLcis4drTn89w7GO9o4cEtuMUw
	 wwglBFqPpGwjaMGQSfu5PL940GL9IhdbCem1fDrp31EbPpGHEA7I9tW7IIh4cB4uEmwhI
	 bnJkPtTHbh/TgJ+8uLQWCGglbVgA4rz6ynsl9245P/qTsZWnFf3X8qbFWt9VeKirt/h9C
	 XnGaDKrfPI5BupuzkYdtEm2b4xpuqwXxYHLlu8X9tG2xEanxuq/FGwUvWKDZMIMbfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/gPGOl2";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1E7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E1E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/gPGOl2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso41819695e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446403; x=1796051203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
        b=p/gPGOl2AjZNLZFe6F4Wk681dmbZdcCIz/meIO31oOhZZGXQt3h6/CMRVP/Jqp+/v8
         IsFfPQtxZCjUFyGSLQi/YuFxseavi3mwMYnG5JH/pwXsru4f3M9Qvf4lmt1jiy+/VEun
         AIDSeXfBCksOEUfxvtc0HADMAJsewLbe+jNj0twQAuG0tKLAMqxsZVEII2eQN35R4t9A
         LJCIYmvtu45Q3uCX0i9+/G3L3BWdVi1afYT6vqANYc0LP8WWtjS21oC95qizuEh7FFDT
         qcl7D7V3Jar7IU7D+knRUXQXk6di7CfOrhtcinnOVqw8ws98NTu9bpZUbmROVTPz55zS
         pk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446403; x=1796051203;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EC2mcbhZaUCQFFpEa+7YYJ6zsvThGtcbiOMpvNNHs8M=;
        b=Gm50zvaShJbMON080JU5zfB31TlY+3/l0iaI7puWI89JKOW6jOgRY82S0dTYfgjrzm
         0OgfN06wsvKivKwgXuT0cidodim9uZRaNO00O6Ic48nyaCsEvGNkGAbVxPdqXZmqmclx
         15ciO3Bf0WGk8Tkxtl2+ccHcmXRqqRJMobmkIj9932RS5CM1RYOaiPg7FRsY6W+/QP3h
         XEf2aMSVFlrolKUfoVRXdBSlEC0+dgo2ElUb36byLs5JDUrVhxnQNFocx6ZRSMA6ltZ2
         uAUsksNLHpyfS/d7uACIzd9Bf5qJEj4HWzKUfQhkC8wyFELdU/WcMoH7JAI1iers49iH
         0QJg==
X-Forwarded-Encrypted: i=1; AL+hErFpfSHkcMH0v8k2M17yqttX40VNT/1OviYVTc2vnd+ish7Qrmj4RPWU4HXZH8rdwVQ6AL1OlJ9sNpPOoT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+KbFV2oJ0rCDDehM/qr+CLULmtkKjUEH82F6GX8S/UZ4Stmse
	SHYdJJrfPPy6G+73LuFU+rYDN1gWdT0xiXiRNFQJN4zmCtLad9/iMlLc
X-Gm-Gg: AZFdTZd6wePuj6pwJxM4c7ugaVIfgEB1jTOvDT23jXgXU3erYVSjEaYIdRLNh1pxLWn
	73W74ewy4+ZkdWEo9sBlXzx1aMXVu+0nAXS74kSbKibKb+Ifj/+ZjD0hrnUEx5kArrfbH3uPKCb
	+T1w11b5jTEm4LLpWICpWHt+MBcEc+vqoMgHQc8rKMXrhnCyJWPcVm50hs3wEtis4lODm93luYZ
	XlDmd7zo2a9wKTQ3NKFQtV4rbPygxAaHCp4M4Imh8NdS9LMeGniEp/R0b5SaXJw6MtTWSU31BMY
	mXjlfJhsv+XctTjFNaJKNuoYaAFbMkgE6JO+SBNhamBNimAskEheS0qrqSqKl6MQbQDlD6s0R39
	UBMpuNsLLYMoRASyCzvmwV60/gcrlrcpEs4WmqRwNDjw5b5Hvc48p29DHxps0IqQau9YpKqyOFt
	8Ie3M7y30lXgYdSln7UzmDi+NYUJFy7u7TAW633i35YxHApCRi8SoG28qivkqIqgnyJ9wi3fCbR
	QgZ35ZoDhKJKlWu/aFKgvMR2bccNHbatppclAwtVveClNa1G+bZrXqhvqdIJX7pEY3PEtnJukDt
	yxeMU6+V5dzu6/bpkIrjiTu6ntakp36Kpw==
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr248093335e9.35.1795446402877;
        Mon, 23 Nov 2026 07:06:42 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm22848177f8f.51.2026.11.23.07.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:06:42 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Mon, 23 Nov 2026 16:06:14 +0100
Message-ID: <awRWEiYaktJcbFfU@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com> <awRQxKxzVyw10pFr@ArchOarora> <18c7d8af-1156-4bee-be0d-f78334d1908d@bootlin.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

> Can I keep your R-by with this change?

Yes, please.
 
