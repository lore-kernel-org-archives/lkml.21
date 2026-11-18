Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795022581;
	b=tTx8LO8YZnpGnPm3QqEA0rR85NPC5fy3g5gWzIcNP0TXxbscaGtrNBzoBSGD0tKIpALr
	 NE59PMAqRD+IAx35ufaqqtJllBF/vBJhipnGTBrOQVSovob0XSSroT/0vqzuuQK97mMuT
	 H1/pcIJyUwhg6R1rnmdoOnAj/Z33ZFvi5d/hAx9oc/qhaTf9HshQx4EV73sawTDL2LqRO
	 VKOg8z+yuwvyPBl8HWsi3JE9zo8+fQmu/MDEdOhmdzzHHa8yoo4eQ+1g6GVkNKftqowvh
	 EAgzcdxZmarOSCYFxHccXAs7LgUnUHKEc1JWXVC2VjFi+CraN+OWrTXXsTNQbN0MHRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hr9tBdlxksiE7w5kDLSfOmMBcgj7vh5+dzRbJRJhNaY=;
	b=VnZYiwwJoUQqJIUmMaowLF2NvvQE0bv4gIefmWdJchJdOjb2tstezv2BuOHOcvbk56mU
	 B+jx9SGptC/Bc/sm4uDWSKHigkDroLqJ0xrsvEF0JZWmxxazQcsJ3XNBQTjHSrYOLM6rC
	 Hj6nl/6DUfPffwgeTCjVjzomwL40a9AdVIMGaq2QSWMiMFNdSjEdJSP2axr/Dob5LH+h3
	 14U9ma27sQPq5uH7d0q5oEMrajig3IJzRtIYlNFBfpGwTo/E2/2uRlmS5vGv0W9a7TOG0
	 /13GQgWK84wgR9csjmFVOIZDCj9lZvJSAeX5VXWywnoQHxUu902yqPLM1uk37SjgNbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gc7gZBgL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FCD606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FCD606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Gc7gZBgL
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c511cdd5a82so94379466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795022579; cv=none;
        d=google.com; s=arc-20260327;
        b=DD29iKE+cZCfyxBYGQ3Z+dPPwIGH+odk6svxvcFO8ehchL4/1KylNUUlOiL3+/TFf6
         LzglhV6EAH7U/UsvJor/K2xXpjoSqB617fYGT/Lnur/ZCNyV61/c2beigwHDIvaShhSC
         r4K+d7Q5z58SQ9AHcNeBuQTs2aAgObqmzO/Z14Zw3vd/pnfYIaz/+UHmmxwaojjupZpa
         sh0HavvQZ8m5uAT6sSXsAYAG7tbDG+t3R5dEzN6j6ROtOdxbC5KLYYms1BIvd4aZ71xE
         Ed7HYBq5Rv0QhMEklnloYPMt/QC5f5j/ZP+a3JUB26XseGaBGJCLF1t0e2He1JCglx2C
         I4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hr9tBdlxksiE7w5kDLSfOmMBcgj7vh5+dzRbJRJhNaY=;
        fh=wqpym5wdywHKX1k4LfSuYEIgziUVveNNjJlYs87qQ4Q=;
        b=JcuX4OlgStSw21yBedDlajDnD5UjApzMg3mxsp5McfZvhN9RCPy5roFXzVlo0nydv7
         HvamzED2LNYREvikVBhGngesJtodeMjJcEFDAywgnJ2S6YUALc7CE+id5B+0SB4yH3L5
         z2u58rVy2mqfB1n9Q639SoFyHxQR+6sVuVoZ+zf34VhDoSMBL7XSTiG+N5GMfkmFosFs
         iOkjuWocwr0+7PLcuRWxJHOdBY6cj4xXXDFxZHF2dO0uFB4xJvq2IyF2b8FiZ6R9J8RV
         z0zbKjrZDTTkLUHY9QqSSHBTX6JNVky9MZcPsz5QNuSOr+xoBePZ/FeOh29JI2Geewn9
         oUCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795022579; x=1795627379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hr9tBdlxksiE7w5kDLSfOmMBcgj7vh5+dzRbJRJhNaY=;
        b=Gc7gZBgL1EDwwf0/GMFcmdOJO7C3d54EbPc4Bv8dx7LQlzW0BZjc1GIDajfY/ySLl8
         WT5+kg1DmoO6UPNa4RgH+QiK9v5eylRz624FfNSxt7CtZpX4w1WHTUUbJysmt+R346iD
         SHcOeZXvJpGWyMUAx1yWRc25LTRkA9f93Wh1AGoZXDmBAHVeM94d9R+zVODw2nPHWqwW
         J1xDSlKZCxxXdhik4hoKjYhKtVBXLhzq1kO+msEeWOlne80dmxEi31QdGlbWKI3dzYP/
         dWum9oGuQ/2B/Hq1tDjiLRk3+tRyrSrRKlwLzgt3OpEHYcHpzCofcBDYPrKrEg2rIKav
         w5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022579; x=1795627379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hr9tBdlxksiE7w5kDLSfOmMBcgj7vh5+dzRbJRJhNaY=;
        b=fJeplEE/7WjeWmQLpzRlaieitVGOftXF6P0yw5zSrWrXSMASep8ioBf2y/+gYOZqjC
         8GOKdAssEeDgsG9Fw+1lTK3KHMr0MdnCHQlHddfgkNpiDyAtXiNLyTys7k6VX9b10gBS
         2dp+tz93v4iATq/1MOMCftzYNvYx5GsUEj0YH0JPwTedbKRz33kFd6j5a51JcBQoLgId
         75MEJdew3P/Irp2zl0QgocRBPbus9WbFLtJ51p2Gk6wSJ3RfAKJ5Z1XuoW7aGj/dVMIv
         p3sv7XrOoCYQy5f3B0UQgnMq8TlrkaY0S8wv9I1bkh5VbzuEs03nv2SNeIuDlkxti9zm
         izhw==
