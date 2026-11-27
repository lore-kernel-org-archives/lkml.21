Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795766521;
	b=APSvRzKvM8sNwC0DC1YsrjsmPpSl1ZePkmJlNAtlPQcEdt7Ca6BCXIxCoL1c+pdMVs6c
	 5YMuksAkjoLuWpFC4v6PDPsOcNd7BWhhIQegOfWVvIFPHLM9WKT8FeTrAd3kcWPV+xigg
	 F/u/bgy0kwDVqOKzCNx6AMWG5aPUT4f4QpoUKFwEcMi99UcWfVSephpB4FHjfKQ9mRdUx
	 TMcpXD7rdPm2pJSP3LDKXKOp1V9Yh0LRLaZ+mwnJvxzdGQcSrMahqiQ1mupx/LZG14LYY
	 lXSXFLHZOOvxyBUgz3TNaDlaHigcqS/y+WtttZH7aEyVjeet4SnV4O+e1FWJ7hy6CCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795766521;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=n6yCFJ0DJehkqwL4DbJKbCSqzSU0VAJQIWHMvsNJQnY=;
	b=WDMTfmha5iNSLpaCAlV3XG1Gs11a3ykYcLbFE4O99kRQJk/U4ZaHXQwrIjHHRv8Fo5ag
	 lYY4lVj8ezsLDAKxkKD2/bo2rdsQimpnIgesWOAqmScFKYbQHDz83AkGJ1dmLLMQQ0Gw2
	 M2o17cpMRkT8SH18zPZPww0a7bnsvpiuBUvKlzYSlhUmj+5aj4XRYoxpAoh2LEHzRi14/
	 a4Xdfz28gH8GVinYhiHVzEEEs8O4k6oxMKSaSA36l3J60D9saYdqVbEXqYuMBmmffyWsR
	 NhrdU4CNivt/Ccu6voISSN3eMbdv5rrUbml8EbftCmAPHGj3T9DirouDdtFBRz9qgTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UhDJ7teg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB831606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UhDJ7teg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987A71F0089B;
	Fri, 27 Nov 2026 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795766521;
	bh=n6yCFJ0DJehkqwL4DbJKbCSqzSU0VAJQIWHMvsNJQnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UhDJ7tegdtjxrbmkdkgqB+jF+pmvGcU1bqMlH5KQGc1col+rtMZCXKHZykX1dRFUV
	 KCy/rY7rOXmL6eTGrD6kZNCOjSoRhAr9sZ3cgja5mXymxQuetn9gRA1icAP5J6iOJq
	 KNRqNAmLxLreH0q7ISbvFqPtm3l4HI+q3aqA340k=
Date: Fri, 27 Nov 2026 09:01:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiayi Zhang <zhangjiayi1014@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Farhad Alemi <farhad.alemi@berkeley.edu>,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
	syzbot+e6bea924b5ee24f7cb98@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] greybus: svc_watchdog: initialize reset_work only once
Message-ID: <2026112758-rosy-elastic-d3d7@gregkh>
References: <20261127075243.3413794-1-zhangjiayi1014@gmail.com>
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
In-Reply-To: <20261127075243.3413794-1-zhangjiayi1014@gmail.com>

On Fri, Nov 27, 2026 at 07:52:43AM +0000, Jiayi Zhang wrote:
> reset_work is a file-scope delayed work shared by all SVC watchdogs, but
> do_work() calls INIT_DELAYED_WORK() on it every time a ping fails, right
> before scheduling it to run half a second later. With two host devices,
> the watchdog of the second SVC can see its ping fail while the work
> scheduled by the first one is still pending. INIT_DELAYED_WORK() then
> reinitializes a timer that is still enqueued, and debugobjects reports:
> 
>   greybus 1-svc: Resetting the greybus network, watch out!!!
>   greybus 2-svc: Resetting the greybus network, watch out!!!
>   ODEBUG: init active (active state 0) object: ffffffff9bda1f68 object type: timer_list hint: greybus_reset+0x0/0x50
>   WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0
>   Workqueue: events do_work
>   Call Trace:
>    __debug_object_init
>    timer_init_key
>    do_work drivers/greybus/svc_watchdog.c:92
>    process_one_work

Cool, how are you running this?  What fake devices do you have where you
have two svc hosts?

thanks,

greg k-h
