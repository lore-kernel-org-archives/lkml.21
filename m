Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449289;
	b=ZNk/7JThoOoseLhLo/f2Ywxa4XGZhhOBT0DVBrRa6yGKBId71klOKzpM40oUrQ6gt16s
	 iyb13PV/D0nQ4HKRfOxE+W52FHTTfzM1FN1GjQcYeIu4iy2B2XSEdRpUt+YuUd/2XigUL
	 rf+TRIy8TT3olozacUw9bCAxrBDWVhTzxA82O2jqZ4DwOynwOmYzfk3rtEXmV6Src5nLN
	 S1WRFNOgFl+QVNjWJ7HusRJGHMhPo2/3/veAp37pVzMDoFszmtixFS1eUhuWP+7R8KDS2
	 uX7QdGHzytURoluGMXjUVdIkEUEOF7M5cblgdekDf90ibLNYWk6Evi4mwX9YcC3kSBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
	b=JYeEBdSUD/7Qns8p9ZGzVEbR9G8moi5/0PJMrtdQ8yDRiBL91BK+SDQ2am4MIDimv5kA
	 /TUT/48whA9c+euzwy/EC5q391b94PF78boAdBa7vaHhYVjTpQRqV/KKsU+5Zvx2UooNJ
	 7++k6YnxhqEN9ZEqg9Tr3G1th8mU4RZlT5Er2MBBUDo63KbNMiQTrOyhR30U8shS53gJJ
	 ytYDdlNLDH9oZ12/D2zSMOHjbU7a4ym1CTiRoszwhkx7jrsUxsFp7E3rYTUdcvBt4Ww2K
	 2bXUmXJ/jqOBihK3fhvDO2iypK/jOuXQoRpzlyw1LrMybZ0eyfle6FMvujVgAYH3Kug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166FC606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 166FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=K31mtXdK
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3258125c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449288; cv=none;
        d=google.com; s=arc-20260327;
        b=f8C4RiXnxqAoZRABJKKzRxpcRXw8CVB1eqMvMKLgvxvJdfO8w3KPWnI9BAWI9d0jNv
         roQGHo4UDJJcuqI3EpxZGMS4/YfEXuMsY+ndLWOMg5QyKcydzFxn+82phkTMB1i4CMPx
         9ZSs11RU4fW/1+dGrZ1dM4swVBXnVh6Nf0okcDcq9xwKQ6heQ9jPTiImDvN6f3gI7o9S
         o1FXBw2+zEV+ffIoczT8i7RAN9d9ivp1HtHlqit2f/wxYpTpzaJVatRFOMA159jExG0o
         zJIVOJXe0RQOfg3/oCkUMQUCDIG7NNo99f8ke/Y87e0kMmhKSNVaFxuPu7lNqxBgZl5O
         bbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        fh=PRbCdQI5fpJzaopsaWY4NLRvTUjQ/c1dUC6qPOTJqCs=;
        b=c2mqiLsC6Ukc0HjaKDFmZoIazaP+J7tlByJm0ngYpbVRRgrr3uHCcQiLoowWg73xVR
         XqFTgpRXkBvJLQK67H/2zxuTWBy6R1YNgVERJEull+NsRpzgJnwJJ9mLFwjO28Zi98rM
         xQ5Ug+EZLtYzyRv9PdUAmlmXKy332VrYqp4KqjUhBHy9NHGLz6ADGf4PRTV9Djtscs9t
         8rU2NthZyTpPuArw/POG0bJH3tI8wcpYoC5HhQ1jKiZdq6z5CsK8Fv/0GiKCAYpW3iYu
         kJmBCmEYcI63UaanlfkVFEM2hYVmltXIn+0ucfHKKsCpRo/zkX+3GCES3SbqDovDfBOd
         yBaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795449288; x=1796054088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=K31mtXdKcF83FLFamHn4mu2c1WFux/XDEszEG14A98Jt2rLyW5vAa6g0aQrAW3bjzC
         gllAzO506OvE/rfpZOcYCxMRUDQNB4VXopntsohEOrakiet5wYn7sGPPxwfV/CfChisN
         uYXj8HFMNtuEZ+ou9t21iBeUUC7Pic5yoPJ+xhHP/+72mh5EZsszVIGPCdywgkhiTEHT
         PWSHOr4kNaUQ3YX2g4wkBHhAis3nwdahz8TPq6MFehDLcsSCT1djEzG7g4OFRye28hLN
         CCekPYk30csF+W8hqwpRnXEm3DGytgokuK/dlh+xzWCckuPUC6BXDNd7W44jN2cXrX68
         uVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449288; x=1796054088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9IX7jhAHia6k2tyI4R6gmuYZ7v1vx6KEiWEsxkHMt8=;
        b=GwnM8TpZCph2lY5Hr3Od/ikhfcLXeOv95LuOWCVXVL+5T/mLrMss0zIVVGYwhEi55S
         sULciKfQ4wT+hGM7eTN5XcoEuDsf0US4attneudd7Eski8mn08mzKv1t8VQ0pOqGCJty
         FwGHadD/39a8N7C4kp1gqH17TuEHky6JG5MWBF01HP90Wygap6DS2hFDGNmI5JtiMDya
         jAby2+kKDz+LtWtG/SqJUPIta07z6XbIpz4Bb1IlPK7YFe15cJh+yCxRgoqFedR2t3UA
         XLSlwPKfx1wa1v7QP/bn5vHkXb4cr2/R+AB8XC1ut8rFwQu9s5MUUgT316M5r9zP5Fal
         7ihQ==
