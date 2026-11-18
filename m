Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794966534;
	b=KZGuEuin4qaLbqRBV2LfaCl0xoNbVb8FOlXQjsD8+NDyyMUudFq7GAYjrjt2YGEIm9K3
	 gQ95DJ3N5rzg9vM+MXYSsz8cPgaqaMkAv8mAlKzuAum0kdPCXQhskKWEfrjLoKjRliUXg
	 E04+QoEXZMdoqdrp7b0jE5r4OStOTqsbbsAvP+6Edlmu7VcBV6zUOreaGKesQh2ipVOwe
	 gfl79HopA70PImtGGpVbh/jvz1BG9IlXrTz8Y94xiuDfVOqsVmtuIGu/HgZneGXNJebux
	 i6N1FmYTMZIoPLEDZ4q2WLlx+jSJ4L3p8UTz9vXhihzWK+F7nXuaqlDBwwaXpGXDHHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
	b=NAXxBKnPKD9qiVgqe2JdXmmmPpKBGacHfv5h3PTJkxvkRHiLca9SWM0WfZJ2kiDaa0n2
	 O3J3L0cakJx366/nltBcsGD8rzwckjyRrUDxSX3MgjBRqtLeJfTtDU3sMUlWKFOAMRTv2
	 eRnuxeGYyKnYAGbaM/LwkpJ8mbMmcRSXC8vN19ilCZXLoq+YxpmAh/K05hSMlrLbJskew
	 +pREST4VsJQ9OlNui5kfzWRfcGN9Jm/vuxq95ak01DJYn7r4oG6LQKlNP8QjG/sFYvdwJ
	 BpZOE63MMRXidDay+pkGlFANnsxn4qEtgR8SoBgj4zpnxLoImYrZH+O5ZgaP8uAQSsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+05DTut;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C1606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B14C1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a+05DTut
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be9601f31so314701d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:48:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794966532; cv=none;
        d=google.com; s=arc-20260327;
        b=ZdXTTrM/0iorItTfGkNpxR00bPUymlMuFOwM9mMBjiYQT3GP4zisvwTOlXOcMWUP/0
         d6A+G8PRDLPI5Bl/zNGZ6vdbYjbfbzbQ1WgFlm1F6XyKKUvvW7R4jqRaOTl9vtzD/XbK
         S2E4pelIosjKh4GnJVo+/HdRtr1OR2VoSOCpnJtsR/Z84KIDpgj+w/BTr/QijuQsW0Ov
         0eziNTCrWsZn92CekG93fd+7Oa4lAQ1VFkPWjXVIYWgItgMmcvFrAcVpei4E9ysYJrLz
         d8hzjuXLG9f6Qsei/IsszTBtjb+JajABfnAz3te4W+dRqyU1UwwjCheTL1tcq1siSicc
         Cksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
        fh=w56atT94KT8bCNAN4mp/NoXOPW76dn0HXbG6NtiCAs0=;
        b=F5zaCG81/BOk0y+N0xFuOTvyj8UR/EM1DtoZTCjqbAaINlb45n2Zu93YusA26u4dRg
         I7Bio4bIWgd402kvMT/R9rD682etYU7wfVsWx0bgz2GZaibECzm4C/YdTnBA24TkF3rb
         onooYpClGxIxDQBI6z/CnaM4FxX5fTwCPLEvfvXOKyAMdvwhGds/EtRFAWqQxIeM/4MP
         bVOa8Wi9TniT9TvoAQ6obMspNa6rjkaL30w6tVc3WB3pdibsARH6cNYX8P9TuYiJedYW
         4RS0JHXyLsgr9OHEX8XrXdZVdPdReo3ffFzwVaQBsd6a6d7WeLnnlbofDeBB7FIFfzHd
         J19A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966532; x=1795571332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
        b=a+05DTutJvxia7IoTDjNo1VYDRBwwwjVqFXekgTEedFWdaZYydMQW+429fNheV06C6
         P2ZYpVEElqd2qFIqiIpUcCRx+MJv5rqfL0ES99/kH6L6QqH0kawf89FzRLFKB+wI0+Ds
         HHE4y7IrIdv//eLLu21CiojY/DM0wCH/0yI7dCBvDCOIDNeMHLkr7NRYmyEzcSkcY8S8
         NZAtkmaf/rMU+r5ltV/c5BQoR6vMIEFV1Edyxmv8remvG5z8SA2U6kPDzNI1sqDZTE/f
         i2v2R4sUxu+37FStQRlTzg4yDiC7WjtHuoeosX53ZNpMkFHXiHZULBQzYVHPodSkWCqu
         E57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966532; x=1795571332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qA17DFw7pSjm3SQ+rD/8sExO1zdTiuzDiXAhNV0lYE=;
        b=Bc3iHbenCkXSc5ZSn10TzeLEgw+IJ/Tmune6TMou0VteQnl49I0kMSNBX5fj6XyAil
         jI9K+mzfpJ6au4ad+yiJK6Q7+oKQN5Wpz5SfLiYOT1aCYiWQzMCpat2KKwr8NYR7B71d
         fZo6TNfBV4/9JEYRpFVgpRjEbzuezppAH9LIHDN2ZBNSOgD0DSJH7vvLfsRDJdd1cqn7
         jcuCbVceWxj62y73/qH1EN9jGgfy5oWrcze63L8EbNt6aMgVIOyNyKJGQnOgquMQh412
         p+zDy45/KvJqTOHEFE+lnDrg1m9WJy0pTihYxdEo8cub9cNtv2zlM+3XL77Owi4/Nm6u
         UsBA==
