Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285591;
	b=kIKqGqO38coRILyT4pHor/XY7++2O4YDmTFD8qZx0/YNiQnqHipOfMc6b/JTSlb6WWRK
	 0Iuig9jXpVA0J5uaM4FBI9NpMxO+Eg/mzLlOI0y8w+AJcyHJ6Blv336f58cljbRa8RMaZ
	 OZ//36gAEiDzDLhtOratzm4oKxJNeu/vZlucCAmGPw2SA1zB4BLcZqDw3VOi9AyWk/jMY
	 cu9Bv3m/e05212fHaXiRMrDmJpoyeKeOY9lL9eeCGvPLXSAhiLpUFRjjqmec1ExrcmpY9
	 vbsP+eQpq2/L8UGSGauEv3rwmgjmCGWH0qc+m6sE+aOv+IUuSkrlxaXHig6r1Umx/Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
	b=3sY3+7avmuwefIcqkwuC/vDhqQNdDJB70AtaFD8tpbllvbNu+8O0uWgVzz8qboKprKUB
	 6oJVbwF6Rg2Y9uSnHCyBokEORLoZUmme31GzRB9gQHOuWK/DOW8PRQ9GBbnsFACEZah0I
	 TBp2cXrS2up8gFUQYEZcuGF9il85V7X+W7I+qazY4juQgBJjJNcjmstbwRLQlkf09T2Vc
	 K0EMrtE09NKja9MZ64BrfuS5dmM9NayK2aUvdWrlCEy4I+MTUy/KceZJdCit5c8+mLS26
	 3LYp8LkiWZS5AUY/dxrfDqmqtCZVXS+mGEJkyVZityDNpTpPHnkHSl2ngPfmQBgfJIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PT9tRHXr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E40C606A331
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E40C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PT9tRHXr
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1987340d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795285590; cv=none;
        d=google.com; s=arc-20260327;
        b=q7N+S5a++VfvKkDQ0a9dziBMJZZW8HXU2JUYBSOMwbp3rexc6UXsgJ4XrLTa/oAY8z
         DrFBSL6Cgt6JygfU137ua4MIDI9Bkgek7EnPR/XTmp8j6S5blHpe8XHtG829x4A2QWY5
         PfeqGsVraSbEGxgTGxKSP4MhWVkiL5YMw82BrIaRWCQZiOj3ERU1C9NEMYBdBRGf1fRF
         T5/r222h9vUYzPwk9shcIJhmW+ozrueMGWexsQJUEuARzhGujbgEU1VP/L14D4mD5iAU
         bpqxaVOKDHR9UxIhU066yvOhvFWUzvZjXw8W7/7RFTOuDkhxzt7TxBY6JTsdqs9scsu+
         TxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
        fh=y3ekbhk4DALu6bCGtSfcoYf/H6FOg3mpIgWTOd/LBZU=;
        b=Dyn5s6goos3fsc/Do+xIorT8rsM8XAbhVhQ0fkB+o3LExJ1Btt6pwNLtvIxuCuU2ZJ
         IKLM0B5y28KbuBIb9zu5fvkr3ne3QdlUgFbFzqVo6xBoGAZiwm1Qwl2g9tLysNlO0TTE
         4xIkDtCe80xPD3ABVn30c928Jaq9UWUZh6KfyZbW99piUyam/wZyq20edlB6YEN4+pK9
         PQXw9+nLWvoefehjoZ4TzM2rElL/EfO8MPE+QEF+rCfND9NKR07rWdpRyYSveld4bvd0
         ljgt4ELJFIhSTcp8jColM7hJWVv6GQwShHWhwahbTPI+i/TexuvFFYCoUE6gudQxc35S
         wi5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285590; x=1795890390; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
        b=PT9tRHXr7x7H83fcvieRWtgZstS1pyRyHtdXUNAQLs5Bmk4GCH2oq4T6hSnMh0OmLA
         4BI1AN1z4+tUeXcai8Z9zODYlfPLYCn8yOhF1WkMdsRAhAXzcSNAjbimF4uZBN9fPEVU
         G9FgCmawCLS6nvEU+xq7WVfSXrZ9cfKFEUl4WAcYwo4L6eCZ3oNZKNPbU+HvZXBzP9wh
         HgEGgmT0tGx+964974FzslwpIrpeR1eNylFw4MLf0hD5nYZe/PKVcWZtBpYmfRQS9TqC
         nbkSVNKRbVIaGPZx5tXzcKI6rhjPhaNqlWRYZR5czTFCo6zjJ0PT8jtt2K170dw8Denm
         L2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285590; x=1795890390;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NK0wAqHXEIlA/czhGzDUZ2MUINpc+fMSx8E3XUBlpMQ=;
        b=QjfIPac8/Tdb2Fgzm9z7LL5G87iJMHOGTkp1929KfHDI3n5FzLQ9t56TtU/cFA+MjS
         TC2XGyb11DlkW3Gk75tUlYeR/2r+HxJl9wh1cSNlY46Ou7BeJNYPhSoFusdw98Qa5c9D
         6fC3rf9zIWg1Bq7/J/E4C0qNRUoqC5j7fpApMP8AWGTfl/2/UwesUGGl2x0ZOz11/gUN
         04OCmNIXntLA9sS1+qS8VV4Kj/Yv/DxxaT6VohXAOs93QLelT1wDf/UBBRC0MW/Xl70k
         ecEucZPjjmheE3HFY0OIbjk/O+nWxXbd17PzY1N9R2wc/sEAp5fUEPwJBiP0KB6U7sXe
         JuUg==
