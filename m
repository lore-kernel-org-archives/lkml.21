Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698976;
	b=SMOZEae+glJEO8jqkaJAAlY9nV0zqSjc59x5i3gaj1UEjv6kwHTAdGnN/1BLgT+1EFr4
	 DTCry6VEXVLbuqKdVwMU0QTlWALZp1fOZZ9P0tSmGoc2g8WmQ9I9RoSMtuSXXNjiR2I2v
	 fGvVimJ4tcOEDKDS7MJve4uF1Lur3AkDTYPfVB8ReCFwufC4+R4HJdmGoxwbZ9J7I1EUA
	 KVOsBHcjnjHmi+MD6A92keStkPl3D/bO1NEf9k5mIH6b7UzVD52b0M/xDbZa/n1mSus0K
	 wPZEe0ko6w9g63Uo+6g7Dw/RSUfo3VJSXaa++uV9D/7ZN/YWxok8znu8s+PkVujvCjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698976;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/8RldKvPQUEazbYpydH6ulNIbu8h2Gc8WOSWGgj6gjU=;
	b=iWc29brdDEZqrjHlfaLgqFnvR/VJ2su7PkhWgNxOP5v/G0Q/zNxYfJSsg8yZ2iiqgzuW
	 ZOObXN4hR1B2WgXgqricX//4dM91un/sHxRl5qFRBu1wqxEgMA+0kDF06CoHdGVTxlItX
	 qllaivmj+j+fppgPhj2IR7CIjv1LjEWDkkGZAnCnl4uCneGAafzo3srTk3M9enuKdlJkG
	 FWO8KmRTAFvHPg0cStmZ6zRXHeKDfxJo6ShZYUlPIWMxbY03GwQKF46LZGfKMKAAyJd2d
	 DUU7cFrnE18f9w4mA69hNoJKj8/RL02AjCLTMn40KxlYYAKg58Rm9k9rPbEe9GqUR0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B196606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B196606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso4708700a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698976; x=1796303776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8RldKvPQUEazbYpydH6ulNIbu8h2Gc8WOSWGgj6gjU=;
        b=PI4iGPQ+hHUwru6mjXX13tcer3cnz1T2hy8m/QdEwgepW2BYui51ycpnUAdaqD3kIg
         M6bUYTKic887AU6N4H3MMiURIIg76JeWCFFItVCU69RFIQrNx0JPONC9BsQspQgd9qKA
         cNQ0FHVY9SBOC5THqrWksbTbguGQwA+vRJqO9pk5+o0oX0RnxFvU0MRX6dT+y5pPNBso
         ZaXbX1LfOp4mUWtGN33cxi8LouDmAkvri8VHTxzbVagRwIjZSpMowUbdDNMwGIweOQcq
         ych7f5cfkB9jHODPjXIEIKEBSg/YTC9v055Aopx1iqgUW5Ve4puVF6xQAxvvkdxeePu5
         jAMQ==
X-Forwarded-Encrypted: i=1; AL+hErHtAMmiXM4ahFGBoiR8Mrwd87AVLzJxchSxZHtbRGXE1yQVp31yUZDxHKoB8d6vPAkp4XhpqUPr9xjkJGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CIFa1yZrFPR3Qehnaq6W4Hp5rojSHih572KBNXG/Ze/oRrZh9
	mEtaEnOU5wdYHFygztoXWj6nh8f9lrDNMIrG1Mwkjps53uYodv2FJ48FR/sGeTCQ
X-Gm-Gg: AZFdTZdpEu5Gu9+l5TTRafOzvaW2Co6btwp34BMDxJQTEKFkftlElP7sP4fQRJ+25mG
	+h416IsRtcdU3r7EF4tlWrvrAgp2L58kuB88dQfEOA3sEBrsaqEdL+ZV2jDXxRvpfu+2J3WllX5
	4CRiyZySbISFhYeZFqsP0M8TYJsHRvoaMxNrld5aj1hbpeSRUC1O+VjypqnEYOx7SKahRyLnjJz
	HS6wxCb4GvMGoE0sSX1yCn6hrCZv1axvURbuG9NxWOKDO5Y7QRD1wsc75uyXJ13HtH0R+BAV7i8
	3pTnEj2GCTN2T5yb2TuZO/Xok6ERtOz1Kn6Ngf2e/UrVd2SarAXP2vHjSVT8vK5qNBZX4Fu0B3V
	LwbazrJa56zCFs5oPPGR1v/T8pnhVaaDWxrcwwxrrR4Ss99pe8+uPLqcpefruMog+Lha0rINn0f
	5a///u9C2nJCsgaw2ReoCWxu2Y+NqaaX2MXO4Q8mzyJeLvoj8C4OtAD4oh+VN1ycpOSUEIcicIs
	MQ+zEpc6hOlRWyVMIy3w5XFrvbbl5qRB20MAw2ujHfDsnLw5LWHVtFFlDFo6JRs255tcmbmExAa
	pa24pan8sDDspt6aSAJgPDdTNWOt2aatncahp3O0/+sjaREzNsfqkqvMAQHcQGGUm20o+q8=
X-Received: by 2002:a17:90b:248f:b0:3b4:2394:7cb8 with SMTP id 98e67ed59e1d1-3b423947e12mr14560189a91.48.1795698975856;
        Thu, 26 Nov 2026 05:16:15 -0800 (PST)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com. [209.85.215.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d002a77sm10594904a12.16.2026.11.26.05.16.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:16:15 -0800 (PST)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cddc597d062so4222865a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:16:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFyfCwPewcGTPgV59EPolpV6frkjKG8Mu06gQpEuYxn/H8n+MMgAFBjDBym+jT0tj9zvvD3mu6WnJCqG7c=@vger.kernel.org
X-Received: by 2002:a05:6122:8b87:b0:5ee:27c9:ebec with SMTP id
 71dfb90a1353d-5ee8ae89d30mr10164180e0c.6.1795698590878; Thu, 26 Nov 2026
 05:09:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-16-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-16-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:09:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUodx0aRPvj9YZVS5SV_42vq0bvnk8VgPFmeOoZDXh4NQ@mail.gmail.com>
X-Gm-Features: Aa3M54oGF1y6BfpWLxe4xGuZFgd7nGmTk63s0g99O3cHf_svXMj9Q2unpIc8mY8
Message-ID: <CAMuHMdUodx0aRPvj9YZVS5SV_42vq0bvnk8VgPFmeOoZDXh4NQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] arm64: dts: renesas: r8a779f0: Describe the PCIe
 AER interrupts
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> The PCIe controllers report Root Port AER notifications through
> intreq_pci0_lperr (SPI 421) and intreq_pci1_lperr (SPI 428),
> respectively, separately from the integrated MSI receiver interrupts.
> Describe these interrupts with the "aer" name so the controller driver
> can use them for Root Port error reporting.
>
> Append the new interrupts to preserve the existing interrupt indices.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
