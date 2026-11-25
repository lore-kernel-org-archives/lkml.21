Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795608355;
	b=wnO83fFHni1G6CZ893sGpqGA0Dwcb0DD55dhjJy4Prc/u4ET74Lrx0lrpsw2slJKUstk
	 xBOdYsDl5fQo2gETdZsQjig3JeB0MswK2Gw53C7p3wrXgv10PyYD84Kq5tXz3sbRwke0h
	 PgSFsy3aXWgbNdKmINFcp7uPOHdaLhleXJJEAWoIsgA0AXucmNf0ulZbLiGcJY9yCu3/D
	 kMOdIB8HTBOkOlVnP3GzFyvdJULEottjwdY5mAbbV8QSxE8PElDY4bc9N4V5AcWuZf5ZL
	 82M5U6Cd6kmOKOaSzx38OQAx6ZFSPtd5bf2bWqbOMBh6qUsKNN+vj847DgURdQnJGOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
	b=p91dRrQO8qi3SL0bPR2yFqsOkxY+NH82t1/dftzy0VIDUtsj2lIoM/yabuaFxI85AGvf
	 06KfpcC+ZO270rTvoYFf2ke4nzDtR3e7hr7/VLhOSZi/G7ScCVL3XcmtlH18Tcey/mgwm
	 Rxb7frglhSGXEarvMn87rsHqocQ/C5vNPexCTpWROEK5VQvaX1HVe8XBYohp1zc4I5pff
	 2E3NbcqNDeJjS8Carmg6BGJ12f+s5JRXm5S/L2DeQ98ghlUzanqG6eDJKNSXN9tLRhSi0
	 Tmzqe83N5pHAMcl2KZCjghzwFhX8Lmp0l8k2J3xyY7O55oqAItUzm3B5JyPh/7jWqgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pjX6QKXG;
	arc=fail smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7BB606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pjX6QKXG
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3247318f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795608353; cv=none;
        d=google.com; s=arc-20260327;
        b=Tp2/r5TmtBSBwWLNOiRuhkmhiNUcxCip93Pu3llyJMMo/0GrIqlMmufH0q/LKXQ7kU
         ufcOgp5wi273kb/5N+aIkIWd+47XwDnu91ltN52nx1zKCIlujw39HLFhzPOKJsdvxI1z
         WoSiAI+NprRyx6CC8+2KarLNlqMaRPheFYfCIJVLhujFYDOa9twgukwKw8Bmr3FG7Zcc
         /IL18Wi9oD4sIBxg4Ov/VxkN636HIsoAue1vMQsKIkmQXdqZxr5JZSXGySdOoZxanOrx
         Z7MQF4NBhHz6yc9wFQ9YpizJka8D/10kzZNmFViqK73/iqqEp2U6EdaIschhLh6pe+r1
         7hMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        fh=3BjFmYxK+MPy8lJH5tK9z8UTzplfpVqVVxzgpO7N/cY=;
        b=nJ/ZLmXuEXGKzrHOQUFvqa1F2RlyyL5358DHI8ySX6EQ2XmPxRhJGCnkd2m1BsgtRI
         Vv/oKKlgZM+m9PgL23x54Lq7L2mzNWAoWBgmCOds6EbtWhQDm9HddFpmDIQcqxh2yYNB
         kwHZm7N4Gd/h6ZGfYm2TsuTPPFnMqHA1bTupxvf1J5UBRdUgr/qzhmgXkbjwkSEOSirV
         OLinAF9EOe9MTOhTj8PljMl2tUPDgRNR1O5MTpHX+SXtUWIhd7BrBYfNGvQi7/KvcxQy
         M+btW5pZ7Dz2ViKEc/RAw7ks26h96HaKlhq9D0ueDWxrYdgW3aqJNy/CZqa9jxC4Z9w9
         0Jmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795608353; x=1796213153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        b=pjX6QKXG1IYWPuNjl0k+8QjE5ymS8vtEytzSOtJkfs1RHFY0DcWjq5Ki3RkEBzUwjr
         fET2ZoGdpDQVz76KNEMLQ3W3K4BGMAqGag+pH2GQDU8ylUe9pUwzC9r10veWdEZhjwFf
         RVfga+T1900YQda9M99rTh3z82hVG8MYmNK5nq6POAKh1DSNZmbD4OeZl4P7IG/ruDyt
         e1TOEFMvwZsON5XeNlcDp70bR/0lYIKov3PlwK+VAn9QLLQo52NE0o17/I7r1j3n+Sl6
         cxWNQuMvE0tun2uMMH4uMbUmrTM5cOVIjjaDXz8yjG8O7Vv5XfB7f3KvBmtBwISInZOY
         dL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608353; x=1796213153;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmpzCTGF7idKvkeds9ux4PCjDdw81921HPWjTxWauKM=;
        b=mex+tZiENQcbbDy4F3odOFL5mu3KxAqI/jRL1VaX4TYLzIg6BEWIzgfC/fbBcybMDz
         /IVcmdULGWxDMPyl7BRiT7r0HAyDhMJ564igvRrByAL35DoJJ10DjEDOvv3utJhjiFif
         LqZTU0VDmuDdQY+gIwoVDXOxYFPoxl+y6sbZAi0+1i+xMXNuwGH0cV/Dy2AR3J8MqoE0
         Aqbx/2dmJrBWgvkqOYkm2BYb/Fg6lhbYt3mevbekALeiKr68m/f525r546ydLGzIrO3p
         RWF7KlYLaWYp2w01WuWCwdoTi7bnGGwKa26ixdPdpODmfApuA0L67N98Mw6HPRsm540o
         3Jeg==
