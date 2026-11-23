Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472988;
	b=2JgoBO1ojDiUHgw4UeDWHKzE+hqS+SaJb5NATWf9uGHJVnwl1pCpkmoJA3PUJav7fk0o
	 0e0ul7ayBDda7kFPu4ljiMdZZZfd7MEj+tM1gaXrCxM8MeZWjoiwaDzlsVLBCFHArwUiZ
	 U54KDlCp/X0q6tHy5PGqM2cnGxsBvjW3xY/qrRVQv+cuJjUK7an0PIuV7OS0o+t/sns2h
	 8lpZxvefiDloAxnHeKRxucEM2csvciEVA06XCgO6Gx7+aTA/Quaz9WZnk8H2Fob4dHOiu
	 MSOaJ8jDZ9sTg3KgyYrLvZwck58hbyawdB8T68AI4oDBHmNlvjyQqxLc4V5I83xZS3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=vcuvpU2ZjCticcRCz8mBiVPYz9CrCiT6lwDcRw9mKTQ=;
	b=eWYhgmZ0HuR66kwNqtCqYjyFeNHfp7Oz2QFcaFvZFddh/mMybGTjPoT/vwi/FzMkG4gp
	 pc85WEMExXkuk3lDwsyelCFjjfDdZxTdzLUXZt9SwK9c/4iUH6b4mA8DuTy4knfpYLktZ
	 oRx5IylvdMjw5+HPHbbi2/GqYK9nvcDu7zWAU3Xl94AP7Hf0sdjRzogqdyUmdLKrsF5/v
	 G2OMtVz9iynl8GO89xobkDuD6tx4TSx9mGCEz3ZW/VgS+niCMWwym2ox5JKlwvOey1TP2
	 qM1zhbw7vOaIx6i51OkwQZOw1S7JKJ59CSirb3LbNLvLC0tsoe1JTWN2xRpyuJjpwHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KtDuIlg7;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041A9606A322
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041A9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KtDuIlg7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b51389f58cso41436707b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1795472987; x=1796077787; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcuvpU2ZjCticcRCz8mBiVPYz9CrCiT6lwDcRw9mKTQ=;
        b=KtDuIlg7B6694VnHPFw7U/qUJ9VgUogU7LUZZ9brTOJ/Zb3QnI5MjsCqFakjLz7Xei
         Bb1tH+rvHn4qN/u8+sGvH03N3IyDQNnp05tMYh8RfBSuPT6LOioKeYy9jPq0d+3Aaf3i
         j4V6hy4vMlUS5Jx53/6NiyF56H2ho4tb2gX8EwKl2y4veDtFCWi3kV53zA1l7LG1Z0Ws
         n2d5SGshAufJMVDqQinqhmLd3SHlFjYvOKQaWa5FEBIt1mEwtTVUl5R7OA+yhxc2MGlm
         danQUZf22swSh4xHm9s5CfwDQKFp0LhUQwMD9LF70WKfHjTTUw8u0MrH0InLBRZB6y8d
         +N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472987; x=1796077787;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vcuvpU2ZjCticcRCz8mBiVPYz9CrCiT6lwDcRw9mKTQ=;
        b=J3huuwYb4e1HttIhpUpbrpBBHRGRN0hjaEnsFJIjbd/Zxlub7VAk7jXZMXdNZAES97
         8/O27ITVD8sQFVqB4V8Y2yWZrgT5m8cNKhVvvM/Mb0SoLWmLdI2mi7DmVX8pdg+Os6c8
         +u3eqXG1kNSjjllAbdYzG/1WE9Ea/A8dBpkCAE/GMkEgysLOJHt+pgIHyUmIIEfgRnM1
         3++Adj06PGUb7+QqGE2V1ZV/CldYAg+337+O15CVUC0pT2R4NH6GsOx51QUlCDbSmWFK
         qKP/d1XPjzfbYl8Y7ukuSEczeV5qnSE+0zk19Fx8+JesFOLfVYcs+OKnzykvIwv4sM36
         pJ2A==
