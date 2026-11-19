Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132499;
	b=pBm0qmBVRrAPowcci12e7gjmxSi1cL4vEWYC6TLmjIKgL+OH1/aCN5pKPNNYm3JGCR8N
	 XTb7uMMB49sQTl+CKa8zT00wttbAubB/qy/mxdQJqpWVxxnM5HZyU9uCBMccydSw+VoEZ
	 QGc5s9/zwpo8y6tzn3m0FldeKcRcamlq/nYjS+3Rvg+6qOuVv4+A7h0CZJFabmjWEdz+r
	 X+pIVhUJlpy9UKC57l3JhGyQTSs8gTQJkRVpwDSjT2PF2FXusTnkKSmDA4tNJkxrzcTKD
	 MSkISv2AeroCrs7SH84kx645eHoVwOiLbOId6H+DZFSKU+192JQbMEI1ITbSi1wgnAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vpKYq578G04A3WM0cJAbU/S0OPZrYtevhMMdamxq/+U=;
	b=d58Djvg2hP6JZYuhbiPgN/SvXbT+vM4W7MLzREgry8flsrNmm/n1StJNfjkKcYkHfl4u
	 a/TVhZAxlneh6BSWawnUCgxwQvs+tHuKEDnkTI8Y0gj0Y2AE2N8fdB+ofwZiS9wy1dKIo
	 07zfpLn6yRQhGV2qDUJAU78gd3rUILmwCufLtleN0wzct7CT+I8O6GuJN+P99Evge85KH
	 DEtKdK55OrjZbK7QMNuwjigl3z8c6q1qPtEtnxfTTpWzm6nu75b5GrKJPjlb8oCCZ1HDQ
	 RvC9AFoU3UFMpXWvr9DGSLO6YWh6z9ZLS4bunTEks11Jp2g4269uU0ZwDaR+yNB1QBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hym66DEA;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EEA606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EEA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hym66DEA
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so218727a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795132499; x=1795737299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpKYq578G04A3WM0cJAbU/S0OPZrYtevhMMdamxq/+U=;
        b=Hym66DEAciaXFZ66cS0Tt0ahcKQ8XfnTn/0NB0TpPgyLF49Sg6Eh9L4jh8BKsMeb9a
         PDq8oS40pDOG7ABwA+kntERnIkVvuDxv7s92M/04USQiISi6FhSlcQAybQuYYySmmvI3
         zkMj2dcwJeKJwyNoGJbiF2zLD6Y90FScEOoE2SlPBXpYsM2fD1nnTZ+9SwpRsswyFhek
         6LDC0DHPz0XYaPuaXyUK4IYfAddyIMVkvdTHm9IfZNtc8Y7Jg0hgefK64C4hSKtpRq69
         VM7yBytDkltGFrCnMudo1e4zmSdVTEisW4IHOV/hkslvnoXOZofdRa9CyRdffw1lEm7M
         6Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132499; x=1795737299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpKYq578G04A3WM0cJAbU/S0OPZrYtevhMMdamxq/+U=;
        b=eGC2M2GMqU0UdMHqkOrYY73hcsRDvmDi1U9fxd9Is9yjYlF9ftb7I4nv/QfSwBr63q
         TsdqW7LUIB86pswy1mJLqDt6s4xQyegs7920IOGgRs2fvS6htq+Oh9jNxxGPlGYwLWaR
         r5i23/gdLvu3qWoH6fZq/JXPRcfjyoKEIYdbiJPAjXVzpKA8YnisFWKGXNhR9EPrDyvB
         jIrEkwWTOy8XWT5DQ0jSyizdQSu29AepxBOiX1lZZ0mGMoXQk4f7wTA2FtMmENpQGHZQ
         phXptpsAmhJKUd8Dgrh0Yy2USYnc0ajvFfbTsOzMcNeMCTPO2Gm7eIFf2nkBlpp/oBgw
         +Ibw==
