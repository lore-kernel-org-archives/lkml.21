Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443077;
	b=NAVsP/l3R5VEpXNXeLqSoYITd/rXi0BiJmzImygOwkk01zSlyKlWQhSi/mFqZF1cMwJW
	 aXX+x/alYzNFV5NrAMiJUI3wKAXOWqz5kPexmQALqM2M1PrTwvSXjp3CEkNp9KVOwG5lV
	 B5LIEUUssEtNd/6ttdbXff+eF4Pg5rq5LN58UKAhnOTE4X3mtWOiqSj1zOP6MgscG47Qq
	 gKUCLBEqjLmWtPtftPtMkolytgnUjGQDGN6UxKbvufTNSkjv07IOM9UPQSQUK97PPDJht
	 Y4vp86OqFMsQHLvwn+8UbupFafv6LLBRHnkiA92SqzqgpgLQsHfu5LXkj2wqrbuhOUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
	b=HchWHcInjttBiqwOCSDLXwdzc6UYwZWfOalUzrfz0wSC5FsAUqfF5YQnpbXRPZ12AXdB
	 CWC480m0n13slN1nqs56y14JKcgO6QAwPA7Kw/GRasfh/NHJ1BW5qtQktr24W99cYwNoy
	 UtoEAdEQi0RKgshwq3UoEyoxmCkyOStWkavRtRav4A3p+I+fNng8HAoS8ev+W0+ONguVx
	 tpSVbzFSfhKkAgJJ5H1XgTjtTIjnCwULSJozH9wNt/iQDBOGpKIvia4VGagyIt6DPTM4x
	 HOJoh2hFAIB3QMCky8EPfE5QthTJETvBGxkZkvBMWudMXxIfBzXjgK8LjJYbsEXe3GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="oJQDP7/r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A832606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A832606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oJQDP7/r
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b315dd057bso20156377b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443076; cv=none;
        d=google.com; s=arc-20260327;
        b=jPkdTga2P87YT4VB91HkWXm7u0CeseIAHbXBSsEO+aX9CxpuhjtY0gie7R0aJ+GNDn
         kI0OuPSUbBxha2kqmvDT7hzIqG5btiVP8Gcw6jIjbCrp0/63WnuVarmore2wt5u2mG3b
         zdTpwcg1zP+jrrhfEyzFfqc3l9E5oLnMDNUEUq+cEW2pve4uATIuw8ByJHPgl5ff3NoE
         l3OewN0Rp0os26KnDjFUxEcSyG1gxEoU3RC2iUtklCTUTUtOy/O5YufDRqZGpnvmP8B4
         bfcpntFkoGcrxGYA5Z1O2E6BO//KWhhQH7JfEK6DW2ASXdPWzG9uQoGPcIO5tnqxQKFi
         Y4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        fh=4TV5c5sOp2jmfAgKusy7uY49CVWri59YsDfvYoVsTMk=;
        b=SjcILTatWEy8geC6u0oA7v3axuAwQ9JPoJ0jcDbJ3MZ1zLL829YwUypciti9hwha2z
         YLaL6DO3s9chpdGQ3UE0sCBrI5DZKMh/2CpVxcPHN2SJBhNvYalApOy45ntTtKU+DUhp
         CQL2SuUh4as8WoNAhdSNWp1QDtfOo2IjSG/e+ejlE5V9hpcF3C9A5yBg4xYAslohu9t7
         pzMloGz6V1D8GHEbqFBec6i/BD+iXQJ/0YjolKt29Xe5xYir6YzKF/Mihfe7MsFpJiEW
         /MBQ7gzZcZQ18gnWemTSjzRvfqjBvlCHqcp/BnO1qRk7opXW0nB5d110M0yHqGkQLjuH
         vDkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443075; x=1796047875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=oJQDP7/rjnJYrd0cLBz1J9ztheI2i7Vp8nI+v4fQe/y+5krO8t32ZmSQPH/iwuMQpm
         vQGEzln+CAf/Ls9QXAPdsJbYCZlK4OpqYet8Q8ou4yINw+jejSIlBhNhXlaQkHcXpBkX
         Y+ex75Dzy21OVQtH9xkHQVReDNd2HaZ73Sd6iDQ4Rv9XzO91ct3S0QNHjfCQUPQ257xq
         Ejj2qDBYG/oU+uhesOvkmns+pcorqf2cMwFYlP3Hy0eMt6nacRpJe5aCOvF8Xd3mm6Xn
         o23ES+cpSCuHc7Ltsupnzy/wiaMwr7v1h3whRzDbqL755Vj3G6jyKcXwhO0GmKYvUVOO
         DpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443075; x=1796047875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=vSZ80z0pL4zTDESbS3LlnAhdvBwP2oZFTmzhcbmts+izec/vq7yEGKamCEyPWrDN6D
         iSePxv/dtUy1BFDC1uYW7YGxJAHBefvI6JvgRs5p1vSOO0uE9c7HPKeFZATDEWVAGl/p
         j9+8W4ilRW2e6uhS85SBXbYltoawpBPmByPlKbupCQvewHRfusR649f/C79WwStbplUL
         9swNr7MEsXF+DtGmFZ2foz3U6qCx0Jy/wBb9uxgHdU5GDWqjLbC5/LbEpbd6nfQaFHGy
         /oV5R1fvXgF8IdTN1yPQQS70/FwS/JO1tLUqLCEOiAFfmp5ZHBCwI3of4yQN66246qt/
         mphQ==
