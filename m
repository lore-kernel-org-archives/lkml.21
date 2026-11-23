Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427005;
	b=COd4WEkFHL9jQMtf/m2MBcutv/lziYGoiBrkWrvBJRmKM0hvWrj+AznWu8Z3mh9qPywt
	 sLwpKlR4LBZ8MNWEA5btqbW9NtRASAaOZrekrFq/Y/p+4NrcsIkjET+lGrLLydHA5ZLKg
	 zrLRydTtnSEJ05PT5/uM4HyM5dVEbr/3wETNkjtJeML0Ndtl0WsyB1JVhaGk3kTPSrWAD
	 STensIISY5keTdQ4JMt9aNkKwItGlkwHmvdpoPdJi4Z6IzuPsZJg4wpNMmj7GVxenvLQz
	 JBt3ZUikgbyg5q7eaDYNJblm9QCwsmF/ESkYkHj9ghbpGRTqYdo1S9TklyEWpio7czg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427005;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=w7OXqAY9mm19Lhj/6dRjORfhan53pohJxpLHOCcmQxo=;
	b=YYY1cXLFi833tvXWTygeT33NB0o20maiwGGqKyUKv4lZV+ojownyKj+s0UEoZZilidKo
	 MjHgWiHykUGQNTPX2maMHzu4VRU0Pp6jIAFtN1ieFm/ZGoN/O7kQa/PfOsQ6yUWHqNus3
	 5TQ6+Lt3myWf7WIuIm0VByOsZI0DgthyHsVowRz2gNPccviI0gFfsVix1NJff+ZC1rob4
	 S8hMnYRN8zCGaJ5oz0/bcffB6p1Ca+I6RDqX/FsMkHEbS71pLO+FSxeViPhusebFDnCOJ
	 7jzY0lphG2LUnEVxFBxpTV6dfTu9DN9L8UVPER2MmojjGKhSJyPsMD6BKAp1g4rOGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=UgtBBjrM;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=j14ml+7t;
	arc=none smtp.remote-ip=188.121.53.57
