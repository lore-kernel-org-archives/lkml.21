Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527339;
	b=zpbobodHdEh6+9RqFQSFKiQX5ZRXjq2xd1c+K8cxdQsGXZ7rYQMdw+pAVUv5CZCs8Oa/
	 iKSKwISvHTY22Xiu57dhYs+a5xqY8CRAfgTv8ny7RpekUAvsGx/SKGOuFvC0WH3IEQ+bt
	 oFBD2zcWPjWfAfgbiUWopTs1+pPQ8EhG9mMnHN/MSj8T2we2wQip2KubHYqZQM6RehxdA
	 5C0IMTkDlEbKFGE0NBpBbQzwsMFNxP6mp8jTWDX5zsOxdtDmrXBEL5uLwTOLAOTD897VB
	 J6wTige220ikWbBP5PYHjDoGt32Zsy2Uv73L7a+DRCLVtBqIZCMlNdV+rIYHGx0SVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SlQLX7u1Me0NFtwAym0d5omjRG8dj5NZbOQLq3ePYHI=;
	b=T89PwkuMBct9rzZck1Bcxd8eqR5/CGcaMgKdA3a3AupGSxAfjvxZb/5cPYnWZxctvODc
	 pLYQKwLddxwY9JdI5dUI0UDhCzHxQIntrUkhansWsJdnjdGd9vRKg/84vm5MEZM/aKCx/
	 Zj/v3ErwsI+KDX5QHSpoh8FcjLj4hkJjUJLgAU7Q0XhO/Pxpn8kWwEtr/D1OwDUa+fKc0
	 rbTHXbYApTfBvSMgR8JV+7RZksJ1Yn/sC4ATFj2QNIODr7y4mkQIhNB30asUTS0lSw/On
	 Cf/kipuHcuQWWTnf5l0IlqNBwMWhjb/cNHdvJF97U7pD4if3SrGkxJXmk+Fzlsk8Ubw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Mh/AXREb";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC8606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FC8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Mh/AXREb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so30562985e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795527338; x=1796132138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SlQLX7u1Me0NFtwAym0d5omjRG8dj5NZbOQLq3ePYHI=;
        b=Mh/AXREbG1U7RIF+6X3VGuSkNAWZhoyGRI07gZPy7T+PtaFYPFMzvkCX2d9BBm/NY6
         +5zEDXBtu+tTmscJ2seQI8rRNJn18AkKAALC/wZH9qNpQgep9Lrot2gCSPLyvwxVMRuL
         jPSPIB+5p05ZUaiMHPT7VHMcSn0gBNilx0/Xr9igXYtRdwREGiBJ2fas7RLaorH2MF4y
         au3npKqc8iSpY9RObbHYwqJfo3PgL6Z61dM6VZBOFkwbeMqlnVLC7q/YYpEjhSYM1ko5
         nfMZumLFfLz2tiAA4H9fgt2oBiXe/vFR0VA835OymKGqCkWAq/0iqDer6XlgfGv2vExX
         O5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527338; x=1796132138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SlQLX7u1Me0NFtwAym0d5omjRG8dj5NZbOQLq3ePYHI=;
        b=SLX4DAzn5ktMzc9FmqvtwwV9nD5sccHNFAJ01u+rh0oC/UXVsZhxEJNWanqXGwAqr2
         y4qY/lHwb3qAnWYoEx1+XYerB7itkDocbyNgnhhUDd+Y+fqa6FOiAqqdW7hO3EEK64PU
         wbjJOYDibRG5Z+gL3ummW/b7IWfLCC8AIMGOLWgreqGLFumG352w385l15boV6gMkmfj
         pHC5HA2h4A2Mzd72F5oWlm3Y0TsHyboPfZj6mii8KMgVyEPe7g71WwXJMNPeX05cRFBc
         df9OBz88bJBh3ZseCHjRsxb9YmrkNuXc352KDdi46sxi1IS/FuPqJG/nu0vlDrcbGFVf
         Z/Ww==
X-Forwarded-Encrypted: i=1; AL+hErEVMb6lcqceSKwYp6KCQF0YLh4nTWrrph3xacbVH/NZOA6XoVWtG1rHsb9MRe8lEDXt0Ul6UYb6Ngzoh78=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JCA+E+01HkuEdgjGfmK6ZHrEWdYFAuknvA7pPjlAkguxNukTD
	jbaZNHPt+JVuMvwp64tz4hjbEikFh2V7/PRjwcaeqTR0aLt3FDJeip6seK/b1Bfo6/E=
X-Gm-Gg: AZFdTZdLQ93gzLn/ZXlCnURCP9C1L8A89K+wuMebwH9vx9DVjIX4HAEtX3WwtLO437g
	zGUXrMd2T/1ppZKr6n4X1Pq+hjbW6IhQufQ3OpYaZnPfmV4RPyOMlxPlbCMun619Lw5vbELBp51
	s3sS9IhCLFOPQAXFDkbXrURqppy48F8/YILsUhHSQsTUCgNPzOUsMz5BHtZHYtgKnDPgWDC4xCy
	G96x9kTceKyi1dIXmPMo7YdpNUGzxvgOFt0THxEdHpmhDNrQKTzVzyHmlVATadVKMjX4OAezVJb
	pP8+PyejYPbRf6nF0vo/RIrKY6/AmCx8Nr0VpNSxVP8g/3oBSKpl2HxIBMIvdR+YUe0p3of/Vxe
	xrP9CkaOlFWAYbL5pGcbEh9yw24dN+5Z1trBstzQwitkkYMYRJMAy1nLzV6FOrfiOK/hSnM624R
	h2LyXHBFrudpVy6sxs5Ucq9SmiY6pUOzjZ/XpsAMhd/IFcNR7vHER5m+LqxG5Qnnffd4I59Ra5f
	qAL0bf/0YDsIpD/xzxG0jPtBHgcfrenmIV2GLNg0OPpXdZalc0vFJCBnY4Be5k9JANAITt9IOOI
	ERXEcBRpcNZoJGPIs42fOJ923ES9Avw=
X-Received: by 2002:a05:600c:a15:b0:4b6:267a:dd6e with SMTP id 5b1f17b1804b1-4bb88938a62mr302562135e9.28.1795527337675;
        Tue, 24 Nov 2026 05:35:37 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm271922625e9.4.2026.11.24.05.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:35:37 -0800 (PST)
Date: Tue, 24 Nov 2026 14:35:35 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: jpoimboe@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	song@kernel.org, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] livepatch: clear internal flags at init
Message-ID: <awWSp422uOGwQ5Eo@pathway.suse.cz>
References: <20261123024000.15130-1-laoar.shao@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123024000.15130-1-laoar.shao@gmail.com>

On Mon 2026-11-23 10:40:00, Yafang Shao wrote:
> func->nop and obj->dynamic are internal flags. However, a patch module can
> set them in its static initializer and nothing validates that. The release
> path uses them to decide whether kfree() has to be called, so with such a
> patch the kernel ends up calling kfree() on memory it does not own.
> 
> Explicitly clear these flags during init to avoid that.
> 
> Suggested-by: Miroslav Benes <mbenes@suse.cz>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

It looks a bit ad-hoc to initialize these two internal flags and
not the others, e.g. obj->patched. But maybe the other flags
just get assigned a value later.

I could live with this:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Petr Mladek <pmladek@suse.com>

I am going to wait few more days for a possible feedback.
I will commit this patch by the end of this week unless
anyone complains.

Best Regards,
Petr
