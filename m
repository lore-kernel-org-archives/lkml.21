Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795052160;
	b=SolBhE/7gnhgr9W20MfTSAKV3349KkJtPmXRIGfsixLi5dbwzM2JlF0OuANgcEuPH9+7
	 9Ei5iTr63SkOabN7Aidc0ZuXrzsynv7apNqwvCyAxkwFgIfcp6uDUNGik9SuJRCD2bAMb
	 bYq17K4mVXsrZRw6dtsRAqODH4u9dI0UUZi+/32fT76ab57yP4vlwDqIG3Tp2kQrKKORW
	 U6PAxA8v9ExUcmtE8q4z8ZpVZlYC73FBSegXa6TD/St+f/gqchuvH2T3PXgw1KOLAukdd
	 r2W25Z7vgOnafDcMzzcVgPeghRCb025dAQ8laXd8q4YNMl0+muePmKDC8hH772w+Y7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
	b=5egQLiMFjP5tpxBCFAjjBwBKkcGszREofi/Ie9kdyNIraLdx7koSb+gppASpRcYmqxGO
	 vqajknX8M5RgmlyROPV7P6Xmb0r/Aw6Gc4o+YSyhEpUcrM1aNzq2XXiC5irNODae3t2Bn
	 ZN7Sq39mbtpbn/vcJCCOKdjuWLAqmw9OKHPGbptyTIyJ8iCv8GWqRK/9K7f3h16G8eiey
	 5up+Yn+INFclpkuj7bbrj4c3vBFONqGTWTaFxCksQ3uWPrgXxHOgjIre2wa+TRXOVgMZv
	 kVVdtIj9i3GEMPLwcScFkV1+rI+W0ExRa2l3QCP2JCNpwYQdGYkH432MB6H/y/GU6sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeFJt7dv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24341606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24341606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yeFJt7dv
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50692e6c0aso27467866b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795052158; cv=none;
        d=google.com; s=arc-20260327;
        b=ls3JlLJtehzd/AYlCh/kmqZhkq221maAakDa8epx11kHNCDct/Hoz1SK6yxhtY6heE
         Oqp4DpA0bUJ/O0V/68jWbZ3jofcelJpFaP+puwx0xRk5DxHqGs/V5No3+j1nGv3M8Jce
         x9UE8gIBI9mXNcxqs3G3I1duSDyAoT/p2A3pHsCr595L6sTcVCwHtc9uYmJOA5j6PfTE
         j2KhbJc28fc7gR64Lcd98lwppGMxXt6UNlbqQ6mbUe2CeN6IawGV1MpQM1kprM08gsjF
         E0vMjjz68LjB2qe84zQv2WU6rfbHNxLjfc56nxPr6t18HZhebSLOsD3WXKNwL/sTX5sO
         GrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        fh=gB3Bfc7/7lDcjUYsZ2sGYj3g1O9yOMZX7pCRQ0TJLfg=;
        b=myA8tcO/+5w6SFLvub9oJ/IWRG3lGzEjWG87jRyQpxxTymF95Z5W6MTp8cqtpDaODh
         Sd8Sfs9FZVFwCzwn51Ya+8q++3PW4DcQRz8EayNpMxtqxWzB1kxVGHVYemctehM3pSj1
         PjPpu1FMzRl/82sNaztnMow1NnyNO6YEFtOwTm8sITVTHCEqkjSDGNWFw7er86thov59
         EfYJ7Yyed04Kda8yRd9Y4K4+DV7206LIHlA4Qg1eg9H/gLPJeFsr94Gkhg9UseVYvNI1
         25O3AXEDWQBmzuAJmEwHRT1kwI1/8NplG/D6vAJC36TYbyejbMSvhVnUQWfB0z661Sik
         AlRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052158; x=1795656958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        b=yeFJt7dvWaL413aWlclNOd/3+LyJv0jdD4XrFH+3E2i1f9jziTwG5Yzc8/FoEnWg/N
         4Rnz6On30LWArDa515jUNCUFk60ZYuph8EOPMgl8f5WcqZZFC02GwEWolyQTxbgYe8em
         cky7zAOvWN4z6qnMu0qQ+4dHv6OMRSRHHEMgUFl8CSWt76SRs21NIiBe69JTbaX3W/wl
         Wc44glX9JFNE2//bAAYrA3MiL9Wl5qeI+h9ifjxK044dDrTkV1xTp59dMqK7JogFY0gw
         LgJiM5qBj0kOiNyEToISg476O7cilbu79WMH/joTtoizntd39Vd4P74dEy2tXyagZuDL
         LkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052158; x=1795656958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WaRyxnVWPqgnXOf76Bo8+FkIIWslu9CLgRdA1TVjs0A=;
        b=Hd8CKAub+H3wf2tArSy9f+8d8LIPS1st8/xsMqP5VzDNM13GQN+bH2jZeNKLhqMnRq
         C3OFp88PQKXtaG+elIwfltP1AGcZinss11mGf9D9eBGDh31W4c6j+LhKr/aHq/pVaWvj
         gsDarngXcs2gra0GCoSc0n7HlcW/s8C4UPIfLBqMAWJSl2WmHboXO1iGh7QtnDSO6KnZ
         Z4kLhteR4obm/Siz/QIsAgRMaFCl2kEe+3D4APMUj6oeLmRBIEjoFStXGtbuvlpG4WeY
         NRWcqFgql3e+s4VN3UaNwMmJBSBV1DsrI8cuagADntzZZ8whAY9NHN429H/qZ3eRcNdB
         404g==
