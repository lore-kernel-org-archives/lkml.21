Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425815;
	b=P5Jef/Y3Qmmao3hJY1Ed3mLedom+MXS/9l6Bee2WiELg58FsRsif2PHCIZw0ce0umVjX
	 DJ0G2PcP0vOlS91wsD8vz3wkeW1xIVqAOzdBVavbodlqOjCnHEKvooZulJe2IPqi52ulC
	 TkWfvohgEL+MCTnIcM07gropMSA4V6iQQ8Fna29MmiTUjTjbdJ+e6iNNV/YrTq1XlE8TM
	 mK3zhr89KZ7aCa50cqkEMa4nBqESPXF/4uMCOfH/hwX3sNi2kXzll5oBYbR1bxX7dgguN
	 MH4itdYldrdx1Yii0kSg9+VROTiXBjEjml16jlN5Pa1gcA3SQ8DncBiNtqduHq8FXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4mtknGoXGHAK9p9v6RkppR1mApQJotXXJssMYXAGe4o=;
	b=sM7qeJIqWU+q/fta/3Sewh6JCn4HKb1VctpZQNIdf2LOvDTZprcViiZ3l4nB2NKxT3xB
	 yoB4ZeJzbqjq/tUoT724NrHWlp9PiHnQKMtYCuiBkf1yhBGYF6aBwSoS+Yoleelr4Ap9p
	 stiSZOdnNEy9HctE+R+nK/MAvTpGd1AEBj5Zm7yj+Na4RH6b4/xDUqt8H3Vy4NHyGAV4I
	 FroAXcjj2GQVMZ2oLForEd8Pixu7TND1S4n4lz7lKZFYJSUYUeMkN6x4cQMWSEPWMSz2t
	 3Ma/iGpN+J2qrBN5wP4GoANmr3lnVXrYVIk/yPICC4ibOaTuCQgwYOismcEyq40AM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIWeuXGU;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC32606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC32606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PIWeuXGU
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so2149376f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425813; x=1796030613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mtknGoXGHAK9p9v6RkppR1mApQJotXXJssMYXAGe4o=;
        b=PIWeuXGUiKL4pDoiW4sdXPlN3quTKb3tyZ3rBsyPYJ5f+CcjFYCJCR6KSgQo1pvrNf
         l1KG0nKNCdeLFaKhri8VcEOVKzTXXcCl8j/7DKSgW5eij4C9VjS3MCSTv8ZrswpMxTiV
         6fLeT37QJ/VUdNkgaN/L/x5ive6F/rL2AkJPZ+Vd/bZH9wF2AugXzrb8UzA6XdvFx/zf
         qAwk02uzM8wvfNNozIoydJq0ThoRfb3+8sKWLeq7t1s+FvWI+3bkME5J0ZeSPbrARh1i
         jrBF7lUOZTTs+tSu2dllk+aAsN8pbW0cnUpyyXWQipuvhvb+ED7FyIahoykWQjQrm46J
         YF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425813; x=1796030613;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mtknGoXGHAK9p9v6RkppR1mApQJotXXJssMYXAGe4o=;
        b=XKt/yjFI4MgIeCasKTFS37rbV1OK7yMITKS21aVppmaULddEK0XyGJBB4xnAVRmVZG
         /0y2QVLzQ8+QqWINOAybOE8JcG8HUQyXI1PbdrdaNRjjcOeMDJzitPNUzuKjBL6JILo9
         5AY6Skxmt2WQEl2Ss+GdqkCnFLs3opXfG11ipM3zautb38551zWd2MXfjUl6B+9gyQxh
         F0UCRYipLDOBVIM2Amk1doKROibDea2GoVLqWq9/yVsWOKcaccykbtwzI7rWiQIfCIcU
         RlwIuWfTldjJtzA1UOc7zu5YPflI2rJ+VKYHPB1lZSW8f/kf5CcUWkDe8sVh0UpxYrEL
         Jy6w==
X-Forwarded-Encrypted: i=1; AL+hErFVllWIHMBBrWH7ZNJ8d6uZfnHd7xvw/sKBnYhAs0kD98DfcEfKoq6+YLS/yqRX3U48DNWxeE+4iNpzMMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u6fHV48wzqZ3p/kPbaAAXJGJwg1pjKwfhmA+fFxo5knRrOOgV
	JXyKJAc9+Q6bRJj+u5RmoBrokwJ16iDoEgn9MqgG9xdbRVYcgujvU4GN
X-Gm-Gg: AZFdTZeYVZNeUO7cyQnr99Gekg7aO7ZFevwLfeK1+Z4lK2Oy3cxCv7pI2roGp6iTMoc
	oG8lk6DQF7Qnd62XtYjMJ2W9g3f8/UWOVKKug3POaWv//AWXA+El++OjpK8Bp6UpSLgnLNsyrCt
	f5Ff5dkaPqCPHBdruNoSUAx4f6VNiLvfUvMpCTyFJQ9W/RYa2iQ6Uwn84ySnIFqvfShH0hM5a2m
	HprXsdL45YFvjf1Qg5LjWFcE5Rg4cYJFLgGgHr+B10PuA+Nnu3obLfinMx+/xjtPWKyecEOaGlm
	Fsq2jxZ3/Y4l1J6FzyScoI3V818MhcDzbiX6q5Qgtl6xsCJPFUG+60fDeWGT58QmQ1BgxGhKCQi
	H2yQ5/TfeIZ7xbxlrJWhTgJ+X8saF6e4QCiYs1QXyjyGaIonuCFK4I2sTzJ8qXqGnoOoEwsEEKr
	mpctJ7emXL30TzNsYAD9i3kKNBKGFUaBf/TeJV8qZlFmC5UcjA7xFRQqXJSQGGLE9XJ7YaHrbQ4
	zRFSw+yfGmkB5Cs5iDVUT+u7s5NxTpzxiOv2O/3PQVyMcWVfOvt+WMQOwop9XGolvfUIFxBXiye
	cBLXye42PrVIOsHyq9GX70cNN7TEer4pQgoBNio4ck/LPlpESHJlAZc2eb5cbLN2z3cf9WIIfcU
	DbvILqoiTlMc=
