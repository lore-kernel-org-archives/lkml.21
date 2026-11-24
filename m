Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795525703;
	b=ijrdx3d2Ddvjp6PZxQf1GB6ZX8fm64CUbkBSF1nCM7MVY0Jty1s4CO6+PiGDD+qcivL/
	 d3pkOo9axuJGA6uhVeVg7PEQzmP0J+nXfBEepF6KM4RXy8nd3VFHJwbca5HcLiXqsQq0X
	 gLj7yxG7OgNTeuzhLigNdicQ02zC3tTCtFk78d5MW0fHcjRYwOQoteb5bGdUBqhspGgOB
	 Yto6P08IPm9IrvRsW2fu5uZIQFvTcuYxKahywLMNYdpjyNtQ1qpSOmad6Yd+Wr84GrTNi
	 QZwiE1EbXjsI1TWKJVGYHBviV7UT05CI+PrQaCodROfQjUyu57W6rdvEEGaVz47/QVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AkNAAAtF4o2icxeAY7gUNPpfbhQGP8DAKlQu3i/mLV4=;
	b=U6o0khiQfFmha6sFRQ8vL2XHYthwehOTqouMN+80JiwqDfYR+WMqH5dddiiLv5udP2f0
	 zr1eHoKb0v29U80hjgBl45vsNrMuh0z5Gs7vo3/3bYBNBZC5oYU2YKtU4xq5rHmeJv7Z4
	 dckxkI4jM9F1oXykL4YwFBp935yt1fNkf0+dmSGgXzK5JWO4xBNDn1fFYNw5vk6MP3whY
	 XAvd9/FzYwm8uIzBxm+K5gac7TP53ZOOyoITthb/4RtfcJIE6q/t2c5kjQXRjglb6NkkG
	 +OY4BHZQbRdpe6fzhzV4zMn3vUGEEFsyyDbeEFTglEKrAigmspOW4wodZDX9cDxVWNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SlpgVcv5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E98606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E98606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SlpgVcv5
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5126505cb3so573825866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:08:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795525701; cv=none;
        d=google.com; s=arc-20260327;
        b=sUNdB7QFVnXe9RIUGBX9zYc+5u3VnemrH8L8+2OVNbxpFOSBVO97Lugy+ezzXpvgUJ
         +8ysnlnT0UeGerOZw60JWvIeq92DewE7iM+HBMeOZezdkuc71dZW+m975iLT2VGwjyFj
         ZKw5ZJlp019bUmQEmQBoHMJmgkpdCnWA3pPtjofb8K/h8y2RIfYri4xSCeYES4NMM8VU
         ly290lT2TOO1X6ViBQID8N7TUCdU+4Pmy78k/C2FJ8cCNdZk0GpNHZP2CGpRBQYb85Dp
         84Mf5H/tnzt+BJOkkb16UrELakqKQsDgettSZkxT0AkTHv9VWh5RFsyzg3c+J+0MKPrM
         51Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AkNAAAtF4o2icxeAY7gUNPpfbhQGP8DAKlQu3i/mLV4=;
        fh=pAJSoDxhLn/+CYSIcIaEPHSqBOMWk6CYH6QUTkwzUdQ=;
        b=Uok5Nrlk0rljdBMJJQPj6IxywElU52ogsS2kOy7XBuU2LHYUGGLQyJkbQpFFOR1MCG
         4tWstGxRLvVhtT2xso3ToleULlBoyxx0AY7WxovJYGUY48FvxRcmejZvtF4PtXN+TVY6
         NZr1zf5hjIbteUplOl4KAlWfpEIOhhVmixnzFxd072F5gv08ZO1KnPDyi6LHtKei1heb
         chnJaJY6VuP9wLAwH8ekym3V5tknnfjwgRn1l4rJLGksYGdOGBj1kH8KXJ07zLqpUc86
         H3OCwTb8uUZuFw1NqPHRih+L+NRt6l6BSK4xW+gVVVLhx5Mt6iiBzHdOopCY9fk80DZM
         oQmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525701; x=1796130501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AkNAAAtF4o2icxeAY7gUNPpfbhQGP8DAKlQu3i/mLV4=;
        b=SlpgVcv5gR/UyiZZogcnbsDTFUQAIQrCDAY7YiGvkitjvIjVAnWIz0UUxJuMo2tf4N
         WB385B/+2VrE9MW3isq9qNWUjB4aS3p/hPVI58rZlqXdRWFOHGElnFD84m5r36FHp34V
         adiqehJVLWSp1oaCRXR1YpOCxm8z6/23MK9LvpHUtKiCx5sUMaTuevSnN1ZNJ8NttHQ4
         BYsPx28LyL3o//fK6ckzKE+DKBzvxgoKObS8E/b5UjopZKndW4lUeaf3ZdModShnwlF0
         3fOopA5oxWIjssOWmS0+ptRm0epVU/DCPaQvKOsx5OLRw3n+UJoG8VSK+bHni0dSyAlr
         vYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525701; x=1796130501;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkNAAAtF4o2icxeAY7gUNPpfbhQGP8DAKlQu3i/mLV4=;
        b=T6ggHkaq7wp3WAqnWDNf4zflP5GuY93T44V7vaLKyrIO50r7TtMJZiNlJTrXDeJk0H
         tbgKnovpguRmcSjA1wtAIBjPCxoNC/miFWKoAf/WIyGSJn9KKpbMwRiSANDUy/o3UBK7
         d2e3v5TggM78W8Xu2JWQN2cvyDY4M1h8wn1IvWkTi+6sXp8UsvYki5DrR2IOxuaTq2o5
         0pwHERoa9HT0YBlvEdmVLwJ9f9js0j1wh3lynefN4B7DtWCSvApc0kusK5l/HPCbIVG9
         UaRRNR+2LE41lScovAs5r4X3spb6jj296OE/2nE5mbU5oapNmJFtUyhZMdRz2ISl/71O
         odNA==
