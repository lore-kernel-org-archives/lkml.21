Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858008;
	b=A6sUYujfvvOScBTwYN6nLrkHDCi7yM/nwzEFjNhZNfLGCZYW7IZo2e6uamuY4ST0cl2p
	 PuJiBljAIkkaQgl3QGsBHT5Xn2YTsCc0JwrjEvXzZvuA0JJkB3gsWf4EsONY1IhnHlkhz
	 FvRIOxAutBIGNl32zEIMWFEZK8pYhEgzktGqS44lSmGP0Z7StALhc88FABPLsA5c0XwDX
	 e6NVWGQd6cQJeNjFXgA03Grm7F9khJsrvJPpd14cH/Oy4obT9/F6C8hUoiJoEy3/c9mxA
	 G0AA1Q2HusNHxUhktE8oMgVBKc8yZEhTt0Lrp+VsPKv/YNGSyE2Crwc7tZeQ9Z7XoOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=FGlvqIex45DiqLn3rsPpN4duJ1MiIAw9VO0j2DhNuqs=;
	b=kSSOqduNMrQ8K179zlRthiR77S5b2sIkXGctFx3OhNnrqhMa7EI1ZkQj5bQ7yU2gmK7+
	 HT/XK5b7tBA1+Zk5ox5KrqI042xLd6srWl3OzoNcJZIzOemVZXtNsvUcy8LynQ0CFbeZa
	 f3eiKvas34E5KS/bCm4lspaqvYRqn4McY81luc/tPPU443UbSW/nXR4u9rihM1XOEq0wD
	 JeP3xo+mlUmnbJkH+bJYJAfCmbILTDvQ5GSqDC9hE7dFsTSfMUYJl0Qn9JWKJiD4g2K0Y
	 peUd1doJu0Y8MrQGGixOeqoUnX6bnbM3wu3TJOya9uXJxyHllXYq+ckQXX261JxP59g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=HAJHm62J;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AAA606A6B8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7AAA606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=HAJHm62J
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-679a2b5fe87so8067283d50.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795858007; x=1796462807; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FGlvqIex45DiqLn3rsPpN4duJ1MiIAw9VO0j2DhNuqs=;
        b=HAJHm62JmBAlu2F4/yF7GuT15nWvDDE5mLSPRLD0O9KIUWqYXg7UvzIslafojr6GJc
         EAv2HjGtfI+B4QF3UKOll41x404gBsziajeZAlV8ck/8coJxk/LGR30IdxFnKHL3hzqC
         uwek4LxEIHZvtgHoxt+oeKiPNDRt8YM1bY5yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795858007; x=1796462807;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGlvqIex45DiqLn3rsPpN4duJ1MiIAw9VO0j2DhNuqs=;
        b=N3OVKyewRKTjrAPzWSkLNs0tLrooPr5nmQGgn46IVocuc+dQekDzqvGGxyH+S7LACr
         5ks4ARVtL9jseNagm1ZihMIxQQkVIKfOOFTlzHmBNLuLpmmXqEr4rCDTAD3/eoKh1/FR
         P12trgVVwKSYk/vZu/d/2PavO0sOJEEW6tSBY+3/Q9dSH/YCP1ETkzw2PS5k0k/d2yBK
         MWqvNU0COtAbY1HmX8bK+t76RdqqJB4McCFJ9D8X5nycXPNRL/UQSSZrTpv1RJ3MggK7
         gS0uFQ7F3l0qjeSIe1KRjbVs0VvWlA7nhSVxdBe+K4McIUV2NQZS0mfyzyKGOvfBi15o
         ehyQ==
X-Forwarded-Encrypted: i=1; AL+hErHMfr86ajrwLJvaTlckq4TLNIVn30PPmBRGM30/KLvn+bfgQeSLSb69el6J2/N2icWQdLz8+zlIPyLx1Ok=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wpgaxEVcTZFs4tXsZ0Q83IA4xzs/Gnz55WY6Gpt5mVQEfNU89
	bxHz0AFTRhz8tZOGwV5IH1iU+JxpZiExnTf5dvAt5WojhT0tcXAW7X9kEIo5+lLben8=
