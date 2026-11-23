Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443165;
	b=KUTQHAkTNNZaUXt79Ht36WH18thIuyFl7eCJiIpaz7nu7OmT7Zx6eLYS7KkH3Ht2K8FH
	 N3o77LnWGgQCS7q43fvr376HXTdXS9sP0ZvB/6q8BEnMhJ7JWk9ZCkA3Q4Am7rcUCPabV
	 gC0iTiG0yAYizL77ozuUANuCvIVZp6OtCLICl0EbO8KKZEmr0+KNRuV8wYCa+BP9EmpaQ
	 ZMWJQmdiyokxoWbFZQ0i3vtgG3vRag1LURdMogWwFdeoWY/POpvVPqRa7DPSbefeQzFkO
	 uHednGe8J1vV62e426LPV7xAmZNAHPJe4kdtuN6AmU1oPEFyixy5s7d0I16vlE6YmdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
	b=dqMy82G8ZoyJUklcHiwJx/lM+N8GwnfsjdcBMq0gMTG7k7hmAgqhC+EhoVOVfMKXTJbH
	 aeJrXihzg9DUjzX4BTUe03aDtp8QiLvqY1CCu3vdUO45Q+84OLzJvPqHPsnkd1dTxMjxp
	 V7/MZGOMTZtJDp/2ZP0LwoHkkPC6HfbdsqLo2o7ePJY0adydHu1sUfiVkA3oVNRw+Ao53
	 0aM0XKFY1+zlqwM74MGxVEpRk0BgmdFghYaOujfQrwYC7RI1xgxN6L7Id6paiJctqPOE6
	 OdtUOMGXBPTZZjaZw4bcez6dqIjhhrhI8k+8t7dYaXUv0bHYMBH1xNJYDlCsps3YMdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NCpzLTAq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5D5606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5D5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NCpzLTAq
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b335eeb340so27619757b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443163; cv=none;
        d=google.com; s=arc-20260327;
        b=rJABD5Noy9Hy8+89BxjLZvdHMNWprsXucxUTjuCbo3J12yVc5oVItmFC/VGE1+TcAm
         wVJXYuKz199rh2QGwL9jxtjcOVnkmawNioDHCZ2mlXy81kMhQdxE/iIgrmpVEAZ/Hz91
         4hL+ufj1eMBCRu4Jk8zU+D0bVrsiqYnM88Z8K+Qn2ZTMMPCP6VY/zD4Zna/UGatUX9dj
         2+RAIaiuOwcJ0GwxW0M2UMmRhU3J+KvTh0Osw7P30H+nJKLWWbOGobvgk5qzxOWHthGi
         IBus4G2yZYShhQ5FPzz+tJuIJPTA/PUahWM3j7NKeCTzIU9Vo4lNpo5IF3wacju1MKDq
         YE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
        fh=ARFnSfg4ihVp6x6wCqvtBMXYV12mfUaKR9zjWdKoSSo=;
        b=LurQJAIAkzQvmP39i8QeEx5DSrEKR9V7HXjaJrRxcc04PO2m0JTKwZ2aKLon7dkAi3
         BfPXKx+zik19+wrt/KCw6vW5xXU7Eu/8CbcQPVq0LmoH9t3iiciqg23nHkhL/pId0kMt
         C3vTXO8V1RzjgSksr8ZYeCXqFT7tyCb+wBS97Nhj6BwEOiozXmowc1OK4q16PSUXT7a6
         MRB1HG4p8tDHOt6d9sD9IjqdMKkd+9XLDoqjKSu4YrBWL7Q0XAsYsHvFdPSImyLmsSz8
         fvj5fFFv4eRHhEVJe8SMQLfB5wrsMnlFr5vl/zFco9UKQYDSgKLJFJEBTr5qS2xZpJRL
         rD8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443163; x=1796047963; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
        b=NCpzLTAqoKBaQ3KVbQj6YwKJp3A1WBpm5bfvC+0PBFFfZAALv3kQhBF+Fst0LotYdE
         HAvRy9agb63TvB+f6ZNIjNN+m8yQVGiv5qD+OjvUT26OXXWKOjFRdwDBEI5FSgTtqqE/
         +ZcVV33xN2ewf/Kwvf/XVspehaernWJ0ncrLm3DdkLsl3mJAypnuImVt0ixLX6kj81K0
         F85t99ITJr1LR7JS1tk8PH9JFF2Cim2TPqfTZb+OF+45kjxL2CIih4JDa4+XZ1qidbjf
         xnfesk3osKHqa9azZXKG5Y3/48C4F3APkJGRhAazQhVlA5kqWhCPoXMHnDQpR2SVLMbS
         4NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443163; x=1796047963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YgMDGcWrMjPej+9nilhSPh1m6I/qFRVA+VWwn5/R8Ds=;
        b=YjktrZlg3TLawHwkQlYJVP6d+l5V6HviqcS14sVb8CFqAJjpCkHSKK5zVDgq5Zx06a
         NidyhIfS2tqpXg/qFk7n3MnWg5YOV0eCRClzjaKGC08MTsNsGZV09aYf8pWR4FG+jZPe
         WD201Te5y7P56m0vfdnylptyWonBpqDiWnT8iJGdwGHhw7FPAjJNcK7ONCgBuxrEPRii
         G1g6fYfz1IdqkBsvlq1/zYtfWbejl7P9LcljI3WHuPx4Q/2kBfEgsMQmefP1NNsn3nwu
         zbJRChf/hLCGwA3ymenlTfXBiQ6pRtcHz3H0CFC3jGvcWs5aquTqEsUlb/a19kW845Dm
         W39w==