X-Forwarded-Encrypted: i=1; AL+hErEKxWR9GQOnJlDLCpFEmxXDMHXpAyQ2sRyGM5fQDzbXB4uY4PTqzPCGYlfub/14A4Btg2RMZbXbX/0z8YA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rwcPMxRXqIuaSvDpkLhjQkLOZ5FEjd8yHUvxtm69VLCF+0O9o
	5bFqCWeVE+7ibfzo1qmqYXJXffR8rTIb0vhKyKmPOSaStvE9GwyNUFJZCOQiCJt5Y5hFi9xMgDi
	iwE7Xc4+kOiRhk9Ni2/e+mOhTvXkH5kc=
X-Gm-Gg: AZFdTZcGD5+hPKRApLLaEfB1Scr/dLMmVhk7YQhwkEJfgEPFC2bham87qkaGOaAm536
	uwsu8n0Fk0NHRT2gsGt61dRfqcl2QuSEwExV2O2TufjQUljj/RR22vlLL1Owdaac0/MTjq7Nnjt
	yOJFmEO2gJ1f6c2bIjJP3/haUISL/ENKGQze8vZQjr+95Im6L3MimolVcjihRYxGFrRYDT6da9g
	/y96Y5BQ5NQYXMUunrG+y9bPkorM0jaWgTfYrUo6g6fpeH+QTDpxUHQvis9Z0uCoEPKaHc7I26t
	9rvVX1JfHHubnLZK7dV8zrZ/DEoKCTKrWL1w0tClvD+r4pLgORL6sFMMTEZnQTraXI+dGZY9Ujm
	8xUPTsMcPgL3ps0lQ5uRAAeEVjCL/iyQ5l9doRsnHIOQVOyHzkLtby3CHakNxDwC2jmW24Q==
X-Received: by 2002:a17:907:2d13:b0:c41:21ef:26ef with SMTP id
 a640c23a62f3a-c513aac43a9mr1237205966b.20.1795525700904; Tue, 24 Nov 2026
 05:08:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123221410.3328780-1-neilb@ownmail.net> <179550252639.1728055.4014817916838632741@noble.neil.brown.name>
In-Reply-To: <179550252639.1728055.4014817916838632741@noble.neil.brown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 24 Nov 2026 14:08:07 +0100
X-Gm-Features: Aa3M54oq4vsQoqGSpoehVE3NGO0KC8qZD269kouvxmZ9wJzsMqau8bWxyLk-dzU
Message-ID: <CAOQ4uxgF6=QoD9RoAOPmxtvkq1jWf+gG1AsJzR=Kt3ROMA=X0g@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Fix easy bits of the negative dentry problem
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Kent <raven@themaw.net>, Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 7:42=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> On Tue, 24 Nov 2026, NeilBrown wrote:
> > This v6:
> >  - fixes the autofs changes in 1/5
>
> Sashiko says this is racy.  I think it is but the original code was just
> as racy.  Maybe the race isn't relevant.  I haven't properly understood
> it yet.
>
> >  - updates d_duplicate() in 1/5
>
> The fix was seriously broken.  Sorry.
>
> >  - uses a new version of 2/5 from Amir
>
> Sashiko has something to say about this
>
>     Can clearing FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN and dropping conn->lo=
ck
>     before fsnotify_set_children_dentry_flags() finishes allow a concurre=
nt
>     watch-adding syscall to return to userspace before the children's
>     DCACHE_FSNOTIFY_PARENT_WATCHED flags have been set?
>
> Thoughts?

Sashiko is right, but this race is not new.
The same window exists upstream: if another thread's recalc observes
the 0->watching transition and does the walk, fanotify_mark() can return
to userspace before all children have DCACHE_FSNOTIFY_PARENT_WATCHED set.

What changes with this series is that the walk is sleepable, so the
window is longer, and in some workloads it could go from rare to
plausible. OTOH, skipping negative dentries may shorten the walk.

The more important question is whether a child can be left without
PARENT_WATCHED permanently. Upstream it can: the transition can be
observed by a recalc from the mark destroy path, which never walks.
With FSNOTIFY_CONN_FLAG_UPDATE_CHILDREN that cannot happen.
Every transition sets the flag, and every caller that can add a watch
consumes it,
so a walk that started after the transition always runs and fixes the flags=
.
What remains is the transient window above.

I think a proper fix for the transient window needs a sequence counter
of scans in the connector. Each caller would wait until a scan that
started after its transition has completed, no matter which thread ran it.

I think we can live with this v6 patch for your series and deal with
the remaining race later if we want to, but I am not sure and would
like to hear what Jan thinks.

If you want, I can implement the sequence counter for v7.

Thanks,
Amir.
