Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561347;
	b=rsAElK31VEKufaYHsZpVN2KicWEnck69pQvmnaGKCgZXUW0eS8P1QdbvcutaiMmVrxID
	 CiF/4F5OH6fTdMniPUCXQvxWjrxf5syXVFlsQPzT3ie0/BtSm/Olm7+2HsAtFNwyRPL+Q
	 VgMRFReYHMu2dnRhs+Yd2AiCNV1TBPGIvongCPU+5sphMGFCZ6NQm/bIbNMZH8DvKQkGn
	 W3pY31zzUfVnwsiall+oyN0p9dOoGes2saYiiquJ54YPpW7a4h0QcWurUOo7GrXOvcbpv
	 zMa7DpDozWprglec5lC6aZb/Py91tCnch3sg/eh1ABDW2bTLdaaUAtpP/O883qMt09g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561347;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=lVlaaAsq67HaSInDi3IQqUKqJIz/RKf/oDeO9AktRqs=;
	b=TNA4fTjwsAi0JqLl9hhRA7Iuh1wYvXPBDFp1RArPviWdxSJ2kA/X9a18sd5lSAZ2tjLf
	 1HrLMlJdcjXQ3ctyoSKTDBZITVaau8XIlwKyJQq8PWPvYGQ3J0WnfJg0tp5VYQKbPSWUq
	 rHateGlk58ICifLOluplFbgrFavwA4terqVwyy1X+tVC60yh1OB+e4svaeo+35ujr4YbK
	 8DhvXttkMzounZBX/XODYtdDaxlpSj1uQ86TGonZ33jGqdhyxcODzaoUNxUe16IPC1YcV
	 JlUMsfqZg5h1oa5c0mD50cN56pn6KXVtF1GZb3mk2gvJC9r0Gkp0cURiKpeedG/ypTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z1MknK44;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=C2oNYAJk;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124FD606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124FD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z1MknK44;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=C2oNYAJk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795561346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVlaaAsq67HaSInDi3IQqUKqJIz/RKf/oDeO9AktRqs=;
	b=Z1MknK44IfDjQGRRuf7+QPIO3gHJYlO88Ka0sieHfAM2XlPJc4LnFntT8JJUCggshnfF5H
	MPiuTU3nXaLFqxRhjtM6ouwJBsdSTB1g9zWD3IXrcOIjASNfx3tWJFqZ7LcUEfzr/wKMfV
	G93hk+G2xleWzNRsKU1AcsZylvO8WDs=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-SXHyvl5GN0WtZGxt61jy6w-1; Tue, 24 Nov 2026 23:02:23 +0000
X-MC-Unique: SXHyvl5GN0WtZGxt61jy6w-1
X-Mimecast-MFC-AGG-ID: SXHyvl5GN0WtZGxt61jy6w_1795561343
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2f2df81bbso2917127137.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795561343; x=1796166143; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lVlaaAsq67HaSInDi3IQqUKqJIz/RKf/oDeO9AktRqs=;
        b=C2oNYAJkQDVZQjl+r6m1PVwF3yAfDSEd94Yeqy0OP+2Q8Z+sqKzReUjkENOVekxVdB
         dZ4isSA8hmnTo+E2J67hC0ET29g4Y9TaY0kNgzI2yNT9vVk/RypsZ9v1hz8MlOuGlk/w
         0w2atOFL56h1bLro+o2Z4lr0tI67rAzkz38gdsENMAWOJnMpQdhn1cDstap5KqF2vifX
         WCxXUL98cJME6HuSH9jS7+bB1ZV+FywEGwM+4yoC0sTmD8hhp2I2tT7qG3udZ0quahSb
         UT7X7GNuaJCJYn54uNSlqTn9y0x2+M+rWqur6uQtxFu5DRhZVIFG8XLoJYK9tZStuZ9s
         IjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561343; x=1796166143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVlaaAsq67HaSInDi3IQqUKqJIz/RKf/oDeO9AktRqs=;
        b=kPG/WoL9SYla42a3sg0MUKHNJN7HfozisyjwtGXh5wnjRp3yJBNFliRdJsQGpGEMqh
         c6iiBy4t/pRxi8Etp/YWRRsBBCNl/eHIrMMNt367sR1VQHP6s44NfA5Yy5o3DXzxW8UH
         IdXUMDVTi/z3xVnAmB88w7aT1lkwNehloNGeNrrh0nMZ5JJt/9KZS9NF5snELOcKsx9m
         EMRmx5uq0GVJI/sxMvJCXK6wj0CvAJpTWqGghKrgBVIHc+1ykp9TjVPWPj09LWmLrtEf
         oBrdj2YGO/IAa6MOoLRwXuOJLmISlVsO6Dhns/h/UJXzEMukQueuvC2ctcqe7g9EpgIP
         BGJQ==
X-Gm-Message-State: APuU4Z9/Wwr7Se3Unfq3mTUYmMFBiYgGcrOhWXz9VXX2WXmPOtwVn8uq
	B7EmsFGiDtnelD/sqA4l5oKnQ2ZbCLaInVWhrSK47by/sFXE9KKtHVB4FlMqaCeZ35JAKcZkaR6
	YplAIk/X6WTETuXioqxMNpTruuQRdzTkPpc/s7KsqbD4YwsKxWai5ZDhNG+12AZ4qxg==
