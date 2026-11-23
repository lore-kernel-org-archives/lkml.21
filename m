Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795472114;
	b=13NnG+m1O/oe3s5J83ubVr6nww4lR23TNkgcJLn6PnjwxIX6B9Iydxu9hj8Xiwz2jjg2
	 wS2NcbU/NM+gf/uZBDTh0q/I8cUwvcfNSVAycsIYhtMTOMXC0WgLtomOVxAdyp6nqISlW
	 2CJlCg7YQwlXuOjcfZoUNM1fJ3FD/3YtaeOqYst5oEax6V7olV7zlX11RQnxDlkWPuO58
	 MZzhYOwI5AzqIR+Dlx0q/nkvZ9zTlh2dplyYY+IBb9K7OmOV/7BSBnSLBKML6BzfrFvMq
	 UJvAzUnRRsrb796IGQuoWU6nIRjnR9N/vliwszUypG69iOQ4A5+Y09e7qneubMPG4oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
	b=A8ssdcjzpTJEG1++Ui9eCcyjRVLXnhEkvtYbcVDeSQb7/MMMF7gJyKwUZulctNRSZGIW
	 lLLPq8jabTR/w3nRivt06htoSvDUANgiDfbiPPP0y4jbybCrBU0F96J4k9HGKtGLEuvBk
	 084bdeobnJmgRtDJAA8kkQ9ye/7EALNHKFob1rfgyKrIBT5AQEx+XFjH0B8d6GoInnoyL
	 PC5yHTlEVkEcXBrG55sLPYr+2T8GjQuYWIzHEo2JB4FlaGYb9oTlHcVkRAXQKDZMMw+Mf
	 ZKmiWWJ4wWCcd3pmna1zLb7xzP4QiCZp2CUNBiF2JHeJ5LccPgeWXy38csNCP1V9N1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAys84+E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88598606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88598606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAys84+E
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-86156081432so722447a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795472113; cv=none;
        d=google.com; s=arc-20260327;
        b=SBiQHf9OtkpcFD9l5aY1N/HwuvOm7jaTR/xLG7C+tkO1n5MxlQ4UtsMYP6rsby/6tj
         BdcYh7C7zh6kTb4NoDgNAPwj/VW6XRbNvZ4mXurmN0Et75QeF/kereV99VJrpZgtm1RP
         IMWQHy0qGD0qeXOqdrQ7QURkv5iL6SjgAxiC4gOm/0X1wkqBplquNbHG2zN+uMrrRN/l
         k0bSOdQkMgtStm8ce2jGgmeigxEMJGVDCHL+PkLl7nSJIt7MXkmE3SfaLbFBg3XYdqL1
         cVrYDiWUR8K180btIbCxmIuM7PSnc503jLybHbLVo1O/oCvv+pOSJAD1D09NHAuUhY14
         fIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        fh=8rQsEq7P3NobsL1fPRSN2xB2UQDDN8RqmFtd12t9kls=;
        b=fDC1yvfQhpnavR0VngetbBz0tvughDaNlHJ2ePLJ+Kgqzc7jNl4I1p44V5UkbUkfPG
         G6G/qpEg2ZTwUEp+f8Pwcqs8KOlwL1Nyc0W3MjL4+qm/qzS8TTr66VhlEuCn31Wq8bS3
         +Qopg8AfxNwiFPqGJtsJ78ElYYm0ezl27zwbr6v3ahyL0tYwI1ANZIEgJBD6xb/zB9UE
         lwfXntJSG9JwndloGgXyWbwU3iCx+q1TucPDI/VrCtQrtK07VFtlyTmoPZ0D6f+GNK++
         dtRdsGzfWSCnjVdUY3LYyyRG924sssM8n8h9MvKAA5/jq3qK2V/K6bYgN5i06ftmUxWx
         pNkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795472113; x=1796076913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        b=rAys84+EB0GX35CiHTLGHRvFl2TY5PywP+H8poN1n58IEwptwTqp/gZd1aNO+/jddx
         YT3RrArgIOclypdPq37rkF23TXh9he6PMtTjDhsYr/zCukCU2JFSmKqqBr+GtTe48sbB
         I53wrIsXWqH4wQfgWKOQL5Yvn9859IoS1PCIxx/I4nccvB42iOmHdCwVZSR/ab/crWeX
         ijA3qDwpTWGbRqX075nIFY2i1t+FFSnXyhJStwLPIrd5KQQL9g8reC29rOdoEzNENfsd
         O8uEhDJ8T1oEbQaACjSoUUqNfbJHo0G5cW6G9DCPuV81WP2qi4uWwelMHZk/4J4Xuh3r
         0MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472113; x=1796076913;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2nxXw1xsNQYaaD8ZR5Wp773q2x9Fzid0kC42p4+1HM=;
        b=jxO/+OvjcgqRjW7FK3r26ZJNaDZa1US1kavlvCCRYaPhbgekKIvyPh4xHblYDskTkx
         GHO8hAcmXZqg+IMPm0wHLi3f2p1ERpEJ47/a3R+UYw3kQ4ErSJO9SW5v9Wt2DzhnWk76
         TP6C8nf7ciGMYBXAAH3KccHe7VznzyzlEoi1gK7Zfdh7HmMCGf6+uk9FQaS1ZNxojREi
         lNVkNt4W5z1F/N2soyYYmpYKy3k65VMa/4rlT+AdK4WIcq2foefOBWBKuFvlOPLIonjh
         wggkfRQYh1lqjxRD6QKE4PPUq5axSYVkMc553NjNb2tUy2y1ZqqhksIuP4M+YdikHTUu
         tfAQ==
