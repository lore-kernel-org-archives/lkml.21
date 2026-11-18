Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003301;
	b=jeRz/q+CUT5gIMw3AYk8Fppviu4L/vvXuH3883fFYW4R1QiDcWcohmg0oQy3UoTyoVPU
	 CWRpmZQlNH/pkC4ZVdYl1yENtRDKrciJsB5zfjMEYIL8mHXKT+MEISIEHfAfoSuwY6AXe
	 lgtLusmC2Kcfjn9Iz1Jpw3bQ0AAPHzYSgAE5b96alDUigjtMB+Ll0j4RH799t5kNC3Xcw
	 9n/fv7JpqrE8w+HvNsrHjbPoXF9DKBJ5eTC6wI+I5iAHANo64iXs6+VABRgDTnt3BdcvU
	 CrHNWCgyOyx2YaQcTds91ylkO0h67KGox6SvKRCxleE1dLzOJNiPaPOM1GO+SZuz53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KSUxz0kUmubjph+cp2VPmoNpzQJPoX8IF209FgUek9w=;
	b=k7FaJdekfekjjbrJqzQ83qU9o/3HEOp8PBhAe5t4YrMQJEMkPwuaz3VPyag0YhZIjVpY
	 XB1ueSMhTu/eY818QjMxLbEAlcNuYcYQUss97SNCf6Q5Xo041oAaQpF8HavcJNd91LPZj
	 wKy43/1ssdQhYyxbsDBQr14rjN2P4fFT1VUxmeIfQ7vcTyXSUcSWdjRvOphCbZVJj7cwq
	 l9yG64VEJmOuhG4b8CVr9PwTQlww2V0dnxx2ktr+tQWVGPzIa3SQVEGcPwIaRp13Ehmke
	 HojH+izZ5NvfVOVdQiebWLR1NUDJDjWiuvAoyolwfztJ3sJ4M7lWPPa3NuF/jtC6dvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04dyscUx;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB11606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04dyscUx
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so4241895e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003299; x=1795608099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KSUxz0kUmubjph+cp2VPmoNpzQJPoX8IF209FgUek9w=;
        b=04dyscUx28izuEt9mrVrJfPqFjgqJBfekGAHo+DIC7UsC1Egv+6+EanxCuGYPtclPe
         S9lmowoVSyq3fIjh0dwNE1/PURIF15sTKBpU61WRqQlqynOm4qqZHdlLymgHd6yl++WH
         bFTTb3Pj/CK9+jvcjQrwMv5+yYPO+HerKySfn28Zt0xFKvnwLnlWayvGmiQjZriR+ZCd
         9W8jU1PryytOQngz89wie5VB5P8hwA7osEFSQYdzw+aWLd6mcLkKBlS5mG+QL7IIiYfy
         62EczH9QCzzLMX7yTRnGHfPuHk38DdTtQlvsb350n3KqQ19PlI+VHQs5/pcuyDT8fw0t
         YbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003299; x=1795608099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KSUxz0kUmubjph+cp2VPmoNpzQJPoX8IF209FgUek9w=;
        b=jIEkB1f8X9okYMiF1HHzzJ7p8pcyZq7OXm7P+pLhfEbb5YgUxzHyC64XmDBjqRdQpE
         8K8b5PsgUMMCNZjtz28b1ovEpIWr5kTGngq+wEC1FxP4vCdORO4FpXJJf8DzyY8TN9UF
         8EZ787Q3Tp5+Fj2doV6Ab5Vnw766lRXIewp+myfoRZy/V8Ja7vG+Cq3o5FH2qNlSTD1Q
         7G1dCPiEXFLv9ES3Gf57EanOB9hB4DZAzp7TUQygwXXvdV1lcN6RE8FSWfP5maAlk0jZ
         0Brh0kGz1yfZmF7YM4B1x1Diorj9cajr6PKgSYfkrtlVGwtjQFaTqn/7pKw4Yjek6Hus
         Dzow==
X-Forwarded-Encrypted: i=1; AL+hErFkI1nGSiSc0JGWbJvVDDuxFwN/FdE66lC1E4sHhVbJ+WY34i3J6VEey2QTkiU2QCpifgmGH2slqmHF5TY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZdM1e6uCTtkv3ITDmGOnkgfPmPOkd2Xmb3yahxnL8djy4vBS7
	WgIWxe/6CVqzRNHkfPeHadvJvsjLXMJEWbbNpp6MXEmSHH5/nNWSHrK5
