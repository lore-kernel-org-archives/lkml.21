Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795132055;
	b=q9R8fFOH21XhQhru8P6AVvMI0R50UcMPGjntheJoEYyMAfETdjsLmPG6gLi8JLvgZNqr
	 cwYK/xtsat/ltGQAkDnaqKgJ/tNUv/8UghXog0YDUpuku0dUBPVlQJl1IB8HLzbuab6FZ
	 tbeTQSxZdXUYo9kq3QVFc8q8fnQV55XkogXzHTa022ewW/m6rKWamoFTgPvaivIT0M2zS
	 iIQ2yOAZNjB54zwLrbEH6TN+Eb41kgi3BikNvE9Pd1kM63acjQmdpAw4kGpalm7R4OQV1
	 v59MHNWU7zf+IdOhSX70JgtthBJlrKhAA4f6Gjvf+AbI3/qOd7Xg68ywGe5EH+RANBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132055;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=1JyuEfN6bVNV6U+s54IqPQn0FYwCqy1D2V8r61yksZw=;
	b=siPcoMQUqHu5N1C/Xj1kMCogcLe5PayH3A1NB74dlrxjDUYn5WHoNgknsv0GmbU9jS4F
	 hmp7AX3hqCRvQkvkFFJk/nCxS7KTjXs9uVUSIYsYVHYCpajZiTJb2orasxismVypwY+iq
	 Zryn9RfqIQURb8LO45GcJg7ikZJJgk7pFEv8qFPLfn488BLArYX50XmuUqGlSdxyKMdEa
	 migLVDvynL+1JEGVK0x503rYA2dr8evhuD/0v58QPhTi/N0RmXUOMvCwX3qw315GOQymz
	 7fodJCt/53xZCCA2sE2LeT0MZZrsVafU4Qjfc/BlvhyZ3WJiKIKJKucgoUvnQ+YQIPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dOxUuNG1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=c8oy6y26;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C4606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dOxUuNG1;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=c8oy6y26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795132053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JyuEfN6bVNV6U+s54IqPQn0FYwCqy1D2V8r61yksZw=;
	b=dOxUuNG1rLmWic3a7DW70m07SrEn3DYH4cP1/CwJ9LNbYuXmPb6a6WQnUjcmnONYwkyGA6
	hZXPyBR7xrdEBIep4j2akSwluF9opCiSuz/itQ1PegRY4XFuv+8CfhwBQQU+gBiSJlEVZx
	fNZ2r+ZYh9ISxVo+t0Y31YOLmlvmP4M=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-_wwCvG1jOFKKxWZYBM-7sQ-1; Thu, 19 Nov 2026 23:47:32 +0000
