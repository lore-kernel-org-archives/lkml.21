Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033012;
	b=uZGnQ6lQnQaHPR5EYtXMuVKx7DgkLOz45aWgRQExD2C7Snu4+zvcqCEPudz2R10R4XLn
	 JRJIy6WlZtshhxdNULG0Jnr7jVGKtMi6nU08qQvNrT2a2fQ6bVFW5O0y209svbXpHCZAG
	 PS9ZSMwN8YalG3W5rt8x3/FeOqblQCYM+g+D8/qbVC9sIA1gZQ5+vZVkDUneF2+gwKnpM
	 lXLm2MkjaBgCmwk+ORNe+2ZUbul2Gfz8TR5unDQm4jA4iVYbRhwpprLf2aaSZ+qQqPTKw
	 pGppUXvYc9652rib/kQtPGZQS/+IaP5Tn6GzD6WO6zVwmtXtA6VVbGhfFSo0HsGzE8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=5UnqAJ+AexMehXANmzRxjm1wi6GBuId92BoCIleFMPc=;
	b=OSRG6LPW/sf0lOI5sp0bswj451qy21YkMrO1xQXxCo3q5XZoV2LcW6VajX1xtRyyiRlH
	 Z4O9UIkXQ3E6ZR2rTXczksmMDiX2AmEnN/6nlhqR07ZZtOjJsblYs/FvmW6qR9vWvoHrg
	 8Ao/PwpipGnJfBoEyd37lbZ1DIQaSvRtLnIkT/i/YwT32++ixbhpP53xcs+xRosJy+K8j
	 TP0C3xiOagBJTefDQz4GVL535dxK6gdhGQFCadQsm75W1hbgiq45IYOV0ZbVw0lT56iAN
	 tPHV3+c05HCCWFsjTQ8qIz2CdFWk1hLvqbaxAhpST7ro+pixk9lQOjK05r0eQcm1aKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A169606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A169606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e96502e447so12014895ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033012; x=1795637812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5UnqAJ+AexMehXANmzRxjm1wi6GBuId92BoCIleFMPc=;
        b=CcCEtF8jUOIsgM20br5E47shK85l0OStUSx+cjociEsPLBl/VSWewnHmWbR9+XIrBB
         wAceAyzfXqy0MIcHTdX0O6IUsJguVpU90rJQq/SWVMRvGl5cZxeIS1aw2H4PMSRJGqNZ
         K38nDzVtLn37T9VXCtnDxHQFIMcfUFw0aY/KnKZ3g6wnhOGwptfAlxpTJzLJ9ZQ+BlWo
         LVyQtKkGD+SGxS303VVvk4dJSKy10I+DhYy9arKksdCX/OLMIn7XYCDk+6NV2uVYIutO
         FehNpl9Mg17Rvv1sJ53qJ757g/lONoJjic5bmXNk5ZJ7mzRG0XHPgkafxSJ5h+s76jCB
         b0Lg==
X-Forwarded-Encrypted: i=1; AL+hErHYKcQnA3YuzW/qS55v25urJvs/28HzCZxzjEp+clRSOVRAcIosnzznqAB3zVXyvn5CAIm+S6NWZup7jCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x9PggHEQhCYk3LJsyObjfrZxgwNnPPD+S6CEegnJj4+BMlVcI
	NNM7+aOQFPL6FZ3KDLcYxag3tJpfh41DId1Z+zLrsHnnqkkjNncrptPF8B7zg2cv