X-Forwarded-Encrypted: i=1; AL+hErH1HoyqVAozZhT9NYOEMpDOgpn7B1nbeskrm7KjZ4a36R6GdPIyzJoBe75nGp/GHjyJiuK6g2yDdgyIv/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/DLhOc5K1YKQVW+eJ9BUNt8Tgsittq5XSviAEVb3el4A8AjQB
	UFOXz1q+YMutYdPitILK8yFTrEdl5+Di0sAsJ+/ya/NBWnHq7z0vAj03MmhAWz89t8AC5+K+7Qp
	j7c7/Sr1Jpn06AftJY8SJWp74Yqu2Y5k=
X-Gm-Gg: AZFdTZfVVMq2sxaegxx0mU7EiZr6D5Zr5vsP9J3VqgR2GzDHfqFhMpnLJGx6ObojErR
	ynAmbzrFsZE9AV7VxEf5+wKrheYOlnEjeHSigV/D2+RjBqXS+aFCdgOQZbhr0cpQT9k6fXvJ4IW
	Ppv2whKR52DwF6+RnPTRD767cDMoRZxbF39j1WSSlDw/h7b4m8AtrQEzpwDR1vCDUbxoYyJRQ8T
	A6tq44GmvpGGtKaugSe5gegfjjrVn9eCyLu3pc761ygCRclO6DM53rhDA2qLbgFp0iAQv1U8EWi
	WBiSXiKcfg7PB6zBpT+EjmQksAjIVTWwBD/8L52JysiYQALbWAcwJZZd7/VVsP3gKMS05PxKMlo
	LFOlJWYMmAnnJqC9nzJ0gRfPCh3Co9ia55ruthcv6Ve+L6ANTWG5Ve0rlAePeYvxrNCKEHXPT
X-Received: by 2002:a05:690e:1512:b0:67d:eb6d:7451 with SMTP id
 956f58d0204a3-67df4422c68mr2129437d50.33.1795285590320; Sat, 21 Nov 2026
 10:26:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com> <1fb7feee-3e4b-4313-a596-29f2ad0de1dc@yahoo.com>
In-Reply-To: <1fb7feee-3e4b-4313-a596-29f2ad0de1dc@yahoo.com>
From: Gustavo Foletto Mora <gusfmora@gmail.com>
Date: Sat, 21 Nov 2026 15:26:19 -0300
X-Gm-Features: Aa3M54ofyQJPd_0cDwuIs6-tjlhNQxU7Th9d_h6ZqzQRuI8H1WEx1muDgV81y4A
Message-ID: <CAK+kzgwqPfWv6uOPd2SmBZ2dFWp7jTpL1YiQ01Gft+KnZ=gjFA@mail.gmail.com>
Subject: Re: [PATCH net-next v12 12/13] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alvin.sipraga@analog.com, kuncy7@gmail.com, fabianotassotti@gmail.com, 
	gabonpivovich@gmail.com, contact@c127.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mieczyslaw,

Tested v13-pre2's port-based FID on a TP-Link EX511 v2 (RTL8367S-VB),
over loopback cables between bridge ports and standalone ports of the
same switch:

- 0x07AC/0x07AD read back as intended: FID 1 on the ports of the
  VLAN-unaware bridge (the uplink included), nothing on the standalone
  ports or the CPU port, nothing in a VLAN-aware bridge, set and
  cleared again by live vlan_filtering toggles, and cleared once the
  ports leave the bridge.
- What failed on v12 with the shared FID 0 now works: unicast between
  two hosts on standalone ports through the VLAN-unaware bridge with
  learning on (also when the bridge ports have a PVID, and with frames
  tagged with a VID the bridge does not have), and static and group
  entries without a VID no longer catch frames arriving on standalone
  ports.
- Everything else gives the same results as on v12.

One limitation remains in VLAN-aware bridges, unchanged from v12 as far
as I can see: a frame tagged with one of the bridge's VIDs that enters
a standalone port is looked up in that VLAN. With VLAN 50 tagged on two
bridge ports and the hosts learned there, the frames that come back in
through the hosts' own standalone ports are sent towards the bridge
ports and dropped by the isolation; with learning off they reach the
CPU. Untagged access VLANs are not affected. This needs the same MAC on
a standalone port and in the bridge, so I think it is only a corner
case.

Family D seems to have a setting for it. The Realtek API in the stock
firmware has dal_rtl8367d_l2_lookupHitIsolationAction_set(), with no
family C counterpart, which writes bit 0 of 0x0A10. The reset value 0
drops a frame whose lookup hits a port outside the ingress port's
isolation mask. I tried two test-only changes on top of v13-pre2:

- 0x0A10 bit 0 set to 1: the case above works (20 of 20 replies), but
  a frame for a host behind the port it came in on is flooded instead
  of dropped, since the ingress port is not in its own mask. A static
  entry or an MDB entry on the ingress port no longer cuts the traffic.
- the same, plus each port in its own isolation mask: the switch still
  never sends a frame back out of its ingress port (I checked that with
  a single loop cable first), the case above works, and the static
  entry and MDB tests pass again.

That was a focused run only: the cabling check, isolation between
standalone ports, the VLAN-aware bridge tests (load included) and
unicast with learning in the VLAN-unaware bridge. If you want to make
this change, I will run the full set of tests on it.

Tested-by: Gustavo Foletto Mora <gusfmora@gmail.com>

Thanks,
Gustavo
