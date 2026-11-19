Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081806;
	b=jEbEj8IY2PrWK5MbKVcWGy2x9TJhsJzIlO+OmnX7X+I7I63Q2cPsrdCkmt4LbX0v7Erw
	 xQ9ZIWTykIjPh3crRtaeIKsQs6rjTMa/d2uQVR2inEmkTtVwiS/47JCk5548wyXHbpKeM
	 CXYaz+Qztpol07gfK3fO0IOBMcipU5iGeRUERlmQhM15bFRmOIziMFPAG5W592Y1qa0OF
	 rTckHMDaa92voATNw+08MJGyuaNKl/QQsM/Ic0zBzCX2QParogqUrEpydGCcuRz3p1rQP
	 YwQU3tICGLY3KFFKal+ECuyRxut4OBjYotGCCVwpdP4Honj2sCl32mx3IOpfKmyjwBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081806;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:In-Reply-To:References:X-Clacks-Overhead:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
	b=RAk37iyV3+31dyryklLA+Q6aJlQ4JX8wVjgfePcopV8NsuN6RgGteRyMU7hv8ZsinZM3
	 JxdKkYf9wWWyrrbdCgA3AGxjyQoG6DRqypnlc1MOEbMto9zU07GDtk4ZjpPMKT2wjm5h0
	 UWbSfkQ04msk5exRkIVX2SslaOUcT9TLyZ14tW2plSezWMPLH8kIkpXUPjkIPmufLgTpj
	 vNyrNlNu/L2ip5IfvdobZVtFwawwWbHjnSru4N0TQFBp7ND7MduaMJDdeF2afd/AwMMI+
	 cKkjs+eIj+Mu7/3rmJ4dMHaH6F65ZzE0TGp1gIlfvrEpNlj6AQs8DQj9Hc1bC6zfodA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CwARL8GJ;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RrswaD4W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AEF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AEF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CwARL8GJ;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RrswaD4W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795081804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
	b=CwARL8GJ5RMdjcLpEFyxHJisMeEBXTHt78lj/9zs+nsVPM8jLFt8LroC2zwv/PqOJoqbDs
	46iS7ZQsasumKq+hIPalw0jz/BsMXZvF8TLT3yscX3ZCcLdBE02KdxJyezch8MXIc78BF+
	TyIv0y5Ykp5xAIpJFygnwS8R4dc6m4o=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-plLEvZiLNpWoZrOZYPeGpA-1; Thu, 19 Nov 2026 04:50:01 -0500
X-MC-Unique: plLEvZiLNpWoZrOZYPeGpA-1
X-Mimecast-MFC-AGG-ID: plLEvZiLNpWoZrOZYPeGpA_1795081801
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67906c453b8so1108779d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:50:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795081801; cv=none;
        d=google.com; s=arc-20260327;
        b=rmNEncu8aXGNAXX1+CCjyjOhLh2iTwaTSve/SV8GL+CyjCMw9czKlx1wI/1SGqMcNR
         ApV3qF50MyuLy+qGtLMjGLdcQY/1KPC+vo/ftQfcsqfZP93gNDgoRwKbEU7bOlZIYKzw
         VzTNZ4kFHvsof8cO5vHDBl3onR0bASjVK0+FmoKhqq1N3zQ2p2SXyF0etj6U7v4PSTH7
         oC760Cfxn90B5ScT6Hj93/o1F3TxhCWMCJsPYIDba5mAQYA9feV5Wb5iF6NTOqRnw7zD
         bl3v2YEjBhLTJHfxicR/nW3C8TAuNHipD72gY9Boty8QaE9R0h4rgdHqApAid/6zk9fA
         oHog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
        fh=3mB/FdUQ9kiOFcEUgYJHNkG1GyT1qS7vtpJ4tn6fp8Y=;
        b=cSZbQd8jLylGU3s+RkRXK0jEVhCO8eY//+c/HeOtT1NN4dbBvkTFWUJUTM6xOw5Zb+
         3tZSjdlt3f+rrITjcosnQyNGfghNIYkagToTP6Bb73H9JlKXlZMoZ7ArJ1ZML3eaEbVe
         t+Esua2syAmt6PTbTgPu+Lzrc1ptL/NLcmUFILCERkHjGuNG2Swvm7gpL7auUuhUvJPK
         Sv6AG5FEqMNYQ61CNQRfjBLRWmXijeGXtIh8XMJFB6OpqQ7ypOTZTLXPhoEwW01f58pa
         crLmZhddBLYml8K24iuLKyvtxnfOwQkRtB9+DW4RvkAYdTf0XeK+Pbtp6fSb/ZPprup4
         pCRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795081801; x=1795686601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
        b=RrswaD4W7x040o8p9lVJjelIFGKhxbDADCuCX3f2gcutea5bMpLmU3WXCGuMd92B9t
         D9phfEC//jtwhHAQ1M9ak3Qc7Qa/NulPXwt406tFz7ZYBiS/2AXsNiSpfSLw/tuZ/loG
         uuhPiMcN84o9wT6eCeFDzTcnuviTRxO3x/tsFBf2N2aW9wtMmG2p5QUi+txlOrxohUwT
         gTa1f4xmuTjwKnLfq1GPYYg0Rirtv3C2AFIvju4L9uCRnJNKGOgb5NbRNXNYK0AFnS5A
         9jCZ9w95jlBxtG+09jE+Bt6RgB2Niwx5MB8qy9KNxTaX8VObLokgheZwY3YlpMzuZpvT
         hs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081801; x=1795686601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR1S+pskGrBHsfPFNh8M/kF8t0FfixQAliVE2UfJl5k=;
        b=e8uo7CgH3H/4TX8Owo17VOD6Q1Y0/27u5ruHoZOLZPORPHaqnXAKGgq66ByE/Hdd+I
         6shrlYh6QRBTgu1KAFZuHJeoKsdMujwOnDJke8I0P7Hfw7ykLTmeycUQdkzEMvhx5NhS
         32yISIwsOc/XwmIKBmeVMNV+QrC+xIkpsA02X3vaPZ8KIXhCcoxR6lJprtabMAmIEhQy
         d+VvRE2rt+j+9DXkNy3wxj3Ie8VYxbxRvkTDO7ddg5aousNBj4fq0XRhjGTD03s18L1l
         spTD4jDb0upObwgSnePVy2IqTurZJlIAkl9Z2n1k75OQDUXXoJvBHTWOYaVOl9l8H9aS
         nBzw==
