Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795208174;
	b=TAaAoFmMqYmdINZZuPNCPp45/p4GTn6VvWTCi28cy9nkpD0cZibQc4snyEi8RrGPnFuT
	 VetpBJUIxq57xByK96DU+ciQHINiBWjIRScnYQd6a/Pc5+RB82dZ2hbTRPrbWvD6v+aB1
	 J8D5l8e0oP7XiBCSp/6TCPB7pgTs2bWbQsnJHRfW66jpyABqt1V7hZVYn0iGB0oJRPrDS
	 nifIZYMJ2QczIrM9rcx68Ex8rtyX7wG0Uwpe1ME8olrDpySKABtTGLRBw9++xDGml2IOh
	 1meSt8F+ViI0AfA8baoQZKZ/5Oo7UgWCnPswBeRaYgarHxogLf3tw8+AlTFTVjQIZHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
	b=s4Rj5zlQ2rXLQyC1BcGiisNn2PeNCw1ZAdduT4QCpQKC2U0Xzdgr2hoL/GGyOhm0w7tZ
	 CM4v5p/OCNemBy2GgbbwXAOdeiiH66Qz5UO3lEMXYE4d7jZz0/O+aYsP50PttEuvNYs5a
	 O/Ojkvd4VUt8DOtSIzwcd9ONY5xphNclKJSfYXlXRd8nrC/QlclBBiPvuN+xvXwtFoDU2
	 XdvEEvKSsB9ANklVS2KdJEzyYJrl4vBgYmwD/yNtoPzJukmJrR3i2x5ui11RmhS4s/iz+
	 TWOyBzRtS8iIHohi7IokMv8dXAzHEYs82GtOK+t4DnDT3FaVNdNlTtDKjsYZ1TGGgcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqnD+BCm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB1606A6B1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DB1606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqnD+BCm
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67df3b1ca06so1524001d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795208172; cv=none;
        d=google.com; s=arc-20260327;
        b=Ap/S2tdFunWXBdySE/h+4m45HOLJIeHj7NdWtCEualXP9UTTH7RkMvV6/Zk2SwRq+6
         pBty8mJ8umt7uJKHt/U9u+ySm4Uarw+A5epKIggE0zNIYrbwd2ByYAQtYkEbMfB8w0Q2
         LtQe4vtqyCRsRrIYc7IRx8EjdMRvCDrkC8uGzbIN6QxTGQoAw16UqpEHth1mY/tL/WsY
         B1Z5iVSO2JyFYVGkcH0XXWom0WKNn4/NkUp5DYwBRnN5in/Hl3I+jbVvx8DXB2kAJhye
         vPTSbvqUQxxsWeHMuozmQECyo/97lIvdTqOO/WklclNA+bNg5fjLVonTKwhmEBtbYQZy
         tieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
        fh=UuLs9IEUmsEkpibD58/t6frRXkMzt2Cuc5Tf4R+X8WU=;
        b=A0xpKT+plE8VhWfuk93v9GfgpDBbqi7QmXc8mnbCM+pUWmiKn8D4Lrijsn60losynR
         stK0Vc4WwHu7VX53cwHMpdLmHpRRbffQV7VDxFf3xziHeRzjTzCWrfF5i4pUyXc+Z6GK
         5Asw+L1WeHVPC23bZQhKOY81m3GhapSC3rXa2MpD/rGd5hB2mIeI1kit/IZXB8AVcv5X
         Bvsqpdc/8VdnJ2JM4OrlzGBEUL7CjJmbZ3NnY8pwxLHsgu2VK+klGfLcg9fgbsjmRn6o
         3ZvEbPJWJIvw4B5sBvnvAGsp22b59pC+dAiIlPuVBhdo6cuw1CHCsyvIhEk835eHFpb5
         pc6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795208172; x=1795812972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
        b=fqnD+BCmZMsSl6GiqWvGzvSz4CDUZNTSHvLmRkRE7ABZzqJO0KBxFvqwkYCxyzdmk+
         Iv7G6Pqj7onc/PUk2HxLn0H9/bpo/PZjyo4h7N4e/GWkh7QFngPaWCzlmRrfxtlMwBuZ
         GysFqWOmnkXYgJEpJkz1FI+lTMzgXMzoZOUJBHFtqeFG76N2UZTE66DIITKOzWu2vVYI
         rCjWmssCCTntC+x/KL+cDN6IW2IZmzj9S0NqNSQN9SMNeIh9Yrsv1LMOmzxnY/v3P9Mr
         pRlxbxuxmVufW+sS9ScnItwnmGagTvXWgpjuN4TVFrdZGBtUuvfLpY2OUKSphYnQkKnO
         PvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208172; x=1795812972;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nHm9hVHT8tsjIbOEfB0poGWscPr0Fu+olYBzenctJCQ=;
        b=LNlHlW+Diucr6Kg5rmxsVODpOEURwwo/b0N0e6f/w9rpNwf8SKy1euDDhnzDdx6zq2
         svBaUYHyRmBDtKkwtLIgVEsg/q6tjMv4NYZvJCQWCEEaciHtuWiAU+OLpksuDAmrKVNS
         /Wo5YLpb5A0R8SloyY0bBfss7ZER1TCuHvGlp4tH48xSh64cAYBxzTi+5Jjh5i3uyGAp
         UfzFIfYsSR7fuPJJNOCOzAwgIwp+Wg9iGX6xQzM/YD3zSgxLJzgoRdfhlwghLFNHo4UG
         mYPt6MpZ9fjOzV0Ytcn77yC7n7pSv4f/JFWXhYLSN7UY27QZhTICt7Abo0xlA9rzS05C
         PFZw==
