Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996238;
	b=wOwDjH1mJ+8BEU1QHykZcYsjONZ3+MzRK8mdKHWPLRIRZDwvPg53cgHPvhtuctO1brwy
	 /ocp3736PVC21qk+FnglayFfCs9akPmc8cc8gkNjzK6viiqHJkpqPpjJwyNvpZbwUryiw
	 CyyTrmAxzV99T0pATdw5yq472NfAGGecuLCgMbvMvIlx43gU+w8JCcyG0aOAxKPd1XD2I
	 +sYL7eSLqPjdNRJQRp7ebq3qOeZyMBET2C7aU1nVdENFgAjqN+GPp1+4oqYoZyFWng/4A
	 Mgl0wKMTp5CHchn8KE+9iGJ9LXl5jOdym/rORLQrq5+rl8zoRqiATwZXlkzQSYxRYsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j+Y2FiNk9Wl9qy2Tngasbxd4q3UxkbbYUIzjyrrCkFc=;
	b=verYQZUp2L1FlifBJbTVZcNqb7Fd5ZObqKwmQHGEtTSqaALWFFJ/bMJ1R4Bupq6wdcGR
	 1ZptHmC1G93kjQExWBAzmJ186gqCYBIDB8tFTWNx0bx7OddOtdO1F5ziTG0rfMqv0Ojmg
	 nrx6KFEut5/KpW+xxMrBWzZNmvsOhoCxQyBh5i0pD04F2af9d3FjuKP7aaRS/r+ZZGTRc
	 XSTJv+fa/p1jS1xGg/YyzhysBGTOjQSZxQ+mLATp8OpyCCg/3iRIYkReGbxqBOi+ngDtj
	 POXWgj9sEbuKjHX8C6YFx/2466JDRhsXpnJdDmh3XQlH0FvKBZcYdQII5KmE8S+9n9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PjwvOV/H";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA13606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA13606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PjwvOV/H
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so4055955e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996237; x=1795601037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+Y2FiNk9Wl9qy2Tngasbxd4q3UxkbbYUIzjyrrCkFc=;
        b=PjwvOV/HB9EDAmJ0beGEqqeUTsLrkVZhdcux9SGuDKjQHS5B4RUgDr661ySi2v2Kwk
         gHvkIN6DsB80jYxUljZo6dl+OHc7Bsijpy5mbgqi31+5esopKrJ9HGYR4/xtWRUuWJMn
         i/lJBKM/QepPOrMeoJ6UHC9k3KwvliFRGGYZnElTKH+gcnv+bAqTExxdEI9K5vkmu+np
         lK/Iud4Vv2i3MnVNbPx4bQLeyUNbKclzrHyxf3mu4an7rsI9VMokDAMqdoGgJaTpqKbM
         xyo0J9JgVQNVADkNzzm5GXe5vWZXo0UVgkyNwzNO+NOFpkDgRMgrAtFpy01JTQ+G3M7j
         0Xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996237; x=1795601037;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+Y2FiNk9Wl9qy2Tngasbxd4q3UxkbbYUIzjyrrCkFc=;
        b=o0MtAKXHUbnXg9KasDYk8YFTdoYrGSTszUtwBBQtxYSJYsgQMisc3bofpq3NBvWxFI
         YWI6Gk5HqRgKVRnbhyahUZcgo9ROWoBFEqf7e5dZbp0yXVjwcY6IdBI46cUJrqowiDN0
         PTr7A5PNTt0rpg5KJGyiL/MNC/NzhfrRPWAenfxTqJnWyueyMBqt8ZHj45prK21cxikH
         ZXVOoKYJgyACbD+TxGq8Mf501PKN5f4oLH5beHR71Ah4hNl+391+e2XgJkenvb8fe7a3
         etohWnGGcon2p/apXQn4Ori8bSqUYQHcRHQlnF3nfMfFFw+b2WBzDYb1CzJbeRgDZW01
         V6JQ==
