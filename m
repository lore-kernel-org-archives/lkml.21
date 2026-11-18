Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795018202;
	b=f7oPEjwW6lfHJLY04ptfrla5TlDSLIxx1Fi/Tansc8ReOvDQhHV65/gZMQTINrGr9/sM
	 PyOkxPNX3edJs84VZGwRDQ8m+nAu3DUpbZD/93buQSfzfkD21lWm8KDXBAZZltG+RMRGm
	 M4kfpLeQianK2RGY+++X/4pk7gqBahZiD4gW7wPQfx1GeSBf7voQhtjNRbYHSlXiFOvSU
	 M4z8eGhA3oWd7MwWl16ruE4vVvT31FETlmkFalfxM+Sh8CicSJbfW/kFzCfCmWGHkrdN0
	 tQP3YnSAaK9lScTFASsgBGYuUFV+D2KVrCKAXp9c/Qo1Nl1iHezHUvipuT551rG/a5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
	b=IQaWm65S4E8/JzmavOw2E7QJrK1PWSMZR5NBJOXeYTI7pZo2jJaB2Nt9xU8/RU5x/3Mj
	 +b1Q0iScIveIZzacZicg+seZrPigEVCWp3hbHYkhikDa8F3lAdz2MQ8wP+pzqrYOZv/aw
	 r3wa3CrnVafhv1hcMdxd5ga6ShdxyVymBLaAS/3rdGyzKWle7kFeLSBm2O/HRhc5cswuW
	 sWeX5LJY6h53mpVVr5ScQ9QwWIPYzR7PKCriETBbH55S/6vu+zTQ7Uu/tEgd0H7XTDv5R
	 Er6BZuvxHGKkxj+bacCrwmbOSb8LaFz5b6mB2Ap/KVRcdbOoYqF0MfDZyC4GzP1iZBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKpVVSBx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81702606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81702606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKpVVSBx
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12323225e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:10:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795018200; cv=none;
        d=google.com; s=arc-20260327;
        b=YOD3skgZGXhgWFGHzCqt78taif67pS7MRNRNBx11FroYn7+ZnHjuVPPG8RVi6fZ2ml
         ziHCdXjlrXw5AAHWAmEEUv207Buvt8tfH0GK2ghnQM5mS5LUKy5kCiQJ1QBOVKkT7mzw
         0i324egp7FFCJyNs3mIfHy5f2Hh/iUzCH0UVsOaykD1slobBHc1oCaS1gA7bZyeOExjs
         xprLnfyqA5mYjmKvumTNrFOjtRfZjACIdWh7jC8vDdiDipLe5tscc3EOD9ny1v5DCS0l
         fjYnnjXChpDx2YBIGtRt2OV+6bBspAOL8r+fXUJY2rIWrZ/QZfr3mFKWG4SuxmLQyadY
         aYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
        fh=xzPUpg8ucwH64aySVrhf7FEmyUjJ5g1aSFf8y4GFNKo=;
        b=XTy5bCwrghydr9/AKN3j5pEFvCnS/RlTjgQt1tedS67aCcqGO0pLDwUHY6UQZ8QzjD
         WiZKg7YwEphiO8Tc9tURk3Y8WBcBzd6nxSBKpo12hQfUIgt9nITVCbgFs8jy+4+1LTgZ
         TCghVpceq3mTtnIyCQk/5nv1M7MUQyOW1S8NtzJkZ2Gs3QBL3Rtyt3fIyKdEXMqvfgfu
         +qMJLfPe1TO7htA/OBcylY2fD6dPnk7gGbRSPKZcWjYcQFEkv5JmerJkvVMW7mJBbosr
         VokaCc8mZRZxVt+IrDgK1+2+PZuD3LeqyBc6wupZgeY5R6jTmj6+++yVGT5H2uCzMl5/
         EEOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018200; x=1795623000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
        b=pKpVVSBxsv0XSkTMIy8QhpV8iYfpJgFtuIOOMraAqkh6IoY/LmnCeoFY2+atEoT7Mm
         51yqYjvClrxz7PJEnwcKX+ag5vvKZvXQsxOzLhCYh4JsRBfQzN29l0NprtTdgWvsd6ix
         AH0QnRKu1GLZ31o6b5lUrcbRaETqVFDnyZJS7t3cmGzJhOaIhFJp2bMr5emwdD29hhJc
         RTs7I+nGHlyycNopVtnLI4PuG1cfcui/Xum192WTkqg+lt112F9t0Y4AcEwSdQ+g6qnJ
         fEyxFj0SlLXR+vzEfwDVpIGqxFUfo5VZRX4qXbDxIZEzPRytaBJz01a74eiTXZMyIuVA
         jVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018200; x=1795623000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbYXoP2RPMw58RAwQCFRXLN2yd0B0w7a3Dun8Sb9Zn8=;
        b=nnf1T0HlFOOwevYLkXW/XT1slSAvfO8uT1BGNrOa1ne//Gt/5zTdffrlW3wkW/rAb5
         vW2ly5BxlW0YbEqrNqPZSouPEBk8hJ3f566alCYo0c/q6y8O+jdQK2hDkLm2OKLF1Hys
         s5NuuB9BEDOtvayyjX6KAgqtYhr4mMSDj7FG9f3iHYONUbdtXTHePPAzyMFWBioC8FeN
         fIqy1jJ5KgNrGx5HfP20+1Gvmd1zNovjpj+p5XUPmPkSUObq6+ifcalnSeVnpLKAl2KR
         KC5/sMNJGsbeS1kN0ITAP8BckoYo5R7bSVqNu91CbLgUrOhhHTOKNewUGwnRVpNx+niw
         7T8A==