X-Forwarded-Encrypted: i=1; AL+hErGTLlinMESxNT4UjxTgTBFzP2pf2bIGBN4KOA6tzkaW8o5+FffXYvBFGXVnXdmZN4pxQPu3NuZi+87yC4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jtOCYA1ghZod28atdvW1lg4uDsG6jWpzPo/PEtPVhPY4AUK+j
	BHxaz0ruTZzlXsp1HFXCt+Swuj2mFkJb6GpkMosm3oeHHldWod2OkAYYUturuCRpGi42rS1VJMo
	0pAdKix9OTwwIZh4jM1fcFXUxgCExH7er5g8z6CetYJZlFeR7Zr3sq448RfLUnD4x60soVIzF+x
	4IGMrq2Stmu4+bsHmmQevwgigYBsTHzzwFFJjQaY9s
X-Gm-Gg: AZFdTZfmBDpb+/Ulqn/eD1KyRuyJzNw9OHVdPeg1jo/6veJuuwT1qtOHbNVQ4jN1avF
	hRrv0Uw5M3i9n//ObdFmRZPpLuWRLA/lBXow9rS1l8mEx75bEWuXksMRLKypD3ED3qABnALiCs1
	TmVnBZPLMH5HSzOyNzyIGf8cOPU8jj+VSP4i2u2LcpkRo9KSpOx9/PJrvn0toUyRTkulM76Q9VC
	xu1UbkS7PxGikC6
X-Received: by 2002:a05:690e:1209:b0:677:d375:13f3 with SMTP id 956f58d0204a3-67dec391b5bmr206037d50.35.1795081801025;
        Thu, 19 Nov 2026 01:50:01 -0800 (PST)
X-Received: by 2002:a05:690e:1209:b0:677:d375:13f3 with SMTP id
 956f58d0204a3-67dec391b5bmr206029d50.35.1795081800552; Thu, 19 Nov 2026
 01:50:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Nov 2026 03:49:58 -0600
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
In-Reply-To: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
References: <20261119-cake_mq_fix_incorrect_tin_override-v1-1-3238122d09ca@tu-berlin.de>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 03:49:58 -0600
X-Gm-Features: AclHuK_N9nYxCFMP6w8kx9onG0fKDrrh5jvaU2YZIh88M_fMRcLfBkWhV58g10w
Message-ID: <CAPB2EApXULDiMGXMS6qg17NJRyEruybWMfu_d35tjBPdk4ftSQ@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: sch_cake: fix unintended tin override with cake_mq
To: =?UTF-8?Q?Jonas_K=C3=B6ppeler?= <j.koeppeler@tu-berlin.de>, 
	Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>
Cc: cake@lists.bufferbloat.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jonas K=C3=B6ppeler <j.koeppeler@tu-berlin.de> writes:

> CAKE allows overriding the tin selection through skb->priority: if the
> major number of skb->priority matches the qdisc handle, the minor number
> selects the tin. With cake_mq, the per-queue CAKE instances are created
> through qdisc_create_dflt() and never get a handle assigned, so
> sch->handle is 0 for all of them.
>
> For forwarded IPv4 traffic, ip_forward() sets skb->priority from the TOS
> byte via rt_tos2priority() when net.ipv4.ip_forward_update_priority is
> enabled, which is the default. rt_tos2priority() returns 0, 2, 4 or 6,
> all with a major number of 0, which matches the handle of the cake_mq
> children. The minor number is then taken as a tin override and the DSCP
> mapping is skipped.
>
> With diffserv4 and diffserv8 this puts packets into the wrong tins. For
> example, AF13 (TOS byte 0x38) under diffserv4:
>
>   ip_forward():
>     skb->priority =3D ip_tos2prio[(0x38 & 0x1E) >> 1]
>                   =3D ip_tos2prio[12] =3D TC_PRIO_INTERACTIVE_BULK =3D 4
>   cake_select_tin():
>     TC_H_MAJ(4) =3D=3D 0 =3D=3D sch->handle
>     tin =3D bulk_order[4 - 1] =3D 3                     -> Voice
>
> whereas the DSCP table gives diffserv4[0x38 >> 2] =3D diffserv4[14] =3D 0=
,
> i.e. Best Effort. Likewise, AF21, AF31 and AF41 are demoted from Video
> to Best Effort. diffserv3 happens to be unaffected, because the only
> reachable override (priority 2) agrees with its DSCP table.
>
> Fix this by matching skb->priority against the major number of the
> parent cake_mq qdisc when the instance is part of cake_mq.
>
> Fixes: ebc65a873eff ("net/sched: sch_cake: Add cake_mq qdisc for using ca=
ke on mq devices")
> Signed-off-by: Jonas K=C3=B6ppeler <j.koeppeler@tu-berlin.de>

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