X-Gm-Gg: AZFdTZfFZyDn8Bb+rrZ4//8+sW1ru5kxgBQqMgux5WgLORD5M2PoPc/so9Z+4SgX8ch
	c3KCRlhLrxBrUWGT4o49axgJ3fkDgFE2yHa2sN6uE8+P/C7YLcx45Uo77Sun/3dnuhWzi774uhQ
	6Hm4wDCJlXWqV86ncXdvtRsXdHJKh7Z10MLo/gHS0R+fRfP08w1RYIxBdktsIb49mHYbU5NAnX7
	VEFpCfXhXvoy7Q+kVWFO4iwkMSxdJM+K+WG4v/sDmpH6wlYqpilDMK5iTPnLgJqCtk2369zUnyc
	41ldgVevTpsURXu0f9FDz1PheU9xEOBxxuiteF3TgMYXvUSh6D+hp24Y7/wyFMlTfpwlN0kwD5B
	38V4yD0vzAO6Ynl0vp/2iSfKQtDQocKkYMiM/+DPQl1AEA5L18S/d4jJ+xPSeEPXCMTKJ8+4rk+
	/5+Zh5C58pYbMK1GHmTggFqHBrduuarIc9TVRwdEvhJ5Q++NiL2CRV9eHVaPXLDB9f+sETS42wO
	IlpUsnnRB35aYE/8Jt1OAuJ6k86LM05m3t/WL6RhyRaUATHCj/XDv/2/Lk4N1S/RxyqB2pdCuhV
	JfhWhzDT16bqQvgLX20AUttPwQ8Te/EpanVt9vF9FpbxxkPGpfkvUfhP+XMSPRKTfEdn2kG2nKT
	MGIDboTxfSSRB/KB0CxszJkjhR0kR8qdoDymBwmfJMnaKKsAh7VPB9eWu1hxJODjPSD7OwGkmLx
	02BbXJU1+VFnyxPRK7ogL807EmlaAtrGc33xcPgxGudZA+k2K+EAtRqsd7XUqPyEpmJ2T0sASzU
	deJBzUuc9sW/15ns2U3pbS0
X-Received: by 2002:a05:690e:12c7:b0:679:2c7b:de5f with SMTP id 956f58d0204a3-67e314d4c18mr6074694d50.159.1795858006809;
        Sat, 28 Nov 2026 01:26:46 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202b09c6sm106779637b3.17.2026.11.28.01.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 01:26:45 -0800 (PST)
Date: Sat, 28 Nov 2026 01:26:44 -0800
From: Chris Down <chris@chrisdown.name>
To: Christoph Hellwig <hch@lst.de>
Cc: "Martin K. Petersen" <mkp@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/2] scsi: sd: Fix data corruption in WRITE SAME(10)
	discards
In-Reply-To: <20261111164705.GC18355@lst.de>
References: <cover.1794069087.git.chris@chrisdown.name>
	<c58578f870580f92d1acd6cb73b59b7a7867d80b.1794069087.git.chris@chrisdown.name>
	<20261111164705.GC18355@lst.de>
Message-ID: <awqeVFzX-t35Vvs4@chrisdown.name>
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christoph,

Christoph Hellwig writes:
>Nah, that's not really how things work.  See my reply to patch 1
>for the suggested proper fix.

Sure, I'll do the same for writesame_10 and writesame_zero in v2.

Even with that, a discard can still reach sd_setup_write_same10_cmnd()
with a count that doesn't fit, though.

One case is a discard that is already queued when the mode changes. sd
sets provisioning_mode before it freezes the queue to commit the new
limits, so that request is still sized for the old mode. For that one
I'll set the mode with the queue frozen instead, as
nvme_update_ns_info_block() does for its own state.

The other is that __bio_split_discard() doesn't split a discard at all
when max_discard_sectors is zero or below the discard granularity. With
scsi_debug, 512-byte blocks and an unmap granularity of 0x10000 blocks,
a 64 MiB discard in writesame_10 mode goes out as a single WRITE
SAME(10) with a count of zero. sd can avoid that one by disabling
discard when the granularity is above its limit, as drbd does. But
writing 0 to discard_max_bytes while a large discard is running also
sends the rest of the bio to sd unsplit, and I don't see how sd can
prevent that with its limits.

An LBA that doesn't fit can still get there as well. bio_check_eod()
only checks a bio against the partition it was submitted to. If a disk
shrinks to 2^32 blocks or fewer while a partition on it still ends
above that, a discard to the end of that partition is sent as WRITE
SAME(10) with its LBA truncated. sd_setup_read_write_cmnd() fails reads
and writes there with "access beyond end of device", but discards and
write zeroes have no such check.

Would you rather I fix those in the block layer, or have sd check the
LBA and count before it builds the command?

Chris
