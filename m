Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795789395;
	b=Cr9oxjXa3DaQuPzDAAQ5wWmlmrdoptwbybzm8q47H8ydPOtWZVvjMFjmG/wNlx8R09P+
	 RfKVxmGV0lnQnVZz+YHYY1MPVoAAn6QGCvdSWH0lDOtOWmlUhRhFUlSwnQXvyu+WbmZo6
	 MvCZuy3AdbcsmcAZgLlkCjJMIOTVSJRwRgfKpCRjztCpdpfWSMX+8DHcz+ALX5B8howVY
	 Dwt0Rova3nP5E+np740Wut2fzxV0RrP1I+WU55+A5KivETKcWX3i3vVkXcfW6kKkkFiab
	 /imVrVyrhqOPfZLKcyScYqvGs3v0v5aM7Z5y/MkMDkpTl/hzc0tlNtR8DNReFH5njLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789395;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=lwfKW9uIZCzzl52VRu/ZTxERvgGAgWRWYeLITZx7GFg=;
	b=qoSmgRMdPnSBoEicevDGJUB0knhtGGJy1UeENjVKQ97LFK9bY4x4S61v5xznETAIoUK4
	 UerPyoiZ93pLLGyDvgJyf0pzZEx0qifN7q4+312TUi3JkUEIaEuo+6Vfe8F7PpZpQapN9
	 ks1rsKH8xVDxA6l0yV463HlIT+xYe8lFmVc0ICEL0vnKjLCtaoXofzNITMNK3kqxl2Exg
	 ARrL/huYS1fd94iwXpWh75PMpBQvvyIULPvJHltHLXG7k9ftWzxGfmQXzHtlEZLl58LqR
	 gBmCaxRbY9h0d7fq9lJiINCuKrs3kfVK4V5dK1nhQZBwgrCyh//hXHRhDQKiJiMcOzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eFi9qMOO;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W+yFe3wg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254CE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eFi9qMOO;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=W+yFe3wg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795789393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lwfKW9uIZCzzl52VRu/ZTxERvgGAgWRWYeLITZx7GFg=;
	b=eFi9qMOOHepypNn8pUstHIDBVFubtL/EOJRC01IC6GDA5XiXPMdEJPf+M+917UT5+YB0zE
	c1vLIYJ1OQmedIk2AK2VqIeWwHG7S9+Rz9wmy809ik5GQhojcBEm6vc62dCB40GYpVrZYM
	CL+CtclX9d33O+WjdvdGQTganqgJAkA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-7g34Ih0UOdu4GBmjsHruQg-1; Fri, 27 Nov 2026 14:23:11 +0000
X-MC-Unique: 7g34Ih0UOdu4GBmjsHruQg-1
X-Mimecast-MFC-AGG-ID: 7g34Ih0UOdu4GBmjsHruQg_1795789391
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so4722863a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:23:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795789390; cv=none;
        d=google.com; s=arc-20260327;
        b=cH7uuvFmLJbKCoXT1pX12cXfiRLKRK3IZr0r8loBazWxr0PRR33oeZ0SB8r4UMCn+Q
         wV5ZUp+Hxg7AeHIgOZsxWM4I5cvM1UdR4XB8yZS9FSDGXI7B4jBiQt7niiwkUlzIw94L
         usShyyXZRaPKxui3b6IIbhIV0VmMWXk1MQLurB0B70bgApmqDVG1R63pt5lyH1pCUfQc
         wbNb98dNpOP5EgmOWtDqpLWuouvFGoMB3zzVkU69vfIbG30n2j8i6qCwcADbiRlbZrh9
         U5QxzIHrEzCWMrrGGWTwovBZQ4FdoR3eNqf4uTSejNncD/6Y6XUHJqEDZsnlxy6xyJ8y
         Hrwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwfKW9uIZCzzl52VRu/ZTxERvgGAgWRWYeLITZx7GFg=;
        fh=iSfJ48GQkhoKuTEPFQi3nhMwCSmx8LiSfELVjJghass=;
        b=mqwJHHwfjSQs5O18v3e8ZXVYY2mReHcFLFoVEGJc953Zj2+Y249BNhYSi9GD+Kqx6K
         1RFwDIsKWGn0l6ezW+jyN1Zi57AFbB+Lai5tJKDAhb7faDGqoVLU17LErg+4TDwYL10s
         ulHkLnO1bQe/sXAj4KPbZ+RMGCVn5K6g+ZfBgnQcHUGn2+F2TgcGcQ6vjKyr1CbBGFbg
         EyIw25zZ6YtzTpdJUDYiHMa8SQUORKU2Dg+aXrxvN3unmrb0j89ecr0g0npRulcTA6Ud
         Yz7vMcmJlDiqfuTZvN+WZ0WLdjxHvZDRsDMKZHmprplwr3LFnaPjAviFbt9F+dU/cXzy
         eN/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795789390; x=1796394190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwfKW9uIZCzzl52VRu/ZTxERvgGAgWRWYeLITZx7GFg=;
        b=W+yFe3wghzpmiXQwQ/9R+HqUrMqLso5A5z6G3yToB+6Wl1i4dCxc0ciMBTPKoDU+ln
         0CQE2mXnlCgQ53Gwm83HZpZxv4mZb6mjFxmlTmih6RIW/PhgLxS+miNNbqJASvAyjyok
         kVst65cYfhxTz06UikDWAIU2R/tAT2wliohkl30pGkmRdlKGf3rnzEZ/tS3lTgTg6frp
         /m6H917oJaMgC3l+o7hWcm8QfFulcpVBM8oGB9WTqr5ygB7WGwutPBPJbOHvzyxl0Im+
         4FewCBgW/UtnRUxqpLdOV6g1fa0H8q1QZ1kmuPSxrFncLpcPKXeAM8wuqZcHpaGGVOGj
         oWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789390; x=1796394190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwfKW9uIZCzzl52VRu/ZTxERvgGAgWRWYeLITZx7GFg=;
        b=JySJMk6w05MXhXe3lWJRknEwJyUpLcny+sbADW1VFtbbyn5xmRUoj1jkFvQN+QScls
         jYCUBs9KhO0Jf/4VlLMLsULK2xqCxRGu/DlQedBIeCYq5Zf4J4GQrbU11JC3b/bJ0L0X
         6ccXSWlrUYF0tkvSL0+3t5BMN3O1x6NHhoJiG6O1NjM8jSRomNQG9l2Jr2mTequM4jA7
         4KAOuxWVgZ5E+3wU+rFkqz3SSugxXwWxDm9qkjnpXUeCh7AdEMnKBkC64HkvIeAl9+dd
         7ySsCzuz7A4Kta/jNcbm+2ZQQ7u/NiZok65vqHPMOT8yHhGmvKQH3AUHWi2vMFKciVbc
         14SA==