X-Forwarded-Encrypted: i=1; AL+hErG779DPiyWxuSbi3dbASoN482Ad/IKOA6TVV2sjwO+IHTCNkK197na8/BdzQ7oBEMWCKCcjK94LYLBGcOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jzZTw/4mpbgV7GpO6jQ0JdmuzZBtbpIzO5p1VRznmWPDhdGdG
	BBP1PxJQFUPCFg0iOZef2sHvJUsxOt7+RNYlE5BifnuKeBbZ/so+vUrTLdm6hmqMG96O9GKrUcx
	pIxZJMWJhKj7A/JjzJPbpLcUU/or8j14lGgjHuFXKcHfg6fBUyt8l
X-Gm-Gg: AZFdTZfFc6iJCrASSoVRMIpNVq7hhpw97gO8l7hoyjoM9zKB8p8RY9EQa44nxecuyqx
	sbjkrasMYW32G1ASLA2bjcSyf3cJLGiCg4u25dXxi9tKBrdLPQLXb5XUKAd8Zz9VGn6o2DTf6xt
	cbr7W0UvOmY+mVANik/qV8Pdb8exlXevXX1mL2LBiW6xjFxQyJFYg34kUzhbsf9Xl5OlqUuO2J0
	WojorQ6pHiyS+ckhkUg+UOHwCQ2ULQpZDShhxEM531oykJki7PkK3C61ybyidUzGn8QkdCmuweP
	e982yM6OOMEXtPfha4TzsYw2JL6YXfwfB3qw64BafK0qhnpzyg/vtU2eFqPFAyxy9NUOmUmS1lg
	uUJWl1bS04vZNVxGeaPb3fOCP76khzQLnMmNsYOrWza3CXUo1/2ciRkqxiDVKGrJ2U2Gup+Y=
X-Received: by 2002:a05:690c:6b07:b0:8b5:61d:f3ff with SMTP id
 00721157ae682-8b5204e9571mr53022067b3.46.1795443075492; Mon, 23 Nov 2026
 06:11:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
 <avMgJNyGez2Eyr3a@nxa18884-linux-1.ap.freescale.net> <awPmc_4VFkcpW0C_@bombadil>
