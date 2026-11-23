Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428556;
	b=D+dmNNvp+peVKGMyUQ4sIVc6fprzxHau8q0q9C5p5Qn4Ntp5yHESBIGF22nd10zvSgxE
	 quLsaXlndxCwrcl7LvMZHzqAlspjFPys38VJqsRMAA3IROMp1yPoQGFFv6+l1v7d1Svv5
	 SYHGZWidgzj6ICXxsPiKlhjb85FGyCCWm463AyOil61xG2tBknYmzxuxgKsk+Evni8ryC
	 FdGbrpFXAfLXZRMRqqodV06TszbRGP70tl1ammGmwIuIhstgD35FPZlRbyVGJBElg78OF
	 yuCWr77m4I03y+EI+F+NEzG4Z4G5oep01U6Bq7pQBLEmbPemV0WxlP5nbIzLd4lQAFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428556;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=F7jpC0aRQkxAxXL/C1WwwMJuJLPnrMYlzoIdG3lXAjE=;
	b=YE8Wx+3sydZonjNz905hP5b7mPghene/0VtX6URjniuIVKfZLi2W4uOzX0I2Bd1JkAvC
	 dRXNNFSHR9os3GX8wgUNSFEg6Qg6aYK7VQAkGl/QFLobC5OvvwHFAeqPAtdFIJjcwD4do
	 VutOQt2QPxpNgNNNLugzFKews4EMJB5em/BJpiDJtjOJKjRbfYsAOQIny9o55PVmYCT6z
	 C/2a+u5kTG9RFRhwRM2Iu7J34RJKxedXvnW/0EP0RnlHSaG3OGiO9K7ejqNUSzN47ZdrC
	 iJjnKiAH4TevvFs8ZKN1fij1a3YDxtblHazhe9jZ9aDzn1FtYURfSPqN4AmhL0XPqGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=owM3erR+;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b="GjBzZs/A";
	arc=none smtp.remote-ip=188.121.53.52
