Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212729;
	b=Emm7iziE3acvSoy4BJAQH8I1Dli6SSsRAUUkG6GOhnDRbavvHo3Wz4CKAIbYYOFQYcFw
	 6parcYZW/9BuO4t9jFZ6/2WS1czf1Ys4tPvsIJ7uihs6CY0K24LnNa75ZqKjXTtyFgiBn
	 2QRfzthnHCqv6c/ATxBEKevgDGrlzdfly9iXznvxQc4zxhpSvUO9mZiCpfinnhPZv5Z8E
	 H8RivompBoJm1NShehe4lWiEWwa4GBBIEBmei3OgQt4Hd6KdYaySh2TZv14cdMd5+mQJs
	 9Od60MNFe9I3gejmdaOxZ4ECoorlNYMSFfv8v1FZGslII1mPjnxxl9aQ5AYDpW1Z7ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212729;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=5MV62/UjvDtrpzf/eJLXBuU+5N8PkFP7Q9wIZ06BXA0=;
	b=rfwetyRmo5myRj1RDW8xP+u3dZjvzZPvi8yczRqySyFp00oaIVVjVQK2I4M6Dpz/1Hxb
	 A6uli2EQ4dIKV6R3ykoZzX4UL6223Y2bx4TLZFrRWeIu1Z2E/N2uptYjjE2S5f46s5L7X
	 egJDpTSJVnoTUVIHjCoLurwHTIZA4A8laW/HWYd1PFHn8B/MC93KkP17aDqHTW9MkWhic
	 0JIPkdSFljVN6AxpjfH+rQeVE5whpfOdrbX38EGnkMcOeAlNb8gAhQ9l7c5dE9/+xvWjK
	 7CTJCRwn0W2PZ8EuujrTBfWst5214dRaNTcQB1LW/TaZdtghnDXbIqDK56jKp+d0yrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B63606A6BA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 22:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6B63606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5587351d419so1108915b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212717; x=1795817517;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5MV62/UjvDtrpzf/eJLXBuU+5N8PkFP7Q9wIZ06BXA0=;
        b=pzsrpAsNRnJtkyrtd2ihZUuKvVgPCnIoTmBFoV18LB2+A7DVsE62Q7csaBcHngnq4J
         J/NJZwfIPw5mztHEOBiMTeYS5cbhoGzxTmTABO959Vouob0dKDG6wbmEdwMSN48WX9Vx
         Kw9wVyBgMTQtTqsgG945hrtPNeqsKXa6+bv8QdVC5lCTFLsrMWtWkqq+X8/+vRv7bcGh
         bX5IjQqh4re8GNXlwq6RKXL+qQ2RW+HOQlEa9DaP0SGvMaXxgc+TUqDc8uZH2YmX6JZs
         KMrClgQ2Y+UfxXII95dTAodGWj7aklaPLVu520dcRR4zR73bBnIXrgkGURyTmiab3u/z
         qTxg==
X-Forwarded-Encrypted: i=1; AL+hErEr/tGnuhkDo4C248kGp78SjWkTgdtX+Mt0W3iZMJ8R0yv+AsoNRyQhokikAiFFyBj4RNctwr6mQhf3VuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0fU+lIkJCJCOt30e2F7hJ9cNQ7KbfE23iSrhmemWl/rP8cBK8
	FEUH+BRgrvN39Ae9IrX/+6eqeMl6zqtg68nfKeNuIfBCBYOq3yBiWu+vtVmNyFODU0ILQybBGEY
	mciPaXP2OhMId75K9YS97QvMiatVO0xNVtv01l2CakBIfMLxL5gIaU5kUnhU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1483:b0:55b:f8ca:5a01 with SMTP id
 5614622812f47-57a0a212610mr5023470b6e.12.1795212717703; Fri, 20 Nov 2026
 14:11:57 -0800 (PST)
Date: Fri, 20 Nov 2026 14:11:57 -0800
In-Reply-To: <20261120221145.70992-1-joshtokarsky@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b00c5ad.44b41460.34b83f.0002.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: use-after-free Read in media_request_release
From: syzbot <syzbot+3910ee87c4ba0a51e3f9@syzkaller.appspotmail.com>
To: joshtokarsky@gmail.com
Cc: joshtokarsky@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

>
> Proposed fix, two patches combined below:
>   1. media: mc: request: don't touch mdev after req_free()
>   2. media: vivid: hold a v4l2_device reference for each request
>
> vivid's req_alloc()/req_free() take and drop a v4l2_device reference,
> so the vivid_dev can't be freed while a request still points at its
> media_device. The core change moves the num_requests decrement before
> req_free(), since req_free() may now drop the last reference.
>
> ---
> diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
> index e1387f03978..96872de536e 100644
> --- a/drivers/media/mc/mc-request.c
> +++ b/drivers/media/mc/mc-request.c
> @@ -71,11 +71,11 @@ static void media_request_release(struct kref *kref)
>  
>  	media_request_clean(req);
>  
> +	atomic_dec(&mdev->num_requests);
>  	if (mdev->ops->req_free)
>  		mdev->ops->req_free(req);
>  	else
>  		kfree(req);
> -	atomic_dec(&mdev->num_requests);
>  }
>  
>  void media_request_put(struct media_request *req)
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index c042d92db17..24b77ea602a 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -881,9 +881,31 @@ static int vivid_req_validate(struct media_request *req)
>  	return vb2_request_validate(req);
>  }
>  
> +static struct media_request *vivid_req_alloc(struct media_device *mdev)
> +{
> +	struct vivid_dev *dev = container_of(mdev, struct vivid_dev, mdev);
> +	struct media_request *req;
> +
> +	req = kzalloc_obj(*req);
> +	if (!req)
> +		return NULL;
> +	v4l2_device_get(&dev->v4l2_dev);
> +	return req;
> +}
> +
> +static void vivid_req_free(struct media_request *req)
> +{
> +	struct vivid_dev *dev = container_of(req->mdev, struct vivid_dev, mdev);
> +
> +	v4l2_device_put(&dev->v4l2_dev);
> +	kfree(req);
> +}
> +
>  static const struct media_device_ops vivid_media_ops = {
>  	.req_validate = vivid_req_validate,
>  	.req_queue = vb2_request_queue,
> +	.req_alloc = vivid_req_alloc,
> +	.req_free = vivid_req_free,
>  };
>  #endif
>  
