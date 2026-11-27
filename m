Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795742361;
	b=lp2eQ6rCB6z0AOcy0puvkrzlJgYfG08/i/CtBHQLoNFryPam/INzdibXhBfKfLe56Zm/
	 2MafJnYbf0/0I2A0vDOand1wagZNHXQPFdCkn+Rkgk2Y8a2GOsR7VhemAY49NMdx6xXgX
	 MAv0D03Fr4jCSFmMq8vqMdUoxPz8tozDrwg2s61jYiXHzT4kKfB2pGa1+EShkqh3AkT0c
	 ip+OtqOroJNxJlXy0cRwWWdhruTJaie671f1LwcToZzxqvMNnmUBcpmyLjoOuYT9mfQEL
	 7inZ4fYbClqrI+V6JzSOCMhCrY5lpzLrjAJ7Ksng/PXVZ3GOfmHOt2ZSoWOdQZa0iVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795742361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9S2wD3u5c8Swjbtm9qjZJok1wpzb9JsdrrAA8lW58GI=;
	b=qkK/tuueHC7Ped8iJaNX37subIGzyVdLqDLyYL5rqSDSjekSXpyJXOL6gn6OxGIysVge
	 57X79dxnuZqtE3/ZJyipigXMZ9a8h+YlOE1kL7dvo7872qwbaM8symfC0je7ApgGWgdlq
	 yFkI4vcebRTzNi+JrqfMyFDGd9tyi7PXMvXrtgtEmY11/zr8Lp1QGrbUg25fO0W+DlU7B
	 nxrg61Ku3F5CP9MCqyuCFqlh9XSG4lDCbOsX2RN+14bP+MSUfisUMpM9NtBqEsbT/MTQg
	 QEEJhfJw5AAfSfJDkwvBibqsuKyJPDDqgccIHOueLA6BvkvR0C1VB4BnvGfHr30GQyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gqesYc00;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4B7606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gqesYc00
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso3181082a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795742360; x=1796347160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9S2wD3u5c8Swjbtm9qjZJok1wpzb9JsdrrAA8lW58GI=;
        b=gqesYc0000eL7XF1wi7BtoTw2Ip7GPQcmU04rUbun+G8KmplMt+t9cAguF7JirI2RI
         ONKpvLSgAVZE/I6dak814vwqahXhxa/KEO1a+PWxcLPT717PCTdfIQ8w4TuWM/Es+zoi
         vs1Xvn9hM75mbx+7MkCTeuWnQH5nf1BYqH/yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795742360; x=1796347160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9S2wD3u5c8Swjbtm9qjZJok1wpzb9JsdrrAA8lW58GI=;
        b=DJh2NEaozodFm/biXfsyHhQh8w+VnRQUOxmrsoxcauFi51t+DgclLyW/lYacE2iS6m
         TbZ7JdwVBPLHdybnV1BfAYgqpIK3VyBY5d+ME08tnCE17S/1oAZvHsfGenqlPlCzxvC8
         /4C3G10dbSQ3FtofzuxkgXRZVqDP6qXNrJLK7LsefYubVO1+tC2MfWsx/t0lFZQXf9Ov
         x2LVhtK6izsElB0Cy/NCkwCDDeH6kSqC+ZdRMOiSfQrGAN5+6zVVQyXuQoBrPZt9M8vV
         BuHSnf/O89wx0jnPYBvqoe+AYgq0ZT6icDQxsa7Myyxb8pCKKP+1H4Jr7f8NjX5ZmO2x
         cUjw==
X-Forwarded-Encrypted: i=1; AL+hErHhV7P/SqwgsBJnudnNE/BmLL/ERRmWmiltpFHPwGnAkX4ofr3u3645LclzXZlz24LxV1DvL3tsPF4pF3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yfZVxdUm6Rcl8qhRlK4KWXbMzU/r1kRig0rDVYGZfq/alNQ8p
	LrmmhOUi9C0qMrKApb3mQBy9QrZigoppN9PHst4WLo3BtXp7al2aW9/yPO+wk6yHcA==
X-Gm-Gg: AZFdTZdOzhqrMUOv6hKruZP3kBIt/daDCqWq3qpv7bzvv48TaqVILA6NXVWKJcPl3mT
	4I9FKiGKO5Eqh1800FbQOGAP7dhteYGgR0jXPuH9q9mSErqWZEEntJhYbtl1sN32GbY5mRVu0E8
	lNa4MdGxuGBSXRrrQPBpjbP1dhHVg6XsiXdLGA/pj5X2F7D7yY8IJCTDmSJjnwLpdd81e6EpCmL
	mVzvy487W7lFpD1s6VmROzn1+M6f5b0qjjPE+pY38r2WSUYg2ZVcXciHy1t0VURjzSNGxXJfAzg
	KK66p8O4Vtxuu36AaGYIF/OJl3TA5B6TLgyAK+IoL3F5+b+M+toKjIJDy7a6eyjozSrvSvT8lgJ
	MdPEy5BB7VFjRfPN+PzDtZks+zABspWoEeKO9wqqkPHi6NLyc1fOyi5INInQLl3/SCbDOzmSigg
	iVLbSCJR2zFv/lfur4hUmPFNcPRCV+UAzunNEQo8D9+vHgoohkIvL9QTlzEeakt7zeTQvCUC3Rn
	crWoOArby69qLqtuZYARiX/QM/hVwKts+U84M2YxA1hhjHW5osg2kSIDMcfTKdE7rZHcdo5DMZM
	+RRyqOCduJUbKAHhGsAdBQmwQtW7e3ak+NTf8dcCWIgZG9/nfW77Txr25x1Lpw5BGkAq
X-Received: by 2002:a17:90b:3f0f:b0:3b4:393:452a with SMTP id 98e67ed59e1d1-3b41c9120c3mr23694154a91.23.1795742359875;
        Thu, 26 Nov 2026 17:19:19 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:5bf8:984e:5bb:e51d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm35954294a91.6.2026.11.26.17.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 17:19:19 -0800 (PST)
Date: Fri, 27 Nov 2026 10:19:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: validate decompressed page size
Message-ID: <awjaHB2ugCG_F3Io@google.com>
References: <20261127004411.109585-1-artem122novak@gmail.com>
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
In-Reply-To: <20261127004411.109585-1-artem122novak@gmail.com>

On (26/11/26 18:44), Artem Novak wrote:
[..]
> @@ -185,6 +185,8 @@ int zcomp_decompress(struct zcomp *comp, struct zcomp_strm *zstrm,
>  	ret = comp->ops->decompress(comp->params, &zstrm->ctx, &req);
>  	if (src)
>  		kunmap_local(src);
> +	if (!ret && req.dst_len != PAGE_SIZE)
> +		ret = -EINVAL;
>  	return ret;
>  }

Yeah, I don't think we should do this.  We only ever compress PAGE_SIZE
buffers, if some backend decompresses it to a something that is not
PAGE_SIZE and doesn't signal an error via "ret" then it's a bug in the
backend and zram should not cover it up.