X-Received: by 2002:a05:6000:2986:10b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4abb32a41f2mr16126290f8f.39.1795425813018;
        Mon, 23 Nov 2026 01:23:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm20889069f8f.36.2026.11.23.01.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:32 -0800 (PST)
Date: Mon, 23 Nov 2026 09:23:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-ID: <20261123092331.0139648e@pumpkin>
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
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

On Mon, 23 Nov 2026 03:42:41 +0000
Phillip Lougher <phillip@squashfs.org.uk> wrote:

> This large patch-set is inspired by the recent spate of AI generated
> code reports.  Four of the patches directly fix AI reported issues, and
> the rest have been found manually by a read-through and testing of the
> code.
> 
> In all cases (except patches 1 - 8, 18 - 20) the patches deal with
> over-sights relating to variable overflow, arithmetic overflow, variable
> signedness or just lack of sanity checking of data read from disk.
> These can cause the code to fail, and which could be used as a potential
> exploit.  
> 
> Patches 18, 19, and 20 fix potential excessive memory use exploits.  The
> code in question was written in the early days when Squashfs filesystems
> were small, but with very large filesystems it could try to allocate
> memory in excess of 4 MiB, and up to 64 MiB.   
> 
> The patches can be broken down as follows:
> 
> Patches 1 - 6 are preparatory patches.  They convert old fashioned
> #define macros into inline functions.  These being typed make widths and
> signedness explicit, and allow additional checking to be added in later
> patches.

Nope....
Using 16bit sizes is a recipe for disaster.
Remember every time the variable is accessed it is extended to 32 'int',
the arithmetic done as 'int' (unless the other operand is 'unsigned int')
and then truncated back to 16 bits.

I looked at a few, they are horrid beyond belief.

I can't believe some of those values can be negative - so don't use
signed types.
Use 'unsigned int' (or u32 if fixed size) so that the values don't
get promoted to 'signed int' all time - which is what happens here.

David

> 
> Patch 7 fixes an incorrect offset value in TRACE statements in
> squashfs_read_inode().  This was new to the v2 patch-set.
> 
> Patch 8 is new to this v3 patch-set.  The patch is an attempt to stop
> Sashiko from getting stuck in logical contradictions when some
> sanity checks are introduced later.
> 
> Patches 9 - 17 fix various issues relating to variable overflow,
> arithmetic overflow and add additional sanity checking to prevent these
> issues from occurring.
> 
> Patches 18 - 20 remove the excessive allocation of memory by introducing
> caches, which limit the maximum usage to 4 pages.
> 
> Patches 21 - 22 were new to the v2 patch-set.  They deal with some
> issues Sashiko reported in the original patch-set.
> 
> Patch 23 was also new to the v2 patch-set.  It adds an additional belts
> and braces sanity check.
> 
> Patches 9 - 21 have reproducers which show how the existing code faults
> can be exploited, in some cases which can allow a Squashfs filesystem
> to be tampered with to make files readable by unprivileged users.
> 
> BTW checkpatch.pl complains about the '#' lines in the BASH script
> reproducers. Let me know if that will cause problems.
> 
>  fs/squashfs/block.c            |  20 ++-
>  fs/squashfs/cache.c            |   8 +-
>  fs/squashfs/dir.c              | 114 +++++++++----
>  fs/squashfs/export.c           | 146 ++++++++++++-----
>  fs/squashfs/file.c             |  93 +++++++----
>  fs/squashfs/fragment.c         | 113 ++++++++++---
>  fs/squashfs/id.c               |   9 +-
>  fs/squashfs/inode.c            |  77 +++++----
>  fs/squashfs/namei.c            | 137 +++++++++++-----
>  fs/squashfs/squashfs.h         |   9 +-
>  fs/squashfs/squashfs_fs.h      | 101 ------------
>  fs/squashfs/squashfs_fs_i.h    |   2 +-
>  fs/squashfs/squashfs_fs_sb.h   |  25 ++-
>  fs/squashfs/squashfs_helpers.h | 362 +++++++++++++++++++++++++++++++++++++++++
>  fs/squashfs/super.c            |  96 +++++++----
>  fs/squashfs/xattr.c            |  49 ++++--
>  fs/squashfs/xattr.h            |  21 ++-
>  fs/squashfs/xattr_id.c         | 173 ++++++++++++++------
>  18 files changed, 1133 insertions(+), 422 deletions(-)
> 
> Phillip
> ---
> Squashfs maintainer and author
> 

