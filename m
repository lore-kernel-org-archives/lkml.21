Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427394;
	b=rVaJvXcGiqwmvAYedB2ebKKnvDThtKblkbQAvM5/oEmZaFoYvbpNhXOSCbHmp7VyUFDy
	 kADALwOG25QrxTZEzzBnjkh7j2c5UE/gOdHTbbp+3ScFnwkBetHjksq5B5QustNFSroGc
	 LM64GBxyq26ZwPPdmqdw+lW7O9+zrs8wU8Icpd17UXk1Eb42p3YRNfg6PcExBg9OW9Gks
	 ySYTJC8Yu0q7MbhR10qDv7RvvnRG+5DwQtYnnr+lZRQYyT8xGgmp8mxqzyhrSZbgn4a32
	 ZqlPoTnxVIkwSS2CU2RY76i6RhMeR3obXlSixHEYSVmdAYcKVALH6ZWejo8Vuocf9OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427394;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RP6LvYm0puwEvofaCRDtWeyWBD/bWBKR5QnOIuN4Xuo=;
	b=5BoRUUqtdsKm2WbEoof+MK79MMauDmUJopqbJI8PgEMNTBvLC/xs8r7jMgnnYeLaYS6q
	 M/Qpuf9kbD2YlBrWmrTAus99apfX56qEoMCBAOxwXdOUCZ2eqJ3XRQD3OhWBBCdRAW68L
	 gqEC2/fL9LiK8lNG2ktHAZmWECMkJBcmk5Bs7Tcoc4kb0TzX3GluW41yrFYdn5+L8yn0M
	 g9lMKrRdQL1uRg0zMPtnVg1MFlxIM/2ycCc4GrWNnS/SLS84TUKeEosMemK+2fvD8Y3qd
	 AaRIK/c6pjISFMgZnMResSsdpSBzSJFSov02jzgnMMpcupEHU9AnKvlTEylizkXE63A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=VZ4wYpx8;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PEj51OM8;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A093606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A093606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm3 header.b=VZ4wYpx8;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PEj51OM8
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 18F977A05FD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:53 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 23 Nov 2026 04:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1795427392; x=
	1795513792; bh=RP6LvYm0puwEvofaCRDtWeyWBD/bWBKR5QnOIuN4Xuo=; b=V
	Z4wYpx80O2saokpkPxwEvw4lo1XAyj2Flj3O5lkt0TdBrIiZUanoa1WPcq3XImo6
	dMFM96jbD0SZwp07U1RnRVS6RksAfhFCpq+1VUn+s27ZgPjoTjk/2Ih7gnVDgtbd
	kNIGFd5Ham34Ykq+QkO6bKHbItvcyzHs+avfHZaCHFkuuYVobOYm7vdO2ZHpwcFA
	J8Q1/aWxU+BwTEPZuOu4O9QBhJZ9E/wklWjBihM6DlgXw+7XMLNGkd+9mR4aXmpk
	PlA+zpvGkeTDOYGjfT5jnLvyTw8AZoRPuihVJy4TS2hqZbScK7QURxdpG0268pHQ
	uzljkfUP13N38EhSNwjPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795427392; x=1795513792; bh=RP6LvYm0puwEvofaCRDtWeyWBD/bWBKR5Qn
	OIuN4Xuo=; b=PEj51OM8nCpXP52Qp9MlfUKSmoyXTvboYGBn969nEAxiA9WMDTG
	7YCCMtQZ/12ooMBBsfjiVJOAOeRQOTk4aflZeqLk7U+D1Jr9qeXhFOJ2fTEctkTQ
	Ks8PHPQzIQk5H4N7fNI1E6Ss71wo5lyjj9S3yjyFznvhyvimkW7FC3vPhraPWNyS
	iQ7SdhcgVMmMqlfAdOojWiQK/3Dr7inoLBS+sJkeIz6vGiNTG893q0qHYuFzq4BX
	2yXS9Oj17KskqkJ0TKQDj/DOlIZ9jYRl4z1jsYERtNZlDvNx0/c+cYMuptkQxxBl
	wOWh8PYrhQigRzxKuaXT7bBrEEpeuOfz1RA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795427392; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:f67kXMwCXnsGp3ZCYqSiPUb9jOmUSq920d71C42r1Jpr+k1
	8eE/NIae9b/DomyNLRW6YXYe3giSBqw3q0Si0hI+3POUjM305vn1Keqxw7pg5R3M
	rnHYSQA9jhqZao5QL09osYVCp1JLl3YATAGoywYhPFXNxhgLzJYU2XqAdVZY2ktH
	HQqDX2sAHuEpFSCLNQfZFW78BFqFJ69naZipG3r8BlJWGy9YeSNVxQCTRqrhOKdX
	AjGRkYX2dwnrJKLa7LnU4wpJ+H6NMF3yxRq86Rc+GNcP/gWWOSNm0Oa6F9x46IGZ
	iyhLG7Q2L9WCFVfe54vHSXTYhXqExx/92yvEw+A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:OYm5k5xNqG3+rmB/biIUe4l1LTzwi0GI/vgLNR1Nrss=:AoKBxveJ/OJ7nMgE6MarW5xA74kKQTDS+lmo/1LoWps=;
