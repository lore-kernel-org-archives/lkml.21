Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683069;
	b=OenClqE+oBzdNp+DWu+mr1EoazayvnwdZmMaLmleYVEIVuSq1PrCqZz9/FScm0cbJXeV
	 B71DoN/91AiaSK9VTs745YJNAaOi58hh+7IodBSCncGZevPqFlG+u1K5rgLaOMnQda5PZ
	 TKvjCjXKnBazVyW3Zq0uhkgqR1qn8SUbYUT0tMmbBgNb57eebmBZ7CRPzXedgp0cybM5U
	 JL7C0uf+dQVoGwwWInERQvXtPjHnPUT15gsMCSGMCMSLYxQ/g3SI/RzEOwrCxmt+6al7G
	 13BcZawjY3WRmt8+pXeQ6E3RKpUo/4vhlFkanKyOjZYvL9v5wsaDRxC8pPWlHsTJfBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
	b=RXw8cJIYvHWOoz8t8q8sqFWo7f9uw7OdVQFPJTOg1aqb/rYSYtYeguZzU/q57X7xRHUR
	 5i6idW7qkSzl1mqFufkOakcHszljQ7UC0H4dTodWmYwmtKSXxg/wxjTfpk/zDWLTpHkBA
	 5jdl/+WVmkgBdToX/kZg8EfJmOd3FR23CCtU0i38dQGGzataQPspFbDCAgRBgW2JunfL1
	 YtmPGg4eKB37/7+R/RXo2mBEKiKJX7I4lkWSMuyVMNqnFEiqTo3Cs72C6hoG9XwEKzgVb
	 ruOOFfZQFVeXJzJMRUxjsqHFWwc3qNzsf1eTOVW+CBjPt8uC+4lPSe/DiSdgMhiBqNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfUauThS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340ED606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 340ED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cfUauThS
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adef2bf7acso5468111fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:51:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683067; cv=none;
        d=google.com; s=arc-20260327;
        b=e4GHY8/x3Ge7rPKyLSe9F/Gvry6GwkUxzsZSrw5DJ5HHo/utAPSP7UrYomOm8jNdqg
         V9rpY/7jvyJ7DLXhujODyQLyADnKD6kvmz84lKCOjUxObpbJ+tUPuUmA9HtFSZvGoDbb
         sbct8FqPMXvLEKzrjseXzTKkkiENzTaVLL6BgabVSnfS/Fm2Xy+la4QPu26es20LvYSS
         K8xGZSF7vtgFI0165RbY/p9oFByt0D/ceJWK2GaV2qCU1//Vb8zegCpDMMazjmurh9vS
         FyMR+b6ngQTYwrr+gyNrOWqjKKQdqiICENfAmbLiBK++VJEgt/tyHd/xDU0vxWfspmVQ
         EKyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        fh=zNBfoyV2DTbx25hJQcGocWVMtTXpBf4gj0grLa4aVIc=;
        b=rtLr1P/T8wtvoCBi83M7EdHGYRMnG570q1woimeh+TkKVfimzf8/HF6tbg2Qv+G4eo
         I7RV1+23SlS0/pPrmx8nC+YDbxm3SRJWf19tL/4+8xL0Ev3+oKuEznfrMFRCL8suxcQW
         rTb8vvyygpfgfil5FAxyi9YLZ/mYi+/6OofDsuTkoGciG8NNpepAMytK6XqVbABFuOfc
         BnacBvzpqSceH/Mg+Zr1cTHIRf/Awlh6etxsTFjMNRfFshEgJsyIgi6DyeZnOd35ljDH
         +HaWZ6gXI7tcxsaT27MuAEPtJNvAFOjm+IlW4giX98j3q4+0G+2zknFyrErtrMmAFOWc
         rA4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683067; x=1796287867; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        b=cfUauThSncIiEHnOeT0QIB19ham0PlGU/bs9OjcRraM5Gqf08Cg3S5EHpvoZY82gqo
         kezXrkIo+xax6JsG8z/6F9WVXv+Grzlqj5lRMOlQ3wB2Uva+fOFvluXapX2+gJvHfBmU
         SRKAlRSR9Y+kW8hboevRGjBP4YIKETwd/EoLVrd8jX7zhp5KnpC3SVEGw1u54yqhbjlP
         0eo+E6i4DP2Zqt8TztTd02OgwPI34GmfYlN6qnOXyDUuwdqbUMPVWi0RXNUqQ9Jc0gP8
         KhusAwPWyYZV7dKWt+uZkCoLI7WdNYdWtNnoQ5szmtm8utVYlb/icPX57VIFHbO93crp
         cbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683067; x=1796287867;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ITOW/VUS/xqG6eUBGAKhOlylTSyWPsCYCdwCBfmp5mk=;
        b=1wylYxEHGQtnG9SRLlTXmpmI6htiNL3y7UH6Kq5v9OCggmnPB+timGfpnzLl/6+w+Y
         PqDrOATMBZhUeCbNY8ky0DSWhKiif34tNj84eyD7kShR+gacyZyTjQ0Od0pxn/GokWoN
         FWEVBsXiMn0zNzfAAyNVaiu9uXBdF6n761Ngc9K/7JG3+ZhRhDSt8yGmCEb4n0aGiqbh
         c6Snksjj4ez7T6TC5Xi6PLSQeTfuqZpD+QLKz4wZz2L9QbLS1yGYSQLKqe+1qHcOC0/n
         EGno1MJR2MahnLUYjoM16HMczuukOsAa6N4minEkpur5Fnh0oa1A9FSHmZzhTaV2bMSG
         slgQ==