X-Forwarded-Encrypted: i=1; AL+hErGNXXtc4YJz+cmBC6rmLJXVaP7xQXNSCMzfhKSjsGY41DshfblShZZGUZ826f5/7RIt63gjwaksfv1jm1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8moXaOI2OQstrQ1j96aUzjOSa76Ww1uvqXABQ+aFUTdrisE1Ll
	xBKHVXmvv/TDLwJfZIfOzAaojhEYzE992Zg4tyLauX2qDC3j5g2ChUzbU76nOI3sPv5314C1PQa
	xGaPh+/LKik0h3wS7SR5DCYgpd8QKAerolIzKmTYD5g/FNr9+RFmYRjGaAgHB3AT5ipvd4bT0yx
	OXmcA5st8NE7Ttz+FD4jEnGhFmc+a909Pojz3tEyye
X-Gm-Gg: AZFdTZcGrG532DU5PxEP8is1n7D/0nJMXeMJbSi15i94JvqKahqn3raQnf6IgX+njJQ
	x3QDS7ajgNk4wt8E+e62ht5BLdZz1vId66jfMNn8o9h5dGq5Axr/7pmvzfkG3BrWcXvULW0PE7i
	RXyHbniYb79t/vrzNNv19W4rwPV1OjFls+Np6y8SfM+diarn/gVZaFutayyzoDPMN6iihWKyafG
	SUK4nBLy3jrGeoKxcSbNgNlYzrJUxYzjkrPhoVQFpgoads3ZL9bAtcAoXXBitNdK8iJoXUyYgct
	tGm/h4zahCjNpYZ2GP0w
X-Received: by 2002:a05:6a21:6e97:b0:3e0:da23:874a with SMTP id adf61e73a8af0-4014c7587f3mr27857359637.18.1795789390400;
        Fri, 27 Nov 2026 06:23:10 -0800 (PST)
X-Received: by 2002:a05:6a21:6e97:b0:3e0:da23:874a with SMTP id
 adf61e73a8af0-4014c7587f3mr27857268637.18.1795789389479; Fri, 27 Nov 2026
 06:23:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119235656.70315-1-seanjc@google.com>
In-Reply-To: <20261119235656.70315-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 Nov 2026 15:22:58 +0100
X-Gm-Features: Aa3M54qEhn7Wxct5w0YjpNlbCnASCX_MaorLcQ7GroB_soduAQi7LzpHLQ2-zN4
Message-ID: <CABgObfaZzr7UyW6j1iaz5nx_WJ2TOso+HgQkt_XC38R_UquiDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] KVM: Send reschedule IPIs for non-waiting requests
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Satish Kharat <satishkh@cisco.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 12:57=E2=80=AFAM Sean Christopherson <seanjc@google=
.com> wrote:
>
> My apologies to the s390 folks for dragging you into KVM's mess.  Y'all a=
re
> Cc'd because I want to use smp_send_reschedule() to fix a KVM bug, and KV=
M
> can be built as a module on s390.  I'm hoping to get an Ack on patch 1,
> definitely feel free to ignore the rest.
>
> For the KVM changes, fix two bugs with using the SMP function call framew=
ork,
> by switching to smp_send_reschedule() for non-waiting requests:

Applied to kvm/next because s390 actually needs this for their Arm work.

Thanks!

Paolo

>  1. Making SMP function calls with IRQs disable can lead to deadlock.
>  2. Batching IPIs for SMP function calls using the per-CPU cpumask can co=
rrupt
>     the mask if KVM kicks CPUs from hard IRQ context, as arm64 does when
>     handling KVM_IRQFD signals.
>
> Sean Christopherson (6):
>   s390/smp: Export arch_smp_send_reschedule() for KVM
>   KVM: Add struct and helpers to handle kicking multiple (v)CPUs
>   KVM: Add dedicated flag to track if multi-vCPU request needs at least
>     one kick
>   KVM: Don't kick offline CPUs when making a multi-vCPU request
>   KVM: Send reschedule IPIs instead of SMP function calls for
>     non-waiting requests
>   KVM: Extract and dedup the kick code to check if a CPU needs an IPI
>
>  arch/s390/kernel/smp.c |   1 +
>  virt/kvm/kvm_main.c    | 101 ++++++++++++++++++++++++-----------------
>  2 files changed, 61 insertions(+), 41 deletions(-)
>
>
> base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
> --
> 2.56.1.708.g77570a6a1d-goog
>
