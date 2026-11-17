Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794955614;
	b=YYSsqPgG6KnYZVA9DICkyQPJsBYPXoJoW3I4uFJzBb2YHuVxGHuRIwJbc3VEWp7vpP6T
	 gxxuDqulqvTQBCTwF8TX7TFdiUGjRMXIWNyQfwV0YicfJXalJKtmbF8ZZUgpmLKDH38B4
	 6JyPPv0S9iBIY6z0ULWmYensxyu8ndnAhqk+M6y0VC8shnItIw6cYTj5tVMwPPZLBCr6d
	 0sTD5+FsXq6GsPFPOMHJ47IgeSWl7pOgcITCtVl7edHO92VeKFYniAHNSUJhf/e0SXqr6
	 BgqPe7XnhYX48YyoJsfjpXwQNVyKZcm8SqHrUovB8yPqmuqGriL0qLcGipkTzJWH5EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1hZsbSvYzSmLFEJ0qev10mPTktbA5RBsuqmPE4u2bw8=;
	b=z4+OV9TZltBFvI0SjIRXzKmT8RKiqvTeGHz9HaN944CvJ0hw/tXlo10yyBTm60KpTRB7
	 BylGBGGXizY1a8Js6heZidXcsyyJesisrXDP2k3upio0NRLT4m3bkRvnCUF0D5QaHQfW1
	 LlL6Cem0FWU7e412wDcYa3SA6GU98TPnwnhFy5xirLnmii48NvtfHG4ePzxorUp59oWaY
	 D5r00o7XwbQNRt810S6ZNCU3GX8XRKhqGirBD8Kbg8inxG+vcZ85qaAJee2AmvFnn5yRB
	 CgyKJNUHaQlMflSx3JxcWquzhV9RIf/NMmg12XJfCJGQuMUBX+7q3zk8RXd4q3Wqmdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c85GgB3H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E07606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E07606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c85GgB3H
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94960131b30so42572185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794955613; cv=none;
        d=google.com; s=arc-20260327;
        b=NJ6CeD/WIsEvujDVJfd/Hl85C2z14/49XAI/HMEbPGpuoLkI9A49FMQnZL6wQetuaq
         Ebi7ax1UyHlKXCvPX5A8cSEKOOGKlQM3MLurXJpQk+ajyanSvrIoVp4l2pTV2COgh44Z
         O/3sUfLmtKQ69kCYErvpnjtIqe7hizPpttXoA4vj/ji3kGrkoRoFQOQNMcTTmKlbbORl
         UKJxUXk2MIkUlzflOq8HNRX4tuu2vRnmtjPn3le6rmGTl805qmyv7uNiMjSgjo3yOL4k
         /4U2b0u9OLemkR2ukZ1ljxwl2Yo3bwKQ+cJGJ4w31Hfxz8h+HXZr8PyOYurjpuAWiuKb
         grKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1hZsbSvYzSmLFEJ0qev10mPTktbA5RBsuqmPE4u2bw8=;
        fh=9OWm1iEmX3RFG0yWa/GGHp2r63izx0/9o/ikf3ca2W8=;
        b=LCIcjff6GGD8GKfgIlbCtlpEiumTLa1fd6KLRv8rth2foDSyYHkmQdwMynO3GFAtru
         z2QeYISbVEy3gdPEUZUuDDeMzZ1B60YD9LLgILzOuP/bLFH8YgEHXTg27Q/6XQygKDX8
         csRsUWysC8SUSH8IhdL5wa0tN15129lreADqcZMLDmQUFK4M8ZQs3cnx4PgxxiDCnXut
         amVrvlkRmU+oDfkoOg8IwLnHR/S/5VvltVfHULj2USpNnsnNvPAj9GbuwBa2dUAAbsQS
         KACfn0cok5fx73jTAFGarB9K9La5F0B+cpZAtZYLBdF7E/UoJk5KXz12JPDx8+Uf3GOk
         jRDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955613; x=1795560413; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hZsbSvYzSmLFEJ0qev10mPTktbA5RBsuqmPE4u2bw8=;
        b=c85GgB3Hqb2Dvx/lp0M/tE/smY/tegjNX4tzXgL2V0EhgmXqNR0RddfsWaM61PDr2O
         itJq4oPANM76HOiWShxHcmt8TudUIkV+LaOa7k7cUNVXFQhunxBCKK5p8k7y1UYJtcXj
         CLbPjYKd/Wh7VORUq1hEEsvBiGONxvQqqZ64+ku4Aw8MIewU5uNRyWN3y1X3rmoUnzmH
         ZoGJ+qs+5M5RNQdyqXNpZ0vtn8yBQ1dKre6273Alx2BRKOlO2U3OKhc4MzMQP40zo4Vy
         IUmfiDTVh0tyRZoVkHuAPUhmzpg+kmOAS+SF06EWdCsQAzsCu20Yxfk4LuTkPmtOvVnR
         TDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955613; x=1795560413;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1hZsbSvYzSmLFEJ0qev10mPTktbA5RBsuqmPE4u2bw8=;
        b=DchKrqVaJG7ddAN9cgafwa8FrRHIXLSBdBoEjLegtAD7teWJFC1goiXMcFuzB9buvH
         WXBPWzDz4FKc2SYknoj2e1+07OXa3TwDP01r66ZTrPzN6dKarTSJOSI28kbmdITA6oj8
         75pu2uI05Xi18xJ5IE5EkSqn6LXDs9UD1tWuhERwA9Ev2Wdgp3s80eRFolR1jURFrGFP
         UjEXiED1f9Oa/7ACqQc83AOrsysY68w97n+awt4UpRcnDHRMDQpGil1dtQPm1nGjEqy0
         16vSkOrFDUa2gXhTVbqohQFQ1CUR6GSrxrcuj4gMB0oss8L2f2bHAsPVysLN5TyoBTQw
         5hWw==
