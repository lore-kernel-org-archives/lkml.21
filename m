Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795725271;
	b=IG3xVN4C/tkdfbi7ATqKUrUJkBpVsNNxgTOqqIbwob6uLs79zX3fhXp9yYvnOL5C00Rc
	 uHBCpuEuGKcmsGeMVjicuc1aiM0ceUg6HCQWHEZSBcMR9HAjF/VpWvTwaOUHxWL4y6i2h
	 /HqWajOBcAI+X/V6oTwUlLX5NHyhQ2oAUJVWa3c9pro3jnWbSg57PSpXXuCm7d5fpAEOX
	 YueuXv4qQYXt8SadMs7zGpZo8O+Gh9MLxpI2jVXrlwSDehYiMKkY+mnl8RbUKtp7iV5dH
	 C4CLjFlLB/rJcZ6yXJjPSPgn7+0S1N7kqmi4sT8VnwwcWco/UqcEdk2NQHObHmpyYZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=di3bN8TPtgKo4t9vFYgPIJtNT3UqOcDJowHuF819Ygo=;
	b=ElTfixk4McvC6O44pmA/qXx15iwMLKcJYpdPcEg80I31FSJo0WF1hLKV5umCDBTZS+cE
	 9T+TPfSETepXFpyeewaN6gSnhOs2V/s2xck9oT/y1Alw0usN9myztL7/uHzxx0nQusk25
	 EMQVNwH7HF2p4FeDUkxGU+Dl72afYkKfn0J0Z5P8VngWm+fSy91hSYOfY0M6hnFHa5cnI
	 IlOEDGRzqrl1xKixkC/iiNYF4sbO+bhcuBIXQW2L1vUi8A5Cir8oTfZGyVTLlJbbgGZzH
	 1fG2ZLyJtfBseouhU/s3NRi4Je385JddEqh4GSlmu9yXVvB4x+Bz0xcR9Y2OUcmBumw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uur42fxC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A75606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 20:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A75606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uur42fxC
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-568042aaf90so1060114b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795725270; cv=none;
        d=google.com; s=arc-20260327;
        b=ItjCDMwmR9Vr88yDP6jOofR96Z8DvnHGXAd/bNaOQWYo1pydg2E0V3x5pH5ZpYr6W3
         H335g3hUM93jcqmgOjvaZqyUf6l3ERXkv4gobpmcuUrIg+T0vEJFlSS7xO7UARzkiQhq
         WamrwFmhJPoBUWYRcuLeOr5jqTGY6uUydVgP4TSTiBRF3vDuRCzw8HDATQI6NsXIRtF/
         7ZsUkFTb4UlIGLo5aYU2oZb3rLKU+sRSPgVIMweOaHSqPfMrjw/DZR/hm8cjLYdUgXfz
         9SPtXuWPDg4hqavp0dIX9R4aEFSncPxuipwqjMCuQ2pvKgtKPvCC0b7dpyYLNMQr0qIs
         54AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=di3bN8TPtgKo4t9vFYgPIJtNT3UqOcDJowHuF819Ygo=;
        fh=M5xJr+fyBcYUQPp3trRLkN9eLBo+cbmxiB9vn/MAmKg=;
        b=sTRDOMUfp+l1uM5dl3OTy3p4HQ/BBnZbqtz62knDRY48ylMAbwtgnh7/AB0+wnB9wP
         KjmbdsrO3BnKsET5+10Q7aTv6CdS411kYdW3n4YoqUszpAgsML61P5kGBMFTs6KltxiH
         2PTC1jhMEr6ovNupO30Z8BHShR7SY5dVsqbIoxDM576BOogCWUayef3lXesTiH13ofr0
         I7tNUU6eVwEO4DuHJQCeXFi/lysLz+5Q+VNJt4Yd0mJCyP6sx6J+0uKeDHqjZNQqJ9Vf
         2FS6ZjKQ7F8SK+l4ifKU+2fl9Z30v5QXvtB/d/qPbO+hJZKHCuGp5dqDBlx+5jrGuf1/
         gloQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725270; x=1796330070; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=di3bN8TPtgKo4t9vFYgPIJtNT3UqOcDJowHuF819Ygo=;
        b=Uur42fxCErQVDiYgWsKaF8dmmmKy4JbHVbR4WBRfegN9yxGryufdu+g4xnFbfIEZph
         v/vJoHVkegwTYPi7Emfn5H9g3v8PMhueZQ/CnIOLCbM/w5Uyvj5Pxp9y+TNdz8tT+/C4
         9kd6riX88L1evvU5UNNw1K3SeFMFhUxyNW1hB445DwIrcvtzmdCTCi2+heFkfDzCF7Fk
         SCrwMmLIjyUUVOA78iXCeOor65sUMESkMXSQDLHT+RNVFuXXdQkREM47NXzwJYeuWSLz
         K4AMzS/yR+mP+hm5ilz8l0OoP9VM+Eeje/09DE206JP8k4AuPh0zfUpXpJiSkJ2Llc2a
         HTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725270; x=1796330070;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=di3bN8TPtgKo4t9vFYgPIJtNT3UqOcDJowHuF819Ygo=;
        b=TKmkYm9BAMAv6XS0o5ZF7s58GLKOpncmSC1J6QIsy08K81hWL0YL9weORp9+P1BQtQ
         nvOeN8YQ5TwziSxniLH4nNKB2l8y4BaCD5v35MQA85sJg5fy9xclA/MYtH+0B4bwbJE4
         C8i4xsTYGgCdMwNr1FOVN8nko/S5HUQUsrzRS6p9mk04fGjldLYycLOLhs8nB/MSEJbM
         LT+7Pj6aDEmSVrqNN1jnR3/P8Kb2e4Lh+nGlNiTiLa8Ogi0S3M+Rxda5I05cfgSZ6EiP
         QjHx2Jt49sSyyx2ltnnycb0LHkoIJBNTdmPdJBC0+nBHr30HfVPGe90y7Uy8W6DhYw4+
         3VdA==