X-Forwarded-Encrypted: i=1; AL+hErHgNg0d4hxdhXeDO2JcvDLvHYTz8A90os2+3LKgJxnhRqHJ7/tIc+BPh6o1BSWtPlBE9H+SsX+yw+FLnho=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iBEmJGXnUwEVQDETRJkoTO78CeLqi9KaMXDKqDFkaEYikv0+p
	n8JNTsvaFOldsN2eIc0NAnnx6AZruiBPkWiy7rQdMEvBYJFz16/VTWqR
X-Gm-Gg: AYBFou0RBZcd1leLOLGeE/OBllJ1nr/A1atGRDkfz65O+WY5gfZcrhLSUz1tFRlj8d2
	AnNTNtmnspdLnSgQHB7duX/M6dRqDnbfXUam2lS5aemFpuGwuMQmrCvyNUtijfDssPQs5//cqN8
	4fZ6eaIpyQVWHZy/n9ShUU1j6eXqUOdlG06xA/v/Ou0lKJDeHobDRzkHJYMeU0wpCC0LuV0wPM7
	JUotFcCDXPYrJbhnavL4SuX/V2Bxpn0ZHQjy+BOOPfWYFLMe+fsQh5S+j3PzKwZDXqPkIK9+rgp
	W23sa9LXyoRswaz8QN6L+N1bS4HmamMo98saSqnw184Zf1dZOum/feu3YOX/iu4XAfHB2OjaJRO
	kM/mJuZIy9g6FkXZggH/gw5z+TnxBM4l9NkAhzTCZzNYP1okqk9z0T8Bx0Rk4MCInRh0M/FPhvX
	J+nmUvs5lqu1xptmJxb0kl5k/Wx7L20nh1Ob5oDmef/fYPAS+BIlXAx59hiGXKcUKoa0EWNj8Hl
	pIJGPI4MBbnFD9AIM69lZcxU3/iVFoXJn8TphJtYLaa42y5/1LRrs/YOdIvyI73s0hvzSSE82Ld
	365H7MOoS63I5p4NV6rupgWFwLkEpOaWrSmuNaOI4q4XS+EU8Og0CsZLOrVfu4FSSw==
X-Received: by 2002:a05:600c:800f:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb7da4ec63mr37351435e9.31.1794996236390;
        Wed, 18 Nov 2026 02:03:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm242389095e9.3.2026.11.18.02.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:03:55 -0800 (PST)
Date: Wed, 18 Nov 2026 10:03:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] sched/topology: Avoid unsequenced accesses to
 jiffies in sd_init()
Message-ID: <20261118100354.495fda73@pumpkin>
In-Reply-To: <CAKwvOd=9pjhCnreMvoAH_0PegYg60ouaZL=BAjB242bE48J23g@mail.gmail.com>
References: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org>
	<20261117183043.GK1813469@noisy.programming.kicks-ass.net>
	<CAKwvOd=9pjhCnreMvoAH_0PegYg60ouaZL=BAjB242bE48J23g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 10:39:15 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Tue, Nov 17, 2026 at 10:30=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> >
> > I don't speak enough C legal to actually understand the Changelog, but
> > the actual change seems daft. Is this really needed? =20

A better description might be saying something about ensuring the two
jiffies values are the same.
As coded they can be different with either larger.

> I would imagine a delta of the disassembly here before/after the
> change would make it more obvious (one less volatile access, which be
> have arbitrary ordering between initializing other members).
>=20
> But I guess I'm also curious why jiffies is defined as volatile
> anyway? I thought the usual guidance was to use
> cast-to-volatile-qualified pointer during access, rather than declare
> as volatile?

I'm sure that guidance was based on the fact that not all accesses needed
to be volatile.
But now the tools are getting picky and needing WRITE_ONCE() as well as
READ_ONCE() and bleating about plain accesses maybe it is less relevant.
So if all access have to be volatile why not make the variable volatile?

Doesn't this initialiser also generate 'really crap code'?
IIRC it is likely to generate an on-stack structure and then do a memcpy().

David
