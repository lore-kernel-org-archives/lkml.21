Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465544;
	b=UDEFXUND0UpgsbflZk9Jq2as3EixkjgvY+fmxq3MJgz3exBDIKsgmwMDtmeaf3VX9C6F
	 IrVyLwjPLjyTGw4BQeIIYhxm3aKgOcGk5smOpg0q6agzW89dFfDgo5AbioHzKkWMuLMWe
	 oeQ1P5J8ZhZ2yS6hrJepZt49tuqLiMZ1ZKMaRgpRqd+5/cLZoFEfxXSwXy2cRnlTVs5QM
	 PhRnnXupPxL099rDDM67XxDPMbvcI7eIy+OpPAvJLy+03pAzbXhZ2KkSQHxGdqrTH0KqA
	 Hu7a0dWo27FsmrIwvIwN3vVjkyDQguNaEpAB+8th3i1VeHLCUTBEyIGY3gQUKDvyYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=htaRIjRweiLZjcs4Tzl0zEgyIU7UNaepRLCTi+oWXpM=;
	b=psZFRKNbW5BO3djTuE5TA4jY72QjOqJrnDAsZh7vLnzLLoyHiytTB8Vdr3d79zUJ1o2U
	 8rzaDS1/ZK6NldGtyLaj15gu3p7DMlld5PhZbm0TEKyV6vS68+F5y6N2VeEQlI956Wmxw
	 VorYSapRW+g4vt+UlKfzbU8BWQDd1MdmFDvPy73pwmMTmliwQRXRh/1TK/DFrqMPROKU9
	 qh6TAxk+ipbxke1El7Nvw/D5CfNCDRnK/xeEPwMIwjQzu886kPTaYgmnNgLGAJIIE8oLD
	 aXwiv5+3uNHuVag/X+mrpoZlgCL0B1c60fbkf0HCA80hUyIMyxVUxlimu1jTe2L/XUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGoQEP38;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14BC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14BC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGoQEP38
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-385d8a00598so5213892eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795465543; x=1796070343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=htaRIjRweiLZjcs4Tzl0zEgyIU7UNaepRLCTi+oWXpM=;
        b=LGoQEP38QC3mznKKpYLgQAySy0alTcR0n0d7eNlMT3FTZ1BpQLcmGokdl0DN0D4DEi
         47ol5mg9dX4fE+VZWjDPKzH2w00w48XuQmGfvKWD30EwXq4wBxe2OswhF+w8cYXN8Yvh
         GXWkJ4OuH/HOLmkq91vhcZdPy2oROb6p1SQsZzZC49xdJZVUd0doiVxlS2wNVTRB1Zf1
         swaGUIsQ4cEvd35wpIMB3iECKpLwpiSKr8ymAleMNompx+7dgzkqhjVtbNdU7D1+KLbS
         4UqVK2cEA/Gnqkl6pXK7FD3rEANBEflkhlpTtkxAXmeEQWmOIp72hjpMQ1KC9MFWoxje
         HGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465543; x=1796070343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htaRIjRweiLZjcs4Tzl0zEgyIU7UNaepRLCTi+oWXpM=;
        b=wwUWhANQclXcvn2mZ8izg19KBc1qI8EK9uEdTGPof6uuhChO3gEWVj0fXLuczKSzWP
         rEN/7Pg5AJf4siiwDeR2K2wA7gwlzUIMuHz2mU4hw+4jSqCEFvX6J7k1zaYo7z+C/pnM
         Wd3yFYLwC6GLaZED67fInvHvuPH0RYLT6KHAaaZU0ub6KSXNE+c7e3rilj8P7sO7Y26X
         jsQNqj1wEDc/9dPPClo+e3tNm/gxZjK5sXPSTDtqXDjcUFO8mFySXvU4P3QiYjnABtip
         tAbiIP6CbLCO8NdlinUT+/KI23YqIE3ejYZkIOYBNy2WSJEvINTX9QmxKsvtwzj+1DKH
         I4GQ==
