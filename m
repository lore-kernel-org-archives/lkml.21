Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538094;
	b=srKGhOxfMEBwvGGj7MocHJl7Y346aW2RXcMMoRQxi98FvrBc2chuRN1Bf1WoqSeBf1kV
	 aX76UHeim9UkZ66tG6osgZWHyTDWCxg5sxeMC9b3rLi/c8x/1R/HtcPV1ne9B/uKxEX9c
	 7Vs2CE45GdLZnlNuE8JteScxg+owVe7LRs1sVMwympahjhpUGeCFs5H5mMKZneBOiZheY
	 08aUiHIQYu+sx3Ea88tT5o/59MgoUwgFNTF+NyRb/zvVYW57865ffZwiuzzph6CHCOibo
	 /BqBbdY3fyUhnb9aWS8z7qFEvCcYm5X72f/Hp2cQDKygZ6B7dVmR5LiyKYhAqquNkFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kl1lMLuqhZH+LLqHtJT6QI0oIm+dpJplZfZi0YBu//s=;
	b=iqtGnkQGzKEGptDPEIsj6se66HKXzmrPLkP4eVzFhES1N8T6so91BnGa2tx5thTVeYnA
	 r9dAC8FZ6sBSVgvQfZ4o9AxTswAJ836HTZsZXY90VVeXqQPie0cEpM2rHxwZ9gwD/e7Us
	 nzNUnZC0wHzFxjge0im7yNFmwezeiRJ6VevW73ZZ/MHsa5H5Rv2qQJo/QRdEGkzS3UPhR
	 8F16o4TH6yi1xSJF8daqCBode+E9CAa8HTrqW7WkHuhxqYTsKSnqxBrcvB5wiqmdAwXso
	 u/PJ0ypcpiaQr0dik75C1lL308uh3BGB+zrQnQEtQL1UUIy4uNSIFuM1nFcSmX47q9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TTfD3o0B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE584606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE584606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TTfD3o0B
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-533202fe429so948381cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538093; cv=none;
        d=google.com; s=arc-20260327;
        b=jtOVlUQa3NdKCpwefbTKawozGFcqbYJer8H0JPLPK/KHpMEqn5XnTU+MLbJT7NoTIo
         4MinAaNSeXqziBhG6Mlvr7NJFyk7biJCyeau0X2SfVt03squQ6aHW4MxH93atj6sRZ+8
         T7oHDtrZ6keMBWoalbZFZb37z2haur3FhuT32aywvm8Ei3ePz7GOVxZ3uEnxgDR6gxEQ
         /OVJUbtmOByd5RXmcmc69S7nUIomxhxy37ttnANhrZPMxd55O/P7vHfBOMcqUV5rzBaC
         vatCNDifdsCcmCjYSb1dYZAcSS4T+HemtDVOnbJGhmIQHfGJ8xXrGlwNDHJiftw7+ASd
         ADgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kl1lMLuqhZH+LLqHtJT6QI0oIm+dpJplZfZi0YBu//s=;
        fh=dfE5nxy3I9/nJWdzt+I+jgSkwtPfglUxQ6GBQ1nXxp4=;
        b=feWezTuaK8vI9I1IOjX+Ak1gJbtYkgXulHhnQxcux6vkgwV/igEIO/Eb4GLzyWz861
         fBYGRd5bWh+dFVmWCSXpkOq/2yxGYRRrvIJhzn+V5wDl0OapJRd6Q6Txy32VR5mAvshc
         vINGAfotqZhMDl7GSHxytYed8W3oA0rICm+gdwYcjtpqtNhvv4awb6Jbg0ROc0jsv9IR
         hmo0Z0KHbMdAEjwkFaMla+nkeKHnJNna3f08VGbB9I9dFio3ncSMm7sGax9h8orroi7J
         WyvteYSgkxx06H23p5dzUJsRLYMzXQUzEX0EX6J3DTv8nmnKI6p9iWZUl8Iof3V5A29m
         nC7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795538093; x=1796142893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kl1lMLuqhZH+LLqHtJT6QI0oIm+dpJplZfZi0YBu//s=;
        b=TTfD3o0BLhOt6X12nwfcIRGVYb9Tg6G0UpEGPt06nCVhs3EsfF9sZRAiyiYtMmlDXs
         va/lM5ylYAkLE9JrjT9aBh8u9um5C/Aiabv/RVXBEvh4Ry6uz+n/mZKLchIW0wUwUKJf
         S9lnaf8ctnqeRyWRpCOysIX/jW/XAWDNMPOVjhTASxwjsn2JDkamO6yA+In3FFPD3s4t
         z8mybQii4457OpqE1phzL3POgdHqbEuIgmYlDo3X5wbXm4mzhtOQCV3r3AeXrvd8P0Dp
         +jkirTLgTpgytyL9hge009KHT5Sd3nlecoLqnplQ4NsT9QWnl5SZEi4TZ3KbNaYdUqX5
         GJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538093; x=1796142893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kl1lMLuqhZH+LLqHtJT6QI0oIm+dpJplZfZi0YBu//s=;
        b=kk4to6fZarq0bZKNcgMSsMt2emhvUVRuLICON/e+w4NtUBm1xRO6cginzK8TwujnaJ
         hTXYFysQ1f6sXj+aoyT5doVJEyHIiPFEXDWllzVKHmoA9/DF7bzoiqopscdxm9P+S5nM
         Xx1GZcN/C/8trdaSDIKUiIVUl8E2W8OEzxf2ek8mf7cLIObhZbcIzgZZsEGfTYw829xo
         gqI4Q1tqBQEhHDUF6tBTLn25vc3NDGCBoaIhvoR93D9EzEPewLk26SOECvwuQfGRD9w3
         dyxNzm/B35vfsA2rKRIfcf658zTURxj/0HtxvFgenQbaDRGuhXyf9X6k3i3FNbmJUpIa
         0ymw==
