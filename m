Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101349;
	b=H3onovFSPsUKqlkgoHSYwAWd35jMSTpHD2ELg9WBeN/HBXkI7QPgJQ43Wn6TV+iKRGG4
	 0E9XtyFC6IBjmdMmC9yLNdvgthnKU7PWiVgDEUIMPHDSDtTlCI8+TWHuShDbSAp4ChO8h
	 u8D3vYVOgcckEfqZb0PxlgdLALrSrsb2vfHBSBOs3tYE/Wkyh5J+gSib4Rqr4tzr0zswF
	 nBLzLXX6UwzLlFKK/KGiXXs/exD2l+s3BC+qybMXr03tKTwV9tRdh2kNQh8Zk9YRULeho
	 U00j8FDXGQDKgpHQK2J6KYL083wqiH/degZxgpjq5C16u8/NfB/R014EU3QA3gpaWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=sfRXfpwklxyZ5gL7H6Wr6erdOMTsldmz8uHnE+HhzjU=;
	b=cpqjb3A8ym/6TABtHN0ak8bMksh+efHO32Iz4jN8dkax5/sR8QxcTA6F9ivfgRcq0a0O
	 tLvsAiAhv/boZaVwDbypPiC4iUyLSPfM/UpA+y8cWRLyMolE2uuUxyGezpVW/kqo+d8R5
	 DSWxuLe4toZ+TGQ6EmOPEjvVj9nVk/zW3Ea4hkEZ7IEaLbipobYCrhto2X6gXGV7DSj4K
	 xTgivriLDDYWybAOYe/J8xRoEybWTraHtadPWy76Q/9oe2xrdORMca/xh1o0ReaneAb63
	 O3nUmTvNWau4bNDL7xqiH+YivhO2YbSHG2qAeImnJIjWINJUSuFs7Y+YDq/BMA/hFOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cn1zv9Tm;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D860A261D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7D860A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Cn1zv9Tm
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b413997581so313504a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795101348; x=1795706148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfRXfpwklxyZ5gL7H6Wr6erdOMTsldmz8uHnE+HhzjU=;
        b=Cn1zv9TmpCnPcaSMcd/LlZgTh76BuiBetRGpPw4ZV8qdrxc+89KVdZroUqswQ74uu/
         jbVIzeu5x5Pf/HguOz9ii+tt213ksPN8O6XkHdlNc9cQSQh5w448cNxvhLx9SSIeFJKd
         gJ71ezVnE6lPgRiDqXYG+dm0w2shCa7CEY2V3IV3bEGVEYjDOm3b6eGEcQbMV26lWGip
         M4ezJDrkqxzZ76eFtny3EWmTzCQ5pK8KaE8rS43hWuvNUY7NWA0kubSGsZxChnGCDH9Q
         tvsXTGfYjOysEo7OS7io+/hBZh6mT7rR/QMPR34hMM2W1OCn6XxaNSK3WqJbaLibRIuA
         RPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101348; x=1795706148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfRXfpwklxyZ5gL7H6Wr6erdOMTsldmz8uHnE+HhzjU=;
        b=kaXKHsDUY+/jX/V777x4tdYpO4b4ENklbXW70osIaV5KECdM1poOsMdXUQBy/Wtuaa
         LvXhqtkAmBqRtQkbAjfMWU9H0i8NjJ58WtvnXieCHVGA8BpaGHi7F05k7UZRJbtSp5Nq
         pEKIITi3gGGoTuVL/qLBLXNX3r5OopCpTiZHZQUidL4cst1D0FU9uJT2r2GyG+Ri93HN
         rKs/MvvqE6aWXMTYzCsYh/d4Io2GqgAJEWUtK/Jk/e2mcNt6pSZTbl7MVPSrbRT8C6c2
         YzNpef6thy2MEdFmGI63Ozl2zWAsQ4hbi16TQ7A7qhoxlSqhhsEmfSdQbMkUAFKr8Fuh
         NBYA==
X-Forwarded-Encrypted: i=1; AL+hErH6o+ap55YBHYPx4mPgegmSex+SqJbgk4U2iTZ0SEZBOj0BvLDP1+bxXb7Mb2364kdSnFdwc0KU6Ljvrak=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GqQTlnmeGGM5lwfpHf9RKQXWpzzYlAZ+2CnBWl6imZSOJ9Ql8
	kpPB5cUL1g9VBgjoz3sWLid1A/oNWkchfk4csxHVVIETLXtG6HsgW5gwUP4TLlT6Mws=