X-Gm-Gg: AZFdTZen6UCPkyNv7aC7vFth4HECtj29g/o1ZAxBSXYesGvtUJEiPaKjOc7FcNUnMyl
	oTDEj4JISrFqbYwoiZFr3rT2I16GDWWBXPJ4LC7jgZ0D0MQIL1htrkxsibM+E7wtTA2Dd51jh58
	FzS1Js9vlCZnE5ux2psxcu5opFR821shzp9xMAZH/JyEd4sBmdx7xC12SmdEmdzeS1gUhBU5zwY
	WLwRYd243yWqPIXGc1Pi23D7aWm5nQh3mwyJyPBi/iD9mmzLTJTZQxaBicQ14NsWI5JbDtg+Lun
	EfCe+ochowa/CBijDfYA+2Eho0n89L3TE5kikF4Brbjhen0eBjv39pR0suLIJa+SmJGAG9eFQDS
	mNHz81bIvkQKTJ1mNSvdNZa5zJ1rUkXd5BldAgjR/wfapYwjAFRCw9kxDnWw6bYXMARJnvfQ7Vn
	pyjyRf9X6DWBUtfoIH1o9OJjvJ/RX+yO7TGxjJzIzQCP3aJVSz8TknMYU/VsQC3SxnC8BxUWNy1
	h4sF2+kyhX5EUwN9OzLZipM6AGOgI2M1Cedj3gs5Uj/ZHr+3fe5TFsbrJmNlQUZZ8jskGzuXpOG
	HsdyL4OBV3iBdoVmn2gia4tHETu2DQCFKprbr8v3agkONzpi2Veb6XitfFXj6piLonzrgct2abQ
	7hrJ6sKrk+HVj/IuDahb6cC0o4jVFTwy92qJWqi1wysDf
X-Received: by 2002:a17:903:18b:b0:2ef:f4c2:d65f with SMTP id d9443c01a7336-2eff74013bdmr37670575ad.33.1795033011752;
        Wed, 18 Nov 2026 12:16:51 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617eb61sm18678635ad.28.2026.11.18.12.16.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:16:51 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-382c3c9671fso1744835eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHo7TNkqjDpO/4YrfwN7zGf4HRteN0DcTAvaD8xMPcjRyU/iE6lxPIqbyT5AANxCq+E4rcNyHWv9fdz0M4=@vger.kernel.org
X-Received: by 2002:a05:7300:7314:b0:35f:8c5d:5928 with SMTP id
 5a478bee46e88-38281213cbcmr3898471eec.30.1795033010021; Wed, 18 Nov 2026
 12:16:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-mxl-gsw1xx-reset-v4-2-4ecd18c922e2@telaak.dev> <179500523674.3136.3797005435367758007@kernel.org>
In-Reply-To: <179500523674.3136.3797005435367758007@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 18 Nov 2026 15:16:38 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5MxJJvfPehp+1cFMRZYRa059H5NqbivaHgHymCni=MtQ@mail.gmail.com>
X-Gm-Features: Aa3M54rVwPf5ul66wX8lmbjDq-z9xoC_lJskOBFIWYhripfW-S7U1hEPGn-f_Xs
Message-ID: <CAPY4CJ5MxJJvfPehp+1cFMRZYRa059H5NqbivaHgHymCni=MtQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: netdev-bot+sashiko@kernel.org
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org, 
	p.zabel@pengutronix.de, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 12:33:56PM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> If the switch node has reset-gpios, can the reset still be skipped here
> with no message at all?

Only in a kernel built without RESET_CONTROLLER or without RESET_GPIO,
and then the switch runs as the bootloader left it, as it did before
this patch. That is how an optional reset control behaves in every
driver that uses one. The driver uses the reset controller API rather
than devm_gpiod_get_optional() because Daniel asked for it in v1.

On the SF19A2890, the board this is for, the SoC's peripheral clock and
reset driver (under review on linux-clk) selects RESET_CONTROLLER, so
the imply does enable RESET_GPIO there by default. Selecting
RESET_CONTROLLER from this driver would turn the reset framework on in
every config that builds it, for one GPIO line; imply only takes effect
where RESET_GPIO can be enabled.

> Does this pulse the reset again on every probe attempt after
> -EPROBE_DEFER?

Yes, as in the realtek DSA drivers. The v4 changelog says why the pulse
stays in probe.

Joseph
