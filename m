Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795830799;
	b=ReTM+r/ZcBlbSxOG6vut4iv33aaUyoe3iyEc7w9eiDffcVT/CFiYMp8mje5aqOgIJaI5
	 D5f1DzokJYCT1WOWJ6SnZCpn56K75WhzIGeuvRqFdeGBg3u3aahMB0bf/Uz7UsSPKWO/J
	 qHdR/GYxKogi/TodgW5DG/HJyQh9otXEnydH/E0ec8iPtzXGXWaajB1r+e89/tVCNaP75
	 EbAOb0nFTcWND6RWkfzm+YZSprAphhMi83giayiYk7Zo43brgaYZQ6UJXZjvTeubFS+Uu
	 Ming4K//6LoM8IAW9H5FkUpiq9Lw6dp8qo8/QSGF81O9Wdcw8f8/y4TqMem7Nub/a0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795830799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hyZ/R6k/xIQG/tPusrclgUu0QXpjH1Ks1DGOLNZIqaE=;
	b=HGfWlODsxQvI2ATwt6FTcc40yoXqTUHkmtEj3A+aatmtbxvvm3Mh+Q+0EruR7igLy8jG
	 UHMRX7n/h5wFTjPfmG4YqqfXWj+6oq1BfnY9YpdMJvPKLiSown/sBgCFHJi234OeE1l/X
	 wMDSxLcDyazR2QiejNS4z/kIeqYAcz/TB6p3QI0Ngvmc9X1fcxJ/9JSE5iBajYJT3Zs2P
	 P02+EnnlrFRG0kE6Y0reAU5apAlF9mIjcD9usR6t634whPG3N7zYN4m9G8xDv3gC48b8r
	 piH8PbLSc5zmJxM6ZnSFYNB27QV0ocSukJdXx353gglIZr9cTshoDh1t8Jnka6tcGMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nxjnecsu;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEDF606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CEDF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nxjnecsu
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f02f04a426so69089885ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795830797; x=1796435597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hyZ/R6k/xIQG/tPusrclgUu0QXpjH1Ks1DGOLNZIqaE=;
        b=Nxjnecsu6920Ks6n62WNYxsEUypFF6bQ4PVVqgMR71ygzC0qwyH71uv4eZqSNRSWY1
         9HZTHm0nxweCElYkCDv7qqBTmH71Rt34D/+DrKSqZuWa3AGay1gk+vlBW14bX7ZRG4Sj
         v+0UYv1j3SJ7rJYcmzjgk1eK3+RYZzcPWU98o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795830797; x=1796435597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyZ/R6k/xIQG/tPusrclgUu0QXpjH1Ks1DGOLNZIqaE=;
        b=J/l6KAONOa7AfNaUxMRmTtS6kdxwDbzQFgNZlBVfi9NUpJAB1aDMeAzCJs8aqPkjZs
         mfh70K/f7YSidGEZzqRTod/cn7oA3tRsKMxR0RRokPZKf4t/3G223oFuz2r68cr/AdIW
         XKpYrU+oslSrWg7xZ2gcA7Cavy5yskKbSHpazLdLCuq6jG0V/tt/7IWMjqXaLPdz+IO9
         tJcTqxq8vJ+F2FQOVc7dqI10Q7twGI/VJB0VYj9wlIGumCdz7F6BcXgRGLICXHynkbZk
         Lk87ea24roirUWe+eiUSOlWilddRzYt/H2rNLIPfs+oGdb3bV5l1gfk/XTbPqkTYNA7Q
         KT+A==
X-Forwarded-Encrypted: i=1; AL+hErE6Zk5z5s04KoIw8FkbH5TEX9/JXQJetfGGcfwlhWvddUItFv6hlo85BQ1P1uF6iqO1E9wcXic+B5F57w0=@vger.kernel.org
X-Gm-Message-State: APuU4Z813imXquQfr1E5mWrPeVQpMVsS2M7gUh8HrcEQWUtn+gkDYvmr
	3CYP3uOHwhftiucd0TPLlTEVGbqpKCjfclXpGcXN3QgO2Tzk51qKgHz7gj+ZoKEveg==
X-Gm-Gg: AZFdTZeYKv3AYj31Ficbi2ZAmLqg4p5XxlO32Yo4MucwC4lKcpz9tUf7dlaag8JBiTq
	4pVT9dPxp3adEzvqxFuKmi0tKl7NuaW6Rc3V16Zm8kwmNCwTenjCxh7c9ZMDGHOxEu3a5DnktKL
	eHgd6xp3sbpqpekx76KJRkatSEFSWefJuHZ4Pn/l6hNGpCW0+jmTfzIVNWDLUTVqiqSeWu7k91L
	l4UgESt2dJfYHY1ozysPbCUUjHkUufYZM4gEhwk7Dwc3QXcQmcSEibH2xbrubQsmDmpi5bV3Rss
	4KZKa+I4Sw40jUnIWl/0cAWM90B35G5XxVZqq62ShUawNO4gMblgMhQ7+/Ac8JAqRdasrp0awio
	JfRaYKWenLwDUnxo1aArPgoKn/a40ZimzBtADGeA/Y6WAIEhnlqwQxoZDm94ixpHsCITsx75dKp
	x7a6Az0pDD5O2eaPuKOcUi4lEg8MCRVJRPdT8P8q+Tjv9jI2/PpS2w16LncnlwnStH581YK2djT
	zHcTRgLirMb3CpMBoEOQs6dZugP2+zWt2n7TZQW6tnvDXqH8HCG1cRpdGWEUDGilcbFI2csjpqC
	gStpFFKH6SwZC5wYmbfPUrxYnpnPOmCKpYX1CAB/0rLhNFiN/BfsA69McrYRiQo2svljhA==
X-Received: by 2002:a17:90b:3d4d:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b41c90329emr26496488a91.30.1795830797454;
        Fri, 27 Nov 2026 17:53:17 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:6b7e:ff5:f0cb:5bb0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm24769916a91.5.2026.11.27.17.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 17:53:15 -0800 (PST)
Date: Sat, 28 Nov 2026 10:53:08 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: SJ Park <sj@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add mm and block lists to zram entry
Message-ID: <awozzzB7zkfAVBqE@google.com>
References: <20261127031658.2049871-1-senozhatsky@chromium.org>
 <20261127185347.87793-1-sj@kernel.org>
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
In-Reply-To: <20261127185347.87793-1-sj@kernel.org>

On (26/11/27 10:53), SJ Park wrote:
> On Fri, 27 Nov 2026 12:16:38 +0900 Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
> 
> > Route zram patches via linux-mm and linux-block lists,
> > rather than through the generic linux-kernel.
> > 
> > While at it, fix a DRVIER typo.
> > 
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

[.]

> >  
> > -ZRAM COMPRESSED RAM BLOCK DEVICE DRVIER
> > +ZRAM COMPRESSED RAM BLOCK DEVICE DRIVER
> 
> Thinking loud.  I was wondering what is changed here.  I found it is fixing the
> typo: s/drvier/driver/.

It is mentioned in the commit message, the last sentence :)
