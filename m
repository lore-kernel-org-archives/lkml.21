Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379108;
	b=Mc/Wd8Yqaacvh2X19ieFSFEUoaaxZ3MnByOf6mBH1pXsQFgsaky9gtZ58nk+5RfKYT9S
	 /y7eAZ4qYWoMtbKVCTWy7r7Wjoi3AVpslzlySn3Kv7h28ofkRlatGRqNpqHMSEg85XUAp
	 ZnAzpQ5ehKNPPbc4x2BoRLa9WGNEtmCyHqR36jvXH7eyntNcfTuQvnA/tyq63jhxHZ56a
	 BaU4fltyzy0EUpy20H4WrHmMH0nVBwNPbl+gpWuUWRxJL+LgS4MMR7wRPdKCyoq8jRZ/I
	 Q28VE2pb+ImkmPlj29g2yinjkZhTcQiX0vbUDdRy/jZMD0AHKH1ofVPk7X1yRVvqL0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
	b=UMuJ04tp9k/AnFuE/PRaGAfG/lgWjqJClSVeKGgDbC2NrIhMslpC34j6w+wMml8QpF2b
	 ey5hZzVIbbBlnkYxCm/h9dS6s7bTixkQ2uqKGUL+wo6YuY1KaDh+1oUewCenFUvWbcLrb
	 4iDyyRTsFq0fSXqiNgbjEnQI6DoPWGIhkGpFrdMC+bDV5ndiQMwikax/DDuf8PZlSfB3d
	 izD5vxDl9J8K+xN7Y9wMVwjbbZac3zxtsipYjU9/ncl2jaiC1QoaugM6zY7raShcL+KFx
	 0lBtz/L13PvBfoeYQkwKC1ywdhCPY3VszXZOiN/yvjYjd2Yh7Ht6lrw1JniZss5lNqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bynar.io;
	spf=pass smtp.mailfrom=bynar.io;
	dkim=pass header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=PRtC5hJD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22100606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22100606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bynar.io header.i=@bynar.io header.a=rsa-sha256 header.s=google header.b=PRtC5hJD
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3280864c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795379107; cv=none;
        d=google.com; s=arc-20260327;
        b=G6YoGq1+PBEkBCI3Ok/Ls528QQNanvN4papKtgxeLaYfDEBLF50yHDPts+/S6U6ZOa
         rABCrglPq6sLYjINyttupt26GpG6AjFZxu/2UwWzVs1JhBEjxDU73WZ6dgdgCV64mu80
         r4nJesmDsLjZlpryQF7fw9KKWRQbP2uTOrrgMWk0lNco61f/kCFIi9vPhgeyPCX0If+W
         Pjy4Jpl7idpSrHHWfmZ2nqJ9C/YzoYVpEqU2FCTAI/UZQs3olf2ybLso6blogmo4XxIY
         PLfNl9KnqNHNieEH5HXC4tHE9gkJBf+Z+W95FPpbdL30LpK6F66BmtRlkNjm/iReWFoe
         NWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
        fh=Nry10AM155BC3X0fRoQ1x4BxSr4W8rwockNZjOkagtk=;
        b=afBdNW8IR6j4ta1RA0/VJxp2d3PyWVIIR0hAqi56mNRQN3mFc/wc6DW0KSDTpud4Db
         taWarMfEa+ZMUSIKhdoT4tmLx2rqn0TNfhsho23PI9O8Yk3IJfsINGjKZGgSwxikbrh2
         rEXy7vI3ji5CVtUmzxW3mYjTQf4VC+GY24meaFoht6w8HZieEVqJckdi7Kt+tqp2j5ka
         li8WCrfB3cb+ADtKkjSp77KF+wmMbC1kg63yens48DJbCfy0WjyK5KRYbXCnKHvmYrOH
         yfRQJ6Ih+XvdIUFtLeJdweokehD8Ko8hZiOH1xq/iFklS7GVPsUQjy7mWpllwV+UObpA
         DF3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1795379107; x=1795983907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
        b=PRtC5hJD4+mxpHItpoE8gyDCgRBc77h4S688AUHLjRmvZueTWTX16234ldaUSPvaes
         VBEystPSTCGnXgZRPkxdaMvX06TTj61kCnq9XLkDm1qPYH3pQHTcuqctzFeQgWHDT4hu
         px26owXBd6wZ30lyiylJXej1NgPMaeGEHC1mskE8Em1E4eeL5vAwzHaGBq/BQ9tppBED
         t9lukJ6irTT45XjdLIYaqiLp9l+rE618jSaNr8t7IGuTdsdkS6c3VniMM/vTwe4Lcz2H
         P0dulU3NrNqsuJWsjQ5bKsJgznXajahX9xn1lSp/RrnUEXSWl2UJ7lTZWblp5Nsj4XEH
         bTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795379107; x=1795983907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFAKdjYLzPZL1wR3yHlBKoG/iUsv2YA1etEzXhJ+kaU=;
        b=SuYVDftb1Sb3oODQPFILV5acRlqCykbi1vB4UczRk6+A8eeDBxSb4Qev305JCnnaCY
         PlIo+L3Ubeoou48eutSarsGFjvvEqCGU6z74z/5X/fw1+OhXsc7PUF4NBXWy7qw9dJoz
         Ps9/u9kL75qZKR+qfInB+/lF3ee02wC2YTwKVm7LDnw2TkmyvGR3abM3IR8nnv3hQheg
         P42J3nqSHTVnWw+5xD7E03APiVJnMsABeQKcmcQV04lk7cegqoBXPj5L8LY9tHjXh3e8
         OG3yPf2C4N0Ff++hZFn3IoT74CDq06dAgFJRAkWP01D/JZI/jM+H8D18aBC8IKBaUWAa
         yMRw==
