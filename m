Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967236;
	b=Kv8Nl+YjxjWFGb6q5GgCslwfKHXqO+kt5gRJoVR5ujI6dmxc8GYHAPLhsLePHo/TySTC
	 Aog2VRK6q/X56lq2MXPPiwq27gT8xA2HIvj48t4//HuBfnzFMJhvJApkHnv+FOG+5i22W
	 /QbMWN34SkZPIUsnnjCM6Mm10oSNLFK2XxAaq4RqtEv1l7GaKJuGtRAWIxbgDpXlU2z1Y
	 ImsbtjZxx9rp1/+lNllWx770VUpfeX+AfOVrdgVy/laHYdLzSVRqas2GUvPCJP6xGJxJg
	 bp68qsalkRazzmwu8V9vYV2jlkn+gmytErl8gKtiypUd908DOOFBrllAdqt9hxVHOdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
	b=Z3XwbnLMKWm6brl3qj+XfpFXAPmwXZKcCiM75HeewW0KGgBgolv4AKmwVi2DIXG4ztqT
	 eVJlPYWQM+UBNNXLfFxI79prHJTKTWxguXkRO4XdRoQTFZxYZ95jGqRXnq90jK3TvNmvX
	 wBP1nG2AyshZy2wpuNYLikYe0HPKuyhtTA6d9JSmvLtmXKnBeUYP7L0QGEMfGITrNeU4b
	 UBBIlT5gR6nrK+0QrKSjDsO6rnsXpdHmUy8cLppVfYm/1CugCvGR6EMvsZ4XtPb4pa6wn
	 31b30WGqw89/AfVzy7/NBT7E7AJx1ynf7AFKhwbtvF3bOEUJuQwNn0o8lYB14ssRcjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQZegpSj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B55606A331
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B55606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQZegpSj
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c468bd799ecso52614766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:00:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967234; cv=none;
        d=google.com; s=arc-20260327;
        b=SE9ATSPuT6jDkkUf0+/HXdYZ0CALNZXGt/gI3CIPWVDWpbX6nXnjzWbiGiCPu2TNWN
         jUf3PJIwcTp0oOiD/MjvT5/FSBuOi0M2+AvMLFOdvrzYlE9OgV9dW27ixZCpgfQe0xOy
         xDTrkCZhZVTFi2XFrLuED8q9gFGetZHBfouQpBPUU5aLEoZKL81WunAGhfTKQnWqd+jM
         j9XUxP/1OzqBvb4cBeL5gz1KLyP25diaiA50ZNVNv6ipQA4BAOcd75EDqH7GC6lBrvOx
         y0LWu5r1VYX9u6cFe+urWRbt7bwJsUdiSfG5Qi5nLN35MOaoSnQt+cv9SbeK/ObSpIL4
         c+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
        fh=6c+x9ppsNaIB4npRhXsNmRsQ0TN4KS2TtrM/jhxz93Y=;
        b=YBFrBBISkTSVzKWiyd1gS9/RC4bLLh4wdwzzjcZ0HAuH1MyLdV6/8IxiwBXscIw6Mg
         gp5MybqwP83tpDXeQ+ZHpYvyqpkXg7qXtfsF19j3jE0VVf+xrO9IX9hxCyK9oTY3wG28
         9tyojU9XsspwssznuzW7MrMAal1lJqpVxVnUDaoIJl2JM3YitANnA2Ec5b6471j2ZDrp
         q6XKGNelW0PAVMgeWRZWeJfzcqFCKng4TYPn1J9GeuxTsA/gGwN7oKeuWBzpTf6SbjeE
         nD3LHotqoTNd9230hmXNRNr1AfxIl27UxovycJCDes1QBWUc8lNXHwN8UJlKuYsGZR8V
         dTdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967234; x=1795572034; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
        b=TQZegpSjnt5D45doVsAcAUEEw3Rvakc1nMSw3HK4scuyu2gv+oIsn45/nYdeI2uIB/
         kSVPAJIGr045+O2Q33xA0h+cOsHwJerJhnwE7ErhX0AWCSOjvxwD3sKT27FC/4XwNFzR
         fi3bbTaBFkUB95dsQHB7HjJ3SP1/ORdmI/z8AE69/4m5gnIaD13s70IPCF3qxOqxg/2q
         WjMeDzqN8LSquE2JStqEt2QLKHGFPDG2M11yZ4qUwU6KAthfh1nrl2eC0s0DeDCRvw1n
         ucJtzqjlTt1q0MDnns9tM3EDGsHriN190pHwUm7QH4cy484L0bPd2HevAJwfmy/QJVO7
         e6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967234; x=1795572034;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7DtEa1fPKxHzyQrbe/ja7llzwuQl0kRoXKt8GgAzaxU=;
        b=LdAx/CTK3J5AJTQtKXCRF15KBmcuEeDVkcZ0mkP06awPLm5ntj1LCu/7keZGuqmebj
         Kt3U8IOHlaFy5laVgc2gYNWGtfeBEa6tTpNYRt4lAiKxAXzEpcV4TZOjaRYyz0+snRqW
         72M5wix+xTZ5uO90wTa8rhpUviDCcfjD2O1saYhWiCfRsZYU6tTC8R2M5XmJb1cIwKQm
         HFI7TjbWjYMERfpxzpjWVe+RR1xwtm0QF+VMFCywyL8lVVHU+j6iotsYdsvagLwHApjL
         OLI1SP2Ul2LUyaiG7VgtSGvLUu5JnXnGvFKhO0Iaih954XcaNnC3+/5LXOkIXta7PoYf
         yqUg==
