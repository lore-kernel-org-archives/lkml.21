Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125641;
	b=fqOsCExOEwI28lrRMlk0WuYAI7Jqc22VTvDjJON9QqOd/eOYgE7/YxL4At/Ybe8gLoi6
	 zEiPkpiC9P4P7XiIVeHFupqI4234LH4VeQBe+piJKVRna4x/xlXtPNE4f3HNDF5iT0EQF
	 vVYlfPGNLL9zIoO1xdJGOiNkOVgbEgL95hjj6hw3qhT1fL4l8bo6GmTU31mtYD79Q8FlO
	 hAcnt2tOkHOAQhY6etbnQ27h84DEYmIBf1aDv3b406titOat6eTojhtili/ZnT8wZmLaR
	 US2WWrcYkfkrpS+0wx8Ay1cE1/u4jey040hua+ZyjdJfdJdSW3YEp1NzYNxQGRyo/iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aA7LciJps6ZDvR0//aGq+VpK53nWWFH0Da5N4W303Sc=;
	b=sGclwNW2PTSI8q/iPJA+h/2+YywkOBprhR32CNdtBuozXUeJLLwK8+gP448/2LfGdBCi
	 zd7Wm0LZowUcgJZCX84rBYZ6O92PS6hycI5ONYR+TOqlr9653rZUxd/7DoPEx5/IejRFM
	 Vn6w1lbtIYHwkvVgox1nZ4rcpFgWp98Vb131kTP0eWkWgAKRQgvIurYnAOxalUvARrGRT
	 miR17S9SjccUr5EaHWolLCx+1niKep8/qur1uXBECbEoNf+eFpvZZGroZshHy/dcOjiwe
	 nF2fHnvUK82uLUDrF1ssFZP4lUpVJ3WcUj7h/q61ebCtjQV8tAi/iK3eCXEfc94PB/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LY0Vcm5G;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0282606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0282606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LY0Vcm5G
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14e307f29so152659e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795125639; x=1795730439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aA7LciJps6ZDvR0//aGq+VpK53nWWFH0Da5N4W303Sc=;
        b=LY0Vcm5Gx6jtSCbQbmcAMIgvAkYh6b3PSxYQDcL3vQH4Yh1M4RCrMLuKACO/6IvWQS
         H4+CO3Yv7VwSKDHZ49PqtRJl4scaAqCnL76IJJg18YpyVn1j4nF4umbA0EV3+Jtcchc8
         8o+/KoGUKjThDLsk1X56biO8xlSjE7ruImAiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125639; x=1795730439;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aA7LciJps6ZDvR0//aGq+VpK53nWWFH0Da5N4W303Sc=;
        b=Puqflh7ayszQ75ujGIuU6YtqEVlKw4/AxIUklQDuYel0RG3BG8wW0xlGPoVcHsF/RQ
         ZpRPn2hyEyAwa4qjevyS2BljvUXt+tZARZO/VoXPs3QkvTUCKfXw+2qO/uMW6EvA2CF1
         +4b9zFXGN/FvrWtfL500YL3kw7aDytFnG9B3Hdtg6KAl3rfuKB4Xr9k8CMipGALe9Fv8
         X32/NwluT8wjzQEpcxs/SYY3Ev3Ekmq4hZSG4HMDELtl3VmzK+nVLat63bl0xrmSl+FT
         NkU/e6nNBx3TRzV1yX9gpsixSjZr84TqIpmnFyIy8ESiWyYa+PNhREknMBBtRmZs02f8
         9RGg==
X-Forwarded-Encrypted: i=1; AL+hErFqo410Qj1n0wyUCm9zXfhAWx2tb4/2ABGvied4BVBAXao1vxCz2S3dtQCcfAPfnl46HfPZ1O7c5PdVDT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wHaPh9iliSFOgsIf93BE0wkfQa8IAfh7+Zz793c71Lp71Sw3h
	cB5ncOhFhjdsadd5K4WJZO0jXlt4SANysDCF6FadJ5UTC2g26hNpl0RUr27N45rQPpvZU+nCgpZ
	BO/aL/Q==