X-MC-Unique: _wwCvG1jOFKKxWZYBM-7sQ-1
X-Mimecast-MFC-AGG-ID: _wwCvG1jOFKKxWZYBM-7sQ_1795132052
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67c041acd09so767163d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795132052; cv=none;
        d=google.com; s=arc-20260327;
        b=Ppud7eNEf4i3G7REdNBS2ZB3T8+QFA553Yx3Dsbrw/aaVHFZt38draxJYm873m3Ydi
         5UrGIFyjkQ+XOA3fXXAVTNLFKSaTJkR89OKrWs3fW8hP3SZnb9D3zfAKlEsXontGeWVj
         fZkS8sBbBnSTeWgOUuvRKGSV7wOqiMAhGXDHMJ9b/+Dn3PmXEAwKcceu7m5iLAv086Z7
         0FbTJEIETfrI0tXzALBDqJdN+FeqwUsjtZc7druzzf1oeGEyvnrqAyLpdZam56IZN7VQ
         JA+b/PCbmhYT5ZC+h/yBaR2DH9SsLXUlKOncHnl8WMAKtde919wy979DCmxqwm3bNwYi
         4qmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JyuEfN6bVNV6U+s54IqPQn0FYwCqy1D2V8r61yksZw=;
        fh=h9VKZhJRqrOwNofvuKqHF/XDC6K8g/ExhXJ8PkNYcoo=;
        b=C58EweUXuKFgCjT4Gp38VzwjTY+OnZs7Ytea+BFeUVo9ioDGdKYbV/26aMBUsFHg/e
         F8h6dnqMybMsgGtIsFmOVQbvnGcVv/x218ww8BIXbEtSjb5jN/3lv7Byjc0UP6miaQNO
         8obzpcEfg3T7/GeWAJzdUHZic+D5QjVYAZDl1kGvGlIxZuZKqk1TJ/GxOBbOjMaJjasr
         CHIEmbATmK/28+h5/g03yArDdVs6WOIzkhjZOyejYS3TwQL2AgaFPZm8s0g26y08Xodb
         9iLF3nYD3SYga/GaENOaBxEn/Q+MqdEgtQSap+dt7AoIbvU7MWXG49aVbkvx6K2/NTnH
         eabA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795132052; x=1795736852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JyuEfN6bVNV6U+s54IqPQn0FYwCqy1D2V8r61yksZw=;
        b=c8oy6y269tHu5oosbgWHft6zSJTD0AKTnL+RY9tviKL3QhlzRi1H/WaDulV3y0FKHp
         mFeHPBLo/SGdVKKiKs2dZ+m95q911d/TKvd0/Krml5ElVj+P5PKeGqjitLqts6NKP/iv
         qHTFNWTJLXf4HonNPTLj35VG/R/wnR242lhr6kqYSNYqHGRf+M3QwvbvD2V/1hEM/JpI
         z3hTOEcAv9XtTetuHBlUsfbQeFzBXh8a1s8YJ1LC3YxRQB3T22hg41WOz6Jf0RPG+ZbI
         i8byE+cg6Dh4WiG54icN3YQn0oDTkiRoO0uDBBBWiWLHiTBEq6s6HAToW+FyGNVrD9CE
         oPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132052; x=1795736852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JyuEfN6bVNV6U+s54IqPQn0FYwCqy1D2V8r61yksZw=;
        b=gq0Uz42FuZYGWTdqG4uIFk3HcftfTkX5T7CygRIpNZWsUTfpiuo4RpPUK1fGKrj/Bh
         7deqGBypzwkrPd4D3XtTrvFsg73pejtup7HSsWk2/Zqhgn0u3ebF1iBBmELSP7zvplN9
         plAeF23SdcxmU+FbTOXxHGsvkAgTj3ilJx1LicOoV96VGBenXUdnfeuOfOqQUKBtKl9R
         QLDYKcjygi+yRA3DMT5fdnLh04L1R8LZ6hsjkxF2mfoimm6gE34H1sVS/jTYzxZh5qR6
         Gq38qrromu9TLSkhGwoOfjm/xgmifFivBNVZ9aU/ZzYvloc8oinPBsyunWbLXlvx0CBF
         BvxQ==
X-Forwarded-Encrypted: i=1; AL+hErGvnlTDeIE9Zf2csp/J9oWC/SDoo8YtuXsn8+1l2yAyl2p3Yf9v6yPfjv3Pq6JOQAXaG5h7i3PXfqdVeXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vIcS3IKtgoMMBgTPyVveNTUa8Jt6nNyfqzBVcvg+5VxKCUqAi
	YujaWIdH3ssFggffKbU3f4GKD0vwHtmgTcpDdSMrPukjhyF9AAzyzvvrdkYJWDMLrQ/7zzrp5iC
	LMUNhBivHRC7WqjcwIz1dAlccybiyWgGJawiwOYc6bn5QTWnLffQcvsmlYtkb57Z/opq++5PD2j
	WDSf85KAqw/Ua7dH1DWnaMcdoAHXV5xA4XrP7SAejD