X-Forwarded-Encrypted: i=1; AL+hErHfq3gwEqyLW+TnVPvEdWadKK+//LHhgJDSUDbPU+ATRD86ZtvEzZNw2nxFSLZ5hjMuy0deVNndFJg2iWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZYz/KMMEJ7Pjnj8AT21Q/n7ho58WC9tyM0ja2vJKl3jXgj2cs
	TEFIrJbAizXwoPqP5yoPeM7SXV2Wb84w3i0ttg3HOw6CoqJtgkvqBvCkMGSQ4dsQBzsKfoFfx5v
	8055j/9tG0s+PROWlhrQ78TQIQaUW4FDcyGU246/2nw==
X-Gm-Gg: AZFdTZfI6OtwrbApC0M5Me0DEu/IsChP9Cmkd4J/liGB2jarypBKtTcMz5duMEgQQ+b
	0+u2SLQZjDQPRAhMIT2DNqCMh1MpKl/z28L5qoz4GMcTyWAkLgiwr1ogTLH9mSBZgqEd/E/CRwE
	J+DXhSbk60PKJRDMYtqc7hMnpWxkBKVwIRbUMTyLuNCxWwLbiW/LSJDD8B5zi/c06jsKvVi4maY
	CM4i+zNjhFdyCDqI249cv7nDP+y5KzOJomfAGMi8ubMaYoB8Lg65slgaTknzfpcquqd5Fh0j1o6
	hK5R8qmSwDxKaei1KibKvr5syHIcibF/uWn+XNaTFuq82chOJKa43oUsgFA+eVytTqSjV9A47Cp
	zh1h8Nv+sVdUaoatrkdLqOWgu6rhRRNFmH5woEFz97foJjL0QLrrRoRosW6+8VeDMeYT8nOPPpP
	nNC6PXsPsNzX9vpVd6+i467EBCZ069XTd6ogRa4YoSHsRxBmG08ZbE6kpKpXDLCFB/R5JIgsXzH
	PE=
X-Received: by 2002:a05:7301:e103:b0:385:496e:80ac with SMTP id
 5a478bee46e88-3856fe59334mr13784647eec.8.1795449288031; Mon, 23 Nov 2026
 07:54:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro> <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato> <awGV8BU_AfaXQyBv@maple.netwinder.org> <awIMBj_7OLrlM5G-@shikoro>
In-Reply-To: <awIMBj_7OLrlM5G-@shikoro>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Mon, 23 Nov 2026 10:54:36 -0500
X-Gm-Features: Aa3M54odzMyo7xKMWSU836vO5_C9zRbLplW5YRgzXWccrFx6zqrBud8_l_A46R0
Message-ID: <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document reset cells
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 4:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> > Thinking about it some more, perhaps instead of using 0 as the special =
case
> > for "no parent", we could set .source to match .index. In other words a
> > clock pointing to itself means "no parent". Worth changing?
>
> What would be the gain? As you said before we can't update the values
> because they are already in DTBs.

It could remove some potential confusion about whether 0 is allowed.
And perhaps more importantly, it would make consistent the .index and
.source fields. Having one of them shifted by 1 can be confusing, and
could lead to bugs.

Ralph