Received: from sxplsmtpa04-06.prod.sxb1.secureserver.net (sxplsmtpa04-06.prod.sxb1.secureserver.net [188.121.53.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87DB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87DB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=UgtBBjrM;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=j14ml+7t
Received: from ravalox ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id VQZtx3IRmpVcJVQZwxegnI; Mon, 23 Nov 2026 09:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795426997;
	bh=w7OXqAY9mm19Lhj/6dRjORfhan53pohJxpLHOCcmQxo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UgtBBjrMWNLZBNR6nPt6l8eg6SaBu1Byh1KpJdYQ3P7nCkLFrMGUs8IgoRHq6fl5W
	 JeJ4fdGAHrO4wegvP+JSpO+e1ZVUNAe8oheJ3rfNk6b306yeZimUYO4x3BjP6yAmWs
	 uce+Vx67VlPwIN+THr83SjoTwHlbyb8GgmYZhSw5FjFj5RAgNNlJXKGH26NF3N6qCZ
	 i7tIql4MwgFFb18YgnQy7MpsZWO8keV4EXJM4fIWM7bwIlvSdODmyL70WAaMeCKDGW
	 m/Qxcg9OyIIcYf78BTy1XI2xeiolQ5AXmzssYFK4JE1akTVS/8ZbzzU0/Wo1I1wMYg
	 oC+hHPChEFH8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795426997;
	bh=w7OXqAY9mm19Lhj/6dRjORfhan53pohJxpLHOCcmQxo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j14ml+7tXFmhZhLLb/Qqpr0/RTtNdKQTHTFl+7z14ALs9CatmhUwqIfqdDT52459b
	 RaigZeeY3DuSV0Yz14GceZoiVRC87ZRdejT+YaYL5qY0rj/vRaxKgiSi6zGte4SxVD
	 GuUFPO1BBvLz+mb3+U7kXWM3qwIJTpM5K8jF0wTzPsYQ8ZQOUj6rxyMT0gGiTiEfjz
	 EWnHxA228exAzM+7mvtlZueg16qVbj7edUDzOdB4yKOlIgRWys8ZIkvkFuHqu9iJz2
	 7bWoFJDcIZ6Eedh+acUQs7SNLoJ7mnm6KrQrRYDfLX3vGqafkuRcazHpv1Hz2qqVS7
	 2NHKyTJ2UpNmQ==
X-CMAE-Analysis: v=2.4 cv=D7/SufRj c=1 sm=1 tr=0 ts=6b040ab5
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=1KwyjEPoHUs1rspk:21 a=kj9zAlcOel0A:10 a=Z4Rwk6OoAAAA:8 a=FXvPX3liAAAA:8
 a=vqM-olim6b1i3-1M514A:9 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22
 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 5185fcf3a210c4a3707bef19b92aa32e:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Date: Mon, 23 Nov 2026 09:43:13 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, news@phoronix.com
Subject: Re: [PATCH v3 00/23] Squashfs: fix a lot of AI issues and AI style
 issues
Message-Id: <20261123094313.336001b6251857b182339e6a@squashfs.org.uk>
In-Reply-To: <20261122235453.dc1115a7efdc685dc69e4744@linux-foundation.org>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
	<20261122235453.dc1115a7efdc685dc69e4744@linux-foundation.org>
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
X-CMAE-Envelope: MS4xfPJwHIuZRyHq7P7qalehSwoxLAzu9cgAy536PU/yhNxQLvoDwo3KEdMT4kb6ArfcK3cDFvq5ndAT2Nzg6LHJDtJuuRx4VHUOMpzJmOLELK1Xz8nIbZ6g
 RBBjoDsedb13CW8rr36NDpFcOLU1nwQxz8aWBfrrEu9nMpRjvAWKvjqgNL45yGHi/a5ewwWAulJ2LN0T71GGXZzUf6txTBnSHM52cvrb5PLr2Hl5mDWWltpi
 qAYspUedDQMD1e557p7ju7pcK3ynXx5YP03E43XZP+4=

On Sun, 22 Nov 2026 23:54:53 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Mon, 23 Nov 2026 03:42:41 +0000 Phillip Lougher <phillip@squashfs.org.uk> wrote:
> 
> > This large patch-set is inspired by the recent spate of AI generated
> > code reports.
> 
> Just to be annoying, I fed this into Claude Fable.  It said a bunch of
> stuff which looks very optional but the 08/23 blooper is worth fixing,
> so I queued a -fix.
> 

God forbid,I would never say you're annoying. But the AI assisted ability
to find fault in everything is exhausting.

AI amplifies problems because it lacks context and insight.  Please don't
say you you've got into the belief everything AI says is correct, because
it can be contractory depending on the depth of the anaysis, which means
you will go into endless impossible cycles.

Some of the following is exactly that:

> Unlike chatgpt, Fable is able to build kernels and run them in VMs all
> inside its sandbox.  Pretty cool stuff.
> 
> 
> 
> 
> [08/23] breaks squashfs_lookup() when its pr_debug is enabled:
> 
> 	struct inode *inode = NULL;
> 	...
> 	TRACE("Entered squashfs_lookup [%llx:%x]\n",
> 		squashfs_i(inode)->start, squashfs_i(inode)->offset);
> 
> That wants to be "dir".  With CONFIG_DYNAMIC_DEBUG=y,
> 

Yeah a fuckup because the other function used inode not dir.

Easily fixed, no big issue,

> 	echo 'file fs/squashfs/namei.c +p' > /proc/dynamic_debug/control
> 
> and then any lookup which misses the dcache gives
> 
> 	BUG: unable to handle page fault for address: ffffffffffffffc8
> 	RIP: 0010:squashfs_lookup+0x57/0x4f9
> 
> It is still there at the end of the series.
> 
> [10/23] now requires the fragment index to end exactly where the next
> table starts.  An image with 8 unused bytes there mounts and reads
> correctly today and fails with -EINVAL with this patch (I made one by
> hand to check).

This is correct. By design there is never any padding between metadata,
and any padding is incorrect. This has always been the case back since
2002.

No Squashfs filesystem should be able to hide information (like
malicious metadata) by adding padding between metadata tables.

If it is there, then someone is trying to do something naughty.

The fact the previously sanity check didn't check for this, is
because it was added in the relaxed days of 2011, when the check
was needed to block a fuzzer, and the check added then was
sufficient.  Now, if it is not 100% exact, something like
Sashiko will scream it is not sufficient.

[15/23] similarly starts rejecting a compressed block
> whose size equals the block size.  Is it certain that no version of
> mksquashfs, and nothing else which writes Squashfs (squashfs-tools-ng,
> the various Go and Rust libraries), ever produced either?  If so, please
> say that in the changelogs.

Well this is the rub isn't it.  I didn't want to put it in, but
sashishito complained about the lack of it.

Now you're saying another fucking AI is complaining about it being in.

> 
> [18/23]-[20/23]: with a small index every entry is checked against its
> neighbour at mount time.  With the cached index that checking is gone
> and only the range check in *_lookup_start() remains.  I couldn't find
> a way for that to go wrong, but is the difference intended?
> 
> [22/23] fixes a regression in mainline (5641371fd0b3) but sits on top
> of [14/23].  If it should go to -stable it needs to come first.  None of
> the series is cc:stable at present - is that intended, given the
> changelogs describe permission bypasses?

Yes, the difference is intended. The additional sanity checks make up for
it.

> 
> Small things:
> 
> - [01/23] isn't a pure conversion: SQUASHFS_COMPRESSED_SIZE() returned
>   32768 for a zero length and squashfs_compressed_size() returns 0.
>   Both end up as -EIO in squashfs_read_data(), so it's harmless, but
>   the changelog could say so.

Really.  I don'have an AI and so I didn't notice.  But if the AI
say so, well I'm only the fucking Squashfs author, and so what do
I know.

> 
> - [10/23]'s reproducer says fragment_table_start is at offset 72.  It's
>   at 80, which is what the dd uses.

Shucks.

> 
> - [20/23] has "Read fragment indexes into memory" in the xattr code.
> 
> - msblk->lookup_table is the superblock's lookup_table_start, and
>   msblk->lookup_table_start is something else (the first metadata
>   block).  Same for fragment_table and xattr_id_table.  That's going
>   to confuse people.
> 
> I built each patch on x86_64 (W=1) and the result on i386 with and
> without CONFIG_SQUASHFS_XATTR, and ran small hand-made uncompressed
> images, including one with 2049-entry fragment and export indexes so
> that the new caches are used; all read back correctly.  I have not run
> your reproducers, anything compressed, or xattrs.


I'm sorry Andrew but you have completely pissed me off.

I don't want you handling Squashfs from this day forwards.

I am *almost* at the point of resigning from Linu kernel Squashfs maintenance
due to the endless bullying I have received from you.

But I won't because then *you* will have won.

I am also CC'ing this to the LKML, and Phoronix to show that
that you have been bullying me for the last 4 weeks with my
patch sumission to *my* code.

Thanks for nothing.

Dr. Phillip Lougher

-- 
Phillip Lougher <phillip@squashfs.org.uk>
