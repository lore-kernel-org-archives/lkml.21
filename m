Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795404260;
	b=G8a/oSU69WsBH+RO1/m+GBFM4qLcvUjxld3K98e39AsVnXK1FPszuRNXOIQWK/CD8053
	 Y7WE04ZT1xyE3yW32+AecbyQ4IshhGrhALFNobUEaWPKTU/tOip2K3mblI9J3ezhXUvOn
	 VhnQErMFKZ1agaiNJX7lYAF15lXceqw3kgMW+a3GiGjGEdJeKrSB8hFblMGWmcJGjYXmr
	 6wBSKNXj4IM73+Mn/viBQMUI1Gup1+2qxJnN8IAQfksU8NkIQ2Cg8h2vNVUYkkwvcuSZT
	 76FVI9d3yg8KFV8HK3cmamIebXaAlzne2uDQVAvJuRjPFx1JPo3wdbqDwcQkHktAVAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795404260;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=fb5F1+HV0OZbPTxdQ7/3f15ugGB/LMdBqtkFJnN7Nm8=;
	b=Zbse3zA74BsXdVhRSnAv2XnAalIUeMyJAJxLN74eTOyK6E1tPGK+hW2gnM83Og4yK2bj
	 2S4JWN/8/pUCS1Nlj4cOKvdQj88p8tpGpd5/k6eyFX0CwhzNZEaby27aPEzkngOe5IhFQ
	 ZyA9RIergg0TO6uOi+L63fTObD+7F+cgueR1gbE7RtdoOuokSBhjq3ISlBXQvo0Kp4tQi
	 L9afM0blmJpZ8mv99sHlvZUYM8w/LUfcU2OmRKegA+Th9t25AkbxYrMrTsdAFtykIH61X
	 HnCy7x0azcHNMMMSms3vVyX9RnIr3HYAE3e6jfTHnikOtAJZa4/MKOfEWRKkufg80ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=IqzxPLnf;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=VBdxXJQj;
	arc=none smtp.remote-ip=92.204.81.208
