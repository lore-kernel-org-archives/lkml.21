Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014426;
	b=pVfupK58MfI9svoU7PTH1u4kaVD9wKcV7dSHt5NiberOvIiduJm09rOQ+UV1NGYZpgG/
	 3zNm2XLLXIsGQocxfvFty2jZB0OlXFPo8+4rE79nvF2reEZ7wVJ55ijY4qZpLnwXl3aC+
	 in9iumZC0g3QAE5QL5TEGL1XyJOFuH59GfN/Eza+q4WF72vDyqyigQkM79BUjczr5VP4D
	 duKcUNbsq/kC4kgJ8fWpvuvwyeyeEFvXnNfJQMag4BLjru/08DLS7lU80KRSRjgnNUthy
	 cN54TrIczbXLPWbNjzuj/W9GVhOyyqDkiRY3E4anFH8B+rk0Z/I1QAUnUb5wdEq8pUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pR/71leRclppdiKz4jHL3lSdBSxZdODSzE0Gszdvba0=;
	b=dl4s9u3nVLFiul14Fa0O8D2j4sbCwKwfldzfB3rGDRthIXH1KiyQAYpzO9LgpWyNOQ8U
	 PfRxasr0isShSuTIgvE9cMb/iY/5TOe5ek7XjyZysWEd6qlacsRjxwkIFJ83dEVHmspQq
	 CfqmHdeQw/SlaIidTXFt6xWKzT9Bd1IBh5NTFzG7JMoqqff3cj4cRBRkGvssVkc7uYf5G
	 oOpvx7XiwiifrRnD6PSunUGtLJh7kuLT2ITp2vavILwM2XgVvbhfGGHo/BOZ5a/ETU7GI
	 W96QGq1fVbUkpzBWRoM83ySJBuxNZf5GyX5zNLAALEi15U4WvHf0c4+A6DmWXTXKHkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epb5T6PF;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E28606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E28606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Epb5T6PF
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so796102e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014424; x=1795619224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR/71leRclppdiKz4jHL3lSdBSxZdODSzE0Gszdvba0=;
        b=Epb5T6PFMTlK/EhcgOtGNjWPgzywH2BllGiGaV99kgokQYPlDRc8B+qm5Kl0SgUbKO
         y2qQMMcPIMRZk0yn8KDM+aQNmMyjlV8mhK7iT8AFGD14SLulrt2NQFgFHnRE91Br0MGD
         9f9up6y+tsM8CUugh9NARQrsR3Cdk3MrIXahzqPxDPX3Jgf9I3VcwAtcb89i/uAxXfGo
         IBvoivqkJskVxUPWB6x6navflEb+ZnmSg/rnysg7wvH5uP6Zi+txQo6aEHe8R1bqcOdX
         851e4FGMFLiF9d9mtCCT1SCL1wwlEoZ7XQzXdZnMSJUOCXagb09XJt6Kz2VUkZp6uwXO
         zztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014424; x=1795619224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pR/71leRclppdiKz4jHL3lSdBSxZdODSzE0Gszdvba0=;
        b=j7CPAUTEU03F9CrGDfumF7aGU6Fn7w3s7dNV7QzbaZ5bjCNBuBCYNGX4glmY2dmHSr
         kB2SRrXHUkZ2libxS7G1PWPJObooiiXDQbtn/cffrNR5Z5MckDgiHUkWmap+ayGyhW9B
         tZ/0yRH6pk+uNmpUm0wkzU4L9QjKWPKLx1NT/dfEHfULExRPhUW0faUq+dne1b59xAfG
         Mhznk4FjpRXxKImWv5Jz2hFwfIDOgKpgfYA7pzqh8baAuw8zWNuWjMpjYOBJspS5yQg1
         sutbyBXIo9aCDWX/DsX/1Q6koQu6ZxHvhV5lZAhybgib4VFLIBeVas9vVe/g7j7XVsiq
         T6+w==
X-Forwarded-Encrypted: i=1; AL+hErG1l+jsQOvxTk+kwnUxuVw/Gpw8XR56vZL3fgrt92LD9iyWlZC88DXAj8ANEuXkIKx8bDFIFw9FcklAfnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NrNbAqtvGmYMKnQsPArc0LSK2XHNgHJLITUKjphiQwvccBFgi
	VRyM8a5DgY7Rz1L9P74vdARWE9GGvpyTLTiAELeSesQJ/g4yT/Z7cWO8
X-Gm-Gg: AYBFou2Jow2M/LNXgdU7VU7VWA4Dzdi112KzcT25I5BaqRmc//FGT5X+G7FTMp+uqtn
	Lt1pQ8NcP6DnZbIbaD0JZqUMp9hydd3QcZm9LvDp9Ai/RAoQBJmFGRZ7WvfbhBDuFAk50uF+N0O
	sAASUCpxNm157WxbEkazvEuKg+vr+Un3juZayPHDqr3g5l/w51BV/yiLpT4vnlOrjBtPSB6T1s+
	jr+Bl/GGB+fj8wJDokeE6OxDoAU0pbcop7J9RMkmOAAVupi/XvB4lgvlpKfZklhhsx1Ua4QxMGL
	I/ujPu+ThJuNzTbLaLUYZtFemtiKvvkQJ6DgpE0cFJ2F6HMQ6RLsYsAjzzD4zt6LeTGjuOc5tYE
	j0S18xVLfRFsOpny1prLl2ATWoOxgziuVhLF/kaCSwfCe/tMUTMYzvYkfR80HbFJ2EOv06xvtpG
	1GHLcR4r5yuLwpApkSkjLmd6Xo5c/5zQ7wj+gay4xcxAlqaDytudzD60afWIrPEbPzuXENDxDMA
	JCZsJ3O33H/wp+3VeQy2fniA21IARC+ocZ5ISI4rGgbCgmMxntsbOlKk4kSTCcdPYLoC0AglntV
	DtWYFE2dAtze4U2pujd+akXm4LaRsRzTOaL604deU3qtbEweccY9lsErkQFBiE3KwwXKuA/Xl/A
	Oltz6kio=
X-Received: by 2002:a05:6512:b92:b0:5c1:4cd4:8bcf with SMTP id 2adb3069b0e04-5c1a9f19db6mr1045054e87.45.1795014423455;
        Wed, 18 Nov 2026 07:07:03 -0800 (PST)
Received: from DESKTOP-93012OO.tail8ac4f7.ts.net ([83.245.241.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1acfd9f68sm366210e87.73.2026.11.18.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:07:03 -0800 (PST)
From: Elias Pukari <elias.pukari@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Elias Pukari <elias.pukari@gmail.com>,
	netdev@vger.kernel.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: et1011c: don't write an error code to the config register
Date: Wed, 18 Nov 2026 17:05:30 +0200
Message-ID: <20261118150530.16472-1-elias.pukari@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179485554872.3136.2853572906945647083@kernel.org>
References: <20261115180735.649299-1-elias.pukari@gmail.com> <179485554872.3136.2853572906945647083@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On v2, an injected MDIO read error put the PHY in PHY_ERROR, and a
restart at the same speed skipped the configuration write. I'll send v3
to cache the speed only after configuration succeeds.

pw-bot: cr