X-Forwarded-Encrypted: i=1; AL+hErGPXPP2+1gUR8rP+hvT/1xUZKrGzULqLp1b48l3OkuBExyo5tD3KBgwJViCuHmyKJ8z9IWHfwUxe9L1G+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yvJ81gUbExMXMoOxrwTLHGPx4TcggvajFysMNC8b+Diogr2G0
	7md95knez21VuOUXgptqEJDu+zpibJUsXqF7wFmGYINlh5JgmZRGSztRf6mQuf9SMe8=
X-Gm-Gg: AZFdTZea6U4P1whPThHy2ZxlFLARX28q92Pjn3Ne2b4G3bVZpCnVtRzFKATONS3pVAE
	37+4w+1b2LZLazq5+viki+8Dg49WZDJDpGfxaN110uP56LkTXwGg1BSAKPRnDnkW/kjk4j2ombB
	mFJyiryxCzkhYYpt3Ikpi+eHlhCX1vssMUB/ltrfeN5tpl7XE0u2vf5LK5AuzDqYxsEydjZ6Euw
	SLqa122TDmfUmAUxD++jjS6feIEiAVAzyyum68KhYc9h7iZak5aHcqv3btZxwYz05ZydU7OyaQR
	uOlOGNtdwM7Y8JCQ8Mfv0JiUSyPgbAYdJmo3Sl+qNoVbyuj/lp8s2VSe8IMXp65QYC96bPB84zE
	HHNhJFIZ3EUqJTmJfDsfkMnVM00kqQeChEwK09oFEjFtToHcaVtvSeidQKBWIQ0X8PzmRCZmtyA
	ODIBSlTLMVHiUyzkY4gPRg+HiCegRs9mfsgzY/KAn/8k//WO9Ix/Yfnn8cCJNSWUBl4vs9CqNQe
	gayDamsyoaJEYWDSM6tG7LSlAYtBiuQZQCekW9TudjoRw6W8wyRw/EhN8dSEmDGvhzkcFGnYbs0
	PVER+gVbTLc2GbU3CDSZrVzepXgKGJKInBZaeWm5sfaei4+/g9jKTHw80BbrwJ5gs8Tp+QxfYcl
	H1jZTlMGund2LaPcnviNrT1yEwQ==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr840758a91.7.1795132498753;
        Thu, 19 Nov 2026 15:54:58 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecb486sm4530371a91.16.2026.11.19.15.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:54:58 -0800 (PST)
Date: Fri, 20 Nov 2026 10:54:55 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: Heyang Tan <thy15333007817@163.com>
Cc: linux-wireless@vger.kernel.org, dan.callaghan@morsemicro.com, 
	arien.judge@morsemicro.com, johannes@sipsolutions.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: mm81x: validate external host table TLV lengths
Message-ID: <irtdtr2khzxurndd6ukvjus47vyfz2b7jnpqfuywurn6ibyhwr@sualwdk2hzmr>
References: <20261101141025.694-1-thy15333007817@163.com>
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
In-Reply-To: <20261101141025.694-1-thy15333007817@163.com>

On Sun, Nov 01, 2026 at 10:10:25PM +0800, Heyang Tan wrote:
> mm81x_fw_parse_ext_host_tbl() uses the length stored in the external host
> table payload as the TLV walk boundary.  The buffer is allocated using a
> different length read from a device register, and the two values are not
> cross-checked.  A device can report a small register length so that the
> driver allocates a small buffer, while the payload length field claims a
> larger size and makes the walk read beyond the allocation.
> 
> Each branch also dereferences a complete fixed-size structure while only
> the start of the TLV header has been bounds-checked.  A truncated trailing
> TLV can therefore make the capabilities, checksum, or YAPS parser read
> past the allocated buffer.
> 
> Pass the allocation length out of mm81x_fw_read_ext_host_table() and clamp
> the payload length to it.  Require a complete TLV header before reading it
> and verify that the full structure is present before dispatching it.
> 
> A KASAN reproducer mirroring the TLV walk reports a slab-out-of-bounds
> with a small allocation and an oversized payload length.  The same input
> does not report after these checks are applied.

There's already an existing patchset fixing this [1], please check
before sending patches.

[1] https://lore.kernel.org/linux-wireless/20260812060740.1275280-1-lilinmao@kylinos.cn/T/#t

pw-bot: rejected
