Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195861;
	b=QlNGeMFv8AIEiHaFFUogEJLCLr9UF9YcaCT/4VKFzhnu8BPNQaVVNEFmmSfEtTW7T47J
	 l6iBhQrjjvletWZShpVLIS/yee1jmzS73K8DFz4RDbOUgZBGeK0bUrcJ8E+Dk4eV2LvAU
	 2sreTuO1ZaBr27VP4RPz5moDo/iLSCW4qGnMTglUu/awXeMO5xrXKcMMH60oIZpZruwp1
	 E4gvPiqqPjKV+LbEBKLaG1uDo2iSbSgBKSiFlJh2qLb6N5zqDDtugqBCVZ31FauTGPJA5
	 Njx26Lzv0bo6bQyjru0zKHrEZ3+ERET7liUtT21F+r6JDfua0nQL0Uw+uij+8yuIypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195861;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ktVUBt0SgA21/go1jQ1Ztwg+0qzh3ORMwImoqmt31D0=;
	b=dG5EYbZcu5AODGZYy0/q8tWGx3OjLtrLcHZs51igo+EejuDiBABdhmjoDvmnnrTHcVKs
	 bDGY81F8yERiL7cQ3Tg65c4awe94tbb6URKJVvdfNBfDBhoU3hrknQqkHhLukq2TgvL/q
	 MfFGn1CpvsH+Q13BSjT0WkE3KDOfbSUVvO+jidT8XMQuoMsWAd6vM76SmC8gy0uB7stZw
	 8Q/TL4V+jpfr5bkPmNDAdUP4cJw3EC4AuAhLi3vk1uI0ExdmBe9TzhQ97bB5qroAMgzWl
	 EDLoVeDtoEoQS56VpvyGAveDK9+UTa70rZqLGO5Ut31ewYZKDC4Q1FiwoBQkWF+sjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9IU407c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DBB60A2615
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I9IU407c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5C31F00ADF
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195860;
	bh=ktVUBt0SgA21/go1jQ1Ztwg+0qzh3ORMwImoqmt31D0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=I9IU407cBOhW9pGnof4ZzFjoqWHpzPMbyDeH3k3NkDQvGqbgwwaaXUwVjsBBy+XUi
	 s6EDB7O6dLABmrJgftkV92ZovP9vtdNbyug1KG/MUL/Sors+4j9oEqYf/9Z300gwj8
	 7smwXRDj3VfrxUzci3M11XQuUGFmDHfI0JT+1uPejapFKK5dMjzex5QyYRf1tPdB4k
	 NeJ1yG/b7G9A1sU8BplWNPLFih4Jsguq9n7ZixwIAH44jQo0d46qp5P/etB1wQDJID
	 95+pKlOyLZVH4RwYTIqL7cIm9gphhYmTsc3kfYR22kTePe0UcA8/LfnLq1U+R+Qmt6
	 PVi7aeqUjTpyg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so713049e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:31:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGHIYNV31AnJ2YYB8kwTLeo0cuxefMygP0MHntOEEzgDi52sRYiMQbQEkfnZqnMsxze+93vk8XkkU4xfZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ys75j36qqX4/pryE+SvEutWH+DqxL5NtUIBdUCQYwne7IRayX
	oU0eRj6+daifexcoOu59cMVmntkvBhZshs4RuRZUSsVXpFh9C2OmCswITo/z0oNn8+iJbny0de5
	CnXeimsM5/S4h316HoGRI4L+0IXvz3fo=
X-Received: by 2002:a05:6512:3d14:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1bc660a0dmr1344617e87.5.1795195858912; Fri, 20 Nov 2026
 09:30:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115003113.1852160-2-wusamuel@google.com> <09C404BB-5914-4658-801E-4DADD3411CF2@linux.dev>
In-Reply-To: <09C404BB-5914-4658-801E-4DADD3411CF2@linux.dev>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 18:30:46 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0h-EFQi48VLv4zqgPWR7Gp79WAV4WXrA=vKpnoMQs+AWg@mail.gmail.com>
X-Gm-Features: Aa3M54o1T8MqVs-2VBz8UCNLyu51S6hF_xM7U086eBEKIimWtJ2SwhIJqetgYFM
Message-ID: <CAJZ5v0h-EFQi48VLv4zqgPWR7Gp79WAV4WXrA=vKpnoMQs+AWg@mail.gmail.com>
Subject: Re: [PATCH] freezer: Check frozen() before freezing() in freeze_task()
To: Bradley Morgan <bradley.morgan@linux.dev>, wusamuel@google.com
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, pavel@kernel.org, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 1:50=E2=80=AFAM Bradley Morgan <bradley.morgan@linu=
x.dev> wrote:
>
> On 15 November 2026 00:31:14 GMT, Samuel Wu <wusamuel@google.com> wrote:
> >During the freeze stage of suspend, there are multiple passes over the
> >same list of tasks. Each pass tries to freeze non-frozen tasks, meaning
> >that the number of frozen tasks increase monotonically, and that each
> >subsequent pass will mostly be iterating over frozen tasks. Therefore,
> >it is faster to *first* check that a task is frozen before other checks,
> >especially since the frozen check is computationally trivial.
> >
> >Check frozen(p) before !freezing(p) to short circuit the more expensive
> >freezing_slow_path() calls, while retaining identical return semantics.
> >
> >On a v7.3 Pixel 9 device, this consistently reduces freeze_processes
> >latency by ~10% (~4.5 ms).
>
> 7.3 PIXEL 9??? WHAT HOW? THE BASE ON STOCK IS 6.12!!!! WOW! (Please do fo=
r
> pixel 7, I want flair :c)
>
> >
> >Signed-off-by: Samuel Wu <wusamuel@google.com>
> >---
> > kernel/freezer.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/kernel/freezer.c b/kernel/freezer.c
> >index a76bf957fb32..1adf09321389 100644
> >--- a/kernel/freezer.c
> >+++ b/kernel/freezer.c
> >@@ -166,7 +166,7 @@ bool freeze_task(struct task_struct *p)
> >       unsigned long flags;
> >
> >       spin_lock_irqsave(&freezer_lock, flags);
> >-      if (!freezing(p) || frozen(p) || __freeze_task(p)) {
> >+      if (frozen(p) || !freezing(p) || __freeze_task(p)) {
> >               spin_unlock_irqrestore(&freezer_lock, flags);
> >               return false;
> >       }
>
> Good good.
>
> Reviewed-by: Bradley Morgan <bradley.morgan@linux.dev>

Applied as 7.5 material, thanks!
