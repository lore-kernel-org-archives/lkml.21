Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993640;
	b=bKJWGjeldITJB/5yjDvEPRmjt62VbsKCt4IeR5EhsV7eWUE/Yoc4kShg4NRyw3g5Dp0g
	 Eow6JRiKdLGwzAYQNCmxe3upEeMf7JtOVogwEGnJXX9KzwlhAw1zIUQvzeTomIHOkFlzF
	 MB21Hk1ckgHOjXH4AZkmhzJ5dWxmLnHLTAwpUXNxOTaOjEtX8o85ikU6cyRoLX2waV7t0
	 7FVshJkTBKLJmahMH1RbKoRwaBPL0kCyD1Id92V2NZ0NId2AqNiI3QpOKl7Xim56F8kk7
	 rjFgaZR/mF8Udf0A08CefgVf7ZB+EeRIi4InsZcVexKoQg624TbsU/6avZVHIw33+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7G2JleZyR72mUGx/SlF6TitvE9bUJJx/pf31x7lthho=;
	b=zn2FwbtIQtZNClP4hQbjm9qGaw2Akji7LtkjQt9sj042AIuz2LRZcmkPDVJ4aNcSVBwl
	 EZMHuehWzEfX8K8fgR7WGpOL6Imbrh9Sux0tDh0V042duJkUbycpLSYJ2RRarBSwiIyeD
	 cbxy6//6NpUCoeHOnzk63gtphAtZqKSwjBK5zIyoFdHBnABpWMjgMzyNX7o+EwFcoJvvO
	 4EGidJdEBg3ddF/nk4OgxXbCMZo3z264jJlDsEopL8fXQ0n3+iERFAWfF98y0Xh7imiap
	 y0jp47Ri61lOE3Pim2hWc/de74WXUr05rfTevR8Y4TrbCK+x74V7CJOXfnFGUvh84tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPBA0Fx1;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F7B606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F7B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPBA0Fx1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so9935245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794993639; x=1795598439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7G2JleZyR72mUGx/SlF6TitvE9bUJJx/pf31x7lthho=;
        b=HPBA0Fx1Y42IjYowQTS54bVquaWdLj/lhdK2aoMLk4jypLo1ums5U21+BBKknp3EUB
         PsYZzXipMwJwKl7un/FPSMn/1jgqnE6qwJgdpCPvWs0d5FZibp5ILp2g3AS64kE/Rxat
         9TDOCVhbwRXcZhrQDM7pR00aQpb+jAbacK+7z9efYi6aGkKBUVojLI/lYBvOTRWFtftY
         tOUhAfj4kOzM+XvNzgYEWZBKwVm97eXQQuIGhpgeEvK/Chot4bOHK8cspes0Gw8wMnkP
         6PW+SbIRCN+s+li4UCqAzQyVS0xBVvoBjdmOp6tMhMaDZalC/qbyeX0+hMfRm6MO4s14
         ksAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993639; x=1795598439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7G2JleZyR72mUGx/SlF6TitvE9bUJJx/pf31x7lthho=;
        b=AmY/3kkxgQFWA0wwye0rbHAkVYvMEkjm40itxtbc+xxPUQ3KUO8iO6vHEx/047fGAO
         w2Q9HDr1L2zQYIFEfqu/mDyskMPJR0+Y5l2j9/SYCoFVWnpe483ZzmyDAcKx4H8wmR38
         6P+GxXgHG2IjrPI8waTdAOLQTjr9hv/sOW6xI/x2vdyaNBn0+9m/5/iK6Oks1eDcNWmJ
         ySDun9lU+HAlhhnszvZKVERxXTBF4heMqkWZp7J2uUijrfXVIz4q6qRk0PClfgKxYO1/
         6JLmg9yq+AC6BYNGKJi7RPjvjO8wQEShaVqVSVIhyyzuyXy80+nX+SCvXRC03ro4D8Wo
         j0Ug==
X-Forwarded-Encrypted: i=1; AL+hErGV4KBmoAQUhjNu9xbS1Y9eLdz+qVHfFFL0H5nZHiDWIFAS4lPNafaCeIt1qnyUohbiFD1Y1m95WnpSZP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sZKI/2/SrRwEeIjd4bnNCleoy3eSJCQmiCavF5+Pf/A1GOIVo
	hFEhqwKFb8Zh558PkHRFQou+k+9BjfHjH0UeS4vwSjUIPFggzn2mY5gZ
