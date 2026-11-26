Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795688570;
	b=MKg8Y2FlhInM/e5ZB26guC5/2W9av4ohk1EeQ9NGADU5O9TB5eebdv8NQbMj+4L5Q6B7
	 VTyr9QrL7vSSGUSTS18XklSfJjG9Yy6xEMh+8rSXm96QUH5DqBLdjIRLWuZNEWEi8yz/y
	 iM0ykpOAQ0AJsilcJCrVuDwECCBbyv9AcvTPTwLpVjpvn9uZDM5WLeBTOlTI9KXzbSr4P
	 3W/T2lVD1M6qQ6lTpL3uH0AaENQeFbAXhMsRVzVbCMbgA1WpvtzwggYpFDebwONDZXLLd
	 +43dLafHro+80k6XkN7OqOPGy9JYXBms3Ba4rckxGvsClgNwIcWaxOabYuuPbDcRGNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ddV3AyM6dDP89kTV9C7uTPYK6u/O0e8Sk1//pYBvMLk=;
	b=PaJopoBj0hxWfCug44qp5OsO9ui3WYQpT/QfPAjODX6MIpR/nEXDED1/OXifmarNQOoa
	 4s+DQJUTu6FztReNnzgcP9EnpdsSbpyUn++xCIBsqnsOOTsOqlZQm29/2pjDJxeCKzr93
	 Cip6VYJ/egoMqfTufLkqwGNuwt1yuXgUszX8sHnb8c61HOEIEz96ohoFSzRtQofOIpHKb
	 SQPpxp/J9P0kn5FSDPtoFK8xxyUyaFuTn8f6hBF2U0eTldlao0KdQN7q7oYZ6fQmqaZ1v
	 InQhrfdoIpRJO4d9LNekHOCOX90pJpzEfzR68qGTCnjK3JTDMSgCj6q9PT8F6yZ57sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGUMlgXV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A456C606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A456C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGUMlgXV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so6395155e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:22:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795688568; cv=none;
        d=google.com; s=arc-20260327;
        b=VqJO5rnzWBMFCMTgRgYjyrdiuBBamanly85aN6+DDn7flgVPVQwpBFKLU410r0Of4d
         R0epd2SYumWxbImVnUrO6lrmcTMxWowDdU21n4XDVCndBZ3ju3ZCFjRTUP29aB0F9j8p
         IYBvOwA+aySD4CFkflGXeRf2T32dWH/vqyEnpDlNOc0tF9NtPiUNtKRGkMExMZCxAWji
         FiL87+78jHeh+rGLAYcFHEEmzzaUmlt3Lzsjn1UCoHsp8GMe4JIqalljE9NBvtdB7MQr
         0pzc0GVQAMnz1A0+Saq/s2BDPTTvOmTLfRCu+sK91szPrUUYGbHGOBj1tCyhyujfR+7T
         J9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ddV3AyM6dDP89kTV9C7uTPYK6u/O0e8Sk1//pYBvMLk=;
        fh=owGD7cOSjdGiDEcAV8fQ0n0ksnvRTGx8lkYBwoADtAQ=;
        b=INef2Ts+VK71Vowe4H30btFDqDDip+vncAAA4OXv+nmzejr8p2k49MQS/07F8SlDBd
         CKzQIZH5JKIWh3v2wZ3+Vhj9rBNOKaFNfqCpe6pXerzjNWD1SQia8VdPXRxYL1QUlh8/
         8q8yjHmLu5maHR7/wmx3iM84PhzGrW1w1DXx4jLsAC6bxcszN2wadfxgQ7Tbv/5HwS6g
         BeHIrpOe7QuXoIIeiUtDGpjO7Y+sA2idiHErc//cIR6lhRdmFVu3dbvOZH0LFblZnqmQ
         234C5hDp0P+sukZn7fbFk0LUkz9Iak+WSF1Bu2CPYpZpIHb9sYpXqYxlkbfGoLvxjiPr
         G98w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795688568; x=1796293368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddV3AyM6dDP89kTV9C7uTPYK6u/O0e8Sk1//pYBvMLk=;
        b=TGUMlgXVvhvgTgKqqOO9T59oQrRiNo0oHvANZmmDaiIfPFIZCFKt6gH7lgmVjaNlPA
         Bw2keeY5uu4Lh03FAI9hlaaLr3pbZ4HwbgT0Tz//KnlqEPDenLdAY5XH+TqDav+ui4nK
         qiLGnTzOTt55HD8cT++ShrMRfaL1nade3B+LdVNKt/rU+lkCz3tRosdSn4cHYTd/khMM
         TsSSpt51wrzLQL4uiLNChgp1idZyBDZGCJXvMyiLft72ABw5cC4ecafNAWljwzj3BB/n
         KAtzMgEQqP+hXB+l5zryXszTOGvDV50C1LlJaSXqViBHHdGODNHtCThwnF1oijPJuxOV
         uINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688568; x=1796293368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ddV3AyM6dDP89kTV9C7uTPYK6u/O0e8Sk1//pYBvMLk=;
        b=fDpGG2PfMOQIQoPuZItzrhX2nTXdI5HIQcwVjXPL6VSlWVEUImluAdCkoCogzRZr+t
         aYQtDtfVZQIF7jIfg4XmvhKpfq80INcpvnGvZZX3L24KjLzhQh8AbHbiqJxrfDmaf6Lp
         /LLxcxZAEMk9zY+97gKfY2/N/2+MXNLXZPmMG5FKDik1IY4U24cqznfs30Q+D8D/rsPI
         P0oGDuicHr08BeltSnfb5HxifZOVKDgsi0KO8WHke2l4mzOnQ3QK4YYw9SM3dNE8WC9f
         mmOR2cGanNOpGHtu3YrMVF1K3MGCjKqXcazr4IImkjWOZnjj0piwqJbI/0omahUcsPY7
         RibQ==
