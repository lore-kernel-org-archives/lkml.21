Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452201;
	b=ALhdEwnHk5hBhK/8DT/9vyq8GWGnmUv+8Yef6H7t00Oy/D13b7D5dcYldOpqxG63Ci/Z
	 tfl9SBJxP1+icQaHTTRI4clhV/6YKUZxUo7YdcJ3zrQsVBySrf+2IzBeZdRWYdrFp53ks
	 BkeKC1qBsRN3F3APA6E5PXNcWXl8TWz7pvqMrNgH7a4pUaVQOA/hkx4bSKkjwuua902V7
	 HxGBS/v/xwXHQV+3D3JvaMZOyrm+Tv4t/iNJ3OySbDqMTdS2nYwVW4ab5AfevUyimMBQk
	 r4L/mkoUGqBMNmxD0oBvEMvS7RucmwQcPO6f8zVcF3gZTHZhbYfkP6mY+XEi/oxl1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=LkanCEy56313GwKdNz3yPq+fvhbMpSjimDlTmzHOaLI=;
	b=y8cfB1B/Epo8n2iGbhpjekzrlszmseeGr0CgEnhFCz4w9PmlGbBTWngnW+UgK8PcXqqo
	 sxpreti1uQevY4CPPoSPvwTbbxNmShtT98DZX4sLebWW69e8CpuGpOZTScKIBiu4CwW8S
	 iC25XBiaNtL7nqdVTiXG2N1reIgDchTudyAU3OtH38cHdpY7Us/zJqtNhYudae3OBsfK9
	 Y+0wcccxRnQxHQ7h947HR+FLRdTW2T0//xYRtcRM+mnwgyjfK+XAsl9Hv13xCXz6+kV8+
	 tdo0/wswq5IDla2Yf6R/y+NFkIG6YFx3UiKpn1kAH5VGEiKE1Jm0cYVCltR7fqR2u/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mr39qinH;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4B853606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B853606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mr39qinH
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so4894503c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795452200; x=1796057000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkanCEy56313GwKdNz3yPq+fvhbMpSjimDlTmzHOaLI=;
        b=mr39qinHd0X+9myMV2omJzSJbd0JeBeVM5+eNeph0qxT/9576X4TbsHehVU9mCpQgu
         1d8pinvyUXMwcDGmwuKkK3vc53j0POGWZPTlsjAWWlJcnywB1Md1fv0rdQhtSIJ5lGM+
         7o7py68E6Q4KpLO1EtQiXeF9ecKsRqArfS2otrL9RE35EjZR3ZJ6uWqxo3eQBlCLWnW7
         sGwqLGGP6OCufZKCW0wdprLS6VAR59B7lIhINRQsyzwtZJ5seNOFP9+v0STB/7jKopMf
         2CEeIHToU/icnteFAIHbnspkfbFwQFyqpRNWHl6TuVrO45NT89651bP6EBYk88jr1pqa
         kehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452200; x=1796057000;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkanCEy56313GwKdNz3yPq+fvhbMpSjimDlTmzHOaLI=;
        b=2ujsO7H2gQh5LLsTmgisAy56r03nrVtAb5MRPp3QfHWggAXNqf/geE66bnXxWZDi9j
         65pmwriA4PRwspHLGG/yTy+Izksx/z12ctrKvLrF4N9HZXpNHUl7hladMQG9EucQBRXs
         6yWWOiYaey+Yv0XgTh+jaKc4uOHk1z9YgxmGygPuIrg41vb8z1O7onkeh/AALVuYorDl
         p1Hfk2LdH6DYnjul7xSOXNY4kng8qrzFhl524D8ktz/taUyYmdlGSf8NuUX1hVwCLT7e
         AV59Zh27upBfv35+Efn3rhNtme7Z3JaSlwis+dj8Dwna7KPGFxSlyOAFUw096CxwvjKQ
         NIyQ==
X-Forwarded-Encrypted: i=1; AL+hErF4wiu+GDifw3oj2eZGglcY6lKOyDPYmYFMo3Wlkmt1JQzXEZ2eKyKtuSSehUzeScUtEOxEjFV9iqIqM3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VHaWMmTUeYb+FjPOm/5vDTt+hYqJRRtEKudIGTTdIEMI7eN4P
	nNMwn+Cm/4NFdihlbbxxxoUUzLlnnBG1yd5y8E1AxArSLYWPw+iJOfxx
X-Gm-Gg: AZFdTZee20dBrXBNwN0HHJ7qa2XL38P5CCDJiLm2mFTpObzulVMSvpVIGxNtkHC3uFn
	hQHKKUCcMXC4F2ye1HHwwvdRcGxropEEBVaBpXnqrN4gjAuj9DV/ywKzk768osP2PLUlecxmbLZ
	rMyHzYWqv97DxpmyfjpQLECz3QCRHKCUfNNNo+3zSQtt/ia4SqKMAcBUSj6woL5thlJgBW35ah3
	rncE//t47YjB5pVaRpITt7p6sdLNGd4Qd5uW7K0GL9mqGu5KPyulTtQdfgs2xQ4gAAa7S6Kg1mb
	FZiqUWxmbT65cTasohFuPb3+nE2QAfNiWdZkSp6AXqYkpq3iWzgFH+CvftsFaOh7JgU+/5YBV8V
	gtn3XfY9XnEhMoAkkKM5JaoLqNDePsTtd+eOwk4ilCa3F8uP+r4cnV1ZO2r1K5LqRbLCFthFx2Q
	+mJrfBes3Gqbc5zLY/B85jkU65FiigIFYu3Nca1/Ir+rMwBwlY271ce3XNnrxaZft79bfKPLLqt
	uDB246kV3oPA6pC7+Kdo6Q+6HOcthDUVEJMWtcCwozWuvzDTO3qsNccSdtMysb81QKKxqlKuUQl
	EUJ9LGL31esGVb7wKDVIETZwCZPstg6YFf6FtJr2Xd1/gEU=
X-Received: by 2002:a05:7022:62b:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1b55686d67fmr16770849c88.11.1795452200249;
        Mon, 23 Nov 2026 08:43:20 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm29199141c88.1.2026.11.23.08.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:19 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>, Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, Honglei Huang <honghuan@amd.com>, linux-kernel@vger.kernel.org, TAKANO Mitsuhiro <takano32@gmail.com>
Subject: Re: [PATCH RESEND] drm/pagemap_util: Drop the kernel-doc for a member that does not exist
Date: Mon, 23 Nov 2026 16:43:17 +0000
Message-ID: <179545219715.77822.17551578304982310929@gmail.com>
In-Reply-To: <20261123125127.4114196-1-takano32@gmail.com>
References: <20261123094032.3993177-1-takano32@gmail.com> <20261123125127.4114196-1-takano32@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py

The first copy of this patch did not reach the archive for over an hour
after I sent it, so I re-sent it in this thread.  The first copy has
appeared on dri-devel since then; the two are the same diff, and the only
difference is that this copy also goes to linux-kernel@vger.kernel.org.

TAKANO