X-Gm-Gg: AYBFou0mAh2VqJnISduluqm8gfxNaR5b5I7NYnWYuTbi+o61vlK3PE1Ffwq7gpK1Tbt
	Nvu0o3zA8zFhER0aJKZYlW2kG4+CXmDXMs6/lKDe5ysFqesYjnMN+EGKuQGN0Xg4H4GuOqbwZl9
	RND44XPRu7YiTA+r6+W/0ZzWxePn98bD/O7W/1VIpLTbnnj/xzo6NGi/flJ0sWTn7aCd9UHfRmv
	1XoDMHnrhRsbPYq/b3uSTezdGcqu979og9Wr9kY+UQ9FaLQusoYphFWFERcss/ZMTi5rkE7GKJv
	QjLsOwDyHcWp8PH4yF+Eoni82GfOwcr966R3LD4ASs8N3pfEio5grq72PA+U07tgvoGcIlmaaJC
	2qs5QTH+LjXkdGSNSA6Y2GBm5J4nATQhxOfa/YEgUccV/ss2LTdpYWUosmAwGUiJEzHWKlX+XqF
	6mBoYXiy6AmDFgB86i728EyE/itDbBCKWBtfYmHeMpi1vUyoCUrDr5C7iIrZeVFtmfQlntM5Fu7
	C001gnUk+iG7fYgVD3mfZh1IpyUgmS0GCyxeMVfPkmiPhXtH6OWgxTpFyr4WmagBu46VpEeVm1Z
	PlwXVT0cjr0KApxdKWLXNWloGbd7oTSzJbdLkN5OR9/EHo+mQErx2s35Og481l0F2rXxPPAGU0i
	a/LDX3bYGxf8FGZMAHpDFE0aK/JKNsnGk8j+VcW7gy1PBR/C8rM0XMcnS4zhdSaCK6yk=
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb7da3a374mr41928875e9.32.1795003298771;
        Wed, 18 Nov 2026 04:01:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6575a5c28sm4520927f8f.59.2026.11.18.04.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:01:37 -0800 (PST)
Date: Wed, 18 Nov 2026 15:01:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shivani Patel <patelshivani2283@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and
 mute with list_lock
Message-ID: <av2Tnre7L8iEAf98@stanley.mountain>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
 <av1t4DbqGsmUmrZJ@stanley.mountain>
 <av2KgdP5EuLamxpe@ashevche-desk.local>
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
In-Reply-To: <av2KgdP5EuLamxpe@ashevche-desk.local>

On Wed, Nov 18, 2026 at 01:22:41PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 18, 2026 at 12:20:32PM +0300, Dan Carpenter wrote:
> > On Tue, Nov 17, 2026 at 10:35:57PM +0530, Shivani Patel wrote:
> > > data_ready() and get_top_mbo() read mdev->pending_mbos without holding
> > > mdev->list_lock, racing with comp_rx_data() which modifies the list
> > > under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
> > > holding mdev->list_lock.
> > > 
> > > Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
> > > clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
> > > in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
> > > check inside the read loop.
> 
> ...
> 
> > > -static inline bool data_ready(struct most_video_dev *mdev)
> > > +static bool data_ready(struct most_video_dev *mdev)
> > >  {
> > > -	return !list_empty(&mdev->pending_mbos);
> > > +	unsigned long flags;
> > > +	bool ready;
> > > +
> > > +	spin_lock_irqsave(&mdev->list_lock, flags);
> > > +	ready = !list_empty(&mdev->pending_mbos);
> > > +	spin_unlock_irqrestore(&mdev->list_lock, flags);
> > > +
> > > +	return ready;
> > 
> > It doesn't really matter if we take the lock where since we drop it
> > right away.  The list_empty() doesn't anything that requires locking
> > so far as I can see.
> 
> Right, but the problem is that we possibly might compare valid pointer
> (list head itself) with the stale pointer (head->next and/or head->prev).

It's fine.  If you strip away the macros what the code is doing is.

diff --git a/drivers/staging/most/video/video.c b/drivers/staging/most/video/video.c
index 3a0445ff62f4..7bebbf1e11cb 100644
--- a/drivers/staging/most/video/video.c
+++ b/drivers/staging/most/video/video.c
@@ -62,7 +62,9 @@ static DEFINE_SPINLOCK(list_lock);
 
 static inline bool data_ready(struct most_video_dev *mdev)
 {
-	return !list_empty(&mdev->pending_mbos);
+	if (mdev->pending_mbos.next == mdev->pending_mbos.prev)
+		return false;
+	return true;
 }
 
 static inline struct mbo *get_top_mbo(struct most_video_dev *mdev)

The lock is unecessary, but also harmless.  Why I don't like adding a
lock is because we drop the lock before we return so the return value
could be wrong by the time it gets to the caller.  Nothing really
relies on the return being correct.  It's useful because we set the
error code based on it, but if it's wrong the system isn't going to
crash.

It's pretty common to do this sort of thing where we check in a racy
way if we can return early, then we take a lock and check again to
ensure that something is still true when it matters.

regards,
dan carpenter
