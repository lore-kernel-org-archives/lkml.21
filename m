Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795122005;
	b=iYrVTYgJGVKtPvc+reRKgXVUVOI5M5YJWGsw+RDZo8pWPlogIyXcXwDMVOXsEHc9m0Us
	 KKBdTNptVH8QCzEDYl83xf3ZA4vOh0pQCKU41k8lERmxDmNSBuq704zdMGchkPDM94UVq
	 gJu1OLWL6mZxTxmqqB2PsEzvfC+GAnwLgOUIV+ADi6LWfTiyY/MZCOuefVny/g+52RU6w
	 VXoI46j678XvdmF84uYxI0gdvKICjGEU82PQVEtgG26Yt++Di5GwYqoIOIn4SONm9qTeG
	 mIN/id74n2Is7ODMi5yYDNu8TZXPpmq5Gxm0kMmjitq0q4m90pckqm5pXt+St+5omBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4PRTgK+XBfs6rrQNmcr8U1k3yYcuu2PtqIQvOXHP6y4=;
	b=HTEIOXJfrH3D6mthBGABFNilJWNZtnEfh9cKkLqHxJgrudmgPUuUadS3nQOYaFEHr2xP
	 vQFXibN1u2l3T1gmRvyjpUOFvdoIsWRxWYTvIgLoTCFWma0iSHVW6nBgzWcHxIj35MdiV
	 ykFdLZ/Ka6gp8w4FQmptXZLwagb2maUIVDtwCvZ/G2nZWjp2qNRL2UHo+jTr3eXvkbFYv
	 DK7rGa+2eQnMnSbI8TwBraZjecsid2jGD3Xt+ScbpEy2i9hwQhvh3M5oIQIvS+264bvId
	 QFT/PVb5Oi7pCaw9Y/FSF84XrakOjUazlDx2yqicT3oGBQAKFYluOV7hYxZjRkYl6eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2JKCAwm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A993A606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A993A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2JKCAwm
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so1074541fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795122003; cv=none;
        d=google.com; s=arc-20260327;
        b=dhB9XvC3YuLNjMMbW2iSRm9z1VeXWQUuTqvNGRyg9ZqGehTSDeNPXD6E9H7AWrpviT
         UE+MOur9lZQmofPHYiw53PxC7VNHA+41dtMTaPbcbkf+yTP2zEHPxgOpWv0LLPyA+tE9
         NGLY7h4GBrmzgF/VVn21kiAk6fLJ+7PJXVhU3htG6BIvpdR0k4hph7bn5VqeCRm4v/VJ
         bcq2jiP9hKkdetW9+mOCNWUOvc5dzgkNRSSeC9FZMUMnwr5ozJkqhRtR9lPDqCytEWbX
         aqiC3K8q2Xz32He8eFuwZIbl10mvHX1vG3vgQSKtqPEc8rEW9xOqAvGxklnLtek3WnoH
         ICCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4PRTgK+XBfs6rrQNmcr8U1k3yYcuu2PtqIQvOXHP6y4=;
        fh=huJRvG0hjP9iofqiHWRyrwiHb2onLV3RGXs9vZrls2o=;
        b=WMr1vim87+mxCXYRg+OHAdFnScKsmC/ON5oNSXB5bwPneH9E2CAi6HlyQBWP4jTdqd
         u8HXNOSWtXYNWoGITI8cNHnhgtF7i9UC56BuzsaiGV0mg4WGpGV1C+Y7/LZgbqC3bCRM
         Q4ossEzvfNPaRR/mIzxnYKZDsD/PpZUkDrGKQfPQYpJC/agiHEMOTMClZ5QU8pSCljbC
         mZ0nFAS6MQJQoKQ3qFaNJ+08feI+nqwSAusyBNsqlo+uIEO6OIqLkij1tYHcIF7lK4kq
         C4Fe8aB8b+H48bmuw+ywMU7n87hweu4bpFFXPGQeOeHWaE5HhDDtsZgMWYePFtlI8XLz
         QynQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795122003; x=1795726803; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PRTgK+XBfs6rrQNmcr8U1k3yYcuu2PtqIQvOXHP6y4=;
        b=x2JKCAwmL80xMGOzIPzMOYokK1CVXPBlMHtWajnFS5sjwetyyNmTNsMueiFrUOyXnC
         mKsHbzSJj/upHyonpcahL8Ol5KHe+QEZJ2XG5g4aXJ6ioB0ui1G8zMPOBV7Iqz5gM1ga
         +L7teSrxWuP9YqxSG53Fx4imh92cxg954ntc8uvaU3NYMREJsXBIYgyarMs8hGUiKeMA
         6wA1KSBI6hDvYAT/UAYwWDvC1cw/GI8DL9jCz3lI5F/LHf0mThA7aELDlcv9kay5Yayd
         J1m+yYkZpvL2XMOWEYuy1wTg8Ui3ADGo67wKkLhYjswojqwP7lnosWArIQ4B2CR6C/eh
         eiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122003; x=1795726803;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PRTgK+XBfs6rrQNmcr8U1k3yYcuu2PtqIQvOXHP6y4=;
        b=p0IVg8ws3LUu35v1f58SF57ELZnFNO32KOnWXqn3rESaotEg/AaHtmwIgE2hgP+Tqi
         7HOlfjmLQCYJRlvSKiEbOFbF7Rvge2pV0bTXQATwR8xV/ORfdYzSH1Vowa1tNghgRmf2
         W5vT8v1sCXH7GMxgUYWj4PuCmY0C46sFxLMiEsEPF3m5Jbjo8prZ/2TPnKSq6cUx5A21
         BizwIHPh8MZRmPWN1+FU4eYut5ESMaj5pGROzMHy3NDbbL7LYhuRfRdTh7HWIQt0AZV0
         BznC08NxEoNTS1nLv8agv6bWd7cxF1vILLchUGjpZC0+dsdnoouV5LohL1LI98BITvW/
         qdCQ==
