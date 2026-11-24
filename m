Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536364;
	b=fKFEBhJIHIym5nhOuIVlaGivaFxVb/aaPv0QX2I438J0j95a1e/CpHipoVSlerI1rTpP
	 sQdJ77joNrYie9VVEHnJoTmmkF6Vh1h0edTfxBsb4RPgl8SWDESai+IHx2/V7QI1FCJbe
	 Z4eRUYlgTmeJ6FXo7lQRYOYE9PHkeHw0O8SL2MNpYxGJ5TvjIuteJtVR3MB9Y2Pn7fGqD
	 oAuQOQHBS8jfTqGu/Gas0d/2ipf572c0xBBCeBU5guImmDG7OkYgRvegSylV9hMHdaYDy
	 z83WiXMN02kqK7pCvWBIWq4jLtLJM/0rqV6BArJx8TDuhWOI3fuR3G1WzrjBFTLRnpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i+X1zAbocrlZ5/LLPdVPcXdnhobUDrydqC0c9bKACg4=;
	b=B74dU5Qjz6+0PpaBfw8a6rsdbMnQk6MooMUoayUkMA8NR/oAURjKTTpMCOth9io6aH6K
	 pj2ioQODnTBr5B6xCpggzfbR337w008SdkgO9EaiH1egliVvV9CJ3lbRWGnpGIFjFOrIb
	 Z27Tl0uQETy3JUfLJTi/cBT9IN9N4MNis+tJZ6B9TKdDcivefR8H4G3ar2D3TXLK+2PcP
	 v3UJAVgREYl2Lnarjw2TKYnsD2Am9z3IEiIOAt6vqZ5tl6TF9ehUjgOHzVRdKRBViuJjx
	 Hq7wo7ukm4CdR9vDlEFQ6PfT5EoYKe7EuflKhoPHahYvzootqCxjTIHeRM6i8lo5Wzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/NXh2oE";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F9606A335
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4F9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/NXh2oE
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so4142761a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:06:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795536362; cv=none;
        d=google.com; s=arc-20260327;
        b=PTWMLG4ifWjFltjf8sLQOvskWcA4rq4q1vacfF8YqHJAiNJGsMZgTldKoSt+NsQlL2
         Bdjgnkyydks69SRffpbJaDIlkgfIczwBzVVbfPFJxxAzp71PKVf6mfUE0MWx+iCmg/Fh
         GM3yKot8ncauN3Pcse1zdmBo/QNA7sai1pZOwtvQhQcRdv3yek/hM0ALbRwMhC4xCJ81
         0b7OReFp4R1shmg58o2susCpgEbK3uPz7WqyCfctpx4k1h4lTVie6FRCBj2sjsntW1uZ
         VKHMkeJuHZPB3SIDWJ9byz0YCrUqpdQpeawjgB25qV9xm2GX1pA5JNw2nXwFPUpwQsJV
         4fCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i+X1zAbocrlZ5/LLPdVPcXdnhobUDrydqC0c9bKACg4=;
        fh=P3nz9zd6MG3y8uxcv99NRl2jNFOTVJLp2I6gf47HDpc=;
        b=dV8lv9zV/LDSHD0TtmHHnNAj2N2J1jjsUWdB6f5pVE/q7n3Wz0ODKf96MmS0Ep3TBZ
         MBUKePADhh+O9mavv2Dm2IbZ3ErzGiOGy77r1QAXjs+CpR+tshCrW5Utfi0EqZoy0rwy
         7PozZ18g4/Sz547PtqdVvKhT0JmNURZ8mLWSDo6c2DdCxYjHYYl58Vh5s4hew/WH3f2g
         rIYSbW/FmqpXrIcEKdF6LzKqThnlKs2TqRlrkF6Pt63J82YX5ZLVvVyFgTKZswAiePK1
         VzSFWEuCsf2SradEvUPUIl7kr+7Fw9SjHE4msDIzPYZZDoCSwMS2xqVtK29YuISwtaNY
         qMmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536362; x=1796141162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+X1zAbocrlZ5/LLPdVPcXdnhobUDrydqC0c9bKACg4=;
        b=E/NXh2oE2nEKSp1Nk9q/YlLPFggcAo4/RYF34vpQXstWnUL0v9VAbvpcmp70EeBgRn
         f2BF2jCWaA6bR9UN9EbZhPArzSmequgjr85BP6axfLkoDByL2qJCOW4VTUsIEsSfL2Nc
         TvwGUu8yW2CsGVHAMadwAwe8lxOiepnODue8PfCUkQmOVjnAofnNBX/ZtMaZyKark1Ow
         aF1bEwFqlKnP4bdaiVJWN4uVX3KqbQ+i1nWK57JbtB8lnUyGdTofAuhyGbPuCoC6mUk6
         I9y81VSMSAAVSUB/yIk6pqj8o9M8SKaUGemsg4aNAixUxGGz9k0DHm6ck4NpFQ3YVzhH
         VGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536362; x=1796141162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+X1zAbocrlZ5/LLPdVPcXdnhobUDrydqC0c9bKACg4=;
        b=vRDQczY94M7LinZD41p/zXbDK71NirgRCPDO3/ddXeIiYbO8ssq9TQau8PKGLpyS73
         oSeTVloqmFACFLaSgybo2qOBfje93mhpay7OJZ8gdNDyzUsSEg0tfWzZnZJJ/GVKK72k
         wCs/EbOTYUuPBiWxIBPNYpneq9zBuo/jXOmdkhw3uIeo4oXcb0CPXBQtxcrD5uw+hw/+
         5t08l7NWfwQicCn6RFfPgnOiLAKeUSQx69gCBEbTh6h9ol/V0Wl+KSQ0itYQyjZF9jjj
         7hvzhac+51hfZs53kwL4QmY5Mq73kpPe/sjBOD0ZafMNn3U9AFugiQZloaF3SBSSbTZL
         l1oQ==