X-Gm-Gg: AZFdTZeSf3YQk14KTFR6tprHdTW9iAjKCz6L+QhmUDl2OVJmHSbsQkNj+qx4KfK0wst
	FiRT+GrZFo4f9D3OzZl/A9T5GWwnBYg/c8z+q7qlFql9VTViDWhaqbdDk049tH1uL4cml666hTW
	CghViVU7M87Qsb0LQNDWe63bG6SGYvTV5xtXNNA8YJKmi2qEPAaRD7hI5XPKMtge3IYdb6YyHYd
	qV0j2X91eUy9WI+vazi1sHt9JyCaUfFqN65nm/ecpUqRg==
X-Received: by 2002:a05:690e:4089:b0:679:a03c:3cef with SMTP id 956f58d0204a3-67df4462202mr401004d50.102.1795132051642;
        Thu, 19 Nov 2026 15:47:31 -0800 (PST)
X-Received: by 2002:a05:690e:4089:b0:679:a03c:3cef with SMTP id
 956f58d0204a3-67df4462202mr400981d50.102.1795132051061; Thu, 19 Nov 2026
 15:47:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
In-Reply-To: <20261117-gfs2-log-folio-v1-0-35db3db42e35@columbia.edu>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 20 Nov 2026 00:47:19 +0100
X-Gm-Features: AclHuK9gULsTk6PGMwqspw6Wk6A71f7dxi9qUV73alrF3gpANL5X2_CboyEiDG0
Message-ID: <CAHc6FU43KTAm-VvYXrR19BE1Q--2aHL6UALG9cj1pgdeqB_tBw@mail.gmail.com>
Subject: Re: [PATCH 0/3] gfs2: stop using struct page in the log code
To: Tal Zussman <tz2294@columbia.edu>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tal,

On Tue, Nov 17, 2026 at 8:46=E2=80=AFAM Tal Zussman <tz2294@columbia.edu> w=
rote:
> This series gets rid of the remaining struct page usage in the gfs2 log
> code.
>
> The log headers, descriptors, revoke blocks, and escaped block copies
> are allocated as pages from a mempool, and they end up in the same bios
> as the page cache buffers being journaled. The completion handler then
> calls page_folio() on every segment to figure out which kind it is
> looking at. That won't work once memdescs land and those pool pages are
> no longer folios.
>
> Patch 1 moves these blocks over to a kmalloc mempool, with their own
> bios and completion handler. As a result each descriptor block is now
> submitted as its own bio, so patch 2 adds a plug around the log flush to
> let the block layer merge them back together. Patch 3 cleans up the
> leftover page references in the log code.
>
> Tested with fio 4K write+fsync on gfs2 over virtio-blk and null_blk.
> Without an I/O scheduler, patch 1 adds one write request per log flush
> (196.7k to 229.5k for 32k fsyncs) and ~10 us to the p99.9 fsync latency
> on null_blk (41 us to 51 us); the plug in patch 2 merges them and
> restores both performance numbers to the baseline. With mq-deadline
> nothing changes.

thank you for these patches. Could you please rerun that test with a
block size smaller than the page size?

Thanks,
Andreas

> ---
> Tal Zussman (3):
>       gfs2: stop using pages for log buffers
>       gfs2: plug the log writes of a flush
>       gfs2: remove the remaining page references in the log code
>
>  fs/gfs2/bmap.h |   1 -
>  fs/gfs2/log.c  |  19 ++---
>  fs/gfs2/lops.c | 221 +++++++++++++++++++++++++++++++++++----------------=
------
>  fs/gfs2/lops.h |   6 +-
>  fs/gfs2/main.c |   8 +--
>  fs/gfs2/util.c |   2 +-
>  fs/gfs2/util.h |   2 +-
>  7 files changed, 154 insertions(+), 105 deletions(-)
> ---
> base-commit: e3280ea8b73964efb447f396fb09401a31373136
> change-id: 20261014-gfs2-log-folio-274b84f5cc07
>
> Best regards,
> --
> Tal Zussman <tz2294@columbia.edu>