X-ME-Sender: <xms:QAwEa-zOjfFyOtJF7nbXOBVEhxHgU5G8soWJGMjraF5TnnBxMf-C3g>
    <xme:QAwEayCmo5OjPwlNJ5qfJwQgbzXPsycGxpuj8cxPiykzaAckuT74KSplP8RYw_o8U
    TRXZ-QpWLrYFm1mxIYtI3jZ4T7H-aNPh-0lh8VS6jnRY5vk3792eLEGdA>
X-ME-Received: <xmr:QAwEazb3zzPQCPDRFBp13PHUaY970SK9UCyV0l1GtAbldDpIh2AsXB8hfANUb1k3X0Y5ti-SvaT_BvbU9xlqEF-cfyPKHg>
X-ME-Proxy-Cause: dmFkZTFMqRzwj3b284LFxnPsyS4v148yms9U6/jTwddAleThSux0j2Hs8cfLcS/HRmcOJr
    +gZ6bTvvsKMB+MLKbamZYJo/IF9Mfg1pucX+gI7oEmIrszo2jCaKGXxRBGVW3/ow5Q46/D
    pHhlT03t5tk5ak66vEvARy4ZVZuRehwV1tVgnsu1VwcwvUWrE731o9O7cwbvcMRSsbIbsv
    +NpWNVSaFqsy6RWIMjahrSYTosh4VePdbs1jQ6B/KP0B+resbEUBKtDMokuc1AaipNCdqJ
    Yo+Yd6vAQBSH386Gk1PuhxmQk6n7Z4d940HtTsADUIZd1Mw791U0+VjU4V9rMf5wt0kZUp
    +m6c5GvxdsNwzKIjx8Ps1O7lNM6ZiJ82aQt8oqouc08LFSifmulx4bHw+Gs5+nevcd2lbN
    WbXCqRBMbHwHikGrF9NwHUNU4BRhVwYQMoO0+g3wPGQbowVYua7XJSAlvONIgxZ4LH9lsE
    6LaCR+QgMiDQHQfQ5x4vuc8JnQGfYoLxaQmQlJdAGWThF5nTDzFADLjxqymViMHEUr0B8/
    3ZkGzJvTYXzoO11dXpw7Q3RCNgKQp1KzsNEdOjBSrHonJMGaJ5nttEZ7Rizr8o5i6yLWU/
    C/3k2vm2LjKZfRknBRu8gQE8R49pDvZheOpch1wO5kod/vZsYTsgpZqf28vw
X-ME-Proxy: <xmx:QAwEayhHAKz6jMJfIUs-vjzqxDmtmZyxhepEcrsk0DLy9bgU1LiQ-w>
    <xmx:QAwEa95FvzKavNkRrmhLK39Em5X_a10Nkj6FvOlQGwyuEiYRf6q1cw>
    <xmx:QAwEax70DMRmB5Z3yhMow7xAhQvEcwsQXZ5LVpkLwBafTm3SxxAaAw>
    <xmx:QAwEa5fyaJpiygAs4cTXmKymaRy7rZa4bEDFfp4GFTqTPYyLWWInMw>
    <xmx:QAwEa-vmAaiO4xgkuUyQrdnPfK-M2AN5dgsvpVp9E0CFtdITDnPtPgWU>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 04:49:51 -0500 (EST)
