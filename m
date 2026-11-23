Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441151;
	b=vuIwG6M/pAEBbOAf/CkVCZmZGq4fgDHfW34RKUIbuXabI9s3PoD4cVlcHzlLgjcQF8W2
	 eVUK+2ivJoRBWDec7sbusvf76y1AVvtdLkx+sx8hxcem3Pdy1IEwnWozZ4Hue+odv/ljg
	 Y/EVFBkPqQq8l77s9za4nO3Vn7uiZLzxPod80Z/p0CSR2ZaS7IrlFHY+x0T9YRPAVcdKB
	 TYA9mjWiSeo2YeBJ8tel0aScZYtk9Gz0UxbW221fzIe3agOUIsMR54Sd0I1kZD7eI1cUh
	 VQSZhY74xdyfm26PPpbj23fRYz83zZi5WmhJBVhl4Al/D2eWgySCyi54LY1g/Kj6PNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p1jNW1rjDE4RVQgWXUS4Id/cdE6V8FcZptVFGKsk8Cw=;
	b=opWdlMnbwLtJhjCFLibJNE52SCVnJdesmA2OI2BX9jKoHXQCRklAQInzDHzmK/blJ6Dm
	 iNpvpuAljLGEev+efe82d9X64GTEKsTMtS1MNXlwtrHk6ZZ+V2xQS/SkzCAsArxUPQzEp
	 nlXQciJSjQxIdCfTfEjhrBzqnHoqpd2hmEbt832LQdOHbS0F3qhNGgvV/Ncjz8kZ/bc9H
	 bFhTnV/Hd3jArFGYd5cTghwer/2hb7zqnYk0/JmYIe82iv0ARteWclb0QfMevuX3M/4Kc
	 uqostBfKJ44ydstT7iUx6AxefwuPU3ckhuycSVcz8mDa/3iDhi/9MflcnvldLr4ApLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yyw5rvf7;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9D5606A331
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9D5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yyw5rvf7
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so32195195e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441149; x=1796045949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p1jNW1rjDE4RVQgWXUS4Id/cdE6V8FcZptVFGKsk8Cw=;
        b=Yyw5rvf7f+bAqALPd4sMI5qDLzw72BOdC2A2a5jEk4B0hRawrslMbulwSrna+5f8EJ
         e95rtxZg6tldoYNDRI4RDnjhUwxD57zVI0EmTKFlaN4CbJS4fTGRefsAfjDNtE2/Obsg
         OMvtK3mSLgnDA09KawAyMagn3mAPVaWwn92JxvtyychGaK16SIuTZ4eZv4iGVG5MpEqr
         3802UeOPays9wGEo+k2rJbXHiOVVSJPTV+41vUyZKM8MZs/KLFu/1Ji2OxCA4JXZ3HV+
         05UPQDS2DMyWw3Wmv8k9I8MG8M5kCZ/U0Rmr/rpNVpx7zCATyWIu4pdhxB1e2CKAXkuJ
         3Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441149; x=1796045949;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p1jNW1rjDE4RVQgWXUS4Id/cdE6V8FcZptVFGKsk8Cw=;
        b=QkAQt4tbc0E1zxUhGnwsIsbHF2Bmdr9OJHwnzP/dFP5GPtfcJA+t3e7ho9YvQ/Kfop
         YFMEVBQjZslToNoOcQm0a6Y1ApavvNhg4RyOVqpWbgO2wIDoXK25kVVP2UAQeO2K9dyv
         cOHT/ATPrkiA23kA+r9sbThi6o8yoi5QpV9G+LmTuA+v/Ec7Vc+XlbnupHHDRMqURB+R
         jDazM85/bpTQY5Kve84UAjMq044VCcbQRrtF3J1y9HkEuRJtdxI1keHCvw986f2LeovB
         uLDn3jt9ytcr33pHUjYfpy95z4Z0kir7XWAYsk+fbSwbujVFG/oQ5MVoIzRVO35XIXdn
         5IJQ==
