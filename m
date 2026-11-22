Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350844;
	b=O2hCb9//kpOAo1qtr0InUOIZE4hoNPCWt7S3XRzS4f6IaVvb0Qfu+TuR3m1qy0o3TolV
	 SGGYDjbWYZhuGQKxvsmozBBiDDa3lx3Ef94PtmSUKf4wLkgBrAL0YreTljW0cPcckwzAJ
	 lkaZP+oLGscFSFFCnQ6JQqkvvpKjX2+3oB6yCBvdMiQkzgLhjFmmp182FCcu28TC5UpH3
	 sn13/VP72YMfGt22Dgad7+UILRTq6hKegDj8XO4CtZjVZDCspZszZZzKHNugZV3jhHTEh
	 TN8GTRRrj2qpBDGeITOwiEBjrEVMBR30yF+bb3xBouYinqjdq+4T0y/DEqPN+46fG9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350844;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6yUr19shCKVUrcIp+vJdu1Q3d/+vurtj2XGFw6UpVD8=;
	b=KnQl8NV7Z7isp2D1jYwC5P3D7J8jbiBkOvvHFy6obcDCfy3aRnENc8jeyB2bC0B6uhAj
	 0hHGnXH79WvhW6CSqjWrG4SgheRNDfec2mN1qLTUNOaf2jfyYJpnAYk5SJhw0SN2mT1To
	 pJPgEBFqa6c6w8bJFAaf5e1PZ7uSxBsipsGOdPuWEPL95pj/KRdwdJOCszXzHjS3aCceH
	 Wf1CNmUTMx7O8O3/BU79gzRvwBjtzJnPJoL5LuPWa5WIskxACSvmNowOQES0GGYCmVTNz
	 rZtOzq3ZiIasZP/ak0mspR3afgC3hY2YU2WRCZVA2bR9zMJxke8xg973KJ0+4X1mCAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=SNMV+FE0;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mXmIt+Lx;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0C3606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0C3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=SNMV+FE0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mXmIt+Lx
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 323C91D00504
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 07:34:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 22 Nov 2026 07:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795350841; x=
	1795437241; bh=6yUr19shCKVUrcIp+vJdu1Q3d/+vurtj2XGFw6UpVD8=; b=S
	NMV+FE0WnMWklb2a4YFSd8fayobP0QZAz+yK+D+P6wRMia+M5BR4x45ml0JVkDbR
	EnWiBRHnqrxrT4lfZvgbJdeWoQA+o6fSae+9UI5BGkxsDRTnWNput5uEe3zaDSY7
	gWzlZMdiZ51RSjyNvP9oDvANcY7v8ihk+Asyr6J7ou94nChFJ7TMRONw9nLiOoBW
	Ki3cInyN/VNPo5GiRZl3TWGJeDCjSWir93y3PJLBPwGWyHbqTCJPJ1QnBeV3o940
	kZCNESpA+ZnPj+FvI+BDrP7tMABKNGXwnqoJQnfhfQzVqwqf+3nhXqBiRs6vqdPb
	Pe8MA2dKxzrPBVk8IJ7KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795350841; x=1795437241; bh=6yUr19shCKVUrcIp+vJdu1Q3d/+vurtj2XG
	Fw6UpVD8=; b=mXmIt+Lx6FbMFBqRgVzC25FH2aqa7gWHuCest3PYr4DQS+G9mj0
	dukomyeYTyyCnGtaXHZq8a4Xg/lkUPRtJGB+fDRDar4YxCFQnO8lKDnSFn8UiTu8
	0b+PCtOws1RhWsFQaPF4nh8BJwTDq9RZw/JGwzXA6yE3+L9e0p9PhTzPBWKNb2It
	f+NIPbOyCTuX9QURpBPc8gpwfsn632UzKWOc2Duj4SCZlbOCrPb8pWydYjZIVZ9B
	/vEsKhXdo2Mr9HfRcp0sdYVwzPSnsG4mqTPKji4lRUYlaNbWZnS/l0liB4PF3gEV
	7Lqpngvy+Vabu7IKLW+t68YBU01Rkoa9ROA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795350841; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:C5XeIwuVTkO+kjG+JUzo20CR4reHdT1EqN+qag2ZXrdLJq5
	7E9D7J9AUIDeAzKrK3opozIKshr02MzeGQOuNUryajpIRv/TO0y0VzKeaXXaMcJM
	rcYyvvWKp0+aXFVnq2kdXel+J2jKGtpuPt1lXryqv1pGtPEpMJuX1vo1cdK4J+HX
	6gPhH8HuEbwOeWoQ5y3ZRsSbvMyT3B+lJTQp2AZ2svRF0j4CV5AEOizUpEVwckmY
	DszAsAtgsskPAeoMGGahbm2pXuRleDti3LWjSl35HQfS2mDRNTYU2+fzobNQHqFA
	sfc4RoqEjng/nnOwrEI0xRMFfXvV57/JNLnr/XQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:Ms4JPe7+zLsQKZS409DKOuKITnc4A7gCrTBt9NjDqa4=:oGGvJDZCyOYkoa7I/viR8Ke8Kj7hG/YER0JGa4jXSQI=;
X-ME-Sender: <xms:OeECa6IGWiMitsIW2BpXYuEsXX77ag3xJOWFZg29GJLi6mT7-4iWRA>
    <xme:OeECa57ibHHDfUWJFqSShKm5zKYufatk_kDmHEs8Xr9vKfFOq5Dt_JnK2YesbKmiC
    fuuH6ln_YKnSKoV915fUwQsJaGrdc7STGybLZNzSZEtMeUg_AWJmkAD>
