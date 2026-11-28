Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858005;
	b=TdECue7cWnlAby7Nak2P1zfew2ti1OgpZq7sQOdd1BNSBu2dkSjJWy3Bktnb9g92+mUE
	 XzKaxdqEv2Y9++8jRt3c3QyZGstsVXmL7VebwlEdJBinaI4pTEED27oNQrgdZRezhHZOA
	 VX+8f2wtxzoxCciBIYSAwXvHzoE28hm/AyeXen4V59n4H0d3Vp0v3jNVx5QAyBtLOl0mL
	 UW+epMBJCRacC8TBLtvzWz9xdvrZHvHUW9CNMGOQQjuVWsbTOg9Bwp3pV0Jztb5LECyki
	 qSM6ZZoEG19/uSwCgUQtfrAjvueltaTl+wua9+PrcRoYUjbDWceYjHgBWU2SWHTQ2UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=XePVpPEMY1kO0/i3l/MzHVEvZGt+qA4HbNIOln1umLw=;
	b=M636sJApd+5M4TWaNhBeiNfxS0kcgUQn2UX+iV4C0xbdzCxc1tKNcGJqCFTX+9ZTVCK5
	 XZ9rWN7RHHuxolEXiGGJgKEnYeGkkyQzCWcLYEhb1Z8oYn/njcIA4vWz3s+o2OY3eTpj8
	 blXLKrMkRR7uFVHp0D5mZmRyoZy19EyleVKscbFRivsWbcvfWtp95d6hEIpxLI0bCVWaV
	 kaA3ql3N6TxROXZ4Kl/WjeI3Mqkk/pfg8+Qo/CSMCcKR87isi5Iou2UKPhj9EErNWS1N4
	 TSXOV1zpmRLVQ3QtIFovF9/LqBvJRfaUraS3yFD+43Z1/c5z2Y9BKFeMcBXDEZrJMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=fnWZn8Jl;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF114606A684
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF114606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=fnWZn8Jl
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b595601695so12215787b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858004; x=1796462804; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XePVpPEMY1kO0/i3l/MzHVEvZGt+qA4HbNIOln1umLw=;
        b=fnWZn8Jl4hDG3v5ER3vWgpdY7JkM78obS5xy8U2vgnCamKlefXD7OY0//4PbSnI/QN
         GPZ5wKFFFWoq0YwitfeRxHRRAlj0DFGhhC4cmXQ3lGhQ1HnDdgKINGfigTifYQluaCxI
         B6H9BzV9FoxfNr9MpzqkqP5qEQgH7hDQ6vkqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858004; x=1796462804;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XePVpPEMY1kO0/i3l/MzHVEvZGt+qA4HbNIOln1umLw=;
        b=xua3caC7SAjrtT+7BDCEbB/8vRVD9RC3u3iGeciBoAmAjkm0/0D+5CiE4SPWPZaCeo
         CDwishalTe+ba4RlqVzzO9d2chu/lWPlBS2ZOyrNZkbmIsNXxaRS+bweNNrycWQWtJSz
         1gsN89o9JEABIsox7B9ulovSTfXDSj06fcKvxWnsFOUbudPaMcz6zFm65zVDpoKN+xPP
         qT6ZqvvWTlNVvB416KUwGX+LQwMvIiz9fwdTyn8MEHhrixAh60m8dwWPDq5NFMtlDdZR
         MpGGOfHjEif0+2JxQrQnnFxdCN2z5SBzAqF5Z1iW4rksAoda3iWcm4TOQRtOXcAN9REk
         CNcQ==
X-Forwarded-Encrypted: i=1; AL+hErGJRYriI+FqXEHhD0xMiKtiU7DYYhrHdNOrgpjbdN25vPEe9DFgFENs82k0fjLBqA0ibXBoY8sslnXqnsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/M0AEr0HuUxKM0lQsAd4C6+mIwxmlx6x1FLUz41xCJnfeYAgOu
	u9oAL48TY3cTcjv5tQFuSsxHWJlISX3WJOZuEz4ADpM1JtbiM/8hYGaJRDAAUlklYQ3JahJ0Pz3
	uA2VH5LwBNV9mdwc=
