Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032548;
	b=1UXNsvKXqchTB/J/SyEX11H5tw0iwRt4cuUH+NoAX55SLpQt36ui55crpSUYlChFFPuH
	 gj7mbNrzhYEfc2sj1uF1cMwjs4Pv/3NIWwWegWqLyfKbQ+xIRh51lwSgWkUUAdvZUVZmX
	 A5ATLagbGQ+b6Nu6PyjBbwORkoTpk7joXJGY3bDCspGKgnQfq3hdIPIO2FYmDpWmpr/uW
	 ZoSoBdUOY+sTrf0nX6yNJAHHtdVFgVoCdZCZgD/ZBQRrJoq6UGP8hqC+j2H7rqLWVt5Jw
	 qUqjB6qI0T3aRV+mrFDH5Z87fPD6/eWR8YWrsVQhzhkuDGlEaMp6cy7MxD7uQNbGlmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:Subject:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
	b=1v1uxCYLwZPtnugg3eA9TasENvY6Z2LjW5f4jI/B6jCVI5ozqizukQoSuyY74cAas6Z0
	 yknznk+2Cf1FocaxCoQdKVpcE3/Z3/6FZkJ4sLbkrgJVbuK0Lwtlg1UFwdj/2xv+IS9x/
	 yZ+YDI6P+w0ufhCHps9dMuObU1QU5PrTZ2bF4coGssIqWRl4VmHlbhDe/Bqpi9rSot0XM
	 OKORpPaxA+98dNsuTKP82m+qKYAE144QCcW7/WzIkRT5cPNWfiCYPlHP20xrTt7cf+aXs
	 1J9R9VEQUhG5+n669HcegP/KE3x2RN63U2XOYRZvMht4GsHyYvLd/iH3NVIOnDPuSrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkiKwyBP;
	arc=none smtp.remote-ip=74.125.231.74
