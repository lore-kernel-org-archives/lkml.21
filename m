Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795238804;
	b=5YO4lnOvNHFdpAOf+Sm7uKmv6VMyXH1ZQ/H47oES9gHg9pSHSjDzYDJdXHR6m+RnYtK5
	 uY6+Yy5atjwlU8okwVmQ9FTwoZ4jxKe4unpSzzOIcOWiKA9BhCwN3+zWm+FVfi6Px8fCc
	 FLTpfcG3C0aFSe1eol4g3Q5yUBb4XIdWWX+BJd4DbMiAVjlTHVA41Kv6hy++eUYuqxxPF
	 lXHKubP00/WO8thIHxZ5BkSK6B53y/f+91+1I4ZG0aR26Umjv6/GjC6X8QC+t+2GymTji
	 bxqqgG+pyY+XXlPdikx/XLJ+i0jCXTrZQ6XGi/IHpRhyD3XQd0zwwWiK/9ti19ebF2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795238804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2mKaz/dqifKa6tvgIjKTsGu3wdsWa8OrLCV4/chX4LQ=;
	b=3F+c2ApJ5HAp9ZqsIi57DE4IRfcngP7wp6+cC9UdLFjPl43LCL7D7UURlXpKfvQrr3Af
	 hpc5yo8kqvOv7M2NofrRHyJvdGcvnY45n9c0XmeIPrjSquVkIurSFLJ6LyK3qZNJmsLMd
	 c/pQxqkCl48/zGhg1YCOrL598jjQqmBmkIlG5Bhx6XGIyH6gp4x9arTcMNldRIHBnSRXf
	 QwInDumIMJk8maypg5yEb/+jcdmhI3/eoc4xgpjxuEz1VPy2UQf0hr42I8j3Rf4SoKTYY
	 o1x+2wHIFE01+yppfx0I89esgnfNVbz5Fnjcz66lSspjg3NI5QumYwy7fijR82tFOQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMjvtjYt;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EDA606A685
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 05:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30EDA606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMjvtjYt
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1028438a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 21:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795238803; x=1795843603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2mKaz/dqifKa6tvgIjKTsGu3wdsWa8OrLCV4/chX4LQ=;
        b=OMjvtjYtuz/ck4cShSktGQWWBs+3kGP9qYEgUF7wDld3Qlmz1nB/udxsLsVhvf4yku
         tagAPNPBBMmGf6HpALhJATxoXyF7m56tSmsO/1BZx7j+c4VfFV3PMF2qARoVGL4gInzl
         WNLZOoAI5z98uwxlfrwSZFnjxujJ/SVpCepL2q31TpbpqOUFoFzZv/gpy71IdsuVJLWn
         a+K9NI+YH1uKUKZgjetD+Dmmo7zFUM1hosU7hAXftGbU6okW8uLQuQD2nFyt2GTYynpJ
         +JXzRyaPM7mQDk7mMteEOF0bNl34jcxAZwrmnC7TxbgWwbso3NGVH4HmV1CUZsbQ9xkS
         79FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795238803; x=1795843603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mKaz/dqifKa6tvgIjKTsGu3wdsWa8OrLCV4/chX4LQ=;
        b=DYYqkuzqcF7cgfX81YvnXtXGT2P1OeghNsHmmX1VVz42G22KQ/yKeZYfTJuizJI6ob
         P3TysDSQYyVHt4LE0UE5DdSSXdLT6c8vXX9Gttu5ptIclLOWgAhxZlgeRZeAbfjqs11v
         0bVpWRUg2ReYv5NizMBJktS5Qn5R+2g48WC8z22OGuldBycbxeT+rJKAt4+rH2MthP/B
         LvmYHXxuKW3otshiNRV9oIXtkgo9ZZ4ZhxTi+tVdEFxmE2z2ZNvRnFA14qkjT4SIeobP
         5eCnuq1m9EVe9G45PAtoN2WSc05omB+MTjkyd0yKHwiQkT2mO+aiC2+1MkIUp7lGh5n4
         4x8Q==