X-Forwarded-Encrypted: i=1; AL+hErE3CcALo4sT3M2H1PQsI9XT+XC1sJy/+YDgDLhG9nBiAribvtrVFoati8CRQjL7FLMh8azI7LjGQp/WUfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZHVnUWXjilj5+zSKhy8JFgUBQ2lAvCNrduGJo6aeyUuQKK1sP
	4IQvb+esq18kUTDpuDwkE79U7Nlf3TodZhop6P9GBRha0TW5eTJvlYmMMnX7kxIV/Ahe6xS+ufx
	SIGUmsY+qcVTJ38rLdALU/BdpIvRp5fNa7I3EhMjs
X-Gm-Gg: AZFdTZdEi+nJtTEHhPsDUknoQSY/OlDF5Ri1a9EvOf4UxggMSfX5rZql6/Rl1NQjwmp
	bcg6o9xuiaZeiHyHKRNsfmhbOYVx8Kkuuto9Avm28a1JMtE7j4ZjhglHX5aCp7MrxHkzOn/NjkW
	A8L0eJpxHXJQ012JqSVU9jMy/NUTPdJptzmmm/CTzNrejESpEqjub/116xVYtd+QwNai0n2lmuc
	QH9hZcQPCxQEfnRYazLQ9pRk+g2kyip5+9+JwjsDoGbis8yH9fX61iAzN7corQx4vp89yQ9fkyt
	SUsmJgnSG+iIuq/AvQYjcTu6mAvbf5fehhNsAJ65HQ6ckoJXXoQETFN21AhJPV1a2u/6QxQQTh2
	XKImgDs5MG/lZWOuyihlr38TD7fbD4DU+S/kr8BMf+M7RgEayZvXoFGyClz9+u1EXtvit1bi6R7
	v5WA4E+4EXNWk/zEZDEsd1dVsPDOc=
X-Received: by 2002:a05:622a:5c13:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-55d88102d7dmr59797711cf.3.1795538092021; Tue, 24 Nov 2026
 08:34:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-vma-read-lock-mmdrop-async-v1-1-257f99f551de@kernel.org>
 <awWLCZ-jBjSD7V3M@pedro-suse.tail5790ac.ts.net> <CAJuCfpGk6eYK43Unxo+O4ML5=GM_siZ9owp6oa9fO0ipZXVg-g@mail.gmail.com>
 <CAJuCfpEd1rz3P7fB7W_mHkyzbpq9TscRE+QNwvHdYME=WJj6cw@mail.gmail.com>
 <awWz3nc_b8x3mIXq@gremlin> <CANk7y0gAxY18Ew+6j5YsqrOsf5Dx+v5M78r7_8JLXh5RHZj4qA@mail.gmail.com>
In-Reply-To: <CANk7y0gAxY18Ew+6j5YsqrOsf5Dx+v5M78r7_8JLXh5RHZj4qA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Nov 2026 08:34:40 -0800
X-Gm-Features: Aa3M54psUndAWw1N5lTEQVLz0Ca1-n1kspbSD8lWK-ihjsexo1mFnquPILpy9Cs
Message-ID: <CAJuCfpFuDCUPTUi3SuAhmbtw5tubRZ0+YEY3PotjyJ8Or8pdQQ@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: drop mm asynchronously in vma_start_read()
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Kees Cook <kees@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jann Horn <jannh@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Chris Mason <mason@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 8:06=E2=80=AFAM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> On Tue, Nov 24, 2026 at 9:28=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel=
.org> wrote:
> >
> > On Tue, Nov 24, 2026 at 07:51:42AM -0800, Suren Baghdasaryan wrote:
> > > Actually, VMAs are allocated from a SLAB_TYPESAFE_BY_RCU slub. With
> > > that RCU unlocking move you don't need other_mm copy and the comment
> > > that comes with it. VMA won't be freed until RCU lock is dropped.
> >
> > Yeah but they can be reassigned? They won't be _freed_ until a grace pe=
riod but
> > they can go back to the slab and then allocated elsewhere  right?
> >
>
> Yes, they can go back to the slab and become a different VMA.

Yeah, you are right about that. So, we either have to keep the RCU
unlock in place to keep other_mm comment valid (my personal
preference) or update the comment next to other_mm to explain the new
reason it is needed. Either way is fine with me.