X-Forwarded-Encrypted: i=1; AL+hErE8NOmiX8hZ+8kVT42dk7W3X0iDrlX6Vrvp3JPkirONXHAQ7eFyzRAsehr0VsxPxfckGsroQVfY+S0/E1k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JmpxIAYy8z3wwJRI0bh8TIXaL1syWP4NLRu+mQlsES3DkDiVG
	9R18ecuiKkzdW/gS8vhkmM8l15iYXLKxA2bvL0iKYqbKzXQqXniVjvLuDNCQcIdoz8GpCbnF6u2
	iDe3f+FIGl5HidutyQWoCtqfFqmQ5qWaFGDHAS082
X-Gm-Gg: AZFdTZe8D2f5f9kpz7a4An+IGTkzw1R01sN7L/d8qmATT1HQoSWidUATPPqCiuP/zCQ
	8uHyAcooS+l/HB9sawMaRtVwpc9pPTGtJx8ddZ9inif4yYSYtyAqA1xWcKBOvV2wdm5H/umnroq
	0baytYCbiDbkZdX22ACjVmWeUdMQk/CRKv7HYhxb92fxEVpvpcGH9iLXzB48Y3D6A0Ahh2tMvYI
	VgngXmgqfHzwEbtEUIj+mAkUhIeEztImPpWX8YlqNioWJNeUL+U3itiTrY9ru5xmLifag2ZKVEE
	r9ydRfMNQ3vjFYaP0b2lHUta2djYM/HGuANROU4wlaKOBZgekj+KQWW3aeIGYB0FywA9oVjHu4c
	w2eqY5G0b2Pcwaij5cIMY03PwFqFLdRRzX2xzSLPJWlNA4ZG66MH5lWdHUK9CFfJllrEw6vWHti
	imnRGV81JjSF4k+FlK4iXwPZlz9LscHiZvP22fuQ2iT7J1
X-Received: by 2002:a05:6000:490a:b0:4b7:80c1:11bd with SMTP id
 ffacd0b85a97d-4b780c1127cmr8568730f8f.35.1795608352904; Wed, 25 Nov 2026
 04:05:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
 <20261118-ordered-wq-cancel-v1-1-916e01f9affe@google.com> <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
In-Reply-To: <2efd4eef27cbd033bae9e4f5d5ba30bb@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Nov 2026 12:05:38 +0000
X-Gm-Features: Aa3M54oB_Bc5JJabfyDqaJiI78UWC2_tVPgPCR0cvXKqYj-o-7hWp3ZKJEhfypQ
Message-ID: <CAH5fLgh7b7vFj4y7Pi-s2-4KuwUQg1C1HD6VdDTTkd+xRWaURg@mail.gmail.com>
Subject: Re: [PATCH 1/2] workqueue: fix cancel_work_sync() on ordered workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:29=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Alice.
>
> On Wed, Nov 18, 2026 at 05:09:51PM +0000, Alice Ryhl wrote:
> > +             if (unlikely(pwq->wq->flags & __WQ_ORDERED)) {
> > +                     struct pool_workqueue *oldest_pwq =3D
> > +                             list_first_or_null_rcu(&pwq->wq->pwqs,
> > +                                                    struct pool_workqu=
eue,
> > +                                                    pwqs_node);
> > +
> > +                     if (oldest_pwq)
> > +                             offq_pool =3D oldest_pwq->pool;
> > +             }
>
> @pwq still has @work queued on it here, so it's linked on wq->pwqs and th=
e
> list can't be empty. Maybe drop the NULL check? e.g.
>
>   if (unlikely(pwq->wq->flags & __WQ_ORDERED))
>         offq_pool =3D list_entry_rcu(pwq->wq->pwqs.next, struct pool_work=
queue,
>                                    pwqs_node)->pool;
>
> Thanks.

Updated!

While I have you, is there any chance you could look at
https://lore.kernel.org/all/20261119-rust-workqueue-v4-0-707c68994940@googl=
e.com/
?

If possible, once folks from the Rust side have reviewed it, I'd like
to land it through drm-rust-next together with the things that depend
on it.

Alice