X-Forwarded-Encrypted: i=1; AL+hErEUCG5vK0FvkZmGlSy09UWm3a7HjdhUoo63egU1AON7N4aZrPMSf1b07Z5A0OslIX7RmMBlnKOYvh/RmhI=@vger.kernel.org
X-Gm-Message-State: APuU4Z896zQrkDt2QJ6ufGU1Wo8eD1L9iDriORZ0UnWMKDGxcJ1ilX/Q
	LiRzy/ZavHHPbY2hUxiV5KlKuYpEdCZuKz7xoFyDlfBwqqte6xMOODsa1yXdLZ+c2hiV6sanpjk
	vdm6L9ntc+f1/Wkd9vzH6kZDDgG22wBY=
X-Gm-Gg: AYBFou2yBs3uw3U1t+9Z4nENvWAZvT5OplrUqlU7JHO0j9CV+LDHhD1gF2SF0rgJLfQ
	eA7DvLPL8+nBFx4ljGQ5uFDtJwHOi1/wt/0zcLsUd7UwnKL4WQ1vY34HN/C51FJHaoAXva5iwlx
	Tx0EwhtWP/AYjkB4gu6hI5bKiDqGxg9JC9J9LmdEb1PdGlC5DYrSW2VA1Bte3CY6kjsnNyH+lLh
	W9JeMlzaoZfd8a95xLnTWs8pu2n/eq8fi9H2p1WHX5GF/3lZEE6HowGyty3RdJujpjFp4uqg2FX
	xJzxymCbHxZJep5OtD7Zbz9ZOPkX4PUMmywvwicnATiZyNVdfOYPTzpD332GSo69znJGNThbBYi
	UzDb/txsagywN+0KXOdzH6ZOvyxyIs4B+LNVZduLnuijOkm4wtMfYqOIAuZkjCtYeirZyYNXWug
	O9jiwLQ0H0rS80nlaZivgrQWEcEh1khHDIbFYetiWWldY3SGkymh+l7XoEZjJLeu0CcEiwOeqfp
	Q6X
X-Received: by 2002:a05:600c:3b1c:b0:4bb:5d38:259f with SMTP id
 5b1f17b1804b1-4bb7da24a26mr60211045e9.12.1795018199716; Wed, 18 Nov 2026
 08:09:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117062620.346767-1-yumiao@kylinos.cn> <20261118130537.750211-1-yumiao@kylinos.cn>
In-Reply-To: <20261118130537.750211-1-yumiao@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 18 Nov 2026 08:09:47 -0800
X-Gm-Features: Aa3M54qRdo3OaZ77M4orB5mZ70nSvNFV6Jxp2gOAsd1jbRDwyTe3QzmeCNTj854
Message-ID: <CAKEwX=MssYOr0J7tk54qUF7DbNb550KZrFmwnBD40L+tWde+5A@mail.gmail.com>
Subject: Re: [PATCH v2] Docs/admin-guide/cgroup-v2: fix npn tags in memory.stat
To: Yu Miao <yumiao@kylinos.cn>
Cc: cgroups@vger.kernel.org, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	jiayuan.chen@shopee.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:06=E2=80=AFAM Yu Miao <yumiao@kylinos.cn> wrote:
>
> The zswap, zswapped, zswap_incomp, swpin_zero, swpout_zero, zswpin,
> zswpout and zswpwb entries never show up in memory.numa_stat, so add

For the (z)swap one:

Reviewed-by: Nhat Pham <nphamcs@gmail.com>

(but the rest LGTM too FWIW).
