Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795829774;
	b=cOh6MVT5EPXTzNjfc6EGCYGEeofsWudLFpiPm5o0GJczHGqH1MhU+o6tq2R8om6B0yJV
	 txjgaFCrclBvwyxzlzXVlss9FV+BcuTeBJ1Pg8+V10cS1sV4p9W4Elf6VGlMPqFUaAN67
	 WW7ChZ+KVnSWwVHwSOBeS6sGiXUJnoaDIAPHSxlSCf/psU0qFMnbEvn2mAZDFdfbANNnh
	 P7Vbxk9Ca6kGSzhJ26Em7sIqsWuneEib1wJuQJE+l2e0Bdjk7XuIxFDlvDMdd3DEVX8C3
	 So6fGC6/0/NHZRG8XA+PG3+2eng3J1VuJJx0+TftcYFyMx7ukEqNS4TiVlwkEEu4xFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795829774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hlTasxKzbHtMleR5+wkbWGsmeXu6hDEZF+uLQ0NjV68=;
	b=wc0WhWe8sHYn723DJ+j8cYvvGvkO07+k38WXM26wSzTLK9R7mObIa+SlHHlLeV8n0xWa
	 AvRG8UjHtZ09HevRuzJe+jNyo6UANUgbFtqj42DElMSAvz7SpCTMgKlHsmj10ulAMH/v0
	 b/pPaZIHvhv9wr9CmhuiPs/HO4TEm3AXPyrdp7J7NV6Cl+VXd0lWOfsupLOsMrAnRTaue
	 wJ78fexm2D8tBJ5/MI1BQUp++93oPoLyU3aGklt33a5OoOVz9qYaFRW5EzlzOQQ18k0kG
	 SuHuZzXC6Rk0pbfjL/b8X0+pB0vlR7dv9XCQpVZY0KNFQx0qDtfl0jkbLZ8dUODYSuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKBPY2Ah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBF1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 01:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBF1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKBPY2Ah
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67dc7eb1442so9374846d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795829773; cv=none;
        d=google.com; s=arc-20260327;
        b=LpxRB4GXPxPJM8d7I0t7cfeSjEmX9UmamURIC7gdusKciXWcEXDFQkcsAEUQWJi82y
         cfHyEvAshVg4OwPU5G8hsC0u607cwTtzDKZ4yjI8MgPUI+9ZGvGdeBdmq2pDUmUzvQ/w
         zk8qb1wKfNydyHj+NR9hBut32JyIktmCqLMa2q+s/wxLjihDcDyJUzDQCO+iQWOfeufy
         Wr3zvuM8WX30RHgiIf8lWZlKJJccxyjWwmGsQzZXDKbyKrnyEGsag4XmfaBN1HucuI0p
         qVgLRnUDnYsuMmMPuan5R6wuqDWx/q3NjPxfmLolXc3SvognbgDOkTHiOJft5BBiQXmR
         yfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hlTasxKzbHtMleR5+wkbWGsmeXu6hDEZF+uLQ0NjV68=;
        fh=YKzDzFOC3pujGHuaDIrVua3GZnDLHLhYr3xa//0yY60=;
        b=dWnocqrDXaq3JVF7NKVv05aO0bWS3qUyna2+jQZpMrzyRzgkHjLz1MkCYSIH9DV4SO
         W+bwYA0soWKrvSwqevqKYbnao9faTTtz+ENXQtC2XdNbLRehuPqxdriapUMOmnPeOVac
         DWBTWoG9NmbnEET1ojD2QDLQbEBifFj0BL52IgGDMFSrdsnL9H3On018n0p5Zl5pjYK4
         cwFtgyGrYyaD3ApWyZWrwwJvQR48KFWXvgLYlsfUBDCAKXzev0OrKcyg3W7vkcx5f41a
         QEVG+GRsxFxXqT4iAev6533gWJV6PM06A1QGBTe1rzPXshXWEFl3+0bCSSo5ANmyVxJX
         9/Gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795829773; x=1796434573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlTasxKzbHtMleR5+wkbWGsmeXu6hDEZF+uLQ0NjV68=;
        b=HKBPY2AhbDKedYOXAH9MlDYYnfxJp+uuxXh37G6UV0Uukdf1bDXIsjclNL4gNhwXZV
         F8xvBHvIEJU4DIT7PQJg2eQtNTxCzKL0cNYMZvRnE0pkElYA/9Uu9l5P3CWtdkyqyKBb
         mg6tvMFGPhLUDDQuIHn3rjGIyPpWWdZ2DkGz2wyQDASUcAfhDXrfij8pDO1tTQhlW+95
         PxiS+65TgYnw5aOpEsV3SYNA7G+fW4x41FIJZUnoBkDZ3TL+6muSUPrlfJsEJNhx1aTB
         qzW9VdTOYFucNWRlzH6V9tJBBNdP7a9c2cU5AKkXpjFqEGYYpLJdwJdLyCH5KvGjVDSz
         /Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795829773; x=1796434573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlTasxKzbHtMleR5+wkbWGsmeXu6hDEZF+uLQ0NjV68=;
        b=qtjnH9lT7PS5rvNdr4murNVfmYfkuoCR5k1LJcesvTCH0B+a9eoWdFF1F7xowXz2sT
         R9XePVQtOTyL7Gl3cP2lZUChfrkMI8aR539uoKtFojCM1SY8N9cHJ1Xd9y4EVmAcj0K7
         tmwT1pogo51U/r+o4J0SNvsqynNw8PRUuicWYhYE3PdMGhyUAo6qWhLzZszFGVOFTmPi
         8wIWeqAsw2hdwBKh9O9XyL1zG5fzfcNbvok5fkmMtU0sZQmqu6EtcIArZqm1BgUX6jjp
         QaboR1nJs9KaF6IOlEgWFmjcfq5BX+FbBS4Pqsa3k4O2LlOFIBL1a0g8HM3dH16m26Je
         rjwg==