X-Gm-Gg: AZFdTZdjQR8JL1uI1QOS1w7mufAp1QQMWoUIXp0SLw7j1WDROty6jmWJaF3UHaXGVdQ
	AFAtmzbTmGBHHcso9VO8puf3qExUOSsimWydpoCdZv4d5L6bejfpu5jZPQhi6AOEYqfxhEMQeA3
	j3QSu1Q7fAMsaKex1eypH81o0kNZekppe35nhTtaaH9/zexhUDmtmL1U/+SOdfZBgDagoplLMBW
	jhijuZ0RwaNufb4AXtjV4HfDoQOgvChLx79O45v0aAm35vxFCBQ+ZIFzpjumT5SGML8kcPuEUV8
	EonyzS/gQ+RibwL0hObfR+2TpVZDMh8cZwt97+Om3RRORjrTbZh1G6fhF76NSeFXEtODSY15Ftv
	dRjuLwK5kTRkeUDg/OeNFE8zN8SfKJXVQtCf4EWx09Emx9ZLqV+MscT4x6BabCCEjuZxs1s0hEH
	VJXk4QQYi7Tvu0aQ==
X-Received: by 2002:a05:6102:26d4:b0:7d6:83ea:1183 with SMTP id ada2fe7eead31-7d7395b6140mr9305363137.23.1795561343349;
        Tue, 24 Nov 2026 15:02:23 -0800 (PST)
X-Received: by 2002:a05:6102:26d4:b0:7d6:83ea:1183 with SMTP id ada2fe7eead31-7d7395b6140mr9305309137.23.1795561342760;
        Tue, 24 Nov 2026 15:02:22 -0800 (PST)
Received: from [192.168.5.11] (pool-108-49-8-79.bstnma.east.verizon.net. [108.49.8.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bf848dsm147522066d6.44.2026.11.24.15.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:02:22 -0800 (PST)
Message-ID: <8d952f5fa8d93c5d5f92292b5af203e83e5de3ae.camel@redhat.com>
Subject: Re: REGRESSION - 2652aca460dc ("drm/nouveau/kms/nv50-: Enable
 atomic modesetting by default")
From: lyude@redhat.com
To: Mike Galbraith <efault@gmx.de>
Cc: lkml <linux-kernel@vger.kernel.org>, Dave Airlie <airlied@redhat.com>
Date: Tue, 24 Nov 2026 18:02:21 -0500
In-Reply-To: <96444f8e0155d34c7a07fd5cc67ed87784bedd38.camel@gmx.de>
References: <96444f8e0155d34c7a07fd5cc67ed87784bedd38.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-24 at 14:16 +0100, Mike Galbraith wrote:
>=20
> In said commit, you say...
>=20
> =C2=A0=C2=A0=C2=A0 Now that we've protected against breaking things for c=
hipsets
> where atomic
> =C2=A0=C2=A0=C2=A0 isn't supported (<nv50) - let's enable it by default o=
n
> generations of
> =C2=A0=C2=A0=C2=A0 hardware that support it. We'll leave the module param=
eter around
> for the
> =C2=A0=C2=A0=C2=A0 time being, as turning it off may be helpful in the po=
ssibility
> that we hit
> =C2=A0=C2=A0=C2=A0 regressions.
>=20
> My now a tad long in the tooth desktop box regressed, symptom being
> an
> apparently bricked GTX980.=C2=A0 It bricks instantly at login when
> starting
> a plasma6 wayland session.=C2=A0 Plasma6 X11 or iceWM (et al?) sessions
> work
> fine.=C2=A0 nouveau.atomic=3D0 makes GTX980 wayland agnostic again.
>=20
> [=C2=A0=C2=A0=C2=A0 2.846347] nouveau 0000:01:00.0: NVIDIA GM204 (124000a=
1)
> [=C2=A0=C2=A0=C2=A0 2.928383] nouveau 0000:01:00.0: bios: version 84.04.1=
f.00.02
> [=C2=A0=C2=A0=C2=A0 2.930480] nouveau 0000:01:00.0: pmu: firmware unavail=
able
> [=C2=A0=C2=A0=C2=A0 2.935007] nouveau 0000:01:00.0: vgaarb: deactivate vg=
a console
> [=C2=A0=C2=A0=C2=A0 2.935270] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
> [=C2=A0=C2=A0=C2=A0 2.935288] nouveau 0000:01:00.0: bus: MMIO write of 80=
00017d
> FAULT at 10eb14 [ PRIVRING ]
> [=C2=A0=C2=A0=C2=A0 3.002282] nouveau 0000:01:00.0: drm: VRAM: 4096 MiB
> [=C2=A0=C2=A0=C2=A0 3.002287] nouveau 0000:01:00.0: drm: GART: 1048576 Mi=
B
> [=C2=A0=C2=A0=C2=A0 3.002291] nouveau 0000:01:00.0: drm: TMDS table versi=
on 2.0
> [=C2=A0=C2=A0=C2=A0 3.003475] nouveau 0000:01:00.0: drm: MM: using COPY f=
or buffer
> copies
> [=C2=A0=C2=A0=C2=A0 3.069569] [drm] Initialized nouveau 1.4.3 for 0000:01=
:00.0 on
> minor 0
> [=C2=A0=C2=A0=C2=A0 3.104139] fbcon: nouveaudrmfb (fb0) is primary device
> [=C2=A0=C2=A0=C2=A0 3.155613] nouveau 0000:01:00.0: [drm] fb0: nouveaudrm=
fb frame
> buffer device
>=20

Hi - do you think you could paste the entire dmesg from after when the
bug happens? There aren't really errors here besides the MMIO write
(which isn't unexpected)

> 	-Mike