X-Forwarded-Encrypted: i=1; AL+hErHx/CHzgdBpdKEv1IIlEbEazBrZAWd78y1u9kAfAASb3/yt+ekZwjKQQcRptP0oFSuOip0RQJ1+tq2hMLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zs+D78cR4f3LyAGoHlUDrJqVEkP34gjdlKwKk4htTEiEKOZaE
	M0Y45KgonMWvUrwtD2TgKOYgrlZYqgeAHY/cqk6lHKMHRHxuIXP/X1ynBtp798huP2qoW+pf16o
	RRVU2V6qyUt3Y76Dx4lAkIffVEuGjfSI=
X-Gm-Gg: AZFdTZfLfL7WCYdRxkQs/HvImSi/DZIJLFYu/i+sJBJmw0J/H9cEjAO5sWxsDb5pZrI
	J4OwoTemFbO0Hs4XycNMtexXgT+F8E0FBgEreBAjCRfyp2dlUMrcZs1eFrNaVZr+JXg66Dr6wbB
	MU2Vf43qvzbyMxCGeSj6JUR51hzp1Fgj8+UQw8gwqqb6PpAuS1dRppiDSVpePWHHQ1nSDHXalNF
	42uZF0RkqO+PJlMOSHIM4wKSPqjQAOoGL6bJRMwfUf1eZ6khgwCSRl/tx1tUAkWwWSNNUxvMCuh
	2u3Vf/LSt3FGvgu4UlNoYW5WiyE/spHAt2LE4lhsIujdu9ahph9OvHlCbLx1s0UJFHdNQnlAx/P
	fgBfMb1g8aBBTHgjXl8rl/DKvVIEZDXssAkWanR+ok1apJ/Y5lQtURYT7gqd85OTmRpV8COs=
X-Received: by 2002:a05:6512:b88:b0:5c1:5488:f57d with SMTP id
 2adb3069b0e04-5c1bc85b735mr7624851e87.4.1795683067065; Thu, 26 Nov 2026
 00:51:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-synopsys-dw-dp-improvements-v12-6-d42d3dc5bdd4@collabora.com>
 <179533990370.107225.5765165679182115805@gmail.com> <20261122094050.GB2739410@killaraus.ideasonboard.com>
In-Reply-To: <20261122094050.GB2739410@killaraus.ideasonboard.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:50:56 -0800
X-Gm-Features: Aa3M54qYbt6ioFRQuuBcY-nINhYnmyO69wxHem1cDdgKrz6EAiep7-lR2zDaAac
Message-ID: <CAEy9hNWKmcr9qsvrS3t-UkG3igA_eYdQY_Q0sxWK7fccpWWeow@mail.gmail.com>
Subject: Re: [PATCH v12 06/23] drm/bridge: synopsys: dw-dp: Fix AUX transfer
 timeout race condition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Yan <andyshrk@163.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 11:40:50AM +0200, Laurent Pinchart wrote:
> There's something missing here. You may have reviewed (whatever that
> means) and tested it (probably), it doesn't seem you've understood it.
> All of this screams of a big hack.

You're right, I withdraw it. drm_dp_dpcd_access() already retries a
timed-out transfer up to 32 times, and my test only counted
per-transfer timeouts under an artificial RT hog; it never showed a
DPCD read that actually failed. Sorry for the noise.