X-Forwarded-Encrypted: i=1; AL+hErGoZRbVzTIqh/+I1sgkPY5+pvElAIRmMI2zP3q/y+Pu0S07jTJutzsjqSA/dQNApcC2rdsUchCaOEpsn24=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k+oWYhmEDQC/DgspK7wQrSiNJil26GJy3Ma7ApkY1xCR3QhJv
	O3efgQPpQcndmam9PW3oMfr4gcyvqHzfgsv9KsnGby9ZBNTQ70M10VFyGEhZDAgD4SWD/MuDxH8
	fAZq2BM5MN+qkDVjsXFLQAfusMISPLbo=
X-Gm-Gg: AZFdTZc+hVCTUxa9gZZ49p3tGZ95OyT922ncHyuvwmVhBPnFgloEFr7hSqPqJBJg6et
	s8VAfwcsztMlkKRbZNBueTPPReu1Gv8DFvwWtjyCC/ZuI4JTrJdkr9jLAT9iRnte+gkUUOKOp3K
	WgJBVHWIw1x2ybCkScZHRRPx6YNJuvqHkt4PUqcqlIjfpru48I0w9mYtxx25tJSlg138SBYdJky
	yUv/OsiSH+cBHsZ+4YPPZWy5GWdpxpWdJwN0jOP/mpjxcC3/B7E9V3fGNo62BgdYrG81uRuYhjJ
	m1uraFqFJoBktH/4pDpqFVXR2XJcWMnbxgd2er86G/k5bN2cw1r/vCSxR/z/lO1iZPZVnMN5mRZ
	KJVt5i5hVeWJ2l5I3VkU3RO14wLSfSUOZa1WozRl4sf68x6rWfMyrMhNb3kq04QvCNCBJv6IEDn
	GzipEMkwMUNQaJankHAYsJ+6dseTyYSVnz++IizE0gS3G9XU3cbmo5nxwvrPdkUXpOHn5QhvYyT
	fL/CjuYkmOxI19d3nH0SWG6TaYGLA==
