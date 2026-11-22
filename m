Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368148;
	b=kwB+WDk2Y0ZK/AdTAJatlxE5+p+1IUHp7OPLo5H7cSOg6JCPZYCuJHbHH7OdhIHu/Fjp
	 lt/c7z3gyrIr8GqQt5pXZmC2LP0ZEadYkHnMpe5XQWfeQ67+i0p+p9hTA3cDDJWq6NoZc
	 /RMIdciFJMHbD3OYa6kasakw70/26jTSGW8JYc2A82AdKS+HEuP3xyjPPYdlufZWcavaD
	 VcBqxauMDFx71VEu2yH/HaPjH4pi0AZ2JUajWVDK/FOw/gUnZq+TmYil7TGWVMYtqIQW9
	 DaZf5g3C80v2NBTA6aNEkITWxhNyEhFtc9yoz6fpyU/Sho4A1khwroqxorSkYXK1Kwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
	b=f5JQtrfF/hMuGkn0dtQlS7sHVUvnjHWA9EJGmME1vUGahdCzEFAcQ97GHcTjeHJ3PBNj
	 qRlXKDUHdrUiqjCkpm+CR8SLiVaR3qQvUWKkhxpgP6jdJvrnBls1g1w+5KhNA+FRXbSW7
	 ONnJFiOGSPohcn3/3Wbm/GWQAS3P7mD3zpLjFWc4LxkKRcWmoMeKZPTDbIagfPlf5p7wZ
	 gMB/wDy2+BursYoYa9aNdWKRYGNHUFGTydtdwjWu6BQoKL+6dGw+PYhLnWl8pkoFjR2bC
	 zVz0Xt8RHl6k5OOkZoj94IYUY19ON2PiU11cbye8N300ovWukVEf6gCqEk3spRxmQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A38606A33E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8A38606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2893531bso1386908a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=XBAzZYcvI0UAjxnxRcreZ2xa57tWzsBIk+xJyJfakPnjZQLRqB7gnVTc6Qn5CdjUbO
         xXTqI9r+rGRXSGvF5d9u/Gnt8cBL/N5/xf6tBndcQ9TnX3hHeuD9tSzX8sNkkbj7vhA2
         NeZPxacRSsaOBC0O3QO9DSW6vT50WIL7fgQmtZa0YNtC+iyBs2ZZbCtUEdbBWGXZZsl3
         XzMwvQ4v9H33vCd27VDcugFyzLDIPGo4nIjz28dfG3CtbzZTvpHODKvnyuNs3l4NIsgV
         rmrwLL0KqwTgCr+ubLcXoPp9NBBDnxFxRbDWkoQYlII4OMLRVrvsRiSieYn+T9Gsvdjr
         irPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=wl12IPJSVdQ4L6o/SVBD/omT71yayz7ibLO1//bNKC4JYxpYOQ/8+7Ewz5oiEajOnF
         8PUF/zEPBQKHRU8EJrjz5OuJR3XiUYyQ1pOn1Y5g7WUsPqh0oV+utEzymINgYVZuWh78
         lScOY6BvR2ccSwTHEecwNbfckeX8/x3aHHGL9HIsUAEPqZeNgDomQFFpkP6kS2vmRO6Y
         0LP+ysqBkO4XaroDiOswiUZ0YFO+6Y4sGRXrwQo9iAk60vTUOjFdtqQkg31uxMszmvlO
         fvpFhQ2xTEPRGEFAb7uEDLnUF33vM0tNYIhkLyuzkTUvXnnlcvm8avojX7VeB1+48lPQ
         q/vA==
X-Forwarded-Encrypted: i=1; AL+hErE/DFICtUxT4uXBvKxQmtfd9QIGe+VJUXkqUquUXX0CPgwgP5Dyon33+nIJcdv4LiiaxTi9ywujoOdOis4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oJKayEZryOlt5uDK1WcE5CTkFed41/Uvc3PElca8tYd0MGnGm
	mYmdxponb1rXCFmz2bdEINsMH0MbeJtUhV6R2M1p70kfoxoz3uomltd8
X-Gm-Gg: AZFdTZf/6HzQJT/PmyEgqOJvRops65lpGgKeaKjAmrgMEsIodwoT22NdnEk3lwTc4yc
	+r99+hKGr1zVnx0bXolCIS1wmyVqJpyI7u29F5XXtusFAdENKS/wSaMM4AaRcBIacIAwVjykvN4
	er9ORnk1RBlyLuWoSTNnUKrlq6suuHrvvMNY+VPmwCMeicCN2A1FAyF1fA+GXzd6UHvHw5Ra6WC
	Bz9fTxgAGTreAuuCnavcg8S5dF3Olr9TjB4i3GaqO+AAMQF39HoMeT6fPWi4NUaOzGyxlvQ6Ps2
	as4PBcd64OTYN1BPievwOH6qMlBCKgX/cgKdJ/J9ziJXpBGnkq4YjuVL8RGMNKeN9KHyWQa8fHw
	HBxbr0EQeFFRnwrBwsHbEIvJeZe5JvrShEFs1QeglzUjfhW+mJdtc1kspuZSxBuRQgCMivSalQq
	jv2oiZsyp0HgtmY4yhbdhjsUGLF5LgVNwHDSHWAkWAqfJl8xgkeICRvDWvpmUO9GeoLd4xKxO42
	RoJFRw7tZWti8ffsIaTsBOTTPhM7JATuPyiCqZ75KUpA3+feYD+rRKBiCamVTzFL7FC4Ja2mhva
	doDOoOnlmhCGAaVpAxyC/3UOFb4SzrYRvOgnbFIEhuMhJ6f1R5I1aGivtug9hFI5FK+bi0StKZp
	BDtc=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)