X-Gm-Gg: AYBFou1SD9ske/4MotwCXAvEY5ZF/+m0tfvOxb+6YT5VCOhNArY/orVd3BewxeMoU0o
	nH62YzFdnQchiydxUxk7t2subje8lTV6gGizKauXsX2qgjhrtbaULrJ7eJnUxpEN2nPH6bHL1on
	2rJXxIcGzoI9NiHjg4smgmDdxr8MEXRQ28yC72XEl5CiGeeIRwoZ4LvET2kQzyD9LJeH/B0xuKL
	xcL4XStIKVpc6Rknmzw4ynssHRHBLvNyd+BMEY42Rfk7EdXveohwavBM0JRi7lZO3WZti+hdZvA
	qAFNsb3xH8eMFDlpDAEndIvVDd6U6+yPmSse+aJYFFQ4Qv3IoCiJJOamoqjNZMxzd8hISWetSNo
	mJqqjACnMHeJNr6mXEb0N5MZUkPXhG4HSFGomf/n9gyfdfyW5X5z8K/y1unx3SzE9WeJUeWLoFM
	a2gp35Xie6PWgNWwmbC7uHKk3/2qBIKJVkLIqdCaIlDj9aYQxPTduF1wpDTP/3rThNMyWaRfyfv
	p/mC4xubJeXxr66cmYRM7Ox6ge0YKhcvBuB3SahVT1Zo2FXyWGR2inPQde12ebFGYlZ1a6vtuz1
	Q8mcITdBmaiLN6EZZ4++Um/5/mjQYkj8U3TTjcPSqqlTEWBlqno2lWzMO7W9fas7+OUSMx+OSmo
	6oYqZr2IDILEUMK9dQU5h82MgA/ZF9IXunZZjwiZAuZVHYijCthoUT5rk7ZlQZLzG90TK
X-Received: by 2002:a05:600c:4f14:b0:4ac:da92:2bd4 with SMTP id 5b1f17b1804b1-4bb7d6cc934mr40618635e9.1.1794993638760;
        Wed, 18 Nov 2026 01:20:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2aad96sm42979355e9.6.2026.11.18.01.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:20:37 -0800 (PST)
Date: Wed, 18 Nov 2026 12:20:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivani Patel <patelshivani2283@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and
 mute with list_lock
Message-ID: <av1t4DbqGsmUmrZJ@stanley.mountain>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
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
In-Reply-To: <20261117170558.33844-1-patelshivani2283@gmail.com>

On Tue, Nov 17, 2026 at 10:35:57PM +0530, Shivani Patel wrote:
> data_ready() and get_top_mbo() read mdev->pending_mbos without holding
> mdev->list_lock, racing with comp_rx_data() which modifies the list
> under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
> holding mdev->list_lock.
> 
> Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
> clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
> in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
> check inside the read loop.
> 
> Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
> ---
> v3:
>  - New patch added after inspecting list_lock usage per Dan Carpenter's
>    review of v2.

Huh...  This is interesting.

> 
>  drivers/staging/most/video/video.c | 34 ++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
> index 3a0445ff6..92d5fbc9a 100644
> --- a/drivers/staging/most/video/video.c
> +++ b/drivers/staging/most/video/video.c
> @@ -60,14 +60,27 @@ static inline struct comp_fh *to_comp_fh(struct file *filp)
>  static LIST_HEAD(video_devices);
>  static DEFINE_SPINLOCK(list_lock);
>  
> -static inline bool data_ready(struct most_video_dev *mdev)
> +static bool data_ready(struct most_video_dev *mdev)
>  {
> -	return !list_empty(&mdev->pending_mbos);
> +	unsigned long flags;
> +	bool ready;
> +
> +	spin_lock_irqsave(&mdev->list_lock, flags);
> +	ready = !list_empty(&mdev->pending_mbos);
> +	spin_unlock_irqrestore(&mdev->list_lock, flags);
> +
> +	return ready;

It doesn't really matter if we take the lock where since we drop it
right away.  The list_empty() doesn't anything that requires locking
so far as I can see.

>  }
>  
> -static inline struct mbo *get_top_mbo(struct most_video_dev *mdev)
> +static struct mbo *get_top_mbo(struct most_video_dev *mdev)
>  {
> -	return list_first_entry(&mdev->pending_mbos, struct mbo, list);
> +	struct mbo *mbo;
> +
> +	spin_lock_irq(&mdev->list_lock);
> +	mbo = list_first_entry_or_null(&mdev->pending_mbos, struct mbo, list);
> +	spin_unlock_irq(&mdev->list_lock);
> +
> +	return mbo;
>  }
>  
>  static int comp_vdev_open(struct file *filp)
> @@ -143,7 +156,9 @@ static int comp_vdev_close(struct file *filp)
>  	}
>  
>  	most_stop_channel(mdev->iface, mdev->ch_idx, &comp);
> +	spin_lock_irq(&mdev->list_lock);
>  	mdev->mute = false;
> +	spin_unlock_irq(&mdev->list_lock);


I don't see the point of protecting ->mute.


>  
>  	v4l2_fh_del(&fh->fh, filp);
>  	v4l2_fh_exit(&fh->fh);
> @@ -175,10 +190,15 @@ static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
>  	if (!data_ready(mdev))
>  		return -EAGAIN;
>  
> -	while (count > 0 && data_ready(mdev)) {
> +	while (count > 0) {
>  		struct mbo *const mbo = get_top_mbo(mdev);
> -		int const rem = mbo->processed_length - fh->offs;
> -		int const cnt = rem < count ? rem : count;
> +		int rem, cnt;
> +
> +		if (!mbo)
> +			break;
> +
> +		rem = mbo->processed_length - fh->offs;
> +		cnt = rem < count ? rem : count;

The worry here is that we could have more than one reader open, right?
I don't think this is a complete fix, because they could both take the
same mbo and could have cnt >= rem and the other has a use after free.

I'm not super familiar with this code.  I assume it's only supposed to
have one reader at a time.  Maybe it's serialized at a different layer?

regards,
dan carpenter