In-Reply-To: <awPmc_4VFkcpW0C_@bombadil>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Nov 2026 08:11:04 -0600
X-Gm-Features: Aa3M54rmzuqQaag6_hKersoZSWqoaB26gF7bb-M07qfK52BJ_PrHvuWnVFcXIfA
Message-ID: <CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: revert channel freeing order in imx_rproc_free_mbox
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	weinshec@holodeck2.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 01:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> On Tue, Nov 10, 2026 at 09:46:12PM +0800, Peng Fan wrote:
> > On Tue, Nov 10, 2026 at 01:29:08PM +0100, Richard Leitner wrote:
> > >The imx_rproc driver is affected by a race condition in the shutdown
> > >ordering in imx_rproc_free_mbox(). A received message might cause a
> > >virtqueue_kick resulting in tx_ch access. When imx_rproc_free_mbox() is
> > >triggered between the if (!priv->tx_ch) check and the mbox_send_message()
> > >call in the imx_rproc_kick() function the mbox_send_message() then tries
> > >to dereference a NULL pointer on the tx_ch (as seen in the call trace
> > >below).
> > >
> > >Therefore fix this behaviour by first freeing the rx channel, so no new
> > >messages are received and therefore no kicking on tx_ch can happen.
> > >Afterwards release the tx channel.
> > >
> > >This problem was encountered on a fleet of i.MX8MP devices on about 1 in
> > >500 system shutdowns, resulting in Oops below. This Oops was recorded
> > >from a v7.3.0 kernel before the work-queue removal.
> > >
> > >    remoteproc remoteproc0: stopped remote processor imx8mp-cm7
> > >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> > >    Internal error: Oops: 0000000096000004 [#1]  SMP
> > >    CPU: 0 UID: 0 PID: 32710 Comm: kworker/0:1 Not tainted 7.3.0-XXX #1 PREEMPT
> > >    Hardware name: XXX (DT)
> > >    Workqueue: imx8mp-cm7 imx_rproc_vq_work [imx_rproc]
> > >    pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >    pc : mbox_send_message+0x8c/0x178
> > >    lr : mbox_send_message+0x88/0x178
> > >    sp : ffff8000897f3b70
> > >    x29: ffff8000897f3b70 x28: ffff80007a07b248 x27: ffff0000d90e1a20
> > >    x26: ffff80007a07b328 x25: ffff0000c1d31300 x24: ffff0000d90e1a40
> > >    x23: 0000000000000001 x22: 0000000000000005 x21: ffff8000897f3ba4
> > >    x20: 000000000000000b x19: ffff0000c1b24240 x18: 0000000000000000
> > >    x17: ffff80006a453000 x16: ffff800081ac8000 x15: 0000000000000000
> > >    x14: 0000000000000040 x13: 0000000000000228 x12: ffff0000c115a3e8
> > >    x11: 0000000000000000 x10: 0000000000000001 x9 : ffff800080cd6570
> > >    x8 : ffff8000897f3ba0 x7 : 0000000000000002 x6 : 0000000000000000
> > >    x5 : 000000000000000c x4 : 0000000004400000 x3 : 0000000000000000
> > >    x2 : 0000000000000000 x1 : ffff0000cb268000 x0 : 0000000000000000
> > >    Call trace:
> > >     mbox_send_message+0x8c/0x178 (P)
> > >     imx_rproc_kick+0x50/0xc0 [imx_rproc]
> > >     rproc_virtio_notify+0x3c/0xa0
> > >     virtqueue_kick+0x4c/0x68
> > >     rpmsg_recv_done+0x224/0x658 [virtio_rpmsg_bus]
> > >     vring_interrupt+0xbc/0x158
> > >     rproc_vq_interrupt+0x40/0xb0
> > >     imx_rproc_notified_idr_cb+0x20/0x40 [imx_rproc]
> > >     idr_for_each+0x74/0x100
> > >     imx_rproc_vq_work+0x2c/0x40 [imx_rproc]
> > >     process_one_work+0x194/0x520
> > >     worker_thread+0x19c/0x320
> > >     kthread+0x134/0x148
> > >     ret_from_fork+0x10/0x20
> > >    Code: 37f80574 aa1303e0 97ffff39 f9400a60 (39402001)
> > >
> > >Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> > >Cc: stable@vger.kernel.org
> > >Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> >
> > LGTM:
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> > BTW: would you plan to fix the other issue that sashiko reported
> > regarding imx_rproc_xtr_mbox_init()?
>
> Thanks for the review and sorry for the late reply.
>
> Sure. Should this be a separate patch or added to a v2 of this series?
>

Please send another revision with the fix.

> regards;rl
>
> >
> > Regards
> > Peng
