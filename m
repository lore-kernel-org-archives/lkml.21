Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204858;
	b=O6/HXEgOTtys75wfnOykZa1heWgDbO2O0gPC/5/0/fN8rmmUXHaj2Tpu2w0xWmpHUZ7w
	 y5vsMSCIhs5Uux0X4fVtvrHfKLPdC8pPiDBTptpY5qF8pDVpK/KBoA1UQZIeMkqVv2bh8
	 Rr/XCb//BlM4Rbv1Aig3uaODCg+4g+FneidJowaY1uLuGYawSDRIUxvFd+jtUItrQ8c6+
	 DjEFR1F001nEIjhTDLc/rKADceQ/S79dG4qQwg9swuCOHgHdqpB/XUjbfd+Xd+eWKNJss
	 ANpbH/2q/x1x0imbEr4Fi3qU1J3CRCNzZLvBx78Frpyb/SNMoghIgmYZlTLhXWbtvvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=v6MACD1sBfgK5beVMe+EiTqIGqdXAEDg9pQGTzuk0wA=;
	b=Z7Zfh86KHTsboiZ2KmxRNvGvxQOrTThJ5NOPLvhioma+uJqs1sOQMiL76lhliZd3Ad4t
	 my6nWbjvGR7T6yySPvyCYrbLM/RAzEqBL4Nw9/TCvllQLTV/qPfao47ajSMpQBbm4mLcb
	 nXy1lWWcl7NKNOGaB0k3RbJfVHogskbvRcUsP8ldhjs9acyVGSbnEJH4Q0x5+/cShgWl4
	 HYjFclYmAfhGnzGq0ml/0nqvazFO0NTrJq4l7TLh9UyAZK9O3bVvz2sD7laN43Z9tSgl6
	 cTHxuRzAIWv1FlXbZDCIWjPbqeGNuixZk7HEz8gikrbH+YbNIf9JM2yAG5boVusooyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mvSCHHSQ;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D97606A6DB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1D97606A6DB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mvSCHHSQ
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1626876eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795204856; x=1795809656; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6MACD1sBfgK5beVMe+EiTqIGqdXAEDg9pQGTzuk0wA=;
        b=mvSCHHSQ4+VLK8nz9MRPufP779dzfiskHFZtamiDap/o42aSqIsdtvN9mRH4XxHtSQ
         9hf8WmY2fmWDaAmVIm7izW5QxCiW5zL2XW0hY8Bvk7jXlffbl65bhqZZAhmPHuaeMfdz
         ZmqhkYFKPC6IC6ul4qY+0GB8Pegzj+ko9fmlbgow/HCF4st9gYKaylBhW5XBDlmWJO3Y
         MTH00PadJhETHD6o3WvBglhF0obII1hSsJgtSgpXBuixEJ2K5lfC+3el3sEdoMZu+ond
         i+BtsZ5m0C73muqqTx+jRGqfYQkmMiy4v6scA8BHhM8VZ/wUjYn9yKjNOZkRj9JVrbl/
         YmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204856; x=1795809656;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v6MACD1sBfgK5beVMe+EiTqIGqdXAEDg9pQGTzuk0wA=;
        b=2pHseTzC1XOzCB45pCC0O4/WE7E/XrVYVvAFHKW1AZaPt9bTmDEb/B1xI4FXf2B1a1
         YAFKFCS5obHiSoJ7rzvB+9H4XvH2tgUnMjsJT8ruxtJJmPJKOmTM6IgUMquR0nV8cF0a
         MAzSkoLmKoB/ibJ5QSGBujS9eEaT8bmeqFXUdbCNFu4vEL1N5iXseJJV460dI4gT8bxS
         NZXwhHCYmIE16tImmnmLMAhs14pnyYYoazxyM1z5NcKUg35d2CcQu3x7OYLustWpbkTi
         8O62CmzsRi0bKrbbop+NX0IWcDUFDdQcneWhvdF71h8MYh6i3JElU+rLgQsMOZ7bren5
         lkgQ==
X-Forwarded-Encrypted: i=1; AL+hErH5vNYoptGRP8EsgoYQng/Kk6gZlgOuJd2BUaNx0yqyhyAaZ4MpQ3ejRe2qmkQr8SL9YnPJRoUhI78J9vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z82y3Hb87T43Y04vUxPQ7m6n9TTB52VAHX8VfELa7kwy/cVbOvn
	Jp+07CZi5r/QucebzSHUQYkAjRf3oZX9En1Uy9/al3mPyv/4kJO0KOrOGfIyoAH1O0oshujzBCG
	tmA==
X-Received: from dycc14.prod.google.com ([2002:a05:693c:60ce:b0:380:e54c:744c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:880d:10b0:36b:fca0:80b3
 with SMTP id 5a478bee46e88-3856fd5d0f0mr4234213eec.22.1795204855427; Fri, 20
 Nov 2026 12:00:55 -0800 (PST)
Date: Fri, 20 Nov 2026 20:00:47 +0000
In-Reply-To: <sashiko-outbox-225939@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <sashiko-outbox-225939@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120200047.2917735-1-elkin@google.com>
Subject: Re: [PATCH] serial: 8250_exar: check IS_ERR() on __xr17v35x_register_gpio()
From: Elkin Cruz <elkin@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, llvm@lists.linux.dev, irogers@google.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 07:40:04PM +0000, sashiko-bot@kernel.org wrote:

Please ignore this patch.

> The error-pointer dereference in xr17v35x_unregister_gpio() mentioned in
> the commit message was already fixed by 0353b5196588 ("serial: 8250_exar:
> check priv->gpio properly"), which checks !IS_ERR_OR_NULL(priv->gpio).
>
> Previously, GPIO platform-device registration failure was non-fatal so the
> card's UART ports would still be registered.  Propagating PTR_ERR(pdev) from
> xr17v35x_register_gpio() and iot2040_register_gpio() causes
> pci_xr17v35x_setup() to fail on port 0, which breaks out of the port setup
> loop in exar_pci_probe() at i == 0 and leaves the card with zero UART ports
> registered while exar_pci_probe() still returns 0:

Sashiko is right here - 0353b5196588 already fixed the unbind bug in
xr17v35x_unregister_gpio(), and returning an error from
register_gpio() would abort UART port setup in exar_pci_probe().

Thanks,
Elkin
