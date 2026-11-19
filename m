Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795105208;
	b=GFF6gwPsZeQRxQIZX9POb4GFC9wstUxDmJdN2OVnwrJjnNK3jLXmbfxnUxcNqiEZ2hm+
	 V/BKV5q+i8lxoRnZ1cRn21Lj7Jk/KLrQi9etMNVXJh/rZ6Ss9bqgqrUNQWYbvz6StUPGi
	 j4MW8lxjNe50m5Apt5mk2uD4nddJEMxCkb0H+NFh7G6V2IZpxc+GD+LVuUaewsr4CX41e
	 AsOvEx8j99nIHkp1jVl9X1iAXANt6aSojWiE9H548dEoySndxn3MK0LhpJdx1+Ahq+iPp
	 vr+6zJWNJNHn2GgJgbUcjTeQdZAJMjp54WikcLfv9EfK1DGrEujdU4+nU+bv+kxdXYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105208;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=RVJh2xVangVJBwzgstXkIQAK+55cvVoeAY88H9/9n10=;
	b=lvRKUhnVxmwYi/oND+50z9Pb7ALNP+hWaRwfsmk+rhFLIh8glk0YS2mOPhXncjMOzUpX
	 sdA9lnIWrqqkArU7iu+SK7yC+5uuIjz3vG+FYEQ9iF6YGvdJs7DCPhU628/9i2M/V+CI6
	 aUNEjds3H2C1Y3/gcS730PSMVH24PuuYQP1nJNR64YqNAxoNtoi1wwWrsAUAUWtzI1dLH
	 Z+BYKcijrHBiCqnZVIY1mcntoMe78J1LAEXAI3DNu/bJMZKcN/nbwMWgwQxZGaVPfAf2N
	 JDZtvtjms/Vlof6cC7HST31O11y1f7kJ7kP/JWBpqg1jysF6Wrh3mfFiorHebd00ErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="S5/M99cJ";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1D606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF1D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=S5/M99cJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 763071A171E;
	Thu, 19 Nov 2026 16:20:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A8A35FF9A;
	Thu, 19 Nov 2026 16:20:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F6B111BC0CC9;
	Thu, 19 Nov 2026 17:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795105201; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RVJh2xVangVJBwzgstXkIQAK+55cvVoeAY88H9/9n10=;
	b=S5/M99cJq76gM4lfm4/KPAMwaNOLURrsn2xn37PPMLNQZlgjLOkklLJybB0ViQb0dhjVmm
	v6sEH4ba/M5lP7Z5V8WRm0hqdSep+bhZQaSsNlV6LmgbK6vxsYZ2st+zPhDSu6t9VuMlME
	iNLKGw0p8yfT9Qi0/yrOsQXkfvjjr6w/SvVEN1ZKbfZa5bN+C2e9/GvsNwQpuZCLfjQKum
	1o/6ZRq8CL9rvUL7wr8YzV54kYf/a+AjPTMop96yu0d9YQMY6F7B9iDUQu+iQ13TchXMjs
	SJMngqnF8KXW3sqwtDFhFKhRNgzDMNKGEa04cZCGkY2iSW4nZt8EykBUeO3UOg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 17:19:57 +0100
Message-Id: <DMZBON30TWI8.1KLN28QJP6TNN@bootlin.com>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, "Russell King" <linux@armlinux.org.uk>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Paolo Valerio"
 <pvalerio@redhat.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Nicolai Buchwitz" <nb@tipi-net.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH net-next v7 2/3] net: macb: implement
 ethtool_ops.get|set_channels()
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261118-macb-set-channels-v7-0-2dbc00f686af@bootlin.com>
 <20261118-macb-set-channels-v7-2-2dbc00f686af@bootlin.com>
 <cc50263bc4f161b2fff96e04306868cc@tipi-net.de>
In-Reply-To: <cc50263bc4f161b2fff96e04306868cc@tipi-net.de>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Nov 19, 2026 at 12:54 PM CET, Nicolai Buchwitz wrote:
> On 18.11.2026 21:53, Th=C3=A9o Lebrun wrote:
>> +	if (new_ctx) {
>> +		old_ctx =3D bp->ctx;
>> +		WRITE_ONCE(bp->ctx, new_ctx);
>> +		wmb(); /* ensure IRQ enabled below read the new context */
>> +
>> +		macb_init_buffers(bp);
>> +
>> +		/* Clear DQL (only on successful context swap). */
>> +		for (q =3D 0; q < bp->ctx->num_queues; ++q)
>> +			netdev_tx_reset_queue(netdev_get_tx_queue(bp->netdev,
>> +								  q));
>> +	}
>
> The queues we just dropped never get their BQL reset, not on close or
> open either. So after shrinking and growing again they can stay stuck.

Good catch.

> Maybe just reset all max_num_queues here and in macb_close()?

That's the safe solution, agreed.

>> +	ret =3D netif_set_real_num_queues(bp->netdev, num_queues, num_queues);
>> +	if (ret) {
>> +		if (running) {
>> +			macb_free(new_ctx);
>> +			kfree(new_ctx);
>> +			macb_context_swap_end(bp, NULL);
>
> swap_start() cleared TE, so HW is back at the ring start. Doesn't this
> needs a gem_shuffle_tx_rings() like link_up does, otherwise Tx stalls?

Argh! I had missed (or forgotten) this implicit behavior when clearing
the TE bit of NCR. Yes gem_shuffle_tx_rings() is meant for that.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

