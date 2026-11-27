Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807105;
	b=KAoW+mOMDULztXO1UpDQUE4R7gpQN2B0FvDXZZbN80alQ22immXB9LBPaxqmQxwk7l5h
	 Q4jwFht6Utc+e33Ufu8ANyNsBxklAS7weiIeAQUPWLJQmWhWhQQhzFsCVH5c4BO8ziVPq
	 X1R2rZz5+5CQkDnA6cYLqH6rAyEwM9N/oniyJdna74bPAqczwt+irHmk4JUruNjVFhKW+
	 OS5BgKRPqF+H/LAf/CPuu8L1RBhPdV3mAKubjiFY39oII3UdVVzWiBr9kpoNEmXUvQntG
	 Ys+Nll3abQaRFH1MKEcS0+3XWSuuS74ivI4TbI+qfmfS/fvSLWDoGcB0EZNj8s1tt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
	b=MKXhLDeDtLoGtwRhlRaFJ/0fgpj835m30PU2uvQ27LGrItu2QlVZXnyBjOeTc+MkUQL/
	 tHNygliS6e5M/BOSs/9NzK33crGlnEhFYjtcRkNCyPi2lWuDtyzsWhUmZh1QZueLC7iD6
	 X3GasVwxPx2QhEXwmFD9xkRdYKXS0OgkryiWmBSklF8t6fuB9DWHTF/+SMHjMWoYmOt1i
	 bJg/WJYiw+E7Ue1BGYO/dE/7hzgTQT+OuNIqR87S5pkzO+/YF4feqwuLW5Pxbj3KWAS4S
	 4ZV66DVznWL/PXuuibqxlIzD+PpnpxIYuKfke8210oX+7vWxC9/mwDF98QH784b/TLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Au2hPQjf;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FD9606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8FD9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Au2hPQjf
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-94960131b30so745439985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795807104; x=1796411904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=Au2hPQjfRRLKqpzLdUlS4qTuMZfutWDMs3nxeZ6kBFtz5N2Xk2LtgNA1S5U0oOtM1F
         pUH04r+cU6kZ0kDgUOxrstM7z2Im5gAyxPSe4aD83cFjmAwAj+Fkxac12C/8nN6ofeLR
         MFElkoYfleQYMRT7phF4+sDQ9A/GDPgp08AagWSlO9SiwrCyijC940FqmwCDAQns8SPF
         vr8fSP2KNc3B6d+8S0JwcH7uT18lonZeGkS87z1MJOqJgxKlovDuQgZgrTINI217fher
         UuRXmrGlqd2cTXfhETi+BHgGNRW6PAqgPj4iVvWnFYjeFdjgAOpMLRYBPKKqoDP1GfuD
         ymIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807104; x=1796411904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=PRUZH8LdN4W5uM8HSvxa5wQRtbGuG+u56n92domyEVanBtTlO48egOiHeUlx7grcTd
         LnQmqALFDcYo7o8fGC96qHNnq855gQNlUHnuEd+PvzwA8xCzpmyXfkkaXYjkipONayBa
         ys0MVsE3vFxI4htk5Oy9FoBz6Yktv/s409Hdx2B8e3+PkuM0UAeIqSa3eb3jh0CdmWGb
         J4IgiN3AGzLZU0MsjiGnv5lZFNR+QZBsABVK2qOgcivLVQoQIMYGJAxIyYF5t4mEoJ0Z
         F2As4zaoSm2D9b94k5sEKEwGLdMJVbHVdPQNgnVNTzZ/+n0J3jvdGJ7/9RAxsy6YnLyf
         Rq6Q==
X-Forwarded-Encrypted: i=1; AL+hErEpWR16QJJKBEXeGOUM2PuxDRJaY0ktg3uiQL+yUOYQVTP/fOyIjnarWwdTutqvvfe0nU4rEddaTwwbT0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z85wi6JkInZmHTfhaxL9oVVY5VvSIgA7/gyP9VVqrciywCAEimN
	eKNlvvLezG/srMXqGe3aMLyEffBuZomcQUPbOLsXIYefAsdsK7CVu2B8V9yZTbiSskM=
X-Gm-Gg: AZFdTZdRjgnOUSj/+Hw2Zi0sgtiUaJapdWqsXnaxfCQnyUXkY99Mzu15JMGiDxOJnV+
	pQlcES97BZGtwRxcRSpEva/P655ZAbjbmr7R9/8b/yvFPuq3YprC69fJjHixKzlq2qdWDA1GfQO
	idLQGfNzEADwWXzssppMc7b+6AE8oRINbtAKErxzcxywmgKFNSjg/xLjQOOSCEiORKMaFucSeh4
	cwzfVSXdZfg/c3YcOH+qFwWI3shPEbbVfm4M/dueuMLCZkoXe5jH5C2ArScg4pluwGeRPTkycVQ
	zKq42axaXaH6vakyioWAp0SdMBoj4BFK1OVLIXH9jiWwOLqKwVjdPmz56+43HtHOqiTjUACsMm1
	sjVC96g9fEo35J4npeHX5TCMGt3jHFrFQBbuMOYQAd33Car4sg8YQs5tD0ERJORLWsbDCd7ENXL
	30ZdN7VvY87nCIN5GC+Ax7Owrt3vyCs0LT/kB3gvjF1PtpYG1y294BYCqdUEvbY+aKXy4I4riI4
	l27LyvK5jCYTDX/MeYEUpmZ6R++v0Gsat1NsBeBQOMxC0KK9cgEZO86db+YjUzPBc6XGdyVn8BJ
	tro5xg==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4395559985a.49.1795807103939;
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm1867466985a.38.2026.11.27.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX1Sg-00000007nGK-3YSV;
	Fri, 27 Nov 2026 15:18:22 -0400
Date: Fri, 27 Nov 2026 15:18:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127191822.GA1856591@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
 <20261127183550.GV246011@ziepe.ca>
 <awnV5S703Rgf5sh5@e129823.arm.com>
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
In-Reply-To: <awnV5S703Rgf5sh5@e129823.arm.com>

On Fri, Nov 27, 2026 at 07:11:33PM +0000, Yeoreum Yun wrote:
> I think the problem is the *max-token-size* could be changed.
> once the LFA updates the Realm definitely the contents of hash of
> firmware binary can be changed. this means the token's content could be
> change including the *max-token-size*.

I think that is broken, there is no good way to make that work in a
sane manner.

LFA must stay under the hard wired max-token-size limit, not try to
change it while a realm is running. Take this to your spec team.

> For this, the RSI host call interface has the way to get LFA eventlog.
> IOW, after LFA, there will be LFA log is genreated and then for the
> time of re-attestation, it should deliver the LFA logs together.

The detached event log is even more reason the token should not ever
be changed by a LFA.

> > I saw in your FIRME series a solution to this problem, I think that
> > would be good to get out on its own and apply it first to RSI as
> > well. We will have the core RSI stuff, the realm attestation and TSM
> > driver at a minimum..
> 
> Hm,, Does this mean do we need to create two device one for TSM and
> one for attestation even the functionality same?

They won't have the same functionality. It will be the same as you had
with FIRME where there is a driver doing CPU attestation and another
one (the TSM driver actually) doing link IDE.

Jason
