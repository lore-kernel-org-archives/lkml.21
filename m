Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795176133;
	b=smHOKvoYwDugoC9wKlX0H5YauH7ovHpvYLE/sPopgr9w2t6zF+tk36TdC3NQKqKNoeYL
	 uBqLua5Y96EJTDtIDrubjQcfZB7csXCbyYtUtTb+5x4xu4UMd1y5sH7pjuJpKJtiNmmKm
	 hNj1IsF87J/GfLhInBy47oFF21iBegWH6q01Z0Hr1XWIMJcB//a2YpJp8XtltfcVQFSU6
	 Y5w/Idc/KDsf1peqpInhdSkyVaxEqs7a4PFdYzjfId1VH/4+1hTDmkknx2KRf1kJkVDa1
	 wTT6XhICufSTQgJOYX0njrInprMMPtwp+94BrBrlIvrqMZUHBMzi1Qa3U3o3zwTcQAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=M0GVSOJEv4Fg5tAe9BmtD544Iu6fdkKfVtmzI5e60Pc=;
	b=140NXfBRMfDNZ5gNUUIynJ8+D+iODvTbBurAzU9ZRqfjd6uxD1iiVDz9kBTiwZAzFOPC
	 Znmh3F04WZvFVeDP3Jq2Qaz8L328IweSz2MkI2DJlkt4jdZBSBlGhDlVI+MU8m+DZbNBS
	 XYs/EEFP5HmoLD87afHWSI9sc9nxjUOhXN9B5LoODqueS828AU8xoEQfGWj5+Xe/rgV5b
	 H/ilouVCXZ+SbyRVxjzuGoXPedbC2uyBJ4o3shEyPMnKp/p4ZGlcF5Fn/T44wBfVKQwrQ
	 V5boED9/usxA9Hy+v+rPrg0meTQNiTpUKeOlkRSTG/zemRBhQIWo01uZ6HoCZuq4njg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elnT9W+K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9C8606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9C8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elnT9W+K
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so135166466b.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:02:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795176131; cv=none;
        d=google.com; s=arc-20260327;
        b=TkmBs8d70cH0Er8sYI5zfPk0tkpHLtTaFJoBxs3amLkf2VC/TimLd0Ay5LAc5zjJLK
         w8odlOgOYmOridcQKamoJpTcpzjSc3pEZRUOd0u/0qRYx/6cuYAd3Tbn/wCyIxxtSV5p
         v/iyCLMaSodDXeANdL4ipvb8L6jlj0x+K0lgGLdNmjH2pc/iAlOHZ8WtDJ9JupO+LxZd
         XtwMj+Kmmed9JE0LHgnKK/B+k/RiXWWDdXN5cRnSBcOch3kPydZVDYeSaj5QfDh2mJZC
         o8XVz0ycOl9rNGzBccAF4aO1Zn0y1x0Kpk/wq9bXk6HtUYlN84UQdxzITk08mLgrEkwp
         xKcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0GVSOJEv4Fg5tAe9BmtD544Iu6fdkKfVtmzI5e60Pc=;
        fh=L4dKoD6lubz6kBzL6SkvJ10FJ9HRx0upIoJLJN5yo9g=;
        b=NyLOc82DgNJ5e3vWWF//GHC8W8a0BKkaw0G/tZApB8mINGEqmSD50IKDUy/rghEY43
         jVIcTOVT5fIPCfQQn4e/GeUR4NtiBQ/a3l2G0T/JT5Ptx95NbA3YDscwgnYcChRDaI4G
         P9Jmf95mX/dtN6qFePhD6ueC6fug9c/4f1YYr6ZGPJNWq3wJ1owQxCS2VqpolTuObS3I
         GajkVkhdtFWuvFIgVKFhZqSzfeX1/p9T9/Cijpbvwl6eWWJer0hqBidM4m+eGr8S8rUh
         SG2orkHx3ff3W6p4Cj8kEXyFtR5odD/0Z8gnmSrQ8IENXvWbvDrLrysrY9lqjz/W8fRe
         vQcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176131; x=1795780931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0GVSOJEv4Fg5tAe9BmtD544Iu6fdkKfVtmzI5e60Pc=;
        b=elnT9W+K/n8i6yiUeG/vwm+AuWZDS7DoUKbFQYRBMAXKO57CxAdbGuvEp7yGT/ng4A
         xJpGl84wP3dz5FzRKXe1mxeZZWeFygWYXwT6EcOzt3WuouvhCpt8slCtE+Rm50c3bBbG
         jZD32of3vcH4juNQdSqKW5qUD7leYDJAhDOQxBXy6f4E1VVwgUGsrWFBgn5AWyIRQSc6
         JcQ6v7aum1SoOt22UQcGQfTxneDcBIs/uwdywGcQfTLz0l74MV/l6wVVpNUg2sG+iumT
         sirvXsRGU3I3K+iqC1yO/eBQ8zKNZV/FNXSNl9BBJxM7mKFqWRkVuWq/6Wfdj9Uc+XEP
         6KSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176131; x=1795780931;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0GVSOJEv4Fg5tAe9BmtD544Iu6fdkKfVtmzI5e60Pc=;
        b=pe1G2ZdWNFoPGm13qEz1f8O3GMNGNtZnuwBNQZWoyyr/HQP11+LO0fLPk6eYFK/2uP
         X4niMOknUCT1ZOYbvujV+AH18npJKA7lK8KV1KuFi7m2yE6gPy5wlLLpG65uM73mNIdV
         ZbYMmBuY0urDS3FGIbQmMTAC9G2uNC6sPI4HNn+Sn/0t7Umz4Jrjtb8FS3r4nXimopQg
         Lf8sS2czQSrdcz4vHOO8pZLyFRH4K3HJac00OPTbdneC516/wMWVZdTLvsSL7YLp566u
         Xv1dB3PkPjKxBJ4NAKwlVGSPtNfyhOqtZjjt0xUJCqSugOoo5/QVg7f1LLDUfeV7DFg1
         8zMA==