X-Forwarded-Encrypted: i=1; AL+hErFGWNrxgIEFxKdjhIB4lLkRcnVSN6cTdoGZa0cVhQFHf9EcvlAN73rT6vn2xJBH5PrI3v2mvJ8sDgQ6W6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jJDzQHfNlcAUtUiNyqaj+awjPmwZGL7IY49w0gU72JrqspIPY
	21CmqsbEoGsZwDk9UtMNRF33+GcAIPGxVye8ExLsWYCoRooevKuyYgILRSI3T2+IQJQaDVQPy8E
	7wzaoeufSN0V8OG0u2W0ZnmiDBjnG3js=
X-Gm-Gg: AYBFou1o8+uVoufWG9j8dkES+0ul1bBeauN+ERflQSPpiZyk8mEo/GpgFBYTynFB502
	ED6nwuvB6Px/YASo8OzLOdTeWhrX4mWAa03HOJJIG6hBsYLgc6FP3pLaB7JXDSXMzh1LhWGQ9fD
	CKZjJzLCdPixbnGFl4mxnYPDvMINRgE30cmqpcBQZVpmx7gEYPSBaDBsgAfR4WD8JWqobW9GSbe
	3he5I1FckjKURcARWZ3gCidXQcafPg8KZ3/BfWqfZrIpoF52ggGydVNhJTFzh/NpiobqfDLtMcZ
	FydsEcGRPyII+5N1XozaYG/18s7GciihxlYRvrqFn1BQSXndjsT+2PkHkBvgb1oEQlvEozgQG5D
	W3zpKYCxWUj7egt4M4QH1QDS/i5+jc+/ZDvLXpKmFXUNvK4jxzSYws2WHYCyQ9ciE2fp9tPKWcs
	9COKWRlBsBVoixfSk/9V/MWQ==
X-Received: by 2002:a05:620a:8005:b0:944:941:c060 with SMTP id
 af79cd13be357-9499957e979mr176328385a.15.1794955613294; Tue, 17 Nov 2026
 14:46:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-prt-explicit-sync-v2-0-bb3851cb6a0c@pixelcluster.dev> <20261117-prt-explicit-sync-v2-9-bb3851cb6a0c@pixelcluster.dev>
In-Reply-To: <20261117-prt-explicit-sync-v2-9-bb3851cb6a0c@pixelcluster.dev>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 18 Nov 2026 08:46:41 +1000
X-Gm-Features: AclHuK_8M3T-tzOgRWG-WLJiHvR1_KsaG1vlYb1skLjroWFOoHVsoG0QIuOvmDM
Message-ID: <CAPM=9tzeLEgavoAwjp2H0Y55STxRr6P8_LHHM5YWLkr9qJ2Lwg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/amdgpu: Add new AMDGPU_GEM_VA2 ioctl
To: Natalie Vock <nat@pixelcluster.dev>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 22:50, Natalie Vock <nat@pixelcluster.dev> wrote:
>
> This new ioctl is a modernized version of AMDGPU_GEM_VA, with the
> main changes being support for many operations batched in one ioctl,
> and a better sync model that allows passing multiple syncobjs for
> both wait and signal. Timeline syncobj are now properly supported in
> both wait and signal cases.
>
> One breaking change compared to AMDGPU_GEM_VA is that
> synchronization is now explicit (where possible), meaning that
> previous submissions are not necessarily waited on.
>
> Using this ioctl allows applications that hammer lots of sparse
> operations, particularly some games running under Proton, to see
> significant reductions in stuttering.
>
> Signed-off-by: Natalie Vock <nat@pixelcluster.dev>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 348 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h |   2 +
>  include/uapi/drm/amdgpu_drm.h           |  46 +++++
>  4 files changed, 396 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 72b3710462824..188c8ec234c02 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -3124,7 +3124,8 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>         DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_LIST_HANDLES, amdgpu_gem_list_handles_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_PROC_OPTIONS, amdgpu_proc_options_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> -       DRM_IOCTL_DEF_DRV(AMDGPU_UALINK_HANDLE, amdgpu_gem_ualink_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW)
> +       DRM_IOCTL_DEF_DRV(AMDGPU_UALINK_HANDLE, amdgpu_gem_ualink_handle_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> +       DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA2, amdgpu_gem_va2_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>  };

Can we just call it VM_BIND for consistency with xe and nouveau?

Ideally of course we'd use gpuvm for amd, but even without that it
would be good to at least have somewhat consistent naming just so
grepping find things.

Dave.
