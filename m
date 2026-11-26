Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686589;
	b=hfvTKhjF8ngOqNrZb/Jv7agnA72lRKLng6e2aQQRhL8OKsu5DEaI8x2gKlDhQq3g7bUV
	 c9ddCmPg+LKYLZ7iXpHXlm9N0Q6GOfkBRUyYr7It+t0ZmyEYwAGwLzQVe/mjZ703bBjy5
	 w/rL3Oo+uXpOFVMu2jt5g++NyPsXvcblG8y3eGIUkVAjWZ0Y6W1f3+utfLaWrmQguqH2t
	 XBOUU51ndW2MNJ72Y5NbYDL7Hr1vOW0kdQ6TJzyVbDkrEWq1/k8/JLW3/Dj16xqchbfW2
	 WR0It+OWoCtJtGXD93p05v6cHRZdKpEwwRTkRL0MEVWHMjHrhmUWTz2EqW52ezRfp7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686589;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=GNrgKTXTrOFzDhPgeYf03Ncje4wZ/Zh1NZKNX0O4g38=;
	b=2uPku84z5ygrRaZeBnx+HXZu6qby1v74yOTfVMx0xaluRDYqxhfb6KFNJ0CTByuvHoo3
	 LilqFPouMuGSbHxznwREuds/Q0cg1uBWY3d2gYSAwLPLbD8S+U2rCdYRuI/SDxJO6KU5m
	 xAUalLptLBnZAyr619nawng/tZNKaefAwlebGbvoS0ysSfOLTt0S2Sj+zKe0pU1x1oyfd
	 xqWErTKWEapukDCUBs4b1fXiwMg4zsbfnlU9hhqxe0m4Jn+3VXkJx8gbSyozn4Ih0cJpX
	 BL87v5DwEm8ItHOYGEaCOe1HBmyGrmV1DU5l5TGeLTTw5f9i49WGLnfyC86S3IIvI/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A85t6mWX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nu0tiS4o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65C3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A85t6mWX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nu0tiS4o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GNrgKTXTrOFzDhPgeYf03Ncje4wZ/Zh1NZKNX0O4g38=;
	b=A85t6mWX+soxOk2ZvVvs0IVuwPe0rk0fHTqvJD1gVBVrkapTv3soWaOfmmvt7VhPYUHquZ
	XGyL2v7lW6nd3KBgBAzkeP8t+ss+6K1cRqpE6NFB0tq2g9ci1A+ttdwNy3HWV8i4Dob70x
	GBQlMnxIaMttmX8o4/Oj+H8P54JANIM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-2qHyYQiDOISZs37ksXLDkQ-1; Thu, 26 Nov 2026 09:49:39 +0000
