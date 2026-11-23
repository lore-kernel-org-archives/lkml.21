Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432651;
	b=zOsHx9IKtQfhdYpvRjbI9pf0ALgnEY4xnsYhduhLTq4bPjVSZ0UDUQIXuVoATGDjzSmr
	 1Pwrt4VPOfEkjurg82ls65uaVMc4JigW0idU7g8GvILHsgv0ThZ7ymlQSCmTRWDk4bV1F
	 aM7s/aG2AmxL3tuwm5js7xUHglpm+DZb/drLYB8UW6Iw7f+6kD2qTtZyyaOZPr9iEELIj
	 k9gC/6ohhN8ah99xcKyMsv8tVm+lCFpLSNTf9vAmAQuvEVazO16ZmELU8UNCug7T5h96w
	 2fpt9HoQ802jgNBDR8254R74kPOLnnMuEKrDWtNWnsOEsZo3K3Bt72MRPEKZ28KHHag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=5hBSW7tM8uyDnbZRgtXZPyH+5d7CmFdSd0KO5SSsLz4=;
	b=TOUCimtzuligHVtC/EHxJkUqgOtAGr93djYGfWAYOMg+4J3Kj127D4gd6D8O0h7ER8QC
	 +mciNSHfkoTJXMzbvmAibYDT1b0WFQvsvG9BVeaDa4Patd7+64BUXfrvpy6iUZsDaHsUI
	 SufQm56RwnvJUUNCeT9vt4X1rt/TdEv58F3zgoBqaBUr2rNhGrRNmX/CibaZe15nA0nsG
	 Ik4ru1NCTtcr1Hb5C/IxApBH9RXvQNtg++PAWH+WZrtP6xPc5Bqe0g8wuKdysDhA4zhHS
	 5owJOqikub40KrxCKXQzrqx5u2Lt0BWayDCJ2jweaLCnms3+ZCuE+ymsj//bL8417vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XstxLq7e;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C020606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C020606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XstxLq7e
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49465892f7bso2302134f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432650; x=1796037450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hBSW7tM8uyDnbZRgtXZPyH+5d7CmFdSd0KO5SSsLz4=;
        b=XstxLq7eu1Rbei1OT9pJxcvd6tc4qLGY1y6S6ZbMCYJ8/bW1KyzYAOUzyV4H3uusjm
         ZAuz9eRkphKPKmzXlGz5nGrieGDwO6DfZTXH18TqYgk7QOcpIgQJThxmHumP27lH6ee1
         pKVTamY6i5IvKVmXUQbEOcnLcJ41ERsas2MGd+McHoEOtAGAKPZETOht59jski2t+ft4
         jwqUnUl6WdPoHnBvwW1irBEc9FO++rxgBq9wG2wedAnAvU5ExGGmbfGF48XyIVWx2eAZ
         to8FVlZNhoFz2mLKuUiS66JsxW/QP5hCj9MxTZ70sYRbrdSXs4TNtGe4BWSXs+n7prk+
         CCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432650; x=1796037450;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hBSW7tM8uyDnbZRgtXZPyH+5d7CmFdSd0KO5SSsLz4=;
        b=u5TtziFPwYrjr8F/a9kg/ehwyZuglR9AkpHe8/fcaVzjCxaGMjnrzlqp83PsQE9+3/
         gYVbDraoZOpTMTAw2Cnx1XQJ8oUBOBTveZCep5a/NhtLSF/1i3XNrBhtK3n9tXb4d2JC
         cGczUbuWK1u13YGv22Jq1VXSnFX3/E/tOZw0wpNrR0J/cMSSDyaJJNWwHdnNEvaYaWvK
         oGFdoLu2xWeXPYQOTg9u9aCFgOaW5iaqhpOnDad99K+G0wz1vfvvsZFWxYppsA1YoiX0
         1aYPqOV4MPQFc7BKS8pz12+r/Vhyva+QOMNjCXLBR9QLHVE4Hu4in18VMVPxpDNIv5s+
         4Cqg==
X-Forwarded-Encrypted: i=1; AL+hErFBjRo4A8GSUy1HtJHFr70IHUi60bp/y3WxRG6IrncVBJpMxJaeOGPR59Bgf9BX0A5edCbHezEtPTnvHcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WN7HSjhktYlQ4+xs5zWKDmTFFuygYk1gMMDTbo61+IzrTg03U
	wF1cEtXhyAhkQFpfYMDfJE8fL2Ub/BR/iYW064lgfp6qvgG+IcpWWJc9AbjZYYqm
X-Gm-Gg: AZFdTZdxfFkFejsnLj0VqtPwLFgTJPTAb48sZWHU8fX7zZ0vcDqE9wX3sK4Bt9q29jo
	E/OyRT66u8RObE/p2eW5AAOXJlJh5nPAoDUBC8ej+VtKf8m0c65x+uf/D5LMR1nk4PvHiLKIG3w
	xkPZ1eiIg9bPOqxun0Ks5NFNQOwNqReTiBXwHSGbZzFTEDaU3HwkZImDBCB3uiAiQ7K4aikHxpX
	KhNP7EeeeakkuvttB6iAfsT0wf8etZwXN4vUv4cIEDn/kv3WkSBuASPBS/B88G0dvRYyqquQY8R
	zwUS6X0XcNEKxZSav91K1VNGceZmWckT2Hv/5YE0eQBGgexhRpuxc0/irtSvT9ypnWKhHLQi0GH
	MN0mLt+uaYWrfo7oUj7Q6YxStYFM0cXNGEcI/wv9oZgsFOWKCRwO+qUPl22OwxtsEcqRrc0Tyom
	iAdoldZVt2+mQ/Z7YNKdkXjm5fe7odS1pZZOc0k/gE30MewrvtkDu/pzBTgktzSjx9PE4vjgk+p
	Hp5O7zr+46QC+koL5EVALvbks0fqusXzgRsoLv7zeYopA3mcMziXRzoNXVtVdsVAmCx5dPBA/ri
	KhkoyK3ZK4qUeRj9ltY+txC6WxDE6vBqofUb/icoEFGHytY+92OZwKDf3QcWvvAWMg==
X-Received: by 2002:a05:6000:4558:b0:4a6:4ac6:d952 with SMTP id ffacd0b85a97d-4abb3a4d510mr14122517f8f.31.1795432649716;
        Mon, 23 Nov 2026 03:17:29 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f281sm20388760f8f.22.2026.11.23.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:17:29 -0800 (PST)
Date: Mon, 23 Nov 2026 11:17:28 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-ID: <20261123111728.6e84b0d5@pumpkin>
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

Then just ignore the stup AI.

> 
> If I deliberately use a u16/s16 I'm telling AI the value can't be
> more than that, and it can't overflow.
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