Received: from sxplsmtpa04-06.prod.sxb1.secureserver.net (sxplsmtpa04-06.prod.sxb1.secureserver.net [92.204.81.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1C9606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1C9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=IqzxPLnf;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=VBdxXJQj
Received: from ravalox ([82.69.79.175])
	by :SMTPAUTH: with ESMTPSA
	id VKewx1zMZpVcJVKeyxeBLr; Mon, 23 Nov 2026 03:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795404246;
	bh=fb5F1+HV0OZbPTxdQ7/3f15ugGB/LMdBqtkFJnN7Nm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IqzxPLnfYggvmqvmgLzhq/FzVr5nMJsqFSZnyLq6x46UD6/7MVXa/Hl7rErhqx4hZ
	 EPJvGcOejfRZQwXrhjVXgkB0flxCviiauWQ/wwvTVtTLrcpDg6YxV9qBh72PHR2RTX
	 99E1mOTUDqSQJnrMJF1jHfvL7Lta5FebpsOghOHBMozjeDIYiMeak3vdMoQ1wrOCfZ
	 iVx3UntBM8IFNLupbEKyfP1buoOXtdeM+2QMDEdDnbqVnDAjwpeCVmCZ2QJwo+sP8m
	 svKTtsyw8KU8aQLJ/snr6xyuQpnVeYnWypclG40m4WyAS8i138eOJ9x2mRuL6fyUkP
	 chghFlENBMtkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795404246;
	bh=fb5F1+HV0OZbPTxdQ7/3f15ugGB/LMdBqtkFJnN7Nm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VBdxXJQjrwgcvVF37/rAknxuPMbxxB1xKNr+g5scrRKFnxGDAngFc+pb3lJuIWYpY
	 zUKw5q4yYOINMO7EBCgPi3YOvCQWn9bVa6jzW9q16uYVMtMD8YduBQIWkfDFslAD9+
	 YrPOxryswsCOHmUCJQpLwkpT+IjRSmaEgcisjhqYYyiQOLkZXhkvpXUfmUhYjCTOHT
	 78YytrikBdrS697gmsNvErzmsXCp2ofYY/FVQRV5TrrJ050HQRZuraMOWCmNHIo90j
	 E9wJw5DbnWfusWZFFN95xWs4IOu0jDNJL6uMKNj3NLiqNMtupcRc2ncM5s0Rhi4x7b
	 L8T540VfX9/nQ==
X-CMAE-Analysis: v=2.4 cv=D7/SufRj c=1 sm=1 tr=0 ts=6b03b1d5
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=kj9zAlcOel0A:10 a=Z4Rwk6OoAAAA:8 a=FXvPX3liAAAA:8 a=OM4U-40VTx3VScZtlVYA:9
 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: ddafcf7f7eb0c3020a2d92e6b9fb169e:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Date: Mon, 23 Nov 2026 03:24:02 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Christian
 Loehle <christian.loehle@arm.com>
Subject: Re: [PATCH v2 17/22] Squashfs: don't store large export table
 indexes in memory
Message-Id: <20261123032402.2ef0f237cbc3fd677b048a11@squashfs.org.uk>
In-Reply-To: <20261112110927.6add17b0552922c5b6b93515@linux-foundation.org>
References: <20261111234402.252354-1-phillip@squashfs.org.uk>
	<20261111234402.252354-18-phillip@squashfs.org.uk>
	<20261112110927.6add17b0552922c5b6b93515@linux-foundation.org>
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
X-CMAE-Envelope: MS4xfBN1rCv2VaseG8nBDIX9nmiVQAAWYxNtgqza7MtGnU7b7zCjwTr1DNXfRjlbmPDUoORJz0frV/y7bHWvtH1+Xlg1Fw+zGPaWBeb4T2K/zx+GuAI2ZyYA
 nioFcL38IcE1tpSbdhFZn4DgOlP607Dc6slOlGRWa2RhRpTfQ7uOQaRx3wmJYSV4rZccyRp04jqo5t4Fdbeo6xJPPUi+YtQLOvxFycnOc5U0amj02V37BmCK
 6Pse1p0Snl0qLbIcIkSnpleqjRSt65hWEJYYjDiGcDF7gQ9lAeaANsbGtwWgEjzfK1B2u6R5kPvhu11y03jG7w==

On Thu, 12 Nov 2026 11:09:27 -0800
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 11 Nov 2026 23:43:57 +0000 Phillip Lougher <phillip@squashfs.org.uk> wrote:
> 
> > When mounting a Squashfs filesystem, the code reads the entire
> > export table indexes into memory.  Their size is determined by the
> > number of inodes in the filesystem.  For the maximum inode
> > count of 2^32, this will allocate and read 32 MiB.
> > 
> > This is an excessive and unnecessary amount of memory because the
> > indexes do not need to be read into memory in their entirety.  In
> > addition kmalloc() is used to allocate memory, and this can fail when
> > large amounts of memory are requested.  Kmalloc() on modern kernels is
> > usually limited to 4096 KiB.  If panic-on-warn is set, then failure to
> > allocate memory will result in a kernel panic.
> > 
> > This commit uses a 4 page cache if the size of the export table indexes
> > are 4 pages in size or larger.  A simple and fast lookup array is
> > retained where the total index size is less than 4 pages in size, which
> > is the vast majority of Squashfs filesystems.
> 
> Thanks.  This patch didn't anticipate the presence of Christian's
> "squashfs: identify device in mount errors".  To make life easier I've
> staged Christian's patch behind this 22-patch series.
> 
> This required a bit of rework of Christian's patch.  While in there I
> filled in a few more places which needed Christian's treatment and I
> made the whole thing more 80-column friendly where that made sense.
> 
> Please check:

Thanks.  It looks good to me.

Phillip