X-Forwarded-Encrypted: i=1; AL+hErGMaMcTmW3IdtbH9oK/5wa2EVSXPxmQ8bd8rlJgSq5kLDGcmPiheeRHQhNHKHXXh4pZutSYghXIdmXIkHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2zx+73FVYMMqvxn9Kfu/R7HFl8dQbPBxDqK1kv/xla727MtfT
	MKKjJI0GnSWpVGcOvPMtKC1OZ+nGud4uiZh26eoTaCLatrA6nWSIa2tzE/aod90K9pb9KWMDls4
	YlVkAeBVqRjhTvHFqgrlQc4s+0bW6KA4=
X-Gm-Gg: AZFdTZeTdXg8cfO3cNMcepmerAZx8/9DjfG44y0yVu1lVQSglv3ya+nqMdxFt19Qf/p
	243rxCxJ96kAWmQ3F400FF/p3WYGFbENPJvskYBrJ0K3ARCms4n+l04iEMAym/i6pykSgDYjZoT
	lq0AbkpoomKDpvioUYHttG1SIjhk+SPV0wqGX2v5yYHQfgmvjePNyQUjqkW6Ky7ZLrm+1+zb49+
	2Yj5jtntAJAW7FTBAbyClWgWgtoz2HNYn5NHTF3o5/vcbOVsrJ8MGhdba0nAkxKO5Mlyh6vidYB
	rdeXt8jnHcygBGoas1ZHkwJPZWfitlzPuiVdKgaQUlNgW3RADZRf4K/PxLLXNwgilSzS1YsMQ7z
	Hzqq2HhOukRuTYLJX5dZTjAKJdDqDIp0hoOwMWw==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id
 5b1f17b1804b1-4bb887f43d8mr396475205e9.1.1795688567655; Thu, 26 Nov 2026
 02:22:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123144440.65441-1-ziyuzhang201@gmail.com> <20261126092356.GF774860@unreal>
In-Reply-To: <20261126092356.GF774860@unreal>
From: ziyu zhang <ziyuzhang201@gmail.com>
Date: Thu, 26 Nov 2026 18:22:35 +0800
X-Gm-Features: Aa3M54okF6QAvzv7rzrr-ssSeI4k-zHxuIK9nsyTY1Ek-0XAWmQP1IvVSbC1QmQ
Message-ID: <CACPoYJyqAKZiCJ1OU01njDuwEQzQ+FjT6Ca0m5kSgM0VL5Ndrg@mail.gmail.com>
Subject: Re: [PATCH] IB/iser: Fix deadlock during blocking connect
To: Leon Romanovsky <leon@kernel.org>
Cc: sagi@grimberg.me, mgurtovoy@nvidia.com, jgg@ziepe.ca, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 17:24, Leon Romanovsky <leon@kernel.org> wrote:
>
> On Mon, Nov 23, 2026 at 10:44:40PM +0800, Ziyu Zhang wrote:
> > iser_connect() holds state_mutex while waiting for up_completion. The
> > CMA handler for the same connection needs state_mutex before it can call
> > iser_connected_handler() and complete up_completion. A blocking connect
> > can therefore prevent its own connection completion and leave the waiter
> > blocked until a signal arrives.
> >
> > Drop state_mutex around the wait and reacquire it before checking the
> > connection state, preserving serialization of state and cleanup paths.
>
> You can't randomly drop locks without any explanation why it is safe.
>
> Thanks

Thanks for pointing this out. I should have explained what keeps the
connection alive while state_mutex is dropped.

iscsi_if_rx() holds rx_queue_mutex for the entire ep_connect() call,
so a netlink bind or disconnect cannot run against this endpoint
during the wait. The endpoint is still unbound, and the connect path
owns iser_conn. RDMA CM callbacks can advance the connection state
or clean up RDMA resources during that window. The only operation
between unlocking and relocking is the wait on up_completion, and
iser_connect() checks the connection state under state_mutex after
reacquiring it.

I sent v2 after the bot review. It also wakes the waiter on
establishment failure and fixes the endpoint double free on the
connect error path.

https://lore.kernel.org/r/20261124090121.77115-1-ziyuzhang201@gmail.com

>
> >
> > Fixes: 504130c039f9 ("IB/iser: Protect iser state machine with a mutex")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
> > ---
> >  drivers/infiniband/ulp/iser/iser_verbs.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/infiniband/ulp/iser/iser_verbs.c b/drivers/infiniband/ulp/iser/iser_verbs.c
> > index 55fe68e..9fe2d3f 100644
> > --- a/drivers/infiniband/ulp/iser/iser_verbs.c
> > +++ b/drivers/infiniband/ulp/iser/iser_verbs.c
> > @@ -778,7 +778,9 @@ int iser_connect(struct iser_conn *iser_conn, struct sockaddr *src_addr,
> >       }
> >
> >       if (!non_blocking) {
> > +             mutex_unlock(&iser_conn->state_mutex);
> >               wait_for_completion_interruptible(&iser_conn->up_completion);
> > +             mutex_lock(&iser_conn->state_mutex);
> >
> >               if (iser_conn->state != ISER_CONN_UP) {
> >                       err =  -EIO;
> > --
> > 2.34.1
> >
> >