X-Forwarded-Encrypted: i=1; AL+hErGRqUOd1syOIO1HQf1Qq4ckq6nvNqsfDo1RpylHJAYy3J8tN/nEyX+NE1affaSREkJJEqbrh/KK+AYnjxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gZuX1psEk9JyK4yUFesQXSgvgk1BXYT9P6npBM2kuKPlZVzFy
	ZvymS6vZ/aBAoO3gOJ4DVt2KpmvomD1zi7nv6bUy5L3xGqZNBV8D+deIo6Edq+bMo+bHcVfvVl7
	z8KC7s4QuAcM2hGq4WzAp0M2n/1i5I7I=
X-Gm-Gg: AZFdTZdBZFZpiL+hdsJDYUV9DFqdJq97Yy67Pgv1Z/TT+lV2aAlAv1vEjl3oEkdGNQG
	D5t40Uwg7PhYnsyaeN2Xqrl3u3Prhwwuws7n4SIh9HfjoufL0/+g9U89ILJhGPnc4vd/fvOVY+3
	62HFsZ7JUJWTNYJatejvu3ekVXjsH5A67rRMUmEM4XxvVrRBJy2n68MvyBYA1Bxhpw4LHIW9/rn
	Q3cqYIJ2SGAG62x2s4y1MOwyVAssOxxQqG+YpamacSMtEqG39xNonDsVFNt4nAeuvTKotX9HmI1
	1eIuYetH4DFhaVpVWrp+4ujd9gSrySqWOXdwOmLeHW0IGeHEauDmxASqieeXrDNqTXXGptyaVfa
	3ROXAzHqWF2KWYzZjj/Qk4UOGEslRxsxuPABC
X-Received: by 2002:a53:c044:0:10b0:67d:b299:df4c with SMTP id
 956f58d0204a3-67dd3fed55bmr447237d50.79.1794966532677; Tue, 17 Nov 2026
 17:48:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com>
 <7edbdf93-91e1-4dd1-9ecf-35863cecc277@yahoo.com> <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
In-Reply-To: <CAD++jLmDszU-XBV9bVDH39cYLSKMDOAHEMdu7s8mxYjfhEvuNA@mail.gmail.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Tue, 17 Nov 2026 22:48:40 -0300
X-Gm-Features: AclHuK9OfDXHhJvhOW-znqZivtMI1pbd9fi69T_7Y39jiuS3D1c5vGLLPG7v_NM
Message-ID: <CAK+kzgwVSG4CBv8NQvQaqyr__BZbd860EDfEMoZU5JdFCYhtTw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 07/13] net: dsa: realtek: rtl8365mb: set and
 get vlan 4k for family D
