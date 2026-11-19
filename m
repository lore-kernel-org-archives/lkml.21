Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094139;
	b=IRjhRflJ7AdTakGoHj0xssDc70VO+wfWsoH7P4Jj1Xa8XvqD3JoEeAId71NeBqHW0psb
	 L+ehneOKbljBwVpEQmgP7bNpWvG2qV+svIter67OgAtoZW0l0+QA06FaND8F/u66Pv88w
	 NnT965SJNEGrptNZ51X0RY5aB+IrVVnjNm0zMI7ytLxD7WPV3LhtPaAgy6aOauw45qB8o
	 hsi5Ei8wnRqjPcC/cKkZNbrUwIg00MnEVS0pTO9lKb/XmrgudLWl0P4G5zV3WIalev959
	 hpipb+iQyjZYBFM8O0W3AYFlydp7CNo6I+OnHR6dLACyhy06zEXgJZCjVCOZ8FpH00w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094139;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=EI408fifvnEJ/B166JwKm9Y6OhlxedP5QuLCOP0Vpj4=;
	b=rAYMowOg+HL2CmVE37D6Bx3HGbpYj4hd/7CRf1XkUaifcJueF8W8GRybCpttjPSeyC7x
	 ESVNJwgb1uLQJfhDpzYSDvb/cijXubMZy8fsD/meOIUyYi5r97c1mHapSZlZ2+4QDQWKT
	 v18+g6MTJvN0efGXSn4vQwxhU0SaDCGsltg0MajvKEghi7FpSD0tOEXYbY0splYTCfS+P
	 vi2/5VZYggt4kuFNoUDb1mIUbuxE7aSPQS+mXa3NBizpUU0UVxoP7j/5nDTybL3jnJUBZ
	 zNzg3qwPv/Qx+MokIobeHWG49jz/zfv04BcIigRfy4FG1bAPLslW7X9L+vblzSRCJ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=a7snv.com;
	spf=pass smtp.mailfrom=a7snv.com;
	dkim=pass header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b="s/Dtm5Q0";
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930F2606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 930F2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=a7snv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a7snv.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=a7snv.com header.i=@a7snv.com header.a=rsa-sha256 header.s=protonmail header.b=s/Dtm5Q0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a7snv.com;
	s=protonmail; t=1795094135; x=1795353335;
	bh=EI408fifvnEJ/B166JwKm9Y6OhlxedP5QuLCOP0Vpj4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=s/Dtm5Q0x5+wk/qASksO+l1Q1BoWzJn8JQmdGvJ0tH9zbP6YkPLUpCOsxWX1xe9nY
	 HXHTXNTa8CIfiiLWtH3IrzNjh79M5sIgKc42SvtWJGMEdU1KFg1jQWWrnnfWtr0cmL
	 FvWQssclzvmhHVKi/lqdVlmqrWXswIvumBRC1hBd+VGxS/MSBQDXfmE6bvboCSelZt
	 jn2RXUYRbjRoG3wBD/WwhJzOdPpkG0COoJ0xm557bgvEXvuzfTnP9CsXpH88BfxuAF
	 R3oy3d1Y9zE/UuU8pORVeZxBvqTex/3oKNu59XJIFxLyu8JtktlMqGtGoCoK5d1hln
	 lEigdWvhRckXw==
Date: Thu, 19 Nov 2026 13:15:27 +0000
To: Bernd Schubert <bernd@bsbernd.com>
From: Yun Wang <arsenova@a7snv.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Joanne Koong <joannelkoong@gmail.com>, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] fuse: don't wait for a sync-init mount in fuse_uring_cmd()
Message-ID: <179509410286.1113694.13152766226405003077@a7snv.com>
In-Reply-To: <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com>
References: <20261117075632.59959.p12-0-arsenova@a7snv.com> <20261116235814.60702-1-arsenova@a7snv.com> <7bb720d9-30ef-4d3f-8ab8-81c5fe2e0fe1@bsbernd.com>
Feedback-ID: 235448903:user:proton
X-Pm-Message-ID: 9db23fb9944db016d5a4d39f25daf6ec60d3eba5
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
Content-Transfer-Encoding: quoted-printable

On 11/17/26 22:47, Bernd Schubert wrote:
> On 11/17/26 00:58, Yun Wang wrote:
>> Until FUSE_INIT has completed, fuse_uring_cmd() returns -EAGAIN anyway
>> and the server has to send the command again later.  Return -EAGAIN
>> at once when the device is not mounted yet either, using
>> fuse_get_dev_nowait() from the previous patch, and don't log "No fuse
>> device found" for it.
>
> And what is if io-uring is enabled? Userspace busy loop until the device
> is available? I don't think that is nice.

I understand the concern: -EAGAIN doesn't tell userspace when to try
again, so a server can only retry blindly.

But that isn't new with this patch.  On an async-init connection,
mainline already returns -EAGAIN for a REGISTER sent after mount(2)
has returned but before FUSE_INIT has been answered.  On 7.4-rc2, with
a test server that answers FUSE_INIT 300 ms late and resubmits on every
-EAGAIN right away, as libfuse's fuse_uring_resubmit() does, the
REGISTER was resubmitted about 50000 times in those 300 ms.  The patch
applies the same rule to a sync-init device before the mount.

It does change one thing that the changelog leaves out.  It says the
command gets -EAGAIN anyway until FUSE_INIT has completed, which
suggests the wait gained nothing.  But after the mount wakes it up, it
can still get past the initialized check: FUSE_INIT may have been
answered by the time the woken task gets there, and if not, io_uring
retries the command from io-wq after the -EAGAIN, which may be late
enough.  On a sync-init device without the patch, 12 of 20 REGISTERs
sent before the mount got past the check (6 in the woken task, 6 in
the io-wq retry).  With the patch it is -EAGAIN every time and nothing
sleeps, so the old behavior was timing-dependent rather than a
reliable wait.  I'll fix the changelog in v2.

libfuse isn't affected either way: it sends REGISTER only after the
connection is initialized, with both sync and async init.  I ran
passthrough_ll -o io_uring on 7.4-rc2 with and without the patches and
counted what fuse_uring_cmd() returned: never -EAGAIN.  What the patch
fixes is the submitting task sleeping in io_uring_enter(2) until the
mount or a signal, which also holds up everything else that task
submits in the meantime.

The retry could wait in io-wq instead (I have that working), but
uring_cmd work runs on bounded io-wq workers, and each early REGISTER
would hold one until FUSE_INIT.  A server registers a whole queue's
entries at once, so that can use up the submitting task's bounded
workers and hold up its other punted work.  With 4 CPUs (a default
limit of 16), 16 early REGISTERs were enough to hold a NOP sent with
IOSQE_ASYNC by the same task until the mount; with 15 it completed at
once.  I don't think that is a good design.  Queueing early REGISTERs
and handling them once the connection is initialized might avoid this,
but that is only an idea, I haven't tried it, and it would be a bigger
change.

Would you prefer to keep -EAGAIN as in this patch, or should we look
for a different approach that covers both the sync and the async init
case?

Thanks,
Yun