X-Forwarded-Encrypted: i=1; AL+hErG2pIANA9UJjWMvc80Gk+TSNOxxN7aJarQFk4MzKSYVnmRBQoc4s34rMmIT6LoYxouSiFxPBbQfm6UcRxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iaqAx6ATbV6lZ6rpl2y8sQ4tg4RgRBfW36yKGo5ty7/dyy6xr
	I5hr5fcj7wDw1ATjG6MXBuTpECoqaXpzCOHmWD5wRhxe7vO7dA1sG69cwqrDmv7j1xIu9K3wRAz
	RpBdl068wJgYeXzsSiR39vRa5hSDv+DRc0L0GvDzpPdE=
X-Gm-Gg: AZFdTZdV1ODtEPbpZM8mvBm2tSJQwi9qml2/wDwnpYDqBa47hNze6sFDz/+KluO3u+5
	xH/ZAJ/6kNCZ+/Buh4024CuwlKQ1dEVnBXELg6Zf0oxLhlYP+D1tji9JzFmxsM4RlQzzUqlbfNX
	dB5o50w8tjyjxwf0e7SlKm14KwWyLDCoPZbK1wivvmWMcg97MvQvS4XR57h1a0SdIfCevsquoDf
	3iwxUEMrin9Dh1hxw8wnoXNpoH6bi0dWeAbl9wNMDpCvK6BqZrkkxoBr+qcxe7W0upSIAR8BZBf
	2Vm3Vw6W2Kr7srZQtfspREUla+pYUSqatBrgunUgs8dFbx7rvwDgkssvjf09s7DNLBaI4IpCvWf
	rg8GvlRi+5yHnbZHfWUyGIC9E1Bvi9/fsMqJWjJFuyXxZw+Lmhy07hBGnso5qo+vSQGGvvEE=
X-Received: by 2002:a05:7301:2222:b0:384:2662:a7fe with SMTP id
 5a478bee46e88-3856c9a1180mr8820556eec.1.1795379107164; Sun, 22 Nov 2026
 12:25:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925111619.68345-1-giulia@bynar.io>
In-Reply-To: <20260925111619.68345-1-giulia@bynar.io>
From: Giulia Aloia <giulia@bynar.io>
Date: Sun, 22 Nov 2026 21:24:53 +0100
X-Gm-Features: Aa3M54pI_9GiJNz0gNOZak90hOtzbU6MMzqGmmgKBjqtp6rYz4B2p_FhKCa8a98
Message-ID: <CAJzojTiWdt+vbPSu0+pOTypgvyLbn6bvi1L1n=-D2Uv6_k7Wig@mail.gmail.com>
Subject: Re: [PATCH 0/2] fs/ntfs3: fix log replay payload overreads
To: almaz.alexandrovich@paragon-software.com, gregkh@linuxfoundation.org
Cc: ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Just a ping on this series.
Would you have a chance to review these patches when you have some time?
Thanks, Giulia


On Fri, Sep 25, 2026 at 1:16=E2=80=AFPM Giulia Aloia <giulia@bynar.io> wrot=
e:
>
> This series fixes two journal replay paths that can read past crafted
> redo or undo payloads while mounting a dirty NTFS volume.
>
> Patch 1 validates that redo and undo payload ranges stay within the log
> record before replay uses them, while preserving the compensation-log
> record undo exception used by Windows. It also validates the fixed-size
> OpenNonresidentAttribute redo entry and optional undo name before the
> analysis pass copies them.
>
> Patch 2 validates the minimum payload length for SetNewAttributeSizes,
> which always reads alloc_size, valid_size and data_size but previously
> only checked whether the optional total_size field was present.
>
> The two checks are complementary. Patch 1 makes sure the selected
> payload range is inside the log record when that range is expected to be
> present. Patch 2 makes sure that the selected range is large enough for
> the SetNewAttributeSizes operation that interprets it.
>
> Both issues are reachable while mounting crafted images. Each patch
> contains the KASAN report observed before the fix. With these patches,
> the same images are rejected during mount without sanitizer reports.
>
> Giulia Aloia (2):
>   fs/ntfs3: fix out-of-bounds read of redo/undo data during log replay
>   fs/ntfs3: validate SetNewAttributeSizes payload length
>
>  fs/ntfs3/fslog.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> --
> 2.55.0