X-Forwarded-Encrypted: i=1; AL+hErEZKI+B8q3aT4g98XhHUZZ8Yj3mmc2T4lgiM/QDGDn7ZQ7soO/T4iJi5o7NM0UC7Nf4bXHwYndcxIIiP74=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/Ztp5ZKsgn1R/4eWeXdxuGdqYdWaeRJef7/ZCekhb0sz/06CR
	VrSaR3E3TNlMmwaYLi8DqJZWi2kEKG9TVusFZsLFRce4AkgzIiy+shsgLuD7yWe0
X-Gm-Gg: AZFdTZccGUAh3tKp1gaxtz7bEI2v69zyKN59KriQqUxblYU2V2YXcGiIE9uQlLZ9trU
	wv11zuiuQURPqfrAwLdyK04uabqkiZCbicYZ6bBY/Q2o29Ilxeuvmh2Jq9N60IPthDFuUaJJ+RV
	rYpLSrmsytfhBGi/mOI6Vv6tAAivE9GYzNvbfy5Gz+TEHCMN0WJ9qhUTcRztR9oU03OzRSlirzQ
	pXBKmAcOExnyn4MMTfIa41At3jlCdPsn7Ifssc6SoWb4ZdCFrbvrH4OAz6do8AOohHh34ifR99K
	hRxVnBs+7UdZdE/+nV2jFBfVXu4aaTSUjmsEKmOLDJe9pA66+QoSIviqY3mBSuBluTLCoW1sXyx
	+COfXHcqX/tsd5NTIk2DOWGNEj8rlsVUfnO7GzdZ48YbY4XJWQaaF+eaf7OInmfV2QDa2aHCKg3
	NF/pYeul6J+77NWvJzh8OGa+donq170DQ3M82MHNuxJsqpDjrO+hBEfEO7xE4o8bWDNrMebpnGP
	hsIq4YIg9/QE9vrFZNawCJXQ96W/Y5sP/AwLrZbmjV84NqMCij3dNgux+5sZNGbF2CD8w7jd3wp
	hhsATTpv29sMWa6YkrVUJiFhMjBlhz79par1qLmCRwbbb8NaPnJCs39m2KlMRHdACg==
X-Received: by 2002:a05:600d:8402:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb88806287mr178980595e9.14.1795441149273;
        Mon, 23 Nov 2026 05:39:09 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm481592495e9.13.2026.11.23.05.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:39:08 -0800 (PST)
Date: Mon, 23 Nov 2026 13:39:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-ID: <20261123133907.110d5de3@pumpkin>
In-Reply-To: <20261123100858.0d852be6d74342ed0f176cf6@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
	<20261123092331.0139648e@pumpkin>
	<20261123100858.0d852be6d74342ed0f176cf6@squashfs.org.uk>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 10:08:58 +0000
Phillip Lougher <phillip@squashfs.org.uk> wrote:

> On Mon, 23 Nov 2026 09:23:31 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> > On Mon, 23 Nov 2026 03:42:41 +0000
> > Phillip Lougher <phillip@squashfs.org.uk> wrote:
> >   
> > > This large patch-set is inspired by the recent spate of AI generated
> > > code reports.  Four of the patches directly fix AI reported issues, and
> > > the rest have been found manually by a read-through and testing of the
> > > code.
> > > 
> > > In all cases (except patches 1 - 8, 18 - 20) the patches deal with
> > > over-sights relating to variable overflow, arithmetic overflow, variable
> > > signedness or just lack of sanity checking of data read from disk.
> > > These can cause the code to fail, and which could be used as a potential
> > > exploit.  
> > > 
> > > Patches 18, 19, and 20 fix potential excessive memory use exploits.  The
> > > code in question was written in the early days when Squashfs filesystems
> > > were small, but with very large filesystems it could try to allocate
> > > memory in excess of 4 MiB, and up to 64 MiB.   
> > > 
> > > The patches can be broken down as follows:
> > > 
> > > Patches 1 - 6 are preparatory patches.  They convert old fashioned
> > > #define macros into inline functions.  These being typed make widths and
> > > signedness explicit, and allow additional checking to be added in later
> > > patches.  
> > 
> > Nope....
> > Using 16bit sizes is a recipe for disaster.
> > Remember every time the variable is accessed it is extended to 32 'int',
> > the arithmetic done as 'int' (unless the other operand is 'unsigned int')
> > and then truncated back to 16 bits.  
> 
> This is getting beyond stupid.
> 
> This patch-set is to shut up woefully stupid AI that been inflicted
> on everyone over the last couple of months.
> 
> If I use a u32 then stupid AI will *believe* the value can be up to
> u32 and then complain about arthmetic overflow.
> 
> If I deliberately use a u16/s16 I'm telling AI the value can't be
> more than that, and it can't overflow.