X-Forwarded-Encrypted: i=1; AL+hErE+kziR9WMAJ9UhwmPaiq916x6yQIPgplOyNemCixdbtUioOdBS0beyUXGrpBJCo1OtwqpUrO8XuitQ20M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nJhzyGHdlcc1TTmNHoFY8x0qSon46ra45hrgPzEWaIoGVElwE
	WMwwxXyO1FSi6flxd7WRMDbsb1GJWteubbpkCshuTTVIBTEGjdFG+6n+
X-Gm-Gg: AZFdTZd3WInppgG5Nsxodt88TrvflKJ0iQcG/CSVEVAHX7CwCVzouIdgXc2bN0sYj73
	NHPMPLlZwEy/TRnOGbDND0lER4sE/JNI7pHZgaC/LZzAxgeAmmwZXLURJBWIrY6On50nfon7PrF
	zZK/yBuiHFnsqBG2xE6uOJgBiV0b6l5Ww/gNHAPTMPIHsEn498pmHDS19t0di79wg1uu4LrcgmT
	45TkiXj4PmfFTAInrvndHMKOUZWwsXkaVzJ1OVse7yTj7P4cs2kkXd03sOg//woGYu16bN9AyVq
	8YBHpxtqEPshrIjXgRt+OdDx86DI5h8mTS1ltdBhFIDpL9ob3tYs1MAlzhiV1iA5NFxiO9Lbw6Q
	/MMjP3mAZnUqUF5/pyWNriblWXsPgOUUOxmVOEJPitoVTHKJeLAIc5CbZfMz8tBlNFe12r0QJot
	iA/Ep+ZiBB2TJiFE7WJ/UwnTLVYce3+BbJNMZSToU5gk8tCph/WhFoUMDOB5kn4BwlpSqR9g1Zw
	91NRemF1J/pTqz5bQ+bI7oIIUI2hOeTIu4vqF3cFD0QHBYVsCQp9YE9c0ze/I1moWe6bqJbxzZi
	o+G96uaEO+H51/qEKPkhP4kAh3SI/pWs1OW0d2+HJeggvlcs
X-Received: by 2002:a17:90b:3890:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3b41c97deecmr5244247a91.56.1795238803409;
        Fri, 20 Nov 2026 21:26:43 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm1223708a91.4.2026.11.20.21.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:26:42 -0800 (PST)
Date: Sat, 21 Nov 2026 13:26:35 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261121052635.GA32792@rigel>
References: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
 <20261120-gpiolib-chip-removal-v7-7-aambrozewicz@nvidia.com>
 <20261121044657.GA17013@rigel>
 <20261121051900.4118973-2-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261121051900.4118973-2-aambrozewicz@nvidia.com>

On Sat, Nov 21, 2026 at 07:19:01AM +0200, Adrian Ambrozewicz wrote:
> On Sat, Nov 21, 2026 at 12:46:57PM +0800, Kent Gibson wrote:
> > > @@ -1690,7 +1697,6 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
> > >  			return -ENOMEM;
> > >  	}
> > >  
> > > -	mutex_init(&lr->config_mutex);
> >
> > What is the rationale for relocating the mutex_init()?
> > Looks like a gratuitous change, and if this patch is going to be
> > backported then it should be kept minimal.
> 
> It is needed: linereq_free() now takes config_mutex, and __free() also
> calls it when linereq_create() fails after allocating lr. The first such
> failure, kstrndup(), returned before the old mutex_init(), so it would
> have locked an uninitialised mutex. I plan to say so in the commit
> message in v8.
> 

Ahh, I overlooked the __free().  That makes sense then.

Cheers,
Kent.

> > The lines removed/guarded were added in patch 3, so note that this patch is
> > dependent on patch 3 in the description[1].
> [...]
> > The line removed/guarded was added in patch 5, so note that this patch is
> > dependent on patch 5 in the description[1].
> 
> Agreed, I plan to note both dependencies in the v8 description.
> 
> Thanks for the review.
> 
> Adrian
