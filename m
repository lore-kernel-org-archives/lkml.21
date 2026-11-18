Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960826;
	b=tAkvHkj8L5jaw4Ezi0mvCLDEv1VRzCAaUH85i/onqKWnjOC3s2EeQPd1PlG6pr5HUVG2
	 bVEZZKlRajQSaOYT84+zWhyGsWSelSGWMvDhe2tpk0LQrB9m1XSBaYja+mGelGkRq+Ps4
	 ja5HbxYxl2Uc+rL16iNhxrDzUo4mhDwjeXG3ZxSmMwsq68ytDY/F7N6Fv86DJO1omZsuz
	 q7uub51l2GTMr6FDvh+o7Sr3FHPEwXE7bvm+oEggBCPppw+6oiwQP+rQtswWdkuvop6j0
	 5oXK5Qy2/BL7Zydy1hJN4U/bmuSwfTttcgLslivsdGYJDs76VCvbzx5Xb+Pi/TwXzHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=zjqK1ZKqoTJgPH+MFlEIuxyYmJgHMciHIUmqwesN1rM=;
	b=lf6ImZ7oNt4R489f8eTjMAsp88C/Vh9L4TJWVSvHxcFl+WqpaSLtmA+mucElF4kPh/pW
	 SaNHChEAUA/b9IeCRIXMmNgrKxc0XI2jl2jHcRrOB8c5LoZJ6jGC4Jshn2pqyDG9mikQ9
	 LsIKi2NcqyF1Ehtmt18s79COeGEfEDiO0cWtgGK3swGOI828FZ7wNHA9o83Wy45Ampytn
	 Nw62NX7aQlCzMyOT8ZcHhDum+oce06EVf/XBONBrAHgVDsCQHac0V28uEapwmZa1MQ9j2
	 H68DA2Ry5gMx9k52df55zDy8JYVWNq6ctntPOYm+LDoETEATePrhMxNYvbwVG85fdLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A0vuMCN0;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8911606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8911606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A0vuMCN0
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so644497eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794960825; x=1795565625; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zjqK1ZKqoTJgPH+MFlEIuxyYmJgHMciHIUmqwesN1rM=;
        b=A0vuMCN0ONpOU0y0oJ/JSjwikoQFUpfzrwqnozXXlqygpXDcRKA865b0Lxkb58H5qi
         V11PDIkTQ9mA5PlAkMx4BR6Xgg1+v/3lvvbyEpAQ/iPgnYGRL1uWYW8Yw3s/zJMY6I9/
         opO9gM34Qi1xH/TAEMPgsB5A5jn6Rz3O0ngBI/KjbN6Sdu3EXg3ojcnz7obYWR4P6NjA
         lamUYIduh/ULj/4x41WArkaameLN0v7HgNei1I82Rq90V/KG3zal0sESe/vknshhbmRR
         NwCC4YZ3vDUO/YbodqvlNPh/ae2+FFtX4hfAjJvyBSWbKloA8i5RtPQVXEjA4ZHSmml5
         lRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960825; x=1795565625;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjqK1ZKqoTJgPH+MFlEIuxyYmJgHMciHIUmqwesN1rM=;
        b=uC2TDYgbqdPhKN13ipvYhfa94tQv+3JXNkeRQkNEVJlZggfz6gu4Nib/Vqx7rpf3v1
         Qu8dnyLiQtWh8+IRFqR+xVBWRSIYCnEE+sr32ay6Q0AWb0syWl2+pAVSrhxQGFj74Zh/
         yep+aVQ1V6oXCzlpTd5VVUufnn5WoMFM+GZ+3ZXvyezML8gjpL+Va68SvE4rRZc1OZ81
         1vNGd5cOt8JEtLnXi2dVhjqYIBla+oY+zKyQHVsz60miDWtdf/qTWDE4tMmBb6zO+hgE
         b8z6lg7akw8EHGdMNk3AXXKF23W+moGmw6sEtCSrj15QXkuhXZZcWdku2/Sza2DDxllA
         8JxA==
X-Forwarded-Encrypted: i=1; AL+hErGjijYcTJlwJBOvm9a5xE6sK5287r6/myjdzlKtPoPPLwt1ex79VWUic6ed7q7WQ4yHjZ4SG1j99rajPUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0A+Juf4Q+VipIRqpZJXUJvLskl2lCLGoVtI8DMCN0RS98T4fO
	MMQTZGAqCtVMPj8+FHo01JvnbLunpWT7SxtCQdnCEfAuLhPKW1zP2zH4ixgqJf6EbutV0BYIeIK
	i1tid+06gMXGLssIg5TwSei0brLkogQ==
X-Received: from dycjq7.prod.google.com ([2002:a05:7301:5807:b0:35d:1771:4816])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2291:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3828083e1e0mr821168eec.19.1794960824542;
 Tue, 17 Nov 2026 16:13:44 -0800 (PST)
Date: Wed, 18 Nov 2026 00:13:43 GMT
In-Reply-To: <avVVRYkIAQnLC_Yu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com> <avVVRYkIAQnLC_Yu@google.com>
Message-ID: <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 2:58 PM Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
>
> On (26/11/05 16:53), Chris Wiseman wrote:
> [..]
> > Maybe we go with Nhat's idea (CONFIG_ZSMALLOC_SHRINKER defaulting to
> > ZSWAP_DEFAULT_ON) for now, and if zswap adds a proactive compact knob
> > later we can just kill the shrinker?
>
> Sounds good to me (on the zram side).

Thanks Sergey.  Xueyuan, are you still planning to send the 2-patch
series (CONFIG_ZSMALLOC_SHRINKER + unlocked zs_can_compact() pre-check),
or want me to spin and post it?

Yosry / Nhat - any objection to starting with CONFIG_ZSMALLOC_SHRINKER
defaulting to ZSWAP_DEFAULT_ON so zram users can turn it off right away
while we decide whether to drop the shrinker completely?