X-Forwarded-Encrypted: i=1; AL+hErHK64bzlT7HfOezfwpXcCasP3vLNyuiMl9eGVlccyHHYObdxOSs8a9bcWfkcr5JDHAIsNJGdRMCIFu+q+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z++sp4U18QzoB152HCUqojZMtI70z7M1htgFiCBufoiXhghEIzw
	sOZ+ZDNE0Hc7ifTnCg52ZKYC0NFBYbZdQgwtGSnYCyoqP3tTnYb4pAL1fxLk4oSxWmUzEOz0tVC
	kJLQjKInQV2EuIoMrJXlZvVGGcuGCntw=
X-Gm-Gg: AZFdTZdQkoTxsdhzSheBaMhl+mMtHxsyenqwYuLy+CRBjldgX2jtbl3FyOnAwf4EYT6
	gdbsDU400vwJG14vgIMUqTD8MPiRoO+Bk4TUDXj9euOyuSkOSOADWJjzKvVCgabiHPyvFiNVA4w
	Tte0gTU2Pga+ylUjj9MOwtTONoBt78zevlK0ws9+0/wnTF2dVKr7nwGPqzAW/ygSmDY7P2qJbu7
	Vws4ggUFTiyRtS8SmbfnY//lB2HnoHpaav+OXUoF06rlDviqsqMUQM9F28rTDd3ktdwNvvFxtVu
	7MchfAhP2Ck8q413l6XPg7GWzzEBrJF9R2rnfqGnm7E2zyh2jVqYr9EchPx1Aq42W1ImLcIH0jL
	m2ubdzFKWE8wVk72YBMw2ldD7pQiXwMRDQDA=
X-Received: by 2002:aa7:d1c8:0:b0:6b7:37bf:13bf with SMTP id
 4fb4d7f45d1cf-6ba1fadf982mr9292482a12.4.1795536362117; Tue, 24 Nov 2026
 08:06:02 -0800 (PST)
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
 <CAJuCfpEd1rz3P7fB7W_mHkyzbpq9TscRE+QNwvHdYME=WJj6cw@mail.gmail.com> <awWz3nc_b8x3mIXq@gremlin>
In-Reply-To: <awWz3nc_b8x3mIXq@gremlin>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 24 Nov 2026 21:35:50 +0530
X-Gm-Features: Aa3M54pSMtL_EaeBSS6GmhvCgL293XFN6RiH4uS7LjK9j2GLa6vMCzrMZ8KZVJQ
Message-ID: <CANk7y0gAxY18Ew+6j5YsqrOsf5Dx+v5M78r7_8JLXh5RHZj4qA@mail.gmail.com>
Subject: Re: [PATCH] mm/vma: drop mm asynchronously in vma_start_read()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Pedro Falcato <pfalcato@suse.de>, Ingo Molnar <mingo@redhat.com>, 
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

On Tue, Nov 24, 2026 at 9:28=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> On Tue, Nov 24, 2026 at 07:51:42AM -0800, Suren Baghdasaryan wrote:
> > Actually, VMAs are allocated from a SLAB_TYPESAFE_BY_RCU slub. With
> > that RCU unlocking move you don't need other_mm copy and the comment
> > that comes with it. VMA won't be freed until RCU lock is dropped.
>
> Yeah but they can be reassigned? They won't be _freed_ until a grace peri=
od but
> they can go back to the slab and then allocated elsewhere  right?
>

Yes, they can go back to the slab and become a different VMA.
