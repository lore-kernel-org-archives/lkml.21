Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699124;
	b=wfw5bXivpXRhPNszMUt+0kss8NfxDZEg7kbw7m3dE00Q0cnG+IbREg1KQMNRFo7EsCC8
	 xY65LXVcKyFPz98GWaEBB2EO/JlnryPoDkR/ZWZhxOXOVjSlLp8e2Lm1Xg6foQkc4nSdf
	 IEMAA1yhDVCfgDZTn0J7EV2cnLkfChPhU+B7Va9B34VJWN0ZI5Ow0BnhV9KED3CtAmUsz
	 sIh7iTocXaVYHXm2J4LWCd56lhqjcEM1PlbTL/tm9h0Pk5IqKWOJDztVPXa/CqdiDz43h
	 /ckktzij9avTU+r8VJHq+S8/zz02PSIHFaMmvMz4rKAjrEEO05st+wNcDY9ZbHK4cEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699124;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=z5gsJ+BDz+8hzJBQw/xAOysO2V3ppLgl3lpNGd2ZXi4=;
	b=MujIc4WWgCNSLWWNgk+OdHQx8e9/25KocG5L1k3FhYSUVgaXsW0ZRZmFqNtXj68P3a1M
	 tZybTuc8rjrYfqAO8jcXrzZJeNc5zwJmaHNEBkA9Dr93HqmeZsH0YMd1roNTpL0uNVj16
	 FJm65Tk/Min5ZOf4cGc+3qO0w56FoSPVUPNEfi8+uWOpu1ClbzYHiPAMEL6nCFxvRggEx
	 l/MmOydpp+d1NFXUsRjeVm/Wwe/uhEqdEYiFDBp3wDXgMHtR7E6mIpqsqZZglDOll/jdI
	 FTDlTJS9bUHOej0WUmO+IxT3XsHNGJm8kx97LPjY9K5FKHm2dl2nA8bKCwCXSTnzGpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3001E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3001E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-94965745d92so691262085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699123; x=1796303923;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5gsJ+BDz+8hzJBQw/xAOysO2V3ppLgl3lpNGd2ZXi4=;
        b=TBVYEJ5peYYeK2iNXh4blrsPB4Ia29govZPk4aLVjhvNy6/HLmEmUjy9JWdMglu2Ag
         gt/uFBsD1sBW6MgCj+TY8+UuXPy38oiVc5edsDxlbycJdma/NA9mu5igQIE+rRfN/asD
         IYf1sletfDokV/kFRxNfSMQ8Q8jdbNRiuSUZ8dHcfKOWFDFlcuQ+iY2+p63pdyNE/oEm
         OMKCganYa387Gbv1/FghuUsO0vDR/LBCx+EnwpCDocoFzNNGJOztcpwSoz2Wjh/Jhwd0
         6jGBJEAaZ3qz5lddFW0hbnn/6k2BiYtm4r5w540kkABVterBDlm4BBgbG9Ivj6+F1d6q
         2GoA==
X-Forwarded-Encrypted: i=1; AL+hErHLFykXroP8zbT6aeYfacmoo3lrkt6w/gnZee29HWKb5iG2tCnJdmuVv70qQAbA6eDNMqXH38t6tPeJmKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bg2lOM7MCyfJhBhkK13+yVdqznzb5b/vCJcFRh90Bjo5zZq5e
	yA544mEjNpDp+kBXwsvgaxJTJRhwvH7c3UK1Ygem7aTdC8GGKNP9QocI3PIT+OcS
X-Gm-Gg: AZFdTZek7lNOejmZ2k12dJzEZcXIhdy9szWvXYtCAEW7jE6ato1jUgrtXoK+s4AipuY
	trXQPiiowcwtpj7trQvm09xX6AmPwt2qae2Ecn2Tfc6yv/5LNHqTDxzXrM+80w+E/vUc6wBNBVY
	orfHy6tkaX7a04kas2nmoHBQm1NqQvUtIv7azLsiig9PhEnNoSr3QtpKDNH+xHd0iU3OsfQL0Wk
	jv8znr6DNmpwB2fy9NT+ytRB2vOtqKHAC5Z2v0IU4S9eM4BOalTddHUA8oPqr675LKqATrprgLI
	zc2YenziMdoZ0YRsg471gS+qBJ5xu6g8zZhEjhYNQJgfNQUD9ykpIvJnjb9cf38x0XmugaUaDci
	F8Azqr6XiwmReJKzI6FMKb75jFG4+OAH8VkVHMtOfWWxYqqnXwP5C20NlOxNzAAeL8msLUAsA0B
	yAWYTZi5bdiadC6K5B7nONCL87oflD9rb3Fa6NMwasJdR2cUtXWoentbo4YHdbz423zIbVRb3nS
	6xjPge7NDCpvDSa70+OlilWyYHEIO775VImlJI3jOSg3lRfLgBt/rY+1uO66X1cCpG70MVVNWDB
	3H9M6qPjf45Kxph4sUGMZi0oZ47X1vFec5ZcG4ADnuJiGCR4cbxIcezeUK7Si/1fNwwDgeuC
X-Received: by 2002:a05:620a:2985:b0:93f:3120:6c71 with SMTP id af79cd13be357-949ba9c6fb7mr3629613985a.44.1795699123109;
        Thu, 26 Nov 2026 05:18:43 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94a017cfb46sm526217085a.28.2026.11.26.05.18.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:18:43 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5361e313e63so94761721cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEs06Bb6uXA5ag/o3BkuSIL6SGWrPPXpQf+aV8nKXJCDthHAlzll6bXGGws7n7aTjCuFqQu4nnOV6ftfyg=@vger.kernel.org
X-Received: by 2002:a05:6122:e16c:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee8aecb450mr12500493e0c.8.1795698622003; Thu, 26 Nov 2026
 05:10:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-17-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-17-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 14:10:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVpV=FLZG6iiNMj8Mq39RQ3u8JxKyTVws7J0O9Y__2EqA@mail.gmail.com>
X-Gm-Features: Aa3M54rTYSp7n6mDEivRvXB3zz9tm8FUTty6In8Jlz7Pqa2lf3sYsYsJuOUeaRc
Message-ID: <CAMuHMdVpV=FLZG6iiNMj8Mq39RQ3u8JxKyTVws7J0O9Y__2EqA@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] arm64: dts: renesas: r8a779g0: Describe the PCIe
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
> The PCIe controllers report Root Port AER notifications through SPI 454
> and SPI 461, respectively, separately from the integrated MSI receiver
> interrupts. Describe these interrupts with the "aer" name so the
> controller driver can use them for Root Port error reporting.
>
> Append the new interrupts to preserve the existing interrupt indices.
>
> Suggested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