X-Forwarded-Encrypted: i=1; AL+hErFHGPRXPwbfoh0C5qnH47yqRgl6glMcc8QmoYO9VhVOln0FJcYK5lxUCX97gMsPCspuh/lzpV6g1PKTsYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H8JRwFEBM9caVieD76XeD0OcLQhTzWHAWU+FNVG7+7nA1QOHt
	yGoCgloU80aVih8TQqOGfCqNxgJfWnX1haeazuN6IfUQdzIW8LEh1aIEU/shdSK318w/Ofc1kDW
	xrgCcZoyMscehxqYvXiHySt4G2QJVMOo=
X-Gm-Gg: AZFdTZeRiR+aGjnnlu86lqZrYaTA8xfL0FO0rCNVwiCZprxpP0emQ8KorOLPP+ngxN6
	5bQUXQ+Q7BpMk1f0hN7+DHzaIExplPaB+i+v5B67Apya9fLgP7TfbvMYWpETWcM6ED7QVex+e9S
	2xi6HkRbjOd2MHe+pt4vhVGEchS7Tq9WSFHYdsgx/y9VZDdPcROZLB1f/cc/nfS5+n1uVDcqZCP
	wWYRUKCN0vXF1ZT48w1RphzLXb76I0rt6SwamsFt4IC4qg5JPT1d+WfDqs0tOqbA6MnvBkuSYd6
	UNCHNZSG0hOZG0+R20LyARIbiXeuhUlp/+s19yCOxoeFSohV3d7u850QM8qULteoMbQQP5G2lPx
	k2AZ78AGuQGQH0VJY96W6j3WYxupEFN6KE+GvyigqkfjX+5UwfebHisRV6Olk89SbeIft0lopmE
	lJ88BXY6u2vpVPP5w3hx/E04/iJmZccHq4qGaMnA8dUL8Dv1RKluA4
X-Received: by 2002:a05:6808:c3d2:b0:579:293a:52ac with SMTP id
 5614622812f47-57a06a0f737mr23560243b6e.9.1795725270248; Thu, 26 Nov 2026
 12:34:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126045222.20770-1-dennylin0707@gmail.com>
 <awgPDmEbGpJsT_iS@redhat.com> <awhFQzXfWnDh1mKe@redhat.com>
In-Reply-To: <awhFQzXfWnDh1mKe@redhat.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 26 Nov 2026 12:34:19 -0800
X-Gm-Features: Aa3M54o9-WZCIMdpV3GauBo7bolCOn69ezMqv7eMAI9mQ5Mi_Dde3UYGSABQw80
Message-ID: <CAGEkeHeWU1=HjMX=GETdRnWkr-xqTBZp7p8RDdtTiUVw3+qBfQ@mail.gmail.com>
Subject: Re: [PATCH] proc: also check the opener's capability for
 oom_score_adj and oom_adj
To: Oleg Nesterov <oleg@redhat.com>
Cc: akpm@linux-foundation.org, brauner@kernel.org, adobriyan@gmail.com, 
	jannh@google.com, jack@suse.cz, sforshee@kernel.org, me@black-desk.cn, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2026 at 03:42:11PM +0100, Oleg Nesterov wrote:
> I just noticed that __set_oom_adj() has more CAP_SYS_RESOURCE checks below.
>
> Shouldn't we unify them or even factor out?

The checks below only decide whether a successful write also sets
oom_score_adj_min. The checks above already prevent a write through
an fd opened without CAP_SYS_RESOURCE from lowering it, so I left
them as they are.

I can factor out the common check in the two rejection paths in a
separate patch on top of this one if you like.

Thanks,
Hungyu