X-Forwarded-Encrypted: i=1; AL+hErFCODdxclqczsBkiUtGPQrl+PLlJdKhvHcEzWPGQxrR3YGFVHNkfbo0Nf20Zg8E0iFKm96UqVPYqSQLS8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9K9uGY5+WvxrM0PZ1AlK6VNzIoJN1UYhh/F09jX1HWFPsMHMsR
	kilSh0TTdiYyA+U1UexhwnmSa+u9xIQUrtIFaizr5Zb6vXcF0xk9BypcFPSluhnearu8liRwYy8
	O6+uSVcxWXt9X7rTi8+uAFnBiMncdkZg=
X-Gm-Gg: AZFdTZcqouOG6ETzGI4sHIDb6DrHLM82Xi6TDJrc4w8SvAAqP4lNGYrsOXoFK+YAE98
	o4Hz1argKEUq/5YqzUH3AConyIitFEIMGbl0BjAmsR3P612PtuRrcPm/2TAcTjpbePaACAxJPnJ
	o6jmipLZ5DGkm347lF+V8Rwjn0XBXDcjOg8BG9iXs6dAgShmhsbJKT2HPf67HH+mNxDp53wJC2g
	Mj8LUEdNQVzDJ36Uc90ug5oxOShEN71cUvQs95WafoJmm4V2AV+vTe085IaP+bMpQuGZ2kWPOYA
	eqp7G5HCXkvejE36CWvFSwTTp26S1358hpgJO8n8OiErMhAVxkUL2eRyDFsaZRk92kA3t/8pPsf
	wzScZvEL/4ij0Y3qJs4R4ORJaWJd1RoD53aNoQUc8rN1QCftWESMeWw==
X-Received: by 2002:a05:6808:3199:b0:4e8:b729:3ebe with SMTP id
 5614622812f47-57a0b953d28mr19799401b6e.4.1795472113383; Mon, 23 Nov 2026
 14:15:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121163557.963029-1-john.ogness@linutronix.de>
In-Reply-To: <20261121163557.963029-1-john.ogness@linutronix.de>
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Mon, 23 Nov 2026 22:15:02 +0000
X-Gm-Features: Aa3M54r8PgRgIYfuYsniaBnSQY5MIggTDgAoabLc7fQl-pQOC2s44IKG_HVebgI
Message-ID: <CAGSyskX=DHDJiUxWOqG5_rYhA=OGoHbe_=GtGbOPsGPfgZAonQ@mail.gmail.com>
Subject: Re: [PATCH printk v4 0/8] Introduce policies for unsafe flushing
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Rio <rioo.tsukatsukii@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bradley Morgan <brads@mainlining.org>, Pnina Feder <pnina.feder@mobileye.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Gal Pressman <gal@nvidia.com>, Baoquan He <baoquan.he@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Oleg Nesterov <oleg@redhat.com>, 
	Bradley Morgan <include@grrlz.net>, Alex Elder <elder@riscstar.com>, 
	"Cen Zhang (Microsoft)" <blbllhy@gmail.com>, Petr Pavlu <petr.pavlu@suse.com>, kexec@lists.infradead.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:36=E2=80=AFPM John Ogness <john.ogness@linutronix=
.de> wrote:
>
> v3 is here [0].
>
> Until now unsafe flushing is only performed at the very end of
> panic(), before entering the infinite loop. For other situations
> (such as panic-kexec or panic-reboot or emergency-reboot) no
> unsafe flushing is performed. The reasoning for this is because
> an unsafe flush could lead to fireworks, which could prevent the
> kexec or reboot from occurring.
>
> However, some users may be willing to take on such risks in order
> to see panic output. Indeed, for the netconsole (which does not
> support safe atomic printing) it is a regression that such unsafe
> printing does not occur. [1]
>
> This series adds unsafe flushing policy flags per-console to
> allow individual consoles to perform unsafe flushing for such
> scenarios. The unsafe flushing is hard-code-enabled for the
> netconsole in patch 8/8. The justification is that this is not
> less safe than the legacy netconsole.
>
> Later these policy flags could be easily exposed to userspace
> via /sys/class/consoles/, once the sysfs per-console interface
> is available.
>
> The first 5 patches have no functional changes.
>
> Changes since v3:
>
> - Restore WARN for non-panic hostile takeover attempts and
>   expand the comment so I don't attempt this again.
>
> - Rename nbcon_allow_unsafe_takeover() to nbcon_allow_unsafe()
>   because it now allows general unsafe usage and not
>   specifically hostile takeovers.
>
> - In __nbcon_atomic_flush_pending(), additionally use
>   panic_on_this_cpu() to determine if a hostile takeover is
>   allowed.

Thanks for following up on this, John!
This version looks good to me. Netconsole needs more work before we
can have a completely safe write_atomic(), but this will allow users
to make a choice between reboot safety and observability.

I tested it triggering a crash with and without kdump enabled, from
normal context and from NMI context (simulating panic on hardlockup).
In all cases it fixed the regression: messages were sent correctly via
netconsole with no unexpected errors or warnings.

For the series:
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Tested-by: Gustavo Luiz Duarte <gustavold@gmail.com>
