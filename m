Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505352;
	b=tAn1DcfcohvcilnyRNfdhaQFxmR92kgPrni+IR1q5tSrMmAOckM9YKTP3rpabbKkw9qq
	 mdlLWMoRSI/GJDK1Dd0KQluW2na/T7pnjWJsNIouhO89ogWzOAc69moegAxx7NwGWmRq8
	 z//8eQ1E+SM1Qzz27ZonPGOL3kciL/alakxm1VGlbTaMhIQoeNaX5fc1SVN0YcYuk8GRA
	 b/cc9p2EpdAqy2katu9zXKb3l4Zk3ccwmd5tQ0zu8mziTc6P/4J+/LqthfjGrdK1luNo9
	 7kbxj0uc69xn9AbsXVBrKaeQcYwSvmPm+9K0+sd9bf3CmQgJxcMOi5Luoow+i7GETBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505352;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=esZNovM+7BsKIkOgQbO6jVQR/Vy1u5osIislMZksrqk=;
	b=vJT/8iuhcs3J+sN465/btwVNYJclsnL5bfhflzu9UmpjSfMZbIU+EEWIf8HfIJXCWMFM
	 6C/PC75Erw6ZWs8TGec2d+aia/1EHnbk9H1Dmy5LC3H49PgvtwjgiUJoZ0Mot3BbOa0Ge
	 h3ID42zWBvO8iBDf/fbPwZm2QjedO/SFtTMxUXh0xVQ+6uxWWyQAQ00XX3N/7tVCLTOFf
	 zeXHhZAwzhvDmWuHGfD+WC7tFynJjDyV4e/FWQ2GkmMaY/xNwyKE+9bZ+iu7T9Yt0tYdi
	 SCeD0GP0j4yr7xLMwgGE96sXtGrR1+eUdkK4cFI8IaqGwWHZVl8ZsvFpyitGiqo9FMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yq2WRWBv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A482606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yq2WRWBv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F2A1F000E6;
	Tue, 24 Nov 2026 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795505352;
	bh=esZNovM+7BsKIkOgQbO6jVQR/Vy1u5osIislMZksrqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yq2WRWBvXYA/Rn4jqWP7KiWpEHd80X1wn5ZRJbH+mn6xt3OeRxzGUxaZ+62DPo8Xp
	 WfXSnOREukhBYo6Ci7jD0oYvn6Nt7kDSzrY9UFrFqMh1hguO3BakoOJpU2kvQKndmD
	 Y0AcRCAAwMKmJ0hZtVWmipmOCRrUwK08yuW0zWoL5SYnCd43O8tei0dORzizmSkbdl
	 ouZk2yY5Kq1zWmUn4otec90qSeAnNbm6wWGW4Q6NNQ3s2j9rHrXraQj8o99J0t/tZZ
	 TBoi/WZKhrhlJLptn9QJFmxc/6rbO0Wrx59huLd65PwX1GIBYo5T17vUTdsyBz5a5C
	 e9OHgy2RZRolg==
Received: from johan by xi.lan with local (Exim 4.100.1)
	(envelope-from <johan@kernel.org>)
	id 1xVkxi-00000007yKa-066O;
	Tue, 24 Nov 2026 08:29:10 +0100
Date: Tue, 24 Nov 2026 08:29:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Norman Herms <dockseed@proton.me>
Cc: "lgs201920130244@gmail.com" <lgs201920130244@gmail.com>,
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"linux+etnaviv@armlinux.org.uk" <linux+etnaviv@armlinux.org.uk>,
	"christian.gmeiner@gmail.com" <christian.gmeiner@gmail.com>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/etnaviv: fix runtime PM cleanup during teardown
Message-ID: <awU8xkTrwuJyKJbA@hovoldconsulting.com>
References: <bKXiGbjWVw6RVBUFNVHEum6OPpzcYgrpzQTNKG2mnqCes5jzQJiN7BGGbNyJBjsS6UVFLV7wz3dFm7R8vaJoplZn1FI8WjOgk7Vg3WSuwBI=@proton.me>
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
In-Reply-To: <bKXiGbjWVw6RVBUFNVHEum6OPpzcYgrpzQTNKG2mnqCes5jzQJiN7BGGbNyJBjsS6UVFLV7wz3dFm7R8vaJoplZn1FI8WjOgk7Vg3WSuwBI=@proton.me>

On Mon, Nov 23, 2026 at 05:10:39PM +0000, Norman Herms wrote:
> In reply to
> https://lore.kernel.org/all/aoQZ3zhnyRuiHJlF@hovoldconsulting.com/

> For the remove hunk this is more than a cleanup: without it the GPU
> clocks stay enabled after unbind.
> 
> __device_release_driver() resumes the device and calls
> pm_runtime_put_sync() before ->remove(). With the 200 ms autosuspend
> set up in etnaviv_gpu_platform_probe(), that put only arms the timer,
> and pm_runtime_disable() in etnaviv_gpu_platform_remove() cancels it,
> so etnaviv_gpu_rpm_suspend() never runs.
> 
> To reproduce, read clk_enable_count of the "reg", "bus" and "core"
> clocks in debugfs after each "rmmod etnaviv; modprobe etnaviv" round.
> On an Allwinner A733 (NPU on etnaviv with local patches) they went
> 1, 2, 3 over three rounds; with this patch they stayed at 0. I have
> not looked at the probe hunk.

I don't doubt that there may be bugs in this driver but the patch in
question is still wrong as any reference held by user space is not an
issue.

The driver should make sure the hardware is in a defined state at remove
by explicitly resuming the device before disabling the clocks (many
drivers get it wrong).

Johan