X-Gm-Gg: AZFdTZe3oZOobnjrK0xHiHOBbwjjEWvvuo5AG5D6JGXYpC006F5zkX4Xi9Gl0G2+Xyg
	f+aDJmN1Z0acysq+ZU8GFl0SisGkSHNhjE8QdeuXO3kG09lX9b7EqspKDUE/ZeRfJ4qyVkDGopv
	e4dQpbCdqBoi+JpBG7VohFJtV8Z8KqedvNkkp/WKq1523sw8PlgcPyb2WKQdcFocden+fMAaWbw
	8qdmpykHmFJpvOeTqlOIPbwcXkI6P9yhej7cmBneWghaSV49gkQ0auQJq5+ixtjM1g25ca09ocC
	YBp+VQADgpdgt9Iflo9Bj6doXTbiZnwbS6utoBE6LNf6GH0FWkv7i3lAr6qHBvaFoPiF826POvB
	glmnOXacNLowGijyajzRrApOZ5z1Xnmv91iQWado+qiFGkvoq9jiwU2E3ggMQQ2SdeONVLCNKY8
	mL4uTAi87ruf7IIuBRqQ6vu6ZRNiRDVoaHommni2GvFnr+g48xkXccCU2yK6IDd6gCwR8kzR1S2
	/+DfzN97bm2akOncb5VaLIkXN0vKMWzIbYMqUPD4hW+lJDPD3lcY9TFBD14fTU3cn4KQFameNou
	n0RilxmXmUuQrdj3teGHS18iO2B3r/Xu69+Z3/gEKrXQ6zCDzi5+WT3U9q1gBL2MU7/eFBP0nTK
	78Zve3Yey9cBek784VLD33nt5M/pM45OzgesVS/RBEHBefFiYWRu2oFvO7kJA2APr34VqntIB9/
	IZiKdBuz1O+meBBcT2zpdxc3FO1cCqUPFn8MjmTA6+/UoZUo+6f9MIr+jOFXLnmkc4gG+yzBgQu
	CmuNyCd+Sl6P9H0kAiNm4E=
X-Received: by 2002:a05:690c:6b82:b0:8b4:c1ef:ebba with SMTP id 00721157ae682-8b5204ebe21mr92952047b3.54.1795858004057;
        Sat, 28 Nov 2026 01:26:44 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b56fc6131fsm42801917b3.34.2026.11.28.01.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:42 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:41 -0800
From: Chris Down <chris@chrisdown.name>
To: Christoph Hellwig <hch@lst.de>
Cc: "Martin K. Petersen" <mkp@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/2] scsi: sd: Fix data corruption in WRITE SAME(10) write
	zeroes
In-Reply-To: <20261111164632.GB18355@lst.de>
References: <cover.1794069087.git.chris@chrisdown.name>
	<5cb23933fe87df3c342d9805a7fe8c2a1e08ff37.1794069087.git.chris@chrisdown.name>
	<20261111164632.GB18355@lst.de>
Message-ID: <awqeUXDLbKDiovWx@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christoph,

Christoph Hellwig writes:
>Shoudn't we simply refuse to use writesame_10_unmap for devices
>where 10-byte commands can't fit the entire capacity instead?

Yeah, that's simpler. I'll do that in v2, both when sd picks the mode
and when it's written to zeroing_mode in sysfs.

That only takes care of the LBA, though. sd_config_write_same() keeps a
write zeroes limit above 0xffff blocks if the device reports one, so
the count can still be truncated in writesame_10_unmap mode, even on a
small disk. I think we should still cap the limit in that mode, as
sd_config_discard() already does for the discard limit in writesame_10
mode. Does that sound ok?

Thanks!

Chris