X-Forwarded-Encrypted: i=1; AL+hErFPKKYP0Qx2VCdqflrPT6Ir45mmQSEK4e4gzwYa0VUJbem7wny3xu8V19s7HxhxcbhEC6pZv9hckctjWAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z84tLiFNfdvJzW4N/e6Gk8AjyEkWu/64bcDkoSn6Z1gggsarqas
	4rOP02oeNUyOnp+Du4cwSsJHZbK+5MlaXzeg9FGm85cKTzK92UdN9linuzA5is1+eEIq8rkiuQu
	61xHfYH8Eg2pkMnHnhcR62HnPE4W+Etc=
X-Gm-Gg: AZFdTZdfxrh1iqFVM6nGtbd2/ecgqG9iuu1uw3lVHEVKywm4Z4m6gbNZ3rd5G7a4Dki
	Gi6Bv/TmSctXyUkVWfdl4sVQag9ltfoINnhx0xE8P3FjABYzQrQ0iYagsIKXz/3b8PbNLSOpJ/y
	hy9FbJS85DJohtwPdMG9WDPaPigbK0c04vw3Kq9eCeE5J9f+zsqAR2DpSVUt9sxMZNaAlXfymWW
	veudR0YrAA/Ow4q4q5cdMvtS2Iu+uPDIg8EcXOcMnGjgA1+Fwr69W7VOkrEAecLqgAcS5WEasyV
	VgQBRD3PSe35B6LtCMqHTmV32pa7P5Mgs5HQQeoCN01svszQn/o8T9gGUy67GRFCPsUNAbh6llu
	GTt5DtXEqScP7DB8UW/3qjrVjDlH6zt0MK+v+gxoqcWBoky3O/vnlbeI7qHsWowstXkcWhA==