X-Forwarded-Encrypted: i=1; AL+hErHPOYQnOUtwMfyIe8DSYlsEavi5W5gKyKo8esRlJAY3yHnb7jHrEm6n1HqgszRbGBN85J6mN3b9z475sQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HQ+JkAwjxTOTJV4oVs6MqWBiJ17iux4HZ2isjJh+8qzGdAhTA
	gXAqHSYiRbjU8CjO6re9ltoBYhAp8uJY7KESQAvNtX94guxG0GKKK8FxHgW9oy22QEK5/GnwAo3
	2/MdM0HCu80T6Ia5Buk8m4Wht1AemDsbmu3GFkh0=
X-Gm-Gg: AZFdTZeuAC8cXD4J138qq5X5xAN6ZnYum6NmxC2zjmZECSF7bMxpzy+ZLmIAfA4SEDJ
	9GT+UnkLDrd4nlvS+rwGhOqcV+0EU6m/cRJzn0RccC9bFuSAnj+Mjs+GUl4PTkESmljwIF16YBD
	C5C2JS69aXxkEWVFd0nda8wniMGKBunmYzlTLtNrL8mbG3GhB0FumoNyqLTVN0C3DIEVdU4hzd8
	W56ob3gpHsOxfLxJjuX8zUNbZCU11j/D/OIFt6aMJKXKXYwIpHFA1GndtbgGNFfhZ6XzN8h3fH2
	i7Xk1fub7t5ObVokOpBHeqmedAKKIf8hWWFJOEVIiaIrZbGq7dRMpCF7WP0LRXLxUuMtVIthgHs
	5TZ+PH37OxqzTHtW6uU2t22cMMXZBM/SvAEuzF01n6HcsEEjepzVO3m0O8ymZUEO86q1/CqGE
X-Received: by 2002:a05:690e:400c:b0:67d:e6f2:bd03 with SMTP id
 956f58d0204a3-67df445191emr2111759d50.68.1795208171883; Fri, 20 Nov 2026
 12:56:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com> <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
In-Reply-To: <729eeb67-d812-4f1d-81e2-4f4437181744@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Fri, 20 Nov 2026 17:56:00 -0300
X-Gm-Features: AclHuK-JVUrfgyiwI_LligE5LfOLOoWTobSTFnbiJh9-3VT0Gl2CvuUWo8aq-Us
Message-ID: <CAK+kzgzzcGPWVoXQ=VKFeojk+-=9S_mWBhMdcN44M9QXkihn-g@mail.gmail.com>
Subject: Re: [PATCH net-next v12 13/13] net: dsa: realtek: rtl8365mb: add
 support for RTL8367S-VB
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev, o.rempel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw, Oleksij,

On a TP-Link EX511 v2 (RTL8367S-VB, family D), with v12 on top of the
rtl8365mb DCB series, an untagged frame that the switch forwards to a
port where its VLAN is egress-tagged leaves with PCP 1. With v12's
family D code before the rebase (v12-pre3 in OpenWrt PR #19644),
without the DCB series, it leaves with PCP 0.

Test: a VLAN-aware bridge with lan2 and lan3 as untagged members of
VLAN 100 (PVID 100), then lan3 made a tagged member ("bridge vlan add
dev lan3 vid 100 pvid"). 100 frames per case sent into lan2 and counted
by PCP behind lan3, over loopback cables:

- untagged: all leave tagged with PCP 1 (without the DCB series: PCP 0)
- tagged with PCP 1 or 5: the PCP is kept
- lan3 untagged again: all leave untagged

CONFIG_DCB is not set, so only the baseline from rtl8365mb_setup()
runs. The untagged PCP register (0x0851-0x0852) reads 0 in both cases,
while the port priority (0x0877-0x0878) goes from 0 to 1 with the
series (IEEE8021Q_TT_BE, set by rtl83xx_qos_init_port()). So on this
chip the PCP added to an untagged frame seems to follow the frame's
internal priority (here the port priority), not 0x0851, and untagged
traffic leaves a trunk as Background (PCP 1) instead of Best Effort. I
could not change the port priority to confirm it (no CONFIG_DCB).

The Realtek API in the board's stock firmware points the same way: for
family C the PVID is set together with a priority, written at 0x0851;
for family D, dal_rtl8367d_vlan_portPvid_set() writes only the VID and
rejects any priority other than 0, and dal_rtl8367d_qos_init() sets
the port priority to 0.

The rest of our tests give the same results on v12 as on v12-pre3.
Tested on OpenWrt's 6.18.44 with both series backported (PR #19644).

Thanks,
Gustavo