To: Linus Walleij <linusw@kernel.org>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On a TP-Link EX511 v2 (RTL8367S-VB, CPU port 6 over 1G SGMII to an
IPQ5018), on 6.18.44 with v11 applied as is, I tested the live
vlan_filtering toggle this patch now handles. Two user ports were
bridged with the uplink, two others were in network namespaces as
hosts, with loopback cables in between, and the toggle was done with
"ip link set ... type bridge vlan_filtering", without touching the
VLANs:

- 1 -> 0 with the VLAN in place: after a fast age the hosts are learned
  without a VID (SVL). A static entry with VID 0 on the ingress port
  drops the frames, and on the other bridge port it steers them there
  only. A group entry with VID 0 restricts the group. With v10 the VLAN
  stayed IVL until its VID was deleted and added again.
- VID deleted and added while not filtering (so it is written SVL),
  then 0 -> 1 without touching it: the hosts are learned with the VID
  again and unicast with learning on works. A static entry with the VID
  on the wrong port replaces the learned one and cuts the traffic, and a
  group entry with the VID restricts the group. With v10 the VLAN stayed
  SVL in that case.

One thing to note: each toggle that flipped the switch-wide state took
about 5.4 s here (5420, 5450 and 5390 ms for the ip link command),
presumably the scan of all 4K entries over MDIO. Management over the
same bridge stayed up and no warnings were logged, but scanning only the
VIDs in use would make it much shorter.

The rest of the series passes our regression run on this board as with
v10: VLAN-aware and VLAN-unaware bridges, PVIDs, isolation, FDB and MDB
entries, flooding flags, load, no driver warnings or port errors.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo

Em ter., 17 de nov. de 2026 =C3=A0s 05:23, Linus Walleij
<linusw@kernel.org> escreveu:
>
> On Tue, Nov 17, 2026 at 8:39=E2=80=AFAM Mieczyslaw Nalewaj <namiltd@yahoo=
.com> wrote:
>
> > The hardware structure of 4K VLAN table entries has changed between
> > silicon families. Family D's CVLAN entry is two 16-bit words rather
> > than three: there is no third word extending member/untag past bit 7,
> > and no priority/meter fields at all. The FID field is restricted to a
> > narrower 2-bit width. The chip itself supports both IVL and SVL.
> >
> > IVL_EN (bit 3, versus bit 14 on family C) follows vlan4k->ivl_en. On
> > family D, rtl8365mb_vlan_4k_port_set() enables it while any user port
> > has VLAN filtering enabled (dsa_port_is_vlan_filtering()), so that
> > static and learned FDB/MDB entries use the same key. Family C keeps IVL
> > always enabled, as before.
> >
> > When a vlan_filtering change flips this switch-wide state,
> > rtl8365mb_d_vlan_4k_refresh_ivl() updates IVL_EN across the active 4K
> > entries, so existing VLANs, including those programmed before filtering
> > was enabled, switch between SVL and IVL immediately. Changes that leave
> > the state as it is do not touch the table, as the update reads every
> > entry.
> >
> > Reusing the three-word family C layout on family D would read a third
> > word that does not exist as a distinct table word on family D's die.
> > Whatever data happens to be in that register would be folded into
> > member/untag bits [10:8] on read, and written back on every
> > read-modify-write cycle in rtl8365mb_vlan_4k_port_set(). Give family D
> > its own two-word pack/unpack instead: add rtl8365mb_d_vlan_4k_read() an=
d
> > rtl8365mb_d_vlan_4k_write(). The shared code reaches them through the
> > vlan_4k_read and vlan_4k_write pointers in struct rtl8365mb_family_info=
,
> > so the pack/unpack code needs no is_d() check.
> >
> > The two-word layout matches the vendor switch API for this chip
> > family, which writes only 0x0510/0x0511 for a CVLAN entry.
> >
> > Nothing points to them until the family D info is added together with
> > the chip table entry in the last patch. Until then they are not static
> > and are declared in rtl8365mb_vlan.h, so that the build does not warn
> > about unused functions.
> >
> > Signed-off-by: Mieczyslaw Nalewaj <namiltd@yahoo.com>
>
> Looks Good To Me (TM)
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Yours,
> Linus Walleij
