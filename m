Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170428;
	b=mVwFT8APesQ/mrr97kBKTmUdOPECgdCbu+oZFdEYVWFUXpeW58PQ8HGVJG7XMHQmm6gO
	 muBi7AQKaqA3QRvFqB983Ngt00KjxDz7AnnQnpg4RZmQ2/OQVIoBjEFtjYFlF4IoiavdM
	 mQNt4Ei7aRf+Le1KCMLvJricsCaSAemFivjXWPGnMzpe5oSYnxebNYwkzO69M7+2iiPau
	 lhOF/aNC+9xtdWG8OlQgtceQaL3w2C/mdpgt+r5nqOg6KyOjRXNA6QkPUH+law7ch/VPY
	 94gDB0sLoCdnglxzaSDnuYIV8LE8+AwQ1+y0m0UrCHkGNuEA+3+ugXmm1pr0oiixiDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170428;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+fhxoC5HAmR9uJTZaj2gRaeX8sSvkb3SLkNQM5R5BU4=;
	b=oA2g210j9N5URzlGIl59QD8WQeNQg9FpqFqH0mTTbGVA6XsxfZBsxuGoOE4ctdNx4rI7
	 owF/MfytiwZbrX+qXmeSHSp+uxTSzwxTz1l5ZT1UFU1PXXeesI+LnCE5gPKOyqWeY+P1z
	 uV92ZMgvbnv0Wi/WDjNiAfyF9ysgcDptBL0rSdyM8QpEC+zhjV+RBLF0FBQaYrWCW+jAM
	 VfnA3ceNF4TuEAraHsssSfD7IxXEJJaMpGqNtSucP0vVNO7XtODLRGFubz/uKpOM6/nHs
	 7FkoLGt7OzTbHohYFDypt1ikjTD+ipOuhM1tGRL0Hg5lUJYEsiWLCQ+TrSdP6KzvF5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B84ixxfP;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B03606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B03606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B84ixxfP
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4af52002471so874615e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795170426; x=1795775226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fhxoC5HAmR9uJTZaj2gRaeX8sSvkb3SLkNQM5R5BU4=;
        b=B84ixxfPwNl6sA8d/5pyPbnajutxf/jbb5R457y9SSL2GMd8YE/5YyybZxiNJ3N3hF
         cU4nb/1FFX0oKcx6yW1TAwlYGcMTSDJCEGF1UDlrRvgi9qKjT9Qc071BJjnwrR58Ximx
         Yiz08DnfVTpCZf+KVRMTMNjcxL9TCEUNsL6rtivdvYpa3IbxPFLAkW74mWU6u+u2PxcB
         GXusjkx/If/ZfF4YvD0Qm6SYG1ghk374wkdinmWPXDuUQBUvGcplTQiutdEQKY8Fh293
         OozlP/gFYMba62hMFIAU3RcPC40JfVJo0qVqfl2f27iG26atJNZ7X3WugmftOkeJ09x4
         SU7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170426; x=1795775226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fhxoC5HAmR9uJTZaj2gRaeX8sSvkb3SLkNQM5R5BU4=;
        b=nHpz2IBWjOYKydDX8F5PREa+LFJ4MLEPFr6ecdjsv1khPlcMv+WWLX7zdRjbMR7DTP
         1mZ5w0UWB1qsL3Gi5Xj20I60xCgKyKYAKbwzw6aZ0pyTR8NVb8/U2oOXTnHw2ji/DZHi
         meYeOnyXRqPvTftA0160etpbF0yEecL9eja8FKIvBiQjsRO1Dz3ZO7kRfsi3lGdYcH2L
         Svxqz1ob9wG0/VXix92vskRz2ydyloPuLMnISLzXFo9+U2FltJKVrUJww9nkHKka2D4q
         rNwAoJm3HlUZXf/iS/Wp1onQiFf0ju5PcptJLJydluGJfXmfJc7pbOIUb1WrirtjfG36
         Strw==
X-Forwarded-Encrypted: i=1; AL+hErGMB8OzXa62T/7Swhn7lQ9nklX/9HWXOhUA0UC7RJs0+6OkDPQsAaVBuxeNL9aDGrTyqzfIfU68aDSUW2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WeeH6i6/SgGeMhIK7BhHNkn6U37Xjb/rJoj6uWSnqfIAWpFnp
	zeEH8rdXFuMuImZXy9svHHhpRRfYbxfsQlWuVy20TtoiUP++y3zcuA3f
X-Gm-Gg: AYBFou3am72Kd0E0u0BHkzznJyOJvgCY1KdZKjQZYvP0SG567AsiJAlL7gGdWsDhYQy
	83z/JK5wBdvc0j6Sg6z2d9MjGvdbjHr7qhFsJDGMpMHUXOrehZABHNOTsjSUTdSemc6DqtznBB9
	rJTWLZvscskdDUBU8K2nfoDTJd5TSR0WMl/HW9M25m8NDZNrUHuon0geeyun/nPJc0+aPVS2vqW
	KiIaIuYAWJ8N5bvn+M/M4elSAQ9Bm1/+P0K54jWBBLzS0KtWLbi7WoWiJOLq4bGctkyHpirtdvp
	91GuE/Aos/P8Y8Fv9Ayk8w+MY0FGcfhq8DyGHUvCR0OEsuq+8e2Yu8ndpcPd4YpYvHEOTUBYns1
	ev4s6sq34tx/LtdCDvg0+FHFxAU/iKOoAMGVlHPuj95ZTyL6z/DYklKJQpOk8qUrmCVAMxgY5tJ
	qfLASPX0nRz2vQgYIQROvvLiG6DLrGo5FKXoeaCp3t3tCCZozICpgTQz5tGgCQSR8MprFihbQ1c
	nsOq5NoT6sJoULFXu5iTpald33CmpAPBz/WulFdmU/wpC2UFDFcEngolRY/0nZ8Z0ZZH6lOzeug
	TmIUI4ZasubSS/kKbNYlWAimGQtSHgHVXqrmlcosjYICrKwDKWmNCLR0
X-Received: by 2002:a05:600c:8a18:b0:4bb:7ad9:301f with SMTP id 5b1f17b1804b1-4bb88806505mr43367455e9.2.1795170426019;
        Fri, 20 Nov 2026 02:27:06 -0800 (PST)
Received: from scheduler.schedules ([85.100.65.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f66e1sm28286465e9.0.2026.11.20.02.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:27:05 -0800 (PST)
Date: Fri, 20 Nov 2026 13:27:02 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Always clear se->exec_start when migrated
Message-ID: <awAajVOu5t80Z0QM@scheduler.schedules>
References: <20261120095819.1009260-1-vincent.guittot@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120095819.1009260-1-vincent.guittot@linaro.org>

Hi Vincent!

On Fri, Nov 20, 2026 at 10:58:19AM +0100, Vincent Guittot wrote:
> Make sure that se->exec_start is always cleared when task migrates even
> when migrating on a throttled cfs.

Don't this needs a Fixes tag?

> 
> And remove useless clear of group_entities which can't migrate

Also wouldn't it would be better to specify a path on the commit message
that se->exec_start doesn't gets cleared and that causes problems?

My brain is not working with 5 hours of sleep :/.
Sorry for my english.

Cheers,

Kayra