Received: from sxplsmtpa04-05.prod.sxb1.secureserver.net (sxplsmtpa04-05.prod.sxb1.secureserver.net [188.121.53.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865D7606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865D7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=owM3erR+;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=GjBzZs/A
Received: from ravalox ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id VQyoxc4HtEpaGVQyqxDhno; Mon, 23 Nov 2026 10:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795428542;
	bh=F7jpC0aRQkxAxXL/C1WwwMJuJLPnrMYlzoIdG3lXAjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=owM3erR+N65FcDg5NURVcdU38SaCnfzNfPGg5v4jOpChVYlLj6EX2BB8hNu9Cp7y3
	 JGzMnRuZpCOtfXEUtCpTBAaqO2foihAushUpnjv7pLzrN+IPO2dUdBQypoDtt3BHuK
	 ZzgOgt2k1HjazP297FGVW7g0iZYlyzQMfzpwRimTWjYjS/7DnqcEZCWHW8duduUvQL
	 eiFYB0Dvg6+JxZvNVDHT0sbWz9qMgN7lw5ahqLvupriex85tSAwyyRi6LB6OlcUeki
	 oE6k9lHtMUxzKHokqT+Lt1gT8p+vc5i3leGCs5EcEIm9NU+vlkcaaOFJGbBLV9eLe4
	 z53f1GaexEoMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795428542;
	bh=F7jpC0aRQkxAxXL/C1WwwMJuJLPnrMYlzoIdG3lXAjE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=GjBzZs/AeqpLvct5c6rD7vlsPEBeF/YVN4pBnqZtyjk6CeZ+HuHUDOOvEyi4qlvzv
	 Pz5zwQ5BOP8XHy6mG5WgrrwaaNg6Oyrid7KhkGi7kZ1XKMVAT0uiWr9UEFw9QEvJO5
	 R3JiZ2MQRpHiNPO3C26W54jZXlZW38VVlC6O4apne/Hivev5DDFc0rU4UbE1QBobzz
	 298gB7RcFno3+g0XTeD+KOUwWKob9hIyzkPhKXog+9ZX4TlbJu+E7CMRcMHdnAGRvl
	 8cH7AWeepr76lrSXgqU+M7mKQSjEOM0fVXgl/onW+vwbBqx8A/8mTA6iCh38EvJbVm
	 HyLunXzj3211g==
X-CMAE-Analysis: v=2.4 cv=EplHPicA c=1 sm=1 tr=0 ts=6b0410bd
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=1KwyjEPoHUs1rspk:21 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=FXvPX3liAAAA:8
 a=00n9IcWQ-lF8_jF86ckA:9 a=CjuIK1q_8ugA:10 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 5185fcf3a210c4a3707bef19b92aa32e:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Date: Mon, 23 Nov 2026 10:08:58 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: David Laight <david.laight.linux@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-Id: <20261123100858.0d852be6d74342ed0f176cf6@squashfs.org.uk>
In-Reply-To: <20261123092331.0139648e@pumpkin>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
	<20261123092331.0139648e@pumpkin>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfH0+/5H6uiV9gL4L4inCj1gvRH97qz5crnn6PrSSppP0h7V6VWrxxcGNrnifeJN1kuBgUguou8/6APX9vrxEh/YkmVVTlNmjvNKQePx+RENhpdGu1MHp
 ZR7IIFzLvVgzxof/UFRJ4NeByoGLz9QfS9Yt4YvrOCDR2LVPXx33nSDW5w3GUX/PPi5SJN9PzDAYSiGgjMQoNGiNvJT9v0Qabqpt/MowegDqKxGSxA0rwIGz
 FFEoJa8SDSIGcJDD0Z997JU9N8LKeY6EdOLWEdJwWoo=

On Mon, 23 Nov 2026 09:23:31 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Mon, 23 Nov 2026 03:42:41 +0000
> Phillip Lougher <phillip@squashfs.org.uk> wrote:
> 
> > This large patch-set is inspired by the recent spate of AI generated
> > code reports.  Four of the patches directly fix AI reported issues, and
> > the rest have been found manually by a read-through and testing of the
> > code.
> > 
> > In all cases (except patches 1 - 8, 18 - 20) the patches deal with
> > over-sights relating to variable overflow, arithmetic overflow, variable
> > signedness or just lack of sanity checking of data read from disk.
> > These can cause the code to fail, and which could be used as a potential
> > exploit.  
> > 
> > Patches 18, 19, and 20 fix potential excessive memory use exploits.  The
> > code in question was written in the early days when Squashfs filesystems
> > were small, but with very large filesystems it could try to allocate
> > memory in excess of 4 MiB, and up to 64 MiB.   
> > 
> > The patches can be broken down as follows:
> > 
> > Patches 1 - 6 are preparatory patches.  They convert old fashioned
> > #define macros into inline functions.  These being typed make widths and
> > signedness explicit, and allow additional checking to be added in later
> > patches.
> 
> Nope....
> Using 16bit sizes is a recipe for disaster.
> Remember every time the variable is accessed it is extended to 32 'int',
> the arithmetic done as 'int' (unless the other operand is 'unsigned int')
> and then truncated back to 16 bits.

This is getting beyond stupid.

This patch-set is to shut up woefully stupid AI that been inflicted
on everyone over the last couple of months.

If I use a u32 then stupid AI will *believe* the value can be up to
u32 and then complain about arthmetic overflow.

If I deliberately use a u16/s16 I'm telling AI the value can't be
more than that, and it can't overflow.

At the moment, submitting patches to the kernel has become impossible,
necessary workarounds to fix the AI inflicting the submission trigger
complaints from humans.

Result: an endless cycle of changes which get nowhere.

> 
> I looked at a few, they are horrid beyond belief.
> 
> I can't believe some of those values can be negative - so don't use
> signed types.
> Use 'unsigned int' (or u32 if fixed size) so that the values don't
> get promoted to 'signed int' all time - which is what happens here.
> 
> David
> 
> > 
> > Patch 7 fixes an incorrect offset value in TRACE statements in
> > squashfs_read_inode().  This was new to the v2 patch-set.
> > 
> > Patch 8 is new to this v3 patch-set.  The patch is an attempt to stop
> > Sashiko from getting stuck in logical contradictions when some
> > sanity checks are introduced later.
> > 
> > Patches 9 - 17 fix various issues relating to variable overflow,
> > arithmetic overflow and add additional sanity checking to prevent these
> > issues from occurring.
> > 
> > Patches 18 - 20 remove the excessive allocation of memory by introducing
> > caches, which limit the maximum usage to 4 pages.
> > 
> > Patches 21 - 22 were new to the v2 patch-set.  They deal with some
> > issues Sashiko reported in the original patch-set.
> > 
> > Patch 23 was also new to the v2 patch-set.  It adds an additional belts
> > and braces sanity check.
> > 
> > Patches 9 - 21 have reproducers which show how the existing code faults
> > can be exploited, in some cases which can allow a Squashfs filesystem
> > to be tampered with to make files readable by unprivileged users.
> > 
> > BTW checkpatch.pl complains about the '#' lines in the BASH script
> > reproducers. Let me know if that will cause problems.
> > 
> >  fs/squashfs/block.c            |  20 ++-
> >  fs/squashfs/cache.c            |   8 +-
> >  fs/squashfs/dir.c              | 114 +++++++++----
> >  fs/squashfs/export.c           | 146 ++++++++++++-----
> >  fs/squashfs/file.c             |  93 +++++++----
> >  fs/squashfs/fragment.c         | 113 ++++++++++---
> >  fs/squashfs/id.c               |   9 +-
> >  fs/squashfs/inode.c            |  77 +++++----
> >  fs/squashfs/namei.c            | 137 +++++++++++-----
> >  fs/squashfs/squashfs.h         |   9 +-
> >  fs/squashfs/squashfs_fs.h      | 101 ------------
> >  fs/squashfs/squashfs_fs_i.h    |   2 +-
> >  fs/squashfs/squashfs_fs_sb.h   |  25 ++-
> >  fs/squashfs/squashfs_helpers.h | 362 +++++++++++++++++++++++++++++++++++++++++
> >  fs/squashfs/super.c            |  96 +++++++----
> >  fs/squashfs/xattr.c            |  49 ++++--
> >  fs/squashfs/xattr.h            |  21 ++-
> >  fs/squashfs/xattr_id.c         | 173 ++++++++++++++------
> >  18 files changed, 1133 insertions(+), 422 deletions(-)
> > 
> > Phillip
> > ---
> > Squashfs maintainer and author
> > 
> 


-- 
Phillip Lougher <phillip@squashfs.org.uk>