I've thought more.
The best you can be doing is moving any overflow somewhere else.
Reducing the sizes of the types can only increase the chance of overflow.

David

> 
> At the moment, submitting patches to the kernel has become impossible,
> necessary workarounds to fix the AI inflicting the submission trigger
> complaints from humans.
> 
> Result: an endless cycle of changes which get nowhere.
> 
> > 
> > I looked at a few, they are horrid beyond belief.
> > 
> > I can't believe some of those values can be negative - so don't use
> > signed types.
> > Use 'unsigned int' (or u32 if fixed size) so that the values don't
> > get promoted to 'signed int' all time - which is what happens here.
> > 
> > David
> >   
> > > 
> > > Patch 7 fixes an incorrect offset value in TRACE statements in
> > > squashfs_read_inode().  This was new to the v2 patch-set.
> > > 
> > > Patch 8 is new to this v3 patch-set.  The patch is an attempt to stop
> > > Sashiko from getting stuck in logical contradictions when some
> > > sanity checks are introduced later.
> > > 
> > > Patches 9 - 17 fix various issues relating to variable overflow,
> > > arithmetic overflow and add additional sanity checking to prevent these
> > > issues from occurring.
> > > 
> > > Patches 18 - 20 remove the excessive allocation of memory by introducing
> > > caches, which limit the maximum usage to 4 pages.
> > > 
> > > Patches 21 - 22 were new to the v2 patch-set.  They deal with some
> > > issues Sashiko reported in the original patch-set.
> > > 
> > > Patch 23 was also new to the v2 patch-set.  It adds an additional belts
> > > and braces sanity check.
> > > 
> > > Patches 9 - 21 have reproducers which show how the existing code faults
> > > can be exploited, in some cases which can allow a Squashfs filesystem
> > > to be tampered with to make files readable by unprivileged users.
> > > 
> > > BTW checkpatch.pl complains about the '#' lines in the BASH script
> > > reproducers. Let me know if that will cause problems.
> > > 
> > >  fs/squashfs/block.c            |  20 ++-
> > >  fs/squashfs/cache.c            |   8 +-
> > >  fs/squashfs/dir.c              | 114 +++++++++----
> > >  fs/squashfs/export.c           | 146 ++++++++++++-----
> > >  fs/squashfs/file.c             |  93 +++++++----
> > >  fs/squashfs/fragment.c         | 113 ++++++++++---
> > >  fs/squashfs/id.c               |   9 +-
> > >  fs/squashfs/inode.c            |  77 +++++----
> > >  fs/squashfs/namei.c            | 137 +++++++++++-----
> > >  fs/squashfs/squashfs.h         |   9 +-
> > >  fs/squashfs/squashfs_fs.h      | 101 ------------
> > >  fs/squashfs/squashfs_fs_i.h    |   2 +-
> > >  fs/squashfs/squashfs_fs_sb.h   |  25 ++-
> > >  fs/squashfs/squashfs_helpers.h | 362 +++++++++++++++++++++++++++++++++++++++++
> > >  fs/squashfs/super.c            |  96 +++++++----
> > >  fs/squashfs/xattr.c            |  49 ++++--
> > >  fs/squashfs/xattr.h            |  21 ++-
> > >  fs/squashfs/xattr_id.c         | 173 ++++++++++++++------
> > >  18 files changed, 1133 insertions(+), 422 deletions(-)
> > > 
> > > Phillip
> > > ---
> > > Squashfs maintainer and author
> > >   
> >   
> 
> 