X-MC-Unique: 2qHyYQiDOISZs37ksXLDkQ-1
X-Mimecast-MFC-AGG-ID: 2qHyYQiDOISZs37ksXLDkQ_1795686579
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so86883187b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:49:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795686579; cv=none;
        d=google.com; s=arc-20260327;
        b=FTlGcX4L4KpiCEXzoqogIw5ZNX5+mUOyAUL6h0j0FOjl8HyjBd4LGbBa8UqE7gy4XA
         MpnLBhQi2BXPuAtWwUXTTOohUxy7jypf2E9eB0hsRiOJ++62lsgL8MsRnQ9TZBQkmlfu
         5oBgDQiiPzNv08Ut726JqAFIQNCYUw/8huHXqU9FRICMQqp+ZgAXmKXooUinkv9GEjdr
         EZGVn20+UzDIyaascULQ30s/60Gb3GbE5Z68ql72lCI1EvLc5/3KDRQlIVZK04PDejrp
         kn/WoNzOtSaXj8ArY1ncLj9r/VqYTSuA+xnUrpZhBVWyx5bjFS1UJP0jWD0ZLI9pIftS
         2vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GNrgKTXTrOFzDhPgeYf03Ncje4wZ/Zh1NZKNX0O4g38=;
        fh=HEyI0oMiYD2vVtw63ZqNEdwSfqkGC1rdlBh8I5fbTCw=;
        b=HqndOPAk1DFhoJF5guhntrVn2QNw65E2mltcAiEw6XSZXuLvazmmHwlS/bDgKhWIeI
         Bg7zfvx2rp83jYU1YO7TCRZjc3u3GRFHlccFqMdQ1p1N+Dz3idFKXcZs0CvVEsm1zYtj
         658yazvhImVJ0z4FMhJMhwxTU3DXF/zoLafW2/aGZVvvD3Smq8R+5NgLJpZON8Ia6PTX
         PO6DCyK79MU2JUoK/UZGbmjNv5Gw74aWtENazcNXztBpWjsPIOgReLBfDdy2bAMdENlr
         In1+/x+MXSPP4604eP5n7T2CxU2VyrZi/kn0glrKmFxNkWx4+yY8OOaLrWT0/DWw14Oj
         f+sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795686579; x=1796291379; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GNrgKTXTrOFzDhPgeYf03Ncje4wZ/Zh1NZKNX0O4g38=;
        b=nu0tiS4oYUqkmQThR783q8O0nB7tU1BqwBA+laChw1cNfjE8I5oC8ERK+0CINw7i79
         BnlKkX23iwZgD9Kk0NzlD1nc8Wg7mzlYTMe1FrUHL4WPj0hRHMU3zqVvhnL13HlouY6i
         0VcXq+GY1/p14knr+fQolSpjSr7YQPnZDtab8XBAjvxHNHjzM3t4Rs4SL8KUVw2hdEAe
         xP8QxkqueDucJ6W6wmd3Gcijzc22yfOKmy8ziw47thb7IYzRt4mcDzdKVsgnI3YzhNN4
         qnx9Gp6XjxhruR1fIetUhGsvCZqoFDfNeovJZVP8IMSKNMwP/In030GGiEvRgVZZAUs8
         +Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686579; x=1796291379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GNrgKTXTrOFzDhPgeYf03Ncje4wZ/Zh1NZKNX0O4g38=;
        b=owx7epHU6/oOEQ+TnAk28fiS49QFhgE94+ctthfCddUQEetGi3hrRBY/7wg+gwI0sP
         S+B8iHAGYBgCddL5WVSnAVn8zxC2v+TVYN56Ly6GlpPwt5WpqHdxueCWkbGTHbsYslTE
         GGXpE0Jm3G8tNF1TwbwmrfZj4qaI9NBDkzAXeavjtWJCZgAssHsaI5mrn5215j+nzbWa
         I+jwkRRJKrpqpgwVEUSDeyE7RsnH9iTaUZwt3vg+Dwh9sEnfke1Yv8LyPJlzTsbsSX2k
         oyT9Cpa8/1bHc+CI+7wEgguVHiQW7XrFbSiboXz6WKLcq9kt4yzRHvkZScWr7nMcwD9A
         7SoA==
X-Forwarded-Encrypted: i=1; AL+hErEHumjqAp4x2aIfoF09qTDeAJJyPlQtKug0fLe/aHnZOTmL0pjj5szXaNWe3CD7WNdYU+awCilG2PaXSIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sKXJu9kJLO6SeS3ZN2lJ9zWWtUZ31bodmxM0zQL7LcRqXKoDV
	azGvfTHXbhFDql+Icr7FHHwfT6yFviqfTE8lnT8V6cVWhEFcZiN5M+0SM+rJ/BYv+DZhBKUm9Om
	v3tDQfaBE1SBoUVUFE+K6+7qM2+KvWO6Ef+59CwmrPLYu6ivR4DxjkFXQEqvYoGgFZhuUhoOr+t
	JPL6q2gDtKVWWjODLBeOTTgxX+ZuBhE+Hax/cIRRXLPdEqjXY+tkSuhQ==
X-Gm-Gg: AZFdTZfRhJyogKw7gkzeGrSIRiupWpcgrtSxYqfLgy6Kw+0DTtVU2srVNTZstVR3AVa
	RnxxusvDEz3gh6gHWsZs/EbmDxpQWFP7/lNro9Y+TM373EZHGfj8YbslQN8Ty3MJI/HZE+uk3KX
	yXit0WXIyPuRqSv0uSjMbszTKhQF9KWiJSXUIbIINkP5gJhEVp86KRM45C1hTKDRSRFhXREnJUW
	q2Vuhfg9C1m3CO+Cx7MQNxrDKG8natQ9MiwJXtcxBKo6w==