X-Forwarded-Encrypted: i=1; AL+hErHtGfCSwb/LR3rQB2KT49EvBhE7KNspkME5wyWqGZTfcjjQeVoVxjlSf0ylrgsRB1fdBDaF7ywVQn7a0EA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8deoZH+WWLDSXl4CIPDyG1vCiN0eewGSGZ21dZ8RM4Qz2dfMT7
	Ry2KH02DqgOw5lbhRD5f72oo7382NhOxsbVxzKZtr9VT8v5DqVSYHf3JLbSrDh57+FU7DFKhphb
	PKgxfQC0TZy3JtEiv/uGcE/4NIAYwt9k=
X-Gm-Gg: AYBFou22EbczcQn9YeaZZYvglOUA2vyoXJmwu506JrNgM6SeA4rrU+VJnDEKn0JF+ic
	OKhYsbXeq0ykXniP/Un9l+xdD4ygpG5ZM5AN8Qagh7GTHF9uZ6PieC5QgVAKBX0tGcQ03p9MhJt
	VSLsC0VsR9a6zbF/d2ClaKOomThopF48OGif6UlC9IO83Z8W2JVylJloBAuA8nip/lLd9WH1jVv
	EUosi2/tF75PgD0kJ8KdMjAJ5y8viwIbhpy/SOWhIxySuiNKn/Vb6x86ZrFVj+yhzFzHc3tVhe1
	CTVy4Ai0tZb6VuZ/6VCJ7Qt9DcDugpTcEtlELXR88A+3xFQX2ze/oKCcx/+A1NDzPjcN9dX87Je
	WJHSjzKQxNDrqXYgj2s9d0VtWEajHrzbGGQ==
X-Received: by 2002:a2e:a10d:0:b0:3ab:f43:a3ca with SMTP id
 38308e7fff4ca-3ae7fa19f85mr2592521fa.16.1795122002518; Thu, 19 Nov 2026
 13:00:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009190746.803607-1-dmitry.torokhov@gmail.com>
 <20261009190746.803607-2-dmitry.torokhov@gmail.com> <CANRwn3RUdGyEOJEdN1xUjEHwnBX5-UnpZZ+ZBBwY9RBB04FtUQ@mail.gmail.com>
 <as7D7idd-843CJkn@google.com>
In-Reply-To: <as7D7idd-843CJkn@google.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Thu, 19 Nov 2026 13:59:50 -0700
X-Gm-Features: AclHuK-FKMo9pTUAUuY-_Skl61pGFLfpl8fvgBseTqOHH3PJWBu_ZXGag0K_ky8
Message-ID: <CAF8JNhJjjCqxiZDH4mDEuTL+FP+Ugw6aM8RfhM_p9+zfNuphiA@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: wacom_w8001 - assign distinct phys paths to
 pen and touch devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jason Gerecke <killertofu@gmail.com>, linux-input@vger.kernel.org, 
	Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, 
	Peter Hutterer <peter.hutterer@who-t.net>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 4:53=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 03:42:10PM -0700, Jason Gerecke wrote:
> > On Fri, Oct 9, 2026 at 12:28=E2=80=AFPM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > Previously, both pen and touch input devices used the same phys path
> > > "%s/input0", which made it impossible for userspace or udev rules to
> > > distinguish the devices by physical topology.
> > >
> > > Assign distinct phys paths by introducing separate buffers pen_phys
> > > ("%s/input0") and touch_phys ("%s/input1") in struct w8001. Pass the
> > > corresponding phys path to w8001_allocate_device() during pen and tou=
ch
> > > setup, and drop the shared phys buffer from struct w8001.
> > >
> > > Fixes: e0361b70175f ("Input: wacom_w8001 - split the touch and pen de=
vices into two devices")
> >
> > Does this really deserve a "Fixes" tag? This does not seem to be as
> > much of a "bug" as it is a limitation. Userspace and udev rules are
> > (currently) able to reliably distinguish the devices by name.
>
> It is a bug as far as input subsystem is concerned and it was introduced
> in the above referenced commit, so it has this tag.
>
> > Obviously that's not ideal, but I don't see much benefit to this patch
> > getting backported to the stable trees -- especially when /existing/
> > udev rules aren't necessarily going to know what to do with this new
> > "input1" phys.
>
> Right. For input subsystem only commits that are explicitly marked
> as Cc: stable@ will be backported to stable trees, so it should not be
> a concern.

Hi Dmitry,

Did you merge this set? I don't see it in the upstream repo.

Thank you,
Ping