Date: Mon, 23 Nov 2026 18:49:49 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] firewire: keep the request alive while the event is
 queued
Message-ID: <20261123094949.GA545623@sakamocchi.jp>
Mail-Followup-To: Yaohan Li <shunsheng1218@gmail.com>,
	linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20261119083205.3437874-1-shunsheng1218@gmail.com>
 <20261122123358.GA500423@sakamocchi.jp>
 <179540050657.417371.5230551399496711422@gmail.com>
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
In-Reply-To: <179540050657.417371.5230551399496711422@gmail.com>

Hi,

On Mon, Nov 23, 2026 at 10:21:46AM +0800, Yaohan Li wrote:
> Hi Takashi,
> 
> Yes. Both scenarios you describe are what this RFC is intended to cover.
> 
> The queued event has the handle in v[0] and a pointer into the fw_request
> payload in v[1]. dequeue_event() removes the event from the list under
> client->mutex, then drops the mutex and copies these two parts separately.
> FW_CDEV_IOC_SEND_RESPONSE can release the client resource once it is given a
> valid handle, without waiting for that copy to finish.
> 
> In the first scenario, another thread could observe the handle in the read
> buffer and issue the ioctl before the payload copy. In the second, if a
> speculative ioctl happens to hit the correct live handle, the resource may be
> released even while the event is still queued. Depending on the request
> state, that can release the fw_request holding the payload. An application
> that waits for read(2) to return before responding would not encounter this;
> both scenarios also require a registered address handler and an inbound
> request on the bus.
> 
> The event currently has no request reference of its own. The RFC gives it one
> with fw_request_get(), then drops it through free_event() after the event is
> consumed or discarded, independently of the client resource.
> 
> For testing I compiled core-cdev.c into a controlled KASAN test with a
> modeled request lifetime. Releasing the resource before dequeue_event()
> produced a use-after-free in _copy_to_user with the original code, but not
> with the patch. This tests the lifetime problem, not the exact two-thread
> read/ioctl interleaving on hardware. I do not have a FireWire controller to
> verify that timing.
> 
> Thanks,
> Yaohan

Indeed. The main cause of this issue is that the ownership of fw_request
is shared between the `inbound_transaction_event` and
`inbound_transaction_resource` structures. The latter owns the object and
is responsible for releasing it, while the former holds an indirect
reference to it.

```
                            fw_request   event   client_resource
========================= | ========== | ===== | ===============
fw_core_handle_request()        *
                                |
handle_request()                |          *           *
                                | <--------|           |
dequeue_event()                 |  access  v           |
                                |                      |
ioctl_send_response()           v <--------------------v
                                |  access (releasing in some cases)
                                : 
                                :
free_response_callback()        v
                            released (in the other cases)
```

This shared ownership works correctly as long as the lifetime of the event
is shorter than that of the client_resource. However, as reported, there
is an edge case in which this assumption does not hold.

The `fw_request` structure already supports reference counting [1], and
this patch leverages that functionality to properly manage the shared
ownership. This seems to be a reasonable solution to the issue.

However, as you may have already realized, this issue is highly unlikely
to occur and poses little risk in practice. IEEE 1394 is already a legacy
technology and is rarely supported in modern commercial enterprise
systems. It is used by relatively few users, primarily with legacy
consumer devices in desktop environments. Therefore, the potential attack
surface is quite limited.

I don't think this issue is particularly urgent, so I'd like to defer it
and focus on more critical issues for now. It might also be worth
exploring alternative approach in the meantime.

[1] 13a55d6bb15f ("firewire: core: use kref structure to maintain lifetime
of data for fw_request structure")


Thanks

Takashi Sakamoto