X-Forwarded-Encrypted: i=1; AL+hErGhKqeCCMGtSU8qQapT6g6+U3oJ7sMJYU2jVvEt54Sqe/GjNJYZEgtXzyY4sQfe4YNPEekwg0cYyAb1OZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QWZEdlIN45v+yhcj7hJK/ZkLc95dsO4H/+U6ejhpE0G9wbTVX
	kBr1w3ATRY2dP/xJVW5Ya6uR+0dPpAmZE6YjC4eFbtdj0rf5BrISPcKl6gfYW8pRq0HHxnPqcEg
	Dtlqg9mVN+eE62fxDxx6anPc/4+9VOv8=
X-Gm-Gg: AYBFou2OUpyHSJJLiOUH9GQu79tK1X4aN7u1iHXXOuY/URV+/kUp1+T30dRxiq9KVj1
	slXvw5q70TpxAgKG7REmc0lSgdXurEeRZVes4akY4YHVebLg3y+8RJAJRxn26xhG4D9HGYKthhf
	WmUYjiIGtjRrX4e5Adl7SQZH/pzvYZPaNN+D0GNNplTwIrJ/h+hoMisS/SkY6/Fuw5JEHVdvQ2W
	PldkCNrw6s0mrSDzdr5Si/WLfKYP+qk6n9K7bTaLO47DQVkVLyn0yKz6yeHL2BJ5ucVlRUXA6lB
	nHtxUsDdglzZ3+kMFG7FDy38os8LPJDITWBjh5STLKrLJ1nJlNhSynXDg9/zRaq0iYL5TUv8+4F
	ROLk/jMfpNGJf+ETUWKq4A2UX+a59SRAetHbTHDs2GIOcEL0c2MYzjH37yp8Lsk0OS9isJVqY
X-Received: by 2002:a17:907:3e12:b0:c4d:4ce5:7733 with SMTP id
 a640c23a62f3a-c510e1f2a23mr79732666b.30.1794967234088; Tue, 17 Nov 2026
 18:00:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cf3fd237-2290-4002-8de0-ea4100ef0f85@yahoo.com> <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
In-Reply-To: <62c7fce5-0296-4e66-92c9-fdb501ef592a@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Tue, 17 Nov 2026 23:00:21 -0300
X-Gm-Features: AclHuK8VdWRcutya0Cw9hPH7PsgGSrdsC1cePFqvcBvKqqX-zjhNDzrEEgsZTJQ
Message-ID: <CAK+kzgzcugSW_Qo_2=qyCFY3C-bjELp=7nbsDigvh67Pk-J1gA@mail.gmail.com>
Subject: Re: [PATCH net-next v11 09/13] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Tested on a TP-Link EX511 v2 (RTL8367S-VB): PVID registers at setup,
PVID set and clear on access ports, untagged frames dropped without a
PVID and taken in with one, priority-tagged frames taken into the PVID,
and a PVID change in a VLAN-unaware bridge with no effect on traffic.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