X-Forwarded-Encrypted: i=1; AL+hErEAo7cRsnM2I6y1GCp7EG3iErYJooB+00OZ2huwcfrqAo1F1MRs9my3PXHGrXuwywHRwEV3GqaveX3/p8k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P7GxqP6O0tHGHQvYGhLtgpRljQh8xLFDw1kSKlhsYok2ovGT/
	TTlhQ7XGOD//NR5m89qW3XcGmfHYldj6ZSRxLXXQvdmYNYzsSCejG2oc
X-Gm-Gg: AZFdTZeDO7amb5o/WYGDPgkHT9ymO+0dZhsRF38Ck9E3M9Z5SLrIsEgD/v9sYoH+AEf
	eW4y9V6yzIkg7FIA0t4q5mzFZN76il+ZHcqdA6QAbdYCosqGcedfdXhip75rBi+tKcPUDvKATX3
	OFNrAc+HjJ9GP0aBAdoIVBATc0LnRnxV8xx1kRopsvjE6jOmxanPb9nX1Xhw3CM/i/6QT+qDRfk
	0ix+xkyPa4eLbVj1QFTbzRPPeJjG+eItZfHNyJsuusilM4tQPVJ1G03GYT4Wq6KyPs6x84Ya7E1
	v218PegMB19W8x90U35zVyrnH4rWgErdvrAgsQsWA0yG7G2NLyQMJ8j91KWTx91uVwXYK5Um5I6
	rwlfyToc9iDKWUM+Fd5XwNs84pAViNYpMjIBzk1VCRcac12fpfI0uijB6uEOUxR028FGsMQx07f
	h8TPR5RDHMq9tEprXusq4P4u1goCP+R5dI7E+t1O3surpeMZnpOkDB7nEacAC6DE02bz7LCN8Pr
	85Rb+pIdcwGc+KtoZrBaC7w+y5qwE3/g8st4MRELVQHS3q8eeu5uFkdELeAD9XkmmU/oQAE8TIz
	x/QTowrWlXDAwuiRypsdOn+aLz5D/zXkdHE+xdlgLYaa27BGhYtflej1Bj4b4QKallaQr74LmmV
	AfDTwtEOMTy9EZwHI
X-Received: by 2002:a05:7301:211a:b0:373:5561:8d06 with SMTP id 5a478bee46e88-38570c36e7cmr11463927eec.37.1795465542635;
        Mon, 23 Nov 2026 12:25:42 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm46389898eec.11.2026.11.23.12.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:25:40 -0800 (PST)
Date: Mon, 23 Nov 2026 12:25:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 09/10] Input: pinephone-keyboard - request IRQ before
 registering input device
Message-ID: <awShPfjuvVjlw-Kj@google.com>
References: <20261123183200.3900004-1-lee@kernel.org>
 <20261123183200.3900004-10-lee@kernel.org>
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
In-Reply-To: <20261123183200.3900004-10-lee@kernel.org>

On Mon, Nov 23, 2026 at 06:31:15PM +0000, Lee Jones wrote:
> ppkb_probe() registers ppkb->input before installing its threaded
> interrupt handler with devm_request_threaded_irq().
> 
> As soon as input_register_device() exposes the keyboard (including
> synchronous open by the console keyboard handler), ppkb_open() enables
> matrix scanning.  If a key is held during this window, the controller
> asserts its level-triggered interrupt line before the handler is
> registered, causing the kernel to disable the unhandled IRQ.  In
> addition, devres unwinds in reverse order on unbind, freeing the IRQ
> handler before input unregistration invokes ppkb_close() to disable
> scanning.
> 
> Request the threaded IRQ before calling input_register_device() so the
> handler is in place before scanning can be enabled and outlives input
> unregistration on teardown.
> 
> Fixes: 17406967ec0f ("Input: pinephone-keyboard - add PinePhone keyboard driver")
> Closes: https://sashiko.dev/#/bug/linux-f24d8390-cd48-42d7-a3ea-c075b69c127a
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Applied, thank you.

-- 
Dmitry