X-Gm-Message-State: APuU4Z+ZYA23L1FzeB50dwgLDliSSTGCy59aJJCXsY7rcgeooRIa5u+V
	AfHTvTHxsMIxCXBy4xL6hi7/fKQs9zpAgsIrDxNx/f/aXAjcd3SsLbdZqSo4PwqT7YcVEmjGWbq
	bVL7UyMBJ8EFaIWHmmrQv8YL198ZClietWB/q6qKOSQ==
X-Gm-Gg: AYBFou3WZu+Yg+sivGvgPD1a8EVL5dq4zC6W8RiC5xidnI5i6KJ0PdQa2akAvGgzKA2
	SY70v+yeaG6v8ik1gZxCaejEuDC+9e1sYguBAui7PCoE0oriW38PNeGyG5ysk6hjAMRvIobaDv5
	KvxZDpf3QCAiJazkLm8bp8A9i+5dryoHVZVucZdN2lViDEfYIHBV0jAsbrXwteA4whD6MAZ7FpC
	TKTNeBR88dZkefUo+rleu4YOc/jTfqU1UgTCPZuxeL/SyA3blr1mqHTUdbRb7QbK9vlm7QoVT6I
	oDidaNiMQlKDDo3QIwQQUl8OPMytbcqQDEpRznSepoBlNQh16xfkFdzWQAPW8FOP7pQ4Lt7aLe+
	yrN26//XrON7TEqhHPQwtyLMqxlKIi7BqQnhFE/ZpFcsEOOWsBcUQIk0T5J6PvyAPFklgaA==
X-Received: by 2002:a17:907:2d08:b0:c41:cf68:bbcf with SMTP id
 a640c23a62f3a-c510e4c7b01mr317537466b.32.1795022579424; Wed, 18 Nov 2026
 09:22:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116155051.157875-1-marco.crivellari@suse.com> <fbc6c2e5da2565f97889b836d9852843@kernel.org>
In-Reply-To: <fbc6c2e5da2565f97889b836d9852843@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 18 Nov 2026 18:22:00 +0100
X-Gm-Features: AclHuK_xedhoLcZtLJV5rWmU3nAQB8dqCaWiiBmt-0Mte0CjR8SQ78xKlwBm8vI
Message-ID: <CAAofZF7FoqYT4Oj-xMaMnCtqppJciqVfZbOVwxz44Tq98eZdsQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] workqueue: Make WQ_UNBOUND the default behavior
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:06=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> > Marco Crivellari (2):
> >   workqueue: Make alloc_workqueue() unbound by default
> >   workqueue: doc: Update WQ_UNBOUND and WQ_BH documentation
>
> Applied 1-2 to wq/for-7.5.

Thanks Tejun!

--=20

Marco Crivellari

SUSE Labs