X-Received: by 2002:a05:690c:9986:b0:8b4:c71b:e4d6 with SMTP id 00721157ae682-8b5204b4e2dmr82175037b3.35.1795686579010;
        Thu, 26 Nov 2026 01:49:39 -0800 (PST)
X-Received: by 2002:a05:690c:9986:b0:8b4:c71b:e4d6 with SMTP id
 00721157ae682-8b5204b4e2dmr82174937b3.35.1795686578546; Thu, 26 Nov 2026
 01:49:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125175007.3659558-1-hengyul@cs.unc.edu> <20261125185332.2549812-1-agruenba@redhat.com>
 <20261126032826.4156477-1-hengyul@cs.unc.edu>
In-Reply-To: <20261126032826.4156477-1-hengyul@cs.unc.edu>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 26 Nov 2026 10:49:26 +0100
X-Gm-Features: Aa3M54pOdvxu5XUY1DJw0M0cDCzeBZYAQTrBCHj1-4qHVGgpDIiPEkW5-yGupmc
Message-ID: <CAHc6FU7MnFrA8E6OyvOk8WwiiozCT4=QPjne7ftoLq_n7dOmYw@mail.gmail.com>
Subject: Re: [PATCH] gfs2: restart rename when a signal interrupts the glock wait
To: Hengyu Liang <hengyul@cs.unc.edu>
Cc: gfs2@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 04:28, Hengyu Liang <hengyul@cs.unc.edu> wrote:
> Hi Andreas,
>
> On Wed, 25 Nov 2026 at 19:53, Andreas Gruenbacher <agruenba@redhat.com> wrote:
> > Why not make gfs2_glock_async_wait() non-interruptible instead?
> > Something like the below should work.
>
> That is better, thanks.
>
> There is one problem in the sketch:
>
> >                       prepare_to_wait(waitq[i], wait + i, TASK_INTERRUPTIBLE);
> >               if (!glocks_pending(num_gh, ghs))
> >                       break;
> > -             if (signal_pending(current)) {
> > +             ret = schedule_timeout_killable(ret);
>
> schedule_timeout_killable() sets the task state to TASK_KILLABLE again
> after glocks_pending() has been checked. If the last pending glock is
> granted between the check and that point, the wakeup sets the task to
> TASK_RUNNING and removes the wait entry, and then the state is
> overwritten. The task then sleeps until the timeout expires. It does
> not hang, but the rename waits for the rest of the timeout.
>
> I would pass TASK_KILLABLE to prepare_to_wait() and keep
> schedule_timeout():
>
>         for (;;) {
>                 for (i = 0; i < num_gh; i++)
>                         prepare_to_wait(waitq[i], wait + i, TASK_KILLABLE);
>                 if (!glocks_pending(num_gh, ghs))
>                         break;
>                 if (fatal_signal_pending(current)) {
>                         ret = -EINTR;
>                         break;
>                 }
>                 ret = schedule_timeout(ret);
>                 if (!glocks_pending(num_gh, ghs))
>                         break;
>                 if (!ret) {
>                         ret = -ESTALE; /* request timed out. */
>                         break;
>                 }
>         }
>
> The back-off sleep would be schedule_timeout_killable() followed by
> fatal_signal_pending(), as in your sketch.
>
> I tested this version on gfs2 for-next with lock_nolock, KASAN and
> lockdep. The mv reproducer from the patch moves all 12000 files, and no
> rename fails with EINTR under SA_RESTART handlers, handlers without
> SA_RESTART, or stop / continue. SIGKILL and SIGTERM still end a rename,
> and fsck.gfs2 is clean afterwards.
>
> If that is fine with you, I will send a v2 like this with your
> Suggested-by.

Yes, that sounds good.

Thanks,
Andreas