X-Received: by 2002:a05:690e:4146:b0:67d:bda2:a4f6 with SMTP id
 956f58d0204a3-67df44c4aabmr13817573d50.108.1795829773220; Fri, 27 Nov 2026
 17:36:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118002529.250616-1-sidchintamaneni@gmail.com> <2c16f03f9ba10bc4cf508420d564b928@manguebit.org>
In-Reply-To: <2c16f03f9ba10bc4cf508420d564b928@manguebit.org>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Fri, 27 Nov 2026 17:36:02 -0800
X-Gm-Features: Aa3M54rSKmt0il3afckVWFqy1h-RAmFCaFQGHvkbqyLQu4tqXd2WZKI4sY965VI
Message-ID: <CAE5sdEgn4V2JhCPrjcb4gRiPBcxi6GP8cg1JoW3P6Hoqop5zNw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] smb: client: fix cached-dir and deferred-close
 unmount races
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>, Allen Pais <apais@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-cifs@vger.kernel.org, 
	Rachel Menge <rachelmenge@linux.microsoft.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Gillian Laming <glaming@microsoft.com>, 
	Hardik Garg <hargar@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Nov 2026 at 07:14, Paulo Alcantara <pc@manguebit.org> wrote:
>
> Hi Siddharth,
>
> Siddharth Chintamaneni <sidchintamaneni@gmail.com> writes:
>
> > While investigating the cifs_kill_sb() unmount busy-dentry race fixed i=
n
> > "smb: client: fix busy dentry and inode on unmount from late oplock
> > break" [1], I wrote a static analysis tool with AI assistance to scan
> > for the same teardown pattern where objects are moved off shared lists
> > and locks are dropped before their underlying dentry references are
> > released.
> >
> > That scan identified two more unmount races in cifs_kill_sb(), both of
> > which I reproduced in QEMU where cifs_kill_sb() reaches
> > generic_shutdown_super() while dentries are still in use:
> >
> > - Patch 1 walks cfids->dying under cfids->cfid_list_lock in
> >   close_all_cached_dirs() and holds cifs_sb->outstanding_rreq across
> >   dput(dentry) in smb2_close_cached_fid() so dentries for dying or
> >   concurrently closed cached directories are dropped before
> >   kill_anon_super() runs.
> > - Patch 2 counts cancelled deferred-close handles in
> >   cifs_sb->outstanding_rreq while they sit on a local stack list before
> >   _cifsFileInfo_put() completes in cifs_close_deferred_file(),
> >   cifs_close_all_deferred_files(), and
> >   cifs_close_deferred_file_under_dentry().
> >
> > [1] https://lore.kernel.org/all/20261117001733.192399-1-sidchintamaneni=
@gmail.com/
> >
> > Siddharth Chintamaneni (2):
> >   smb: client: drop dentries for dying cached dirs during unmount
> >   smb: client: fix busy dentry on unmount from cancelled deferred close
> >
> >  fs/smb/client/cached_dir.c | 31 +++++++++++++++++++++++++++++--
> >  fs/smb/client/misc.c       | 32 +++++++++++++++++++++++++++++---
> >  2 files changed, 58 insertions(+), 5 deletions(-)
>
> Please have a look at sashiko's reviews on your series
>
>         https://sashiko.dev/#/patchset/20261118002529.250616-1-sidchintam=
aneni%40gmail.com

Sure, I=E2=80=99ll address the comments and re-spin the patches.

I also ran the static checker across the entire kernel, and it found
similar bug patterns in several filesystems and drivers. I was
wondering if there=E2=80=99s a better way to handle these findings.
I don=E2=80=99t really want to publish them somewhere since I=E2=80=99m not=
 sure if
the races are exploitable. At the same time, I don=E2=80=99t want to spam
different subsystem maintainers with patches without verifying each
issue first, which feels a bit cumbersome.
Just wanted to reach out and get your advice on how best to approach this.

Thanks!