Received: from mail-oa2-f10.google.com (mail-oa2-f10.google.com [74.125.231.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DAF60A2606
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0DAF60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xkiKwyBP
Received: by mail-oa2-f10.google.com with SMTP id 586e51a60fabf-4b5cae8da04so467416fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032547; x=1795637347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
        b=xkiKwyBPVGawK7J/tlzEx1mo0Ay4q4b9GywizrlXAJ5/stojHBAIFVgccMIdIu391+
         DhKtTcdHCXoH2U7I3tyo0p9ZgQ2pnkYzk2IbL7GMMnF8vl2y1snphwmJVXpLm9Cf3FEi
         u23N2ko+MKkgXuaCkJK6tgNfHb1u0B57ALpLSoJ16FCqlvQoYK750kiHuNwYxK0L7Sls
         w6uJ+GcuVFVFEbsrPO/BHOoY7z1Nl6K8ZXmMpYENAy+fvp624SUlDiKJj1WC5FttG7Xk
         CG806FoLmN2QLgQBxnJelLiRZwlwWGMT7Rq5BEWK9M7l2n6NTCriOWAoBV3AsUh6gPt+
         /V0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032547; x=1795637347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RRjWL641RBXdzvfFkW2sLfC2on1rvjj7bWT9M3oy9g=;
        b=XsZV5kDJ+bt+S6LV3ZTub2GYOpMKyyJX3VWb3fKeNueP+19E+AiPVuZAg+yGnf3bWx
         ivn9DhTZcu7NVQf0WB5RBiXetP8lGfE7C+bA2TiKarDWA8sn8D05tEEQJHQn3v3gyzYs
         lyoMRgO6y9+eEJIqEBHm8cYA0tZnoWduxAFx4GgOQ2JafzJFZCqkpS2XkbaJsFH6pD6e
         t7VwdG9/Nkitc/qXzVwsCe1Oeatnj1qUDRB1+9X3nepzOJR9smbXgS1EZJRqYLqsP1gC
         SgyPX6nuuJ5Bz60H3slKBnd8JEHrTIOlDNMNcB5g2QzXpvLVIfb8fKeyMyyp0qcpxei7
         cfYw==
X-Forwarded-Encrypted: i=1; AL+hErFIwH3y0d1J7I5ZkN2XUuE+gGFhUk+aLx2O2caGcmprG9MMHg89zxtbrL/GoGO+YVhmTfeU3Ip8Jy0qGdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KuTUGX/J6tUAJXDMizsOWSlnznDKpxSvGXh7DhKDawbesSQhC
	Gy8FB0NqVaQiL/7GzL5LxhfTIbtKBNrIF33KSPoz19RA33fgssSptsTy
X-Gm-Gg: AYBFou3TOHN7c1n71z7u+R8ycDd+D2TnmIb1nnqEPH25kSc/nwLCG2qSXbjH9fY5cym
	ED8GrPTdN3OoT98qRxp2hHm04iZsCaaZ6CTK0XLVSDGqEw4TH1Vgy6gBsas10kSHyaNsZz6U0Xz
	40Q0f/4GoeUhY6rx6TvXd7ToxWzPTHv75epmI/Kl5Dbcr4QJKtJSOfeMBL1GJeai5E9vWEtsjn2
	spQ7d691vSEtTif+sD3bz1wMiYbcdEXqt+00ni4LTvsD5flML4Yza7RoTK+U+opRUAojhOkdQaC
	eCSrouUMEugjzXF5ENN8BWfZwJMiR3Lcrx1XLM5O0cquXfE4j5d+//NNjkQxCNFDsuybdzTAS5k
	KYaei+KqVjJfvirdw33fPn58axCyPdnD3Fdo/dFEUSI8ArxZreYx92L0/40H1BeYFq/lGw2aHwn
	ERHR8LxwffMXDGsEpGmuYUxXScRilRsspytpjxaOIjdWwSb9O3Snrt9JPNNUJth0E+CALqmoaJO
	pwIB30ZDahZeDbhV3TNpAU0pJhrrZJ4TfemyLIsUL/7SEOnWyOIHiyGlxOR0lnkaO5UDV6d0GH/
	SugiYG62CHUw6yCaYo6hHASgjKsqqvnkO7n7iVbD3S75ewcNpWnR2+Gzs59Ro4H6qy0PnUCWtaC
	W+0D5+4DerWuxZaDlnqp2aGf/3lbMLc2A1hc4ysvx
X-Received: by 2002:a05:6871:5311:b0:49d:e1d3:e6e5 with SMTP id 586e51a60fabf-4b75d550969mr3282678fac.43.1795032546658;
        Wed, 18 Nov 2026 12:09:06 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b7437258efsm3148235fac.5.2026.11.18.12.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:09:06 -0800 (PST)
Message-ID: <b662ae67-94a2-4e71-9578-d380ba19938d@gmail.com>
Date: Wed, 18 Nov 2026 14:09:03 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rva333@protonmail.com
Cc: airlied@gmail.com, angelogioacchino.delregno@collabora.com,
 bisson.gary@gmail.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, simona@ffwll.ch,
 stable@vger.kernel.org
References: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: do not enable HS clock in
 pre-enable for LPM panels
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261117-6768-dsi-fix-v2-1-6654a072884e@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, Roman Vivchar wrote:
 > Only enable the HS clock in mtk_dsi_bridge_atomic_pre_enable(), when
 > MIPI_DSI_MODE_LPM is not set, and restore mtk_dsi_clk_hs_mode(dsi, 1) in
 > mtk_output_dsi_enable(). This is a no-op for non-LPM bridges.

Tested on MT8173 (Amazon Fire HD 10 2017). The Novatek NT51021 panel on 
this device sets MIPI_DSI_MODE_LPM, on v7.4-rc3. Tested with repeating 
blank/unblank cycles, and verified the init commands complete and the 
link ends up in HS video mode as before.

Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # MT8173, NT51021