X-Gm-Gg: AYBFou0EsqcWyc/2IiYwr9Jt07Ox9GvteNV6wkC5Uc1hq9RLLIntCGASmEqtdMTmpzL
	s+olPj534iR+4WOdaI1a1nNsvjRShmFIwpaEQdlTOWA0KPdQBFC8DxUeExJ4R5Xim1FpPJ9NMoF
	HtPsb/Uoq0wQ+SsjmpdwGaWyOkOJK/NbbTZRkGjk65HDYgMC9TQByrf4uCiIPCz4J83npS75Itn
	sAemhcxbe/IPEqzBM27HVidapNEkKNa/+3pokKcI+cMcP0GrauS/7/4XmlUxcvmRAWvRr6Y6VYO
	mCXp7unB6Y9T1TcGAt+/11XJdZTTVTpdl2GKna5zRu1EJjs3PsAp4ieL9WpOke74dfnKx2/rjT+
	smrfpfvJRIPM60G96UEEsW0VHgynPHgu9XtTZEkBnV5Pwm8YBgem7M/Km3DE13TbEpBZAGLgu+k
	PVnv0jvag8mnxYxbRVoC4IclrfHzmw6ho1u3NoDX5wC9mzA6S3ftee1oZA1r3U9veXc6FqI4aLM
	l9vBBVUvh27vv56IrxQe4azXQQJvKKseI5S3LQT12OLlWzC1L82QyqgIHKKtN1sV6A1jRlI4Hem
	9ajWyH1GOiYrdYZjZ/RqP6a9KM5/JjgGesKoUr43ABtUFjVMVd+gXt491QdEjSKkhjUw
X-Received: by 2002:a05:6512:3e16:b0:5b8:9ee1:10fd with SMTP id 2adb3069b0e04-5c1bc7cd593mr266422e87.32.1795125638901;
        Thu, 19 Nov 2026 14:00:38 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm2620691fa.16.2026.11.19.14.00.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 14:00:35 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c10dc41270so140745e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:00:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHp5gZyBY4gutwXz5ZA35/MLmVuxlnscm3vxJK4VRHEcO0sH21XvfebzLwWvMGitDpC0pjpINbzn0fpPSo=@vger.kernel.org
X-Received: by 2002:a05:6512:b91:b0:5bf:ce1f:674d with SMTP id
 2adb3069b0e04-5c1bc7b5b0amr294883e87.15.1795125634616; Thu, 19 Nov 2026
 14:00:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119162353.12962-1-architmore303@gmail.com>
In-Reply-To: <20261119162353.12962-1-architmore303@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Nov 2026 14:00:22 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VJHHHJ1-YXBrrrcbEo=zh+ieujT6Q2FpQ2gfYoLKo+PQ@mail.gmail.com>
X-Gm-Features: AclHuK8b5SuMQ1jnVWmU0hGRPWJRjOsQeE75hDNGcjbVc7Sqfy6bSlSaSsLYv4w
Message-ID: <CAD=FV=VJHHHJ1-YXBrrrcbEo=zh+ieujT6Q2FpQ2gfYoLKo+PQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/panel: Use lowercase hex literals in three panel drivers
To: Archit More <architmore303@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Akash Sukhavasi <akash.sukhavasi@gmail.com>, 
	Chris Morgan <macromorgan@hotmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 19, 2026 at 8:24=E2=80=AFAM Archit More <architmore303@gmail.co=
m> wrote:
>
> Convert hexadecimal literals in the initialization sequences of
> newvision-nv3051d, kingdisplay-kd097d04, and leadtek-ltk500hd1829 to
> lowercase, as suggested by Douglas Anderson.
>
> Archit More (3):
>   drm/panel: newvision-nv3051d: Use lowercase hex literals
>   drm/panel: kingdisplay-kd097d04: Use lowercase hex literals
>   drm/panel: leadtek-ltk500hd1829: Use lowercase hex literals
>
>  .../drm/panel/panel-kingdisplay-kd097d04.c    | 242 +++++-----
>  .../drm/panel/panel-leadtek-ltk500hd1829.c    | 426 +++++++++---------
>  .../gpu/drm/panel/panel-newvision-nv3051d.c   | 286 ++++++------
>  3 files changed, 477 insertions(+), 477 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

These look good and non-controversial. Applying.

[1/3] drm/panel: newvision-nv3051d: Use lowercase hex literals
      commit: 758498460e911d51c4dc3d32c925f56cacdb5eb6
[2/3] drm/panel: kingdisplay-kd097d04: Use lowercase hex literals
      commit: 4c1ed6ad2d326b73c0a2b5bc00ad76ff90047871
[3/3] drm/panel: leadtek-ltk500hd1829: Use lowercase hex literals
      commit: c408466a4dfaee4b12587e926c5b85e68c8b3c40