X-Forwarded-Encrypted: i=1; AL+hErFUvPl/mJ9iHnfMxwBRPq+pFlNb6thzVv/WKqRKXI0xUbpMi9z4oTYWtXzkWMDt0HxpBjgIV9ZiUMYQr/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z81IrRrBWYColEb5cbfVe4lctwK3jOZVACqPdVzCNvFvzPhmp1a
	7uikZrg6UFHLVDNx0GqIz0CBN91ZWe6891mycTK3kX9g4isgqPn03NXyOJL58bdfKlk=
X-Gm-Gg: AZFdTZfw2OUwM06Hcx2Q8aTTXgJWOx8zDz1w2wGLKf7wkr5sW7YmUxKO+UKLVGtgOeN
	9f+MQ7r1tlMHneJwqaOkCpBJzWyCDKamLvtw72YArANng5cNyd3DGDI6NW7YIOG7lizrbFlijxK
	/PYvV+n+FfW8YgGyuh0LWsRclzMB6mMoAX7dDCoZ0/QWIKkrBEO2iRReuySrv6ccleA7nA261T2
	V+YDB/kj/fttHVfkDi1IuJIa1JDNgmHPONeWevOITGSwZsWC857vf0itDuBD+jvp20fgqzqLppQ
	SfklI2LFG1kOBUy9zysL1ZRs4GhX87SrJgbv8DI444afTJgbjGR9Me6bITE5sRq6gNLhBHTn4JC
	sDx9yRLATzNUXG9S4Itvs9cmU3NBoZdpuKKh+0GUMsQLdIYBO35zuyinrgOaKKHjRErtfcyssAT
	X/jasszpl63vQ606Xdnq+NrBK6oy9APa6/FEXm+UYSRO6u4/X/mSdFrAK8XQ9MKCMNuCiN5+bKT
	PdtFoUU1SDyvWWgL6sE6kafNAc2bt41hUKtfvwXKnUxQt6+dcVoKUUCAqTgqOytbH567MjUU4Zk
	xtYIYBtuwVVCR9GdgjWVy3bIX1h8yuPoMRNUqd/trjjSx7JNQGGsB8vbJGGQ6/jD5IDvrMWK3TW
	z02lcRbqLFldxmOp/uIur5AmBUDjJbfUtwYaO+Dj0YvzNjMwFeokArsj4TYbtuMBA0WUYZ0xdG4
	LHBvf2eWjBE2fmSYOd8wk=
X-Received: by 2002:a05:690c:6a04:b0:8b4:d882:4a1a with SMTP id 00721157ae682-8b52032b647mr40897437b3.9.1795472987061;
        Mon, 23 Nov 2026 14:29:47 -0800 (PST)
Received: from ?IPv6:2600:1700:6476:1430:83a2:1030:d4d1:10b8? ([2600:1700:6476:1430:83a2:1030:d4d1:10b8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030ff10sm50259377b3.33.2026.11.23.14.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:29:46 -0800 (PST)
Message-ID: <ae8b60d3c989ded1d02e5fce38d2d99c331e8daf.camel@dubeyko.com>
Subject: Re: [PATCH v5 2/5] hfsplus: move file related operations to file.c
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: Christoph Hellwig <hch@lst.de>
Cc: glaubitz@physik.fu-berlin.de, frank.li@vivo.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vdubeyko@coreweave.com, brauner@kernel.org, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>
Date: Mon, 23 Nov 2026 14:29:44 -0800
In-Reply-To: <20261120182228.GB2183@lst.de>
References: <20261118004844.3849979-1-slava@dubeyko.com>
	 <20261118004844.3849979-3-slava@dubeyko.com> <20261120182228.GB2183@lst.de>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
 NFdvziOa4FgUBC4X71upsZIoZJeii2V/Jtc3B4g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-20 at 19:22 +0100, Christoph Hellwig wrote:
> On Tue, Nov 17, 2026 at 04:48:41PM -0800, Viacheslav Dubeyko wrote:
> > --- /dev/null
> > +++ b/fs/hfsplus/file.c
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0
>=20
> This loses the copyright information from inode.c

Yeah, you are right. I missed this. Will add it to the next version of
the patch.

Thanks,
Slava.