X-Gm-Gg: AZFdTZfB+UeBok1m+GQDSOzIiwO4lNMCronmXmxoX1+k456xblkHEKUOqUpqxAmw3Oo
	IUzV+AFdumYU6gy+SSpp38NoXSgp6MWV8wBRwwPuBQ693HAxVEVfsCLLBHAJnIl/lhjx6dk2wQ1
	ce6IN0RTM8Vo6fHsr2LH1A9kSlmxRfOhU9SrqCrfZelFTUqdIfXbb0sM77obLe7UswKRwGtkEM1
	njQ7BlUfCUgGsalbB3HGV4oJVdtGUlPzfd2Wijv+1/b5M2DDqObr2/LySa0YsCHHEOlNBTeWOxo
	qtjksI9CWgtQVF44aVIfPQkrzKzh4hEVMuBqzx/PN4r2UlFFW2gmIxm8eqACDxRvWQRIeCZzatc
	PD7YZ6afh/hCCgU4c4h3KVY7ruWW5ndp9bz9qyin05MXWV4+R681UzNW9Ns0GDhJW73QliV7hkR
	jhdueq+9x2rvqnokyhR0htEtRwfFXJ2CyWWXvhEsDUJF+isb/o+oXYDQReiuz1DBOXHXHq1bZtP
	bLUlhvbEJV/0JxjFzRsUJ6dAOMu0kpFWi0MNf1alLcGNQsIFWnk8l7opddFZ0tK1CFbHOAQxdev
	edi1H76tSA8yJlLmpbB9/+0vw28YYz9nzkS5EhZ+Njw=
X-Received: by 2002:a17:90b:4c8a:b0:3ac:7c52:fb04 with SMTP id 98e67ed59e1d1-3b3d07d80admr6102377a91.44.1795101348515;
        Thu, 19 Nov 2026 07:15:48 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:73::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40285cf3fsm1869921a91.4.2026.11.19.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:15:47 -0800 (PST)
Date: Thu, 19 Nov 2026 07:15:46 -0800
From: Joe Damato <joe@dama.to>
To: Michael Chan <michael.chan@broadcom.com>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
Subject: Re: [PATCH net v5 0/4] bnxt_en: Make RING FREE more robust
Message-ID: <av8Soqh/haOS3/JL@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Michael Chan <michael.chan@broadcom.com>,
	Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, pavan.chebbi@broadcom.com,
	linux-kernel@vger.kernel.org,
	Selvin Xavier <selvin.xavier@broadcom.com>
References: <20261106191423.4194081-1-joe@dama.to>
 <avIpEpoCYvLHYl3j@devvm20253.cco0.facebook.com>
 <CACKFLinPK+wR=TMA3zNJDKQR_=HfMFUHPxKS+yhvv9SegZw7Ow@mail.gmail.com>
 <avNWzavrxJSasfp5@devvm20253.cco0.facebook.com>
 <CACKFLikU8ax8-VN+EiAhrn_w+2=yex2TNHPxEYqni6g0BKHKKQ@mail.gmail.com>
 <avOXJf5yl8ajf8Qr@devvm20253.cco0.facebook.com>
 <CACKFLinsQdoZhEnhmZmMEMZVyGC10KZZRciBGLzA12W2iOK60Q@mail.gmail.com>
 <CAH-L+nOyNgAUMCF74OE+oU2gSCaV_tVcgm2QQFvjge10A+qAYg@mail.gmail.com>
 <avx8da+htUim/x9i@devvm20253.cco0.facebook.com>
 <CACKFLimpUYgcV8VW_wFN5Bm+4cb-4eE=LGtp+9QO5dxAShBgCg@mail.gmail.com>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACKFLimpUYgcV8VW_wFN5Bm+4cb-4eE=LGtp+9QO5dxAShBgCg@mail.gmail.com>

On Tue, Nov 17, 2026 at 03:04:09PM -0800, Michael Chan wrote:
> On Tue, Nov 17, 2026 at 8:10 AM Joe Damato <joe@dama.to> wrote:
> > One more question before I put together v6.
> >
> > bnxt_reset() is also called for the silent reset on a VF: the
> > VF_CFG_CHANGE async event sets BNXT_RESET_TASK_SILENT_SP_EVENT, and
> > bnxt_sp_task() calls bnxt_reset(bp, true). With the ULP patch as planned,
> > RoCE on the VF would be stopped and restarted every time the PF changes
> > that VF's config.
> >
> > Not sure how often config changes happen with RoCE in use on VFs? If not
> > often, then treating silent and non-silent resets the same should be OK.
> > The cost is a brief RoCE restart on the VF for every config change.
> >
> 
> VF_CFG_CHANGE is to notify the VF about changes such as default VLAN.
> Unlike a TX timeout, this is a normal config change and I think we
> shouldn't disrupt RoCE unnecessarily.  It's unlikely to run into
> errors during the config change.  Selvin and Kalesh, please comment as
> well.  Thanks.

I didn't hear back from Selvin of Kalesh, but I think we discussed enough in
this thread that I can put together a reasonable v6 that (I hope) will be
acceptable.
