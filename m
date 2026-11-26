Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671750;
	b=5sME+eLlGo4frTyht8cOgY2cZz1dLDU0a9Zj5sCXHtRahjgypniYZXj70FUWBOSdfAWJ
	 IjCbTmuknuK3lUuJ5BUrOnFHZdxWWWdIdHeIEzvjSNEgsM/6+NhJnKpwveILaq1olUS3l
	 zAMkQ+BPm4hcCkkFAxFa9HN0XIm2O6f6oflTy5iFzhyJy+N3NS4vpzKmkDrd5mw2ybjZH
	 yhdsx3WY2+7hjeSILFbje+rekWbYU1FjlqiWvG3DlIb+jE7+tOLG1F3OErzjPoCWaoIB2
	 HZdf21kYvUVEMOB4NxXctdeKHHpavSUsP4yU+PRQA+9AGP1xA20VBoiCE03hG/YYFqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=++8bio5HQvXBSXEt4G6PkyVHRIkX4ffk6U1NuOhu1sE=;
	b=BLEcdpU+fX9+C0SVP9Aib5/pZYLQw7H9sjZY4P7vhnXut3xEBdABoiCWDV4Dg27m2+K3
	 GOy2sHvZrO9J2+cw4GASPJtEIxdtKI0P1aJ8/VRjutFkPsOdnKX1ShwIaDb9q2Dh1iqxp
	 Ki606RwoIPFapq/2g+7SCNc/9h8Qu4NTevE0b8/1HNUxjU67LHNOzf8144AgCqqf53jn3
	 RK913eOEL7qvJ+7w6XSzGI6BtzAhCgy6HQXmnEYOZ7KI3M/TLedx4HAiR+iJFOdBcoiHM
	 mhfgWgoqvy+kvQneOBpY1RoADWpoddmDJldi8aRz0nHx9/2+Wp6eYu6AJ21uVqpFZjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m39Eyg12;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756EF606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m39Eyg12
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso14089263eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795671748; x=1796276548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=++8bio5HQvXBSXEt4G6PkyVHRIkX4ffk6U1NuOhu1sE=;
        b=m39Eyg123dSahbukQROoyqmw9Qf4U5rSatEUOz6jaPy5kUfcXOOY0VR40BVcOt9hIH
         NkDqCcIV/NoSbbU/XKApFhE39ud/l/FbIPrs6+Edc3DBFGtnM+28t2ENqB0wXteTqhj3
         LIDUbJ2df7pjBxbyZNvWoMM3Z7SCGKql5HiX6ZrCuxO2QMzLVEk9EcnfugU8Gv4mGZW7
         blw9kfljA05BLFvyHEcs30YNOL8sUkR/XcVEfQHzc/hmblomnfpIHnYDvFZNpPwBPelu
         LI03jTZlDATE+7kZAxPKBvXOBQmbYQP77OshQjOGflpuLLQxaWvjquWF3/c5Yeu/BQD2
         d1SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671748; x=1796276548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=++8bio5HQvXBSXEt4G6PkyVHRIkX4ffk6U1NuOhu1sE=;
        b=hXpr+gzpNXVFcvG5wWvnM9saOmI9HjqCB75jgSHhNMmCXBjy4nlwr20Yj2gmzMSWPI
         0ai5IqTBRBcv+8weoML4C7QnxbJYzEr8R5UgFZWEOa3u7gVisAOmPpYaI36SJ2i3Gkrr
         1c5zs1yQY7J0oKp2el+Wk60AaOquNQV6ZS/UBpFiNcwehPlV2fJji0YeIyNoEGcej8TI
         AqXpQCfQQ14e/yNHzuJG0CGukVMSbG83gLHOEdvBlUnZnRY7KVWcy6WSONun20WNYQlQ
         WRfv6HB+XSP6YqGqsatvhHM1zN7172C5LEL5sQb9JEzDtRU2nXTXFuCcnclFkvoFC0rZ
         jdHw==
X-Forwarded-Encrypted: i=1; AL+hErGrUdQTW1HVitftFHD80Zdm6/JdSj9tYdanvq4KgREFsdNmInvAV52VyCSt+L22Z/MmzJ2xZ6ZjzZ25k1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PCa05emBLtu62PRNJ9NiKQMZMLM9p+Cw6wM47XrKveetmQA9C
	MwF4Rw2gElNjcEGbMxj8tIpVxK2sje0rVp6Me5YY7A9vlfxJg4tg812v
X-Gm-Gg: AZFdTZeA8hGQg4iUIkpqBJi+xvzlUNC79gE6q/clsBvYFrnVZXTnIe+uXZ88yrxIO7E
	tjWB9oSxDkuvN0n4YolzGXxJEEbRnzRrTfZiPMeVPIM2n/sZQ/qACH1mEEz1JVm6KAyeq+3pMqY
	vjYk9ValXanRLeQC5q6EogNgq3/sS2sqV+RI9iJckwD3fZmtpjk2ZhUoFd+7VfhBrTrdapBRGPV
	tao1Xr7zJpyA29NOMiLK0yeWz5xrbQwdi8vdTgA0z/PQFEw+g95FMKlIM62hSo6MA2CAPscOGKe
	5UsUQ/owTruWAcn47m8ow9IRr0v32AG0mmOwKZIfUjJJU6gUHdg+eI5A1D5rGJ+ZMTbfFGD48LY
	6JdrQR4mcIUKqY92CbjtJyl9etzV7/fzjQhsUmSai8P5OO0y1fZg/0oDNhmm3nV7v08XLwpRhV2
	QN9n9sKuU3gQeF6MOGPXveUdNjEtTrdGOyjkp17NP3loblq/METOCp1+ADASHZBkSma8VauifZ3
	GGTgOOtti8iTrJbCknm+3LDbbLACaB5/3W3XJ5DLR6kVaZOSdtQNqY+UKPCJqGwqRbtqVka8qqF
	NKKGkZwXXpuqN6u0EiGXL8JiwuFQuJczi/8uGN91m/VwBIywz7grCGXpjALSyhseWUtOk9g=
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr22589262eec.32.1795671748496;
        Wed, 25 Nov 2026 21:42:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm72206669eec.5.2026.11.25.21.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:42:27 -0800 (PST)
Date: Wed, 25 Nov 2026 21:42:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adi - use scnprintf() for the device name
Message-ID: <awfGt6HfOVgT1H8R@google.com>
References: <20261126053234.455-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126053234.455-1-chenaibing@cmss.chinamobile.com>

On Thu, Nov 26, 2026 at 01:32:34PM +0800, Aibing Chen wrote:
> adi_init_input() composes the device name as "Logitech %s [%s]" from the
> model string in buf[] and the controller name in adi->cname, into a 64
> byte array.  buf can hold up to 63 characters and cname up to 15, so the
> composed name can reach 90 bytes and does not fit.  The name is
> informational and truncating it is acceptable, but the call site does not
> say so.
> 
> Building with W=1, where -Wformat-truncation is enabled, the file does not
> build today; COMPILE_TEST configurations additionally turn the warning
> into an error through CONFIG_WERROR:
> 
>   drivers/input/joystick/adi.c:395:60: error: '%s' directive output may be
>     truncated writing up to 63 bytes into a region of size 55
>     [-Werror=format-truncation=]
> 
> Use scnprintf(), the helper that expresses a bounded, truncation tolerant
> write, so that the file builds warning free and the intent is visible at
> the call site.
> 
> No functional change.
> 
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Applied, thank you.

-- 
Dmitry
