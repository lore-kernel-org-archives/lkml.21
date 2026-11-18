Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974239;
	b=rwQMeMNyRNWN1Tar/l35qqoIWZ7ul6FEPFE+pT8rg4eqs9f7tw2XxO21nfk36T5wJ90w
	 kIwfnLex1iytQJ29g/didEkRRKNx54qC42n1Ax5QmngCPEP1gPlgZs1DxaUG93/065igB
	 AZt3tuxVaYOgyybIUGK+stGmVj+t5NuGgT8/xw7XqmJgqzyhTOMFjVmCI658XoZNd2orq
	 Mht2Z5oFu0WXflfvuLeHHQrBkZ5RjrmKBiZqWabiQ5vosuAWjVT6alGlFFdIZVkVkq3A/
	 GTiJbpm01f77OZ/O87Skd6Xi6v9QdDNkL6Yc4QFTHeD2DtYIZIfnHzIZPWnp+4Q4vow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=a0NP+fQWEKAFgHd8mgesU2gFtSULnLoO4NfwAVHm5y0=;
	b=Up399b78n/+OjKTcBK4ke08DST783ETPURzK/6Q6Z25Cip5WN4lsteEEm5dgn4Tw+Pxh
	 eFtS3nbTZtH9/yTmhGRnjd53ctCS269iPMTGSEUgn1F0hBn5JiMgy6Rk2Q2k++MUTBTnM
	 nLHR4PJXCMXskUiAbrvLUhht2MDNvvxnEJ/5pyVvJD5tTlNEvAgh0QIWpd2k8vO0NM6Ji
	 lnprVWxI4WSnpTEGHT2OYYSCdUabKQzDj+PhEoHoTpWd7JwVkbZPR7NFk9g9tDLBk7ord
	 jkydt3r2Rn0iXbvAvWSzFHHakGTzgotXRDAaQTf+C/D5JUAKD5rnKuJbBE1bXb+0h8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxfdgQIK;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A058606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A058606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HxfdgQIK
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-382c3c9671fso423107eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974238; x=1795579038; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a0NP+fQWEKAFgHd8mgesU2gFtSULnLoO4NfwAVHm5y0=;
        b=HxfdgQIK4NOJ9ASdELqWzS7LnVO5irKuKOuzdybLZiyFIfdRlx/33vZo72AF0oI5mF
         0qmHV/9HcQJomOJLX77E92Px/dVgWZvjDs2O75HaMizS67xVbYbamKpkCjkb487kKkyI
         0KqJQiIqUezjvkU5zrzcd75bMHOv2FVw/jPT6aYhkQ8g5XWC+CNYJr64xN/QTuOQazmS
         O6idM9v+ESPuv3IFybCRX9T9Tl8TFIxgipKMYjjc6oZnCX4Ja1RWNtkqqs1ubSbfMPtv
         ytoyKV4T/Xte9PErt8bK1RyZliLo2U+mEvbEBywtByrznYjh0fVRqDu8aAYrdheznSAE
         uZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974238; x=1795579038;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0NP+fQWEKAFgHd8mgesU2gFtSULnLoO4NfwAVHm5y0=;
        b=tN6WKuElGGIom8i83jYqIzM0DuX7C1x/XadenwTWRxI/b+Syin1x12MznNLE2MmbiG
         MkvRiJmglkCXz0CiSevZKKqSAWxJw/HWY7kOctxm2hHcjIu8juE/Hg8e6ULPxXNhaQvm
         HoZNtYKhChcXVhxGc4if7pzGSNQJN6itAWxCcvDy47I61hBxUOdO8J2BLAYWTVuDZxzD
         FC+OaoQHQozlMxlivixkb6ZZzHWYLoojci4zo+BT6JPcPq6kwA8jqR1oESSPQsMW5/tF
         16qBqnvItznsf4/9rRY+ZNa8wfsNkTRKnMy3WgVeLWxMSjv9i5ZlQ9oD2uwGi/2Gis4g
         9eJA==