X-Forwarded-Encrypted: i=1; AL+hErFscYhzCUCsz2kL5iDlHTH4VKkmJOUqp0Tw/bu8q3D5cg0h01+HfAWvPzeG2Ztx3SMcsC+ZbT6LY+p7Ujg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qfgkDp+aRqkaNpwi0LPLU1yVgm+5ERERC/EgyWevNU/2EjoSF
	qkx/cAT/tb7N6/uo7qHxZNecY92LujhbT+Rub/N8LMraJGkHh54SPMqJh2Q9dm5Xljb3kSobEFp
	+Kg1VQYNBjMx/+tBS60EwLFln9PdGVOWdspD4iPWLmQ==
X-Gm-Gg: AZFdTZexdBkXD7ZCAdWkdiTYavAWksuBveEzSsbc2BuP8FADgEHS08AMQsqQrvMNltv
	NSgIXUMjDU4WLMYr2uDB2Qzl1YeVW438mg5yQ35uDcFqC4LPjc44bSYg4kkCgzvdazdCnpfUqmk
	sHQEyrCqbWOaJaBwCT9AHqxHhfsC6h5ymXTiTW1ZBAK8JrWi2bshPiGfxha/CmTVW++xRFee1g8
	+SU1Z17hNLOr3vttPryAUjsjwCfDPLKx4sIYRuRqwkibKpsyRMYBtusEMD/G9ScopxNQYQkDVXl
	LqUO4JczF95mOnaCZ6+8zrJLF9uUXBfoAxzzsUzWKpNPTGeFeX9MV7SeeGG8T6Bnsfkq7YiXJFC
	hGIBwZQEzIBKXifdEORXSAwPISXvaL5/5uM/p9MMOnJqq7ezVDbjEbMlkrYhPg8MfiQEFsWQ=
X-Received: by 2002:a05:690c:4b8f:b0:8b0:e10d:1975 with SMTP id
 00721157ae682-8b520435695mr34860627b3.29.1795443162921; Mon, 23 Nov 2026
 06:12:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-rpmsg-config-size-v2-1-d2fd698b6f76@valla.it> <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com>
In-Reply-To: <26795897-ccdb-42db-9433-2ecc341fb311@foss.st.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Nov 2026 08:12:31 -0600
X-Gm-Features: Aa3M54rloAqf4WAjz_5cyU4l0UPfO3oYekEeRTEWNkBzcSFDmJDGM5H-lLlDof4
Message-ID: <CANLsYkwG-C_CRDr401zZB912U07tQHJHNa+LWd2mgPM9YRgcNQ@mail.gmail.com>
Subject: Re: [PATCH v2] virtio_rpmsg: Fix config space alignment
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Francesco Valla <francesco@valla.it>, Bjorn Andersson <andersson@kernel.org>, 
	Tanmay Shah <tanmay.shah@amd.com>, openamp-rp@lists.openampproject.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 02:12, Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 11/21/26 00:01, Francesco Valla wrote:
> > The comment for virtio_rpmsg_config says that this structure is
> > naturally aligned to 32 bits, and this is desirable by some
> > architectures that don't get along with unaligned accesses.
> > The content of the structure itself however isn't aligned, and the
> > __packed attribute prevent the compiler to add this alignment.
> >
> > Fix this by extending the version field to 16 bits.
> >
> > Fixes: ca96ea25e51a ("rpmsg: virtio_rpmsg_bus: Get buffer size from config space")
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > Changes in v2:
> > - version field extended to 16 bits instead of adding a reserved byte.
> > - Rebased on current master.
> > - Link to v1: https://patch.msgid.link/20261101-rpmsg-config-size-v1-1-65686b445b22@valla.it
> > ---
> >   drivers/rpmsg/virtio_rpmsg_bus.c   | 2 +-
> >   include/linux/rpmsg/virtio_rpmsg.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> > index 23ff6c8b7a20..27282475a732 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -815,7 +815,7 @@ static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
> >   static int rpmsg_virtio_get_buf_size(struct virtproc_info *vrp)
> >   {
> >       struct virtio_device *vdev;
> > -     u8 version;
> > +     u16 version;
> >       u16 size;
> >
> >       vdev = vrp->vdev;
> > diff --git a/include/linux/rpmsg/virtio_rpmsg.h b/include/linux/rpmsg/virtio_rpmsg.h
> > index 0872cbca4593..57f48d537de9 100644
> > --- a/include/linux/rpmsg/virtio_rpmsg.h
> > +++ b/include/linux/rpmsg/virtio_rpmsg.h
> > @@ -31,7 +31,7 @@
> >    * the structure is naturally 32-bit aligned.
> >    */
> >   struct virtio_rpmsg_config {
> > -     u8 version;
> > +     __virtio16 version;
> >       __virtio16 size;
> >       /* The tx/rx individual buffer size (if VIRTIO_RPMSG_F_BUFSZ) */
> >       __virtio32 txbuf_size;
>
>
> Acked-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>

Applied.

Thanks,
Mathieu

> Thanks,
>
> Arnaud
>
> >
> > ---
> > base-commit: 5f22fb20497f4983094131f00a734362300d22d2
> > change-id: 20261101-rpmsg-config-size-0dbe9ea63c6d
> >
> > Best regards,
> > --
> > Francesco Valla <francesco@valla.it>
> >
>
