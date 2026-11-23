Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457213;
	b=U7wmserK7cXFff23oa7hGEX83AFcF17teV1EJXNrzATcQePxEm/vRsTiEBWDrM+sRH3b
	 8x/Pf1/OlemYj+XbO+SgYeLljbI9/VOeV6Jx8bMgd3Jc01BZA5Q5CuKSWIQhEgTOY2412
	 SWbsOAflODfUuuU4LgAo9C7PAJ5c5Yb46TtJwxPckMTK2pU0LMgjdquBgzFgFBOk7ABr7
	 kzRjAVC8jXZ5pQhiWDR2JIdrIcCKJ5boMn9SOdhAffQSqYmCwSosB1IfJYSL3FgTvGIZS
	 tj6fnIEwBfkeZ22vsxv1GfercoOlCoU/v3+1p/tw+q72WrmNlUuV5DbaVlrmstn510w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K/gC1WzVIylwK716jBr23A7FWq/AYO9T9Wc9DElVC74=;
	b=inBMPvROJcit89Cf+W6KYK0/ZXQrvdcxCECeLmtxOnMpx2uvdBbUegEMlDT1DF5Djxfu
	 qvQYXaNrWxOCQj5F1vPdBJq8hgwAcmCRozY/3zBiW2HM2nr/buEQM/HSsN9PK51eaNsih
	 RJZ1Ws+gLPGx1fVXtaW8s+gwJ/JVUOV3BhdmqOtnZhUeNB9Yue8Mc0DnQZXQcpUdNeCSh
	 9qJmZTZlb2AVM4F+6d1oZatI8FC9DImVDoR9RdZANVIgRJuUZa0B0sNhqfYn7hGTiUCXu
	 OhwBmUX4OPnBzcsjA+4O0rMLkcszWQUgI+IORN8IvfrI29U2IYYDe2pA4pktJbmOasA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynGHK7uE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036ED606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036ED606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ynGHK7uE
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67be4f2f4d4so4091295d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457212; cv=none;
        d=google.com; s=arc-20260327;
        b=Z60qKByTJ1+vl9g3wbr4/5J46RqOvQ9tO6+gbg/zlJC41fYjgjnCtuxOIjpCMlx4Xu
         0IX78YaMA/65V+Fw2s7xB/iioXu0ss/PCDKao1nv2WZ3huP6oWH6SVOU8j7GmgRZm4C3
         o5OTtRyAsRF51b4WYq4JK/1YPFA6uFTTNPGnPqgXK+kXcZrOLg3ApAqFEM3KBsEtGt9r
         ZVR+HnCPIYwIp5751y2u24hTeJO1FLL5R+/I8GFdekav3W5CSpfnRtIOxBn9FHsrZfFP
         h4i5ELBR58JrL6lmbGAbd5fv4VCOIZQBD3C4N/45klLcwhGbFjnnbD34hB1Nxys+G+Eu
         7/4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K/gC1WzVIylwK716jBr23A7FWq/AYO9T9Wc9DElVC74=;
        fh=563nRlPXCe/ZjT/ZTwd/wvxJKRIG3SqTgrrKVbPWbpg=;
        b=j62FLwnSkuUhAXh4JhgktGAmiQBEpAwo+s2KaywVwOMHo10gHTvgC56lyNFm1Z/I2B
         lmIhweBaXkRtCQZK+7OZjBQsWUSEj0oU1aVy9t80CRLmghSryBjgKgg/plaeaapDv5yS
         LUY8eUaCkKFqhpvJIxb6I+e/vGCs14bazgKyuN5+HXFQ49gZhS0iwza6zVz9xtSvDQis
         JAeXaG8ZsEbl86U56UU9K6LCC7IixDLrs7+hCv1SY+h7Z7Kox1Bi6okXHUVQYVIM3FQN
         BWv18xGBNtKbBlvfUarozOFQKAKwlM8vieI5NWEAfs9VWHC/3V+/wWenUBCB7e3v9B9m
         oa5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457212; x=1796062012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/gC1WzVIylwK716jBr23A7FWq/AYO9T9Wc9DElVC74=;
        b=ynGHK7uEvexHqw48hCg85zxO03l0VsE5U57hLmfl8nlbBwF68tlK9YYvxVRN1kOjF+
         Cbka8q+ONjU3JwYA1L0RANsDs2irI3NaRWoI7Dpspzw37m38nwFmAiHEv4sZuKvhDawl
         oDiAVcf4tLb3OhjvhyQ1xS9zval+bi/EMfItyd/aykMxzB2ZfNdre/eisMt2A51pA0yd
         nFl0/q2Qd2KXdZnucHrhHZUO2D8HJzCfP+vwZLuaoaSeMerJ8Yg2hnYK7rmXrKQjwvrC
         2nNOFZsDhXdOi6JDe0EbMkqMTDY+9m8n+IEOdp53olcPjsXqg9kIgrra/3JhH9jJeMWZ
         3oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457212; x=1796062012;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/gC1WzVIylwK716jBr23A7FWq/AYO9T9Wc9DElVC74=;
        b=paY/9ujdAtrZ5ce2Vh3+8XdyzDsls7yzFkFuTR9CxhyzzOakNfTB2HmUuw8JQM1NNi
         Nmg75abRUbhli68Y6WAC6WRPeFiOwYywQ4epEK6jcw0uGRAe1AA0392cgrVJ7a1Lp8DA
         LXarr19PbkgpykyTK8WYPPwVUzR9fon8GPqtk8axSGXNCZVdR+2KqTfab0ZGxy9O2BK8
         /JroTfn7YLCE276+7AWtJOXv5JfpOSJJtmsHdBsuAeNTr/D2iV6913T0xq5jsamLp12+
         SGyDe/42+qlmXChxuyFWYjp6W+0SpWJtoHnZoDFDRGBVYOEuNy3iIVYsX2BpbXlwoi6c
         BJWQ==