X-ME-Received: <xmr:OeECa9zs_3bf3BsItUvEkun9D7d0wKm4G5a3jZJJLFdTeOxVCRn6STiP81NT9oLeQc_hPypSodg-o6a2JwPoltaH4RV-Yg>
X-ME-Proxy-Cause: dmFkZTGn86IvMXStrlVTUlT705FmD1/oY+OanFQWwewde3umHitFDEwaWXJsVVJOt6m0wg
    /7vijdvSt4j70DDiqBHnUPRjnI5ZiMkoVo8PZpZ+xEttR1DD7e4UQmcVAQy3l4Xup5bCjs
    cpjJTLpdw0R608Z0BlvJXuv35qE8JFhh/FXbQsBklTPbqLGgiyBBywSaLKJ1rPiB0AJbEo
    JuvGML55uBd/bbN8ZeXGTjJ6fnAIbcIMyjFHG4qKskQhUPA/vKK5FRtYdLcZFAPt50XNel
    g970ykSB/DL7pzbN7W0wyo8L/mXiXut9GdKpiCPCDmTBEgvx14dq9hXiZuO8/4M4W7PFoi
    V+8NZYzfB/vNnttV0JD9nyYlRQduiJHBr2x12wg3LqzPMmj/Zf11B2IFva+n1GhC13sZA0
    Ga6P5MX67XhP4xyAv1nXCo/oxnFgTGG/3ItfYltlRfmKnxMTqIZiLm2spDZeA+L0iph1r0
    cCCryrY7ewEfa4uR6SiWRmYtO0Bs8r5JC3QapCFH993P6c5ywZIJN/tqh5Jlp3SXbdXOYZ
    qL7vw2pnFdlsYKHo0QOzIJWXv6wPBkND1hcMCZmHEb6rKUCcGVDg9UYrJmuEtBeyVqu8XH
    dWpV7QezHMUqB30kHSQ1grbfeGcqtVCHrhrNG66NmmEpHRbcSblKj32Zw+jg
X-ME-Proxy: <xmx:OeECa9YCJ8fH5s-Nn3ZNHDx9j6OW-XogfG7SN93JR2182Z8hKH2j5g>
    <xmx:OeECa_SCQ3dPFDp0OAVq8IB-OIAb0ZN27OBNNmkByq6VZ_SWIgG6aw>
    <xmx:OeECa3y6hCPD01qOxB-r8svtuq95whwXxn9lMk_wSW6aFqVbnF5MaA>
    <xmx:OeECa53cSD_EKMfknmvxqnspIpM1pzcd9tPj66v31j2J_TmwLlcw1A>
    <xmx:OeECa1lIgxlx5dpelrv3s3b2WcpDURFJvOmynPqyU43P5S-Ihtv0Gghp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 22 Nov 2026 07:34:00 -0500 (EST)
Date: Sun, 22 Nov 2026 21:33:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] firewire: keep the request alive while the event is
 queued
Message-ID: <20261122123358.GA500423@sakamocchi.jp>
Mail-Followup-To: Yaohan Li <shunsheng1218@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20261119083205.3437874-1-shunsheng1218@gmail.com>
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
In-Reply-To: <20261119083205.3437874-1-shunsheng1218@gmail.com>

Hi,

Thanks for the patch. However, I'm not convinced that I understand what
problem it is intended to address.

On Thu, Nov 19, 2026 at 04:32:05PM +0800, Yaohan Li wrote:
> handle_request() builds an event whose payload points into the
> fw_request that carries the packet.  The reference that keeps that
> request alive belongs to the client resource, which can be released
> from another thread with FW_CDEV_IOC_SEND_RESPONSE as soon as the event
> header, including the handle, has been copied to userspace.
> 
> dequeue_event() copies the header and the payload with two separate
> copy_to_user() calls, so the request can be freed between them and the
> payload copy then reads freed memory.  The same happens for an event
> that is still on the client list when the request is released.
> 
> Let the event hold its own reference to the request and release it in
> the event destructor, which the three paths that free an event now use.
> The other event types are allocated with kzalloc_obj() so that the new
> release hook is NULL for them.
> 
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> 
> ---
> (snip)
> ---
>  drivers/firewire/core-cdev.c | 44 ++++++++++++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 9 deletions(-)

In the UAPI design of this subsystem, FW_CDEV_IOC_SEND_RESPONSE works
correctly as long as its argument, struct fw_cdev_send_response.handle,
contains the correct handle for the target client resource.

The client resource is allocated in handle_request(), which queues a
struct fw_cdev_event_request{,2,3} event containing the handle. Once a
userspace application retrieves this event through read(2), it can proceed
to issue the FW_CDEV_IOC_SEND_RESPONSE ioctl(2).

At first glance, I see little opportunity for a well-behaved application
to issue FW_CDEV_IOC_SEND_RESPONSE between the two copy_to_user() calls.

However, I can imagine two ways to trigger this situation:

* Busy-polling the memory region used by read(2) and immediately issuing the
  ioctl when the event data becomes visible, before the second
  copy_to_user() is executed.
* Repeatedly issuing FW_CDEV_IOC_SEND_RESPONSE speculatively with
  arbitrary handle values.

In both cases, an address handler must be allocated in advance, and
another node (or application) on the IEEE 1394 bus must send an
asynchronous request to that address region.

Is the patch intended to address this scenario?


Thanks

Takashi Sakamoto