X-Forwarded-Encrypted: i=1; AL+hErGCoEq9F/2QshygdA7rcCg6eKo7xHZLChKqFyL0L33sl+QoPMuuTYXCIwadQzYWWAo1mjJf79BZWrT0dP8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CgaKP1lI6CHLabkir8X2wJ4BT/UIxL9fQtM+7rAOfgDDeAZsc
	rgJyyTijowcic0Wug3imhUXvb+XZF+c9ksolB14W7WsS9ppvATAj7p9WUVN//ro5
X-Gm-Gg: AZFdTZfq+qM3X1mHEgxxivTBXS7ZnRdP4SOXRwIVGYiDjaWAvi+d+/74W81iHwQ3qnG
	TQmtPj9U2zu67u/DbD3tGjGyHwqeGuLZjLewyffVT+Vi+6WGrX9WHf5q/SHbsTOBKTyrfvBoOo9
	XVpJ24MJ6m9U+Ln2Dxxe8CT1U7dFSLhNHUVNZnANXNuqlWyAfGbFquDnDx7b5x9oYJYZX3bkBCO
	1veegCKpWU88WLVGQdDvM4uRY5kJ8c5j0vb/8cqGqutxQsYomJIjem4Zf8kKaXX2i+aLzbu9YUf
	2PgKWa1QoKsQmdA7n7ir+LcvbKwQwq4oNwc6YVK3VF941FABFzB7W2LKjwY1R0ANMfm/2taW+5Z
	32PoYSAQJ4TE+W3C3MTV52akVHQwlzGGUN3LK/ExEHRNhpwcpC90fYhtvkYFKXvTaAhvjHzv4wg
	h4lEX2BfZhDwWk4GEkE/DLCRzAQ40BB3rvdgL+2ooYo61xp28ynzvr5tjGdlo7sce4EwNwSqml5
	JYj8aWlJHyxe4TZgu5/K1x1y6TLgv79of4PVgekOQZC0jgkcifRtLQJyFe7w+mGGLL+2b6KnSnP
	KfurvajtuKmdPSXpERIB11kqO0keQyW1MuEvUA==
X-Received: by 2002:a05:693c:88d3:20b0:37e:9a3b:76a3 with SMTP id 5a478bee46e88-3827fa88224mr1366335eec.11.1794974238122;
        Tue, 17 Nov 2026 19:57:18 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:efcf:4622:136c:bde5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6df02adsm3026859eec.14.2026.11.17.19.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:57:17 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] powerpc/perf: vpa-dtl: fix resource leak on allocation
 failure
From: mdshahid03@gmail.com
To: mdshahid03@gmail.com
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
 chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261112134455.6880-1-mdshahid03@gmail.com>
References: <20261112134455.6880-1-mdshahid03@gmail.com>
Date: Wed, 18 Nov 2026 09:26:56 +0530
Message-Id: <179497421642.52973.303842528916649405.b4-reply@b4>
X-Mailer: b4 0.16.0

Hi,

Could you please check this patch and give your feedback,when
time permits.

Thanks
Shahid.

On 2026-11-12 19:14 +0530, mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> vpa_dtl_event_init acquires dtl_access_lock when initializing the
> first vpa_dtl PMU event.
> 
> If vpa_dtl_mem_alloc() fails,the function returns -ENOMEM without
> releasing the semaphore.
> 
> Release the semaphore when buffer allocation fails and no other
> PMU events are active.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> ---
>  arch/powerpc/perf/vpa-dtl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/perf/vpa-dtl.c b/arch/powerpc/perf/vpa-dtl.c
> index 3e3d65b6c796..20eafeaffa6b 100644
> --- a/arch/powerpc/perf/vpa-dtl.c
> +++ b/arch/powerpc/perf/vpa-dtl.c
> @@ -396,6 +396,8 @@ static int vpa_dtl_event_init(struct perf_event *event)
>  
>  	/* Allocate dtl buffer memory */
>  	if (vpa_dtl_mem_alloc(event->cpu)) {
> +		if (dtl_global_refc == 0)
> +			up_write(&dtl_access_lock);
>  		spin_unlock(&dtl_global_lock);
>  		return -ENOMEM;
>  	}
> -- 
> 2.43.0
> 
> 
> 