X-Received: by 2002:a05:6402:4048:20b0:6b6:e857:19d8 with SMTP id
 4fb4d7f45d1cf-6ba37e69801mr1554757a12.10.1795176130876; Fri, 20 Nov 2026
 04:02:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-b4-ovl-containerized-sync-v7-0-54f45743fe55@toxicpanda.com>
 <CAOQ4uxhXTeTv_ydiQoq6-dvbw-ttFKkdNVUJanKmF6haSnbFWg@mail.gmail.com>
In-Reply-To: <CAOQ4uxhXTeTv_ydiQoq6-dvbw-ttFKkdNVUJanKmF6haSnbFWg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 13:01:58 +0100
X-Gm-Features: Aa3M54rz6j7Tjpjymbfp8C8fSyvFWnIM9Qg1tGNKh3Bsrszg_pg9YMNZMouy94Y
Message-ID: <CAOQ4uxgMO7DQVFwOsK2NTad2bwyktYr4fyeCEFWWVZK5pmqdAA@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] ovl: only sync what was written through the overlay
To: Josef Bacik <josef@toxicpanda.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
	Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chengguang Xu <charliecgxu@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 7:14=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, Nov 18, 2026 at 6:03=E2=80=AFPM Josef Bacik <josef@toxicpanda.com=
> wrote:
> >
> > v1: https://lore.kernel.org/all/20261027-b4-ovl-containerized-sync-v1-0=
-802e512379a6@toxicpanda.com/
> > v2: https://lore.kernel.org/all/20261029-b4-ovl-containerized-sync-v2-0=
-4e9f08e4a052@toxicpanda.com/
> > v3: https://lore.kernel.org/all/20261104-b4-ovl-containerized-sync-v3-0=
-8daa20144f53@toxicpanda.com/
> > v4: https://lore.kernel.org/all/20261106-b4-ovl-containerized-sync-v4-0=
-6ddde0b7dd8a@toxicpanda.com/
> > v5: https://lore.kernel.org/all/20261107-b4-ovl-containerized-sync-v5-0=
-d34b4ae57fdf@toxicpanda.com/
> > v6: https://lore.kernel.org/all/20261110-b4-ovl-containerized-sync-v6-0=
-43d1be16a4d6@toxicpanda.com/
> >
> > I've completely redesigned this, because there were so many problems
> > that I kept tripping over trying to maintain state between the upper an=
d
> > the lower inode. I'm not in love with this design either, but it's the
> > simplest. I'm hoping somebody spots something obvious and we can do it =
a
> > different way.
>

I assume that you asked your alter ego Claude this question, because it gav=
e me
some tips of how to do it differently.

I guess it depends on how you ask...

I asked for less complexity, easier to review, and keep the requirements
that syncfs duration remains low in the worst case.

I also asked to look at Chengguang's v12 work from 2020 which
I remembered was simpler to review, but had some problems:

https://lore.kernel.org/r/20200506095307.23742-1-cgxu519@mykernel.net/

I got a few suggestions that I liked:

1. Serialize syncfs calls with ovl s_sync_lock and use dirty list as v12 di=
d

One list for the tracked/dirty
local spliced list for syncfs
Which workload would it hurt? anything important?
Certainly won't matter for the unmount case that triggered this patch set.
Holding upper s_umount shared during the walk will remove complexity
around freeze of upper and reduces the 3 states to just one dirty/tracked s=
tate.
Less logic to reason about.

2. Replace inode references and shrinker with reclaim list

Only an evicted tracked an linked ovl_inode needs to be added to the
reclaim list and ihold the upper inode
syncfs synced the tracked list (no extra upper ref) and the reclaim
list (with extra upper ref)
This should get rid of the shrinker hooks

This is not simple but maybe a lesser evil than the shrinkers?
Not sure.

3. Try to gate more ovl_track_inode() in existing helpers

Similar to ovl_copyattr()
Many metadata modification already have to be gated by ovl_drop_write()
or the higher level ovl_{rename,link}_end()
we can add both old new to the rename helper
even make them scoped

I will wait for your feedback before diving into review of v7.

Thanks,
Amir.
