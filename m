Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421143;
	b=qFBQrYcr7uK8LZTurx8aqmja7jc8bEemp/pot/GDI5zJq3eOzS0tuT0oixLlnQMJTYyj
	 fz1Z6bQzK8m8np5EkWGf7u/bk6BUNehcMTSx9sh6oVglS6fW6VRwI6BIJPTSMo5IQNiKH
	 U3CoZw3qt8LhVquzJeymIp7S6Uggx3lg/Hu36yta6UO61kHk3ONZZ47EjXk0QE+4JeKkr
	 HPVwiKIoIKEbniKk47xSqNIlBQRvyblHDO9HTS9jxvd4Slced7deObpW6iifGKTMEy2O/
	 360OkUmVrGykn9EwIQ0HlCXCQO/VccfkQtMH/9iol4rhmg4CDFjJDT72OWZOleciCqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=0oB2KC0kks8dAOw3JtWoTCmYwUhBL+wqoVHc0YvSXq0=;
	b=oqmO3VzoGmMFzlPpg9TsBEyZquJqvJDL3m9klqPPWJsNc+aD7ZCfmtXOYoeWNauZFkbw
	 +sAlD5LFsKP/bPR/GySlQB5ShoN/YKBAu45eb75aU8iXYSu6hj8bAHFv9SXHSLyJQZrfs
	 lJiKPlLxKsrsRbosqXZuyiT/EWpolSCog28oXnQlIC6ojQB/OyI16URCYLisJjZs8kUsG
	 Wo3PSgrl4zUOpbPJhYtU3H0ZcS0/zAe2LUeJJD5FL4yqp9uBMP+70OoPElGh/2y5E2cIu
	 z+IM5nX7SUwSIdH9XNP0bXnYJHvMqDpcZ0crSVzlaZ5Ip944/IQOKUjVh241RXHm4bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSTJqkCX;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D721560A5BDE
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D721560A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSTJqkCX
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1196760a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795421142; x=1796025942; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oB2KC0kks8dAOw3JtWoTCmYwUhBL+wqoVHc0YvSXq0=;
        b=DSTJqkCX+gzDxkrzA4CTsuQFZ+7H2LExmh2TUPol3p7ddFdrUa/nBgAVxqM1dv3XfJ
         oiVk9/k8rebnbTCC6l88m80ZqX3IbXMtkoo2zL/Ay/jz5ZSIQTG6JTekYcS/4llqECRo
         vdqR2gpJpAlSkMzHtUUWgsBg4LfSAkQWE0dFlGKC69TRo/hKbJgI/YHXM9+6vAs7zF+8
         R7C80w9kJ81ndktVb+lR1HvnmcF+uP5a5PyU8/+QgG9c3evMg7u0gryMsj08+cU4V0na
         hcisz8Qb4VLnEfRuIfkpk7HoGMema/g3iBgUcSJtevpGSoIgwVIlnauDGVeOJfJDhe6f
         ghcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421142; x=1796025942;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oB2KC0kks8dAOw3JtWoTCmYwUhBL+wqoVHc0YvSXq0=;
        b=xlotgrpEI7sybDHOloh/qINKwZzR05nbjLWZibWl5qLdovRx4dMBXxHhIoZHVBjF/6
         S57mFRXZmv5moHKv9NK35UvuDDpBDjQxl7rVEvm5hLrq2Rud3XQ9Lk1q/JCjR16YLriS
         xgnRS6SJx6lTHSHsy4Mdd9J/lLTHURj5CHxujMDtHjjBhBlGg0h6Oq2YCz3GIjwp/yO7
         jhjc306Nw3DXIztFWfXDNSc7Aa1UFnRwicuI3UWOHmTeweWjPFWCw60VBFZFYDJRtcfh
         bEXyOe7Ztd5znNfA29Lmz6L/uSXlYSpLCUry+PNzsggcPzGhl7XqCNm9JVNr4eZGnwfj
         4w1w==
X-Forwarded-Encrypted: i=1; AL+hErGHAiwf6lQneEKqymFmYFv8VnExvVjM5TzFH2B8vCILhaeXgMmclB0QNCEKyyp5IFSc7y7ugsrl+he302M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wbvdz9grxCstlpv8WQO9hJG1yUaKZ9BxdMBznhDNAgkOPo+xc
	nME4SbgWu9XnBlD2kWlgl+B2hQPWGF1Ho71S0Hfksw90CQ9Fd/v2Nx1P
X-Gm-Gg: AZFdTZfj1r/lF9ooad4TW4K/GEYZGnU6S4SQ/mCbp5mODpMQCXxnt9NnjmpM56LtxN+
	Fz1SjMDndliTsPmVMBK4/CcJz71twINzCferWsAM/0JR6IkgMmiU8K2aRY0NoNClcX0fv9CUqFQ
	dihOmIRQhnptGCE87/mPoc7OLPh6pvLrl8tBD3Ou7ZW6J7Rq3RMZgrTpv7fKKP9khXxHyxnJVl0
	1NC+EKjzXAPTzTUrisF4uycdKaicB48HOrfQdwIQfbRjX+fGE+G12A3EHcKNoiSItpZtrjpLtPL
	zZO95QfxU+LPSEop3Jx9emhRRwqbNBfD/xTOdnMZdpy3H1QdY8k2yQn/Qsz89Cb3EBXucA9++Sz
	I6Yk+9D58kkFiBKFHwqCxeS87o/M5RHRAJSfmY3E0W8B6b3MeLecfVoYQ8vr/lyfXChVE61cbc1
	LrvdDjXSsHCzt2ccKt3BA/zlib849EuorHHCd6IXhjW2rkt4EevjGI3INX1phamrn4u48WHbNTF
	wMnGJIQLmOD+Z5JiY85hRE5YKx/8kM0Lr1EvJX/405nYb6IEvYRFUXu6HkvJUJRbvPgtK4=
X-Received: by 2002:a17:90b:17cd:b0:3b3:c998:6d6d with SMTP id 98e67ed59e1d1-3b41c95da50mr9088833a91.47.1795421142137;
        Mon, 23 Nov 2026 00:05:42 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f12028dsm47209485ad.60.2026.11.23.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:05:41 -0800 (PST)
Date: Mon, 23 Nov 2026 00:05:41 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hangbin Liu <hangbin.liu@linux.dev>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-Reply-To: <179540476963.3135.15854448705865137311@kernel.org>
References: <179505868590.3571070.12381528230330714812@gmail.com>
 <179540476963.3135.15854448705865137311@kernel.org>
Message-ID: <179542086429.3214461.2008225946774527848@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 23 Nov 2026 03:32:49 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Does this fully close the out-of-bounds read on lacpdu_mcast_addr?

No, the nested bond case gives the same report. v3 adds a patch that
refuses NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond:
https://lore.kernel.org/netdev/179535729502.2645501.5219010464870440@gmail.com/

Kyuwon Cho

pw-bot: cr