X-Forwarded-Encrypted: i=1; AL+hErEa+sNkz47pWFwZza+QLgDhJdcPLy1vVNyKZa+qsfbmQCK6YWB3QZdmn0cWgl+KpVOKkqoNd5t8mLNtgr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2rgQLJq+AFrYTHW/UdRBIGztVDiJa2H21EVwBDXUVsxyAGOdH
	XIDWIIi/EdHSD5oMIG2E8RZIKfrwdnM5rFSLdX524yVKzdUyG/Yi8DHfWwt4XaaJV2JlFYN4m6L
	ebj/LXDDh+L6MwmJPQuBcgN5FKVLDMBI=
X-Gm-Gg: AYBFou1bE1JMO+kZWFf16B7dUImHzupQ9ZT247KJ6PUrMGh35ywUZRwUBdHf1nNvJsf
	7Lx0Mu0CR7OxoSCnlqTEljvrfZndGq0DMXA03OM7cJc9a6CE+D4Wi9bkRbuLUrjH9egDxBuh70F
	RPeG+zGXtxxG8hhqPT/GhrZXbhQLhMuORQ/rt6WGctOrjL0cv8oLmZnhljalukTo1aS4RTZbVNb
	5yBY6O87wE0yRYQVaSJCgKRMBY/uacuvci/mJhZXtT5ZtX+lRbTrzKz6vENaRbvDeQEEbwVAryU
	uumeompFP1kN68db+vwDKf1/dYp+t4OZA13DzqVgztwU8nVwKjGA95H1mAgT1XJtpNsAG1pkyud
	PoWTw60YWWzvtRp3gvOSf1ZNlhfa1WSmqWajeUNPU904ZtrsHj/Ot1b0o1a5pzpEkegS6mPc=
X-Received: by 2002:a05:6402:446:b0:6b4:2960:d381 with SMTP id
 4fb4d7f45d1cf-6b887a7ca45mr3534756a12.1.1795052158003; Wed, 18 Nov 2026
 17:35:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
 <20261118-dcphy-rx-v1-v7-2-8de1adac3a74@gmail.com> <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
In-Reply-To: <3a9e999f-5ff5-422c-aa65-b8560dca84bc@kernel.org>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Thu, 19 Nov 2026 09:35:46 +0800
X-Gm-Features: AclHuK8yzTD5Ny6Jae8xfaKIWU82OgGlGfteSTdmbBGr1nUYx7XM082OBv9L5nk
Message-ID: <CAPwA33KcMNnyBEeWkheaEQYUp8FhR+xOdrfv2CAEhG+YuAV2Vw@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] dt-bindings: phy: rockchip,rk3588-mipi-dcphy:
 Select TX or RX, add phy-type
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Guochun Huang <hero.huang@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Riesch <michael.riesch@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On 11/18/26 9:16 AM, Krzysztof Kozlowski wrote:
> Please drop the tag, this did not happen. In the future, please add only
> applicable tags. Otherwise share how this code was executed and tested
> on the actual hardware (make process, like building code, is obviously
> not testing).

Hi Krzysztof,

I will drop these two tags.

Best regards,
Jason