X-Forwarded-Encrypted: i=1; AL+hErEWnuhj7EH2OtN4RwUoRl3I1/JpdkACl7KenyrwiN1lObfVgOCh2V8xhfftXBj/zDqJ7Ujl7gqio5D9XJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qtDr+YI5QvjqAFGsMv46BHPdGrp47O7JBzdbTBM7Qn0PPr4Vo
	l9q0M958VQzjpGjtgRrPMwt+7zMDGxJpmWFdG2ygCz8MOVVS9e1n9HjJbRlFovsc12IBP87Afje
	EJjpODuyLCD/d55y2+hRav3Oh/YAUDDI=
X-Gm-Gg: AZFdTZeHlJPwKNH83mTMVptYu1BNYkzAJFS19mzXN0a9jqsUkBmoQUFIA/7J7HH7K18
	UlZommvzzEjuhEcy6vqiSx9CNaZJVpPfFHBMTKnLdnQv2T7Y3q/fD9h3sWErfUReVIWUPqTrLT3
	vfZNTdBG/96dcl4ji8CeQ0T16QmdjOjBenVjujifihC0TyEMvCIfEMykFxTiH4Ccdn4RdRKSSZv
	LLo6bzTv16qK0E0UUashwmwJ3ZZRCPVXVF1qFXatrfeHDf2OGMxan8ohn8xY4gfXDsl5v2ovzf2
	KFpdtrDCCE1kIraYAhc+PJVOvsCohJ0FR4W/rqfSAHS8nMxO4fwZFSbbDvWXfstIlU0dJ4YUdRO
	bazfnFLKHoDRxsp1WPyZ0LCNPM5is9BHiOGDIx3RruLx/hLk9pGXiCK2nliviB/VCAhI98i9ouH
	/NSVFBZzCxszUSSBfJdPqxDPj1Nn3+nyU+18A9ObFhGOhDEcl5zw+5JbxV5oU=
X-Received: by 2002:a05:690e:440f:b0:679:b5ef:a0e4 with SMTP id
 956f58d0204a3-67df44ff8cemr2520240d50.100.1795457211899; Mon, 23 Nov 2026
 10:06:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
In-Reply-To: <pm-bluetooth-objects-candidate-0218-v8-da37c8a6b33c9d2d8efc-0@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 23 Nov 2026 13:06:40 -0500
X-Gm-Features: Aa3M54oC2JPHwdLbrzUoRb6BHLhu1-ajOv4wUQhdYutOJfAao_ufgCkye0yzpeY
Message-ID: <CABBYNZJMr848DGgcX-SUjf5UfcwYfrB12bGRc0ZVzLWsMhc_rw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Bluetooth: RFCOMM: Protect sockets during teardown
 and TTY handoff
To: Cen Zhang <zzzccc427@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cen,

On Sat, Nov 21, 2026 at 2:03=E2=80=AFAM Cen Zhang <zzzccc427@gmail.com> wro=
te:
>
> Socket notification and TTY handoff can outlive the object which made
> the socket's borrowed pointers valid. Keep the listener alive across
> child unlink and notification, and finish old socket users before the
> TTY replaces its DLC callbacks.
>
> Cen Zhang (2):
>   Bluetooth: RFCOMM: Hold the listener across child unlink
>   Bluetooth: RFCOMM: Close the socket before transferring its DLC
>
>  net/bluetooth/rfcomm/sock.c | 17 ++++++++++++-----
>  net/bluetooth/rfcomm/tty.c  | 20 ++++++++------------
>  2 files changed, 20 insertions(+), 17 deletions(-)
>
> ---

Netdev sashiko found a couple of problems:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/pm-bluetooth-objects-ca=
ndidate-0218-v8-da37c8a6b33c9d2d8efc-0%40gmail.com

--=20
Luiz Augusto von Dentz
