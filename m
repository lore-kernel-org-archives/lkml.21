Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000966;
	b=IG/WCvRGepMkOhaZIKdr4MxZDbR+FUhjty/QUkkehS0qGJCM8cKiIgohOcSIu83RBNDK
	 mheMPiadzZ9Z01YzZOnhcWT4NUoKI/ZqgZE1Uwy0u6aAJj/JSIHEskoMNLfdttOYdIBch
	 w/hvAbl4t/iqbm+YhaKJgu0x+d3ps9Xg5/UkJtMtCU1iOAvAsWIm5beqQZDBMhQCTOdEo
	 0w4zsa7THCajYwbxHvE5BwOiPpMZyiqzuybv4ebP0PocFe9vGqjnglAIXnxRFpfyA4rci
	 javzPwba3hnx/WeTVGdclUgmnAmEC9HXRnKFqPOvgomaRHtdQ0iGLkc3XKPIWn1YVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000966;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ZkzVAUC8Nlucc+Qn84sOEi9EHs8qdlhH5KYkgJRNO04=;
	b=pq2Bf1b+vtYWfe4mouc7L1VsRV7z7B9m/gSdkk+MnBDmv+BoiQY/Yj4GRIFulmeuKksn
	 sOZ5M1T8AAc8q6b12SkG0EAks5xqbmT7llQ9D9SF1fpqTT0+i9YgXPCZC94TfMbvMgt46
	 2JXBVQ+AZfkU+cIOFm6t+A9pLjI9NSs3DDNbYl5irMVVJBO+HMe1Ne7TqyvacPC3i8iiV
	 jvYz9KVjSsk3XmCxWrzgtPhZDSdxO/II86hHycMKgtQbcImfoFMuGOhIRyAnzL8tH0TY+
	 SYGG7nHOVuz/Q38SIaZgU+TlFVOePHQQv58tvu1kLu6NMy0HXAicFi5JKIUpaBEmjIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NMpfSZSr;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A61606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A61606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NMpfSZSr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795000967; x=1826536967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1F5dORa7k4HSGssZHA84M4G5Hli+drHq4OaBfT2fXi0=;
  b=NMpfSZSr1sVDKiALiPD/qaakQ7kss6CcsB3vwx/KGGgmu9Nr3ajPd+U0
   yGgPId7wGbSdK02S/igVXhJQyl8Fbrfeymio1Tzel1aFUQiLiXJkw42Jc
   5ROIu59QSR5qfOKESXUNmhkjvnceOt2GY1jjVkvL6hGTr6nZa9r/p2MZC
   2srPNfzp/5s2OyxmZY0/VBrUtqHbzbYMMocKI52iUkbnsm8j6Clz4M2b7
   FRolSL+r4UHAWGS0pvBZQ4Zt4xqUA7Q5DpoFLWX7bKOVGAgrm5KL27k1t
   AjEJVln4wC4jtCKSyXll6N70QeArcKZna0m5w9prHf1oVoQn2IKrnCEDh
   Q==;
X-CSE-ConnectionGUID: H3bvZhfuQhGA6TSvtvFq2g==
X-CSE-MsgGUID: Q762r4M6Sv+JVXkMqkXtWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3831909"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3831909"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:22:46 -0800
X-CSE-ConnectionGUID: e7sICtvpR82hcomjcL602w==
X-CSE-MsgGUID: K4Z5u7qoTnipOC3FXI9xJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10203305"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 03:22:43 -0800
Date: Wed, 18 Nov 2026 13:22:41 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Shivani Patel <patelshivani2283@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v3 1/2] staging: most: video: Protect pending_mbos and
 mute with list_lock
Message-ID: <av2KgdP5EuLamxpe@ashevche-desk.local>
References: <20261117170558.33844-1-patelshivani2283@gmail.com>
 <av1t4DbqGsmUmrZJ@stanley.mountain>
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
In-Reply-To: <av1t4DbqGsmUmrZJ@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Nov 18, 2026 at 12:20:32PM +0300, Dan Carpenter wrote:
> On Tue, Nov 17, 2026 at 10:35:57PM +0530, Shivani Patel wrote:
> > data_ready() and get_top_mbo() read mdev->pending_mbos without holding
> > mdev->list_lock, racing with comp_rx_data() which modifies the list
> > under mdev->list_lock. Also, comp_vdev_close() clears mdev->mute without
> > holding mdev->list_lock.
> > 
> > Acquire mdev->list_lock in data_ready(), get_top_mbo(), and when
> > clearing mdev->mute in comp_vdev_close(). Use list_first_entry_or_null()
> > in get_top_mbo() so comp_vdev_read() can drop the redundant data_ready()
> > check inside the read loop.

...

> > -static inline bool data_ready(struct most_video_dev *mdev)
> > +static bool data_ready(struct most_video_dev *mdev)
> >  {
> > -	return !list_empty(&mdev->pending_mbos);
> > +	unsigned long flags;
> > +	bool ready;
> > +
> > +	spin_lock_irqsave(&mdev->list_lock, flags);
> > +	ready = !list_empty(&mdev->pending_mbos);
> > +	spin_unlock_irqrestore(&mdev->list_lock, flags);
> > +
> > +	return ready;
> 
> It doesn't really matter if we take the lock where since we drop it
> right away.  The list_empty() doesn't anything that requires locking
> so far as I can see.

Right, but the problem is that we possibly might compare valid pointer
(list head itself) with the stale pointer (head->next and/or head->prev).
Also don't forget that for 8-byte pointers on some architectures it
might be the cross-boundary split (most likely won't happen with struct
list_head as it should be at least 8-byte aligned, but still).

> >  }

-- 
With Best Regards,
Andy Shevchenko


