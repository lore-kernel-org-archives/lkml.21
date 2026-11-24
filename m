Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549211;
	b=SalvexLxmpMLg+tXgy5BUBVxZdDiW7YujqkztJv3IPVZovjRa4HgztLnW/82aCGHRsIY
	 Dn4DxFpxBGUO55YX86P2c27QuP6s8ol4k81uFP29Jr98Tz/YkzmCNMvnpunkE5nmrCIYi
	 y0KsfiKVFkHcrbeaqJ4sE4AqGliorkt3NYZ7+XdNfdPVVrWwaKPCd0rxuoTWkK2G9FGrb
	 9qGeFAJstpKji0FUgFMfNXBURiG9r9eWsXIvSai04ruAucgwpO6gQ/HQIaW/gJHcRE38R
	 pnD+pkZOmWGd/F8i/rNoSWo6MCOH6LvgHE9HDPB1poPpdDflsXedBDtC5HhPPgLAqqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
	b=GWeDpor+c1Cgh42X0tdQ/c2GNYOELeRWQnnev1fJ51Wf9Na1O7uotFEey/RB5YrcJkLd
	 DRYEBpddA3CYSShXK0VfNN2ceoKE6G4k/3B41e2Qz867u2g0FOHcOgF1E9s693T/XGSQE
	 Wvo1mxUiMU/z4uWzc4Xn+5+SMtJBR+JpMAFcQMO+sEA1DWXkTKaPKbeq+87KmgV1fyvty
	 wOaNEDqnlaJ3gzrpIRWs2iDi/mt01aUFYbwXsVAq7l2SJ3xtg9d30T+9mWaKh0zKlgR1q
	 A3HsEy7Se0NA8Lk6jEj/vHMtwCFJ6hdjVeLnT6CLkiu6TNsOqc4FoR5juXS52pxYmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NP5r8GlT;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4807606A69C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4807606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NP5r8GlT
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so36455631fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549206; x=1796154006; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
        b=NP5r8GlTST92ylX8PKG2Pd/emE5hCFhCa3yQgXw/67l48b+J/VMF6p70IdWMS4Oc2s
         eJluY+kIkDRgTN/MCm8X2X6QY+cUN3p1WgIRcf3XvrFVPXZ67rBiYiPaUw8A6rYPZK0N
         omxUYbZlpm7nd3ydpAOLqfQpe/5d9ce0+Rj+LCA+5JYnpap9HPKVWihFy7+jZMWecdkB
         NDopGqMopiZTN4x6q07tLX+cRkUwLqV40kF5OsoBBwbdil0U5IUoiMbEEY4gasRmN6HU
         HxTKWV2DDhEvQKlTkzgFmPS2LRvB9WT3V49ylWky5Pb0DydeXjtu7HDkPfNFBPhGFVYw
         cB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549206; x=1796154006;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Pk7VcO6MHtXoThdYzAiD55vUiySd54g9n6hkzZ6Qy0=;
        b=dNbLqfVju5Ii0sHeudpZwzpDg//74255LwjsevCDeqBHgSPzPskG7+yqEMNReWuOYA
         FXAN0ZeMWgfxI41PDlqc7DQXO4jT8ZXsQu96IhVZJAphBTnOyu4LZNYVFPPwHgMnXeF6
         fYRGiV9WM0egPElHDq428FaW6flUGxSWv7h3Py8Z0CEyVKGXN+AT33vZ0WP5ZQt+Ojc7
         8x/oiWS3hdkoisIVUXSX/Wt6sVVJVxjLxNc095Sprwd9jOn898z/ul8tzf3iwKIPWwZ8
         EP+fUo318pG8IBTRA+KmUW8VKcc+YhPNyCh+DK5K6ayj4L4WGQgl3H4M9Lfm+sti4NJ+
         W1sw==
X-Forwarded-Encrypted: i=1; AL+hErF9RR9k4fUSpOo30ShYI36illv9rC4nsZoE2RcAZZUknMt8bpQeVVKhw9H94nQMZx1DnxIjUvmb6m2EXiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9E49CnwI7OjCbg0dU+qbjLa58d4C+R1Xf+boDRMZc0jjhuwC0y
	/UKyx2HYw5hhQnvHtQ7yYQPftboo+Jaq/IzqQBFF6eupxvRK54C4SDej
X-Gm-Gg: AZFdTZebpjrUtTvkBIXa3PcY2qhw282HXNYOoQOEWf4Qn9mXZVtX6VHVe9B8awlWfwG
	2pjbk+eC1EoTU8obJJFXM41F8nqS24UCOhbydAz3ludesH2ahP0w5qeMWs5n1aRXM3vvQ088asa
	C7nhAOgprlbTCLP8f4uuc2jHuMo+gZS/KqNYuvLFy2qtO8cr102VSOdi7/rqKE2grjsCXVYUes8
	AcF+1qcMOUlaKQtI1CA5xZs0Ar0nN8k/5btW/nZhcEyEnYoVTQGMJ/Ihp1bpXlb8d43tntyjqVD
	VOMwX2Cs3PT7uZceCtoSq7+++cddtakczjUh3F8rUx+tfZdA8Z4UHdrGgcjM4shCGggckhrbCVD
	wD61BfCuSzSiTf1ZHmNTTMjLJ92yL77Ie4qG7GwI0Wm5GNQvWAqsuEQv2YfuznQCNmx3FlKN6ya
	cDBQ4RbXzU1NR62MZ8MYXRbsm+n1JcLt/kOAZkFcvN+1Djp9d+yX8jyJ+jxutZHiaoDCC7xdepE
	dnbav5yNXh4P7BKsMtvOzW3f4sEsBs5wu9KObJnh0I3tHKlTJUSn5zHXRaknAbEt5JPSxNf55Zw
	q5Ew4PidNf6swspZdU+GzBTJVOhTrxT3Au/pxgU9Y9gaGIjXmTTCJY4=
X-Received: by 2002:a05:6512:318e:b0:5c1:5a83:4285 with SMTP id 2adb3069b0e04-5c1bc89ad5emr5211802e87.60.1795549205624;
        Tue, 24 Nov 2026 11:40:05 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd043387sm4051662e87.49.2026.11.24.11.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:40:05 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 andrew+netdev@lunn.ch, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 1/3] dt-bindings: net: Add Cortina CS7542 MDIO controller
In-Reply-To: <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
References: <20261123-b4-cs7542-mdio-v1-1-626d0a0e3b4d@gmail.com>
 <179554724588.3135.13754934088283070222@kernel.org>
 <22c76d61-d604-445a-9aba-f52e19f93ccb@lunn.ch>
Date: Tue, 24 Nov 2026 22:39:44 +0300
Message-ID: <179554918420.4.6608826251937872544@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

I agree about describing the input clock before the binding is merged.
The vendor U-Boot sets bit 5 of the MDC prescaler, and the kernel SDK
writes 0x20 to that field. Neither source identifies the clock feeding
it. I have not found a CS7542 clock diagram that ties it to the APB
clock, so I am checking that connection before adding the phandle to the
SoC .dtsi.

The U-Boot and SDK sites I checked are below.

https://github.com/futuretekinc/cortina/blob/aafa3821f0934eebe8137726d4e6d5994c1ac3fa/u-boot/drivers/net/g2_ni_mfe.c#L724-L727
https://github.com/drvlabo/linux_kernel_cs75xx/blob/8bb3f7dc796a59d992572a118448ba196f547ed6/drivers/net/ethernet/cs752x/src/ni/cs752x_eth.c#L3529-L3534

Thanks,
Fil

