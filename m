Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795198471;
	b=HyGCNY2FPDCEafLCNoTWIU41KbZqi1WAEHJN9bxwaZBURmKMDI43jgmkfOHWcNQ9o7xY
	 fOK5+6YN7TGQpxojqfjDFk4WQ0p8CrxkMs4SUm5nWhVxqgJwWD68w3itJesOZxfAzoqlV
	 SmI5RB8Ak6o9tgwIs0n49nLEcvIW1Kmmq1TiwCvZIGsqyM/AHZJYjOzuUVA8Jis2e60UX
	 MhjiM2GZYMYGHtH5p2QAcrpV95l7vBm6EVztb7qCCpA3KRRf5U4rLALmZZONKatsN6pqt
	 3LfN4rzpketvth2IUCJCAYdXDVNUGx/8LCF0HlE+nd+0g4YyC9N0vw3liFE9QK6+o0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795198471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=y5c2VZtwDRA4u4fDXfCjcUviG1Y5Rc9cZO3OfEME5lE=;
	b=C0+8OkDHQnQom2Kdv0qt/rqnO3DAzBsn9FRjOZ+qKNHRW60oYU3THx9BFsT9YYujh5rS
	 w97aLsN5LshPdbjjMzFe6ggMzJ3c4ZIv3D0q4TmAa2H73QHErB6auih/651k482JqOdxc
	 ly9L+4jhnhaXjNKtiDulBKuam4dkqCtyEWcW5UZS9TgoE2MO1X49qVniRdDlR9ev9NLlM
	 F2PalBJwG8dCeDmoGJnJv6l3gJcJ53VNZW9H+dzGjXT0dMb6DtImoDvyglpHdOoRhXdk8
	 87Wi44Z8wMpgzg/oDDg/G9DIqb17TaFXnS3+ohgDoOMXLFUT0iVoVU/UUv3isbzkJYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tu4rEJsI;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9179606D4A6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9179606D4A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tu4rEJsI
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso1053349a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795198470; x=1795803270; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5c2VZtwDRA4u4fDXfCjcUviG1Y5Rc9cZO3OfEME5lE=;
        b=Tu4rEJsI9U/ztyWe6nHOylhPszZrrJOATOtwxO7XPvvJIrMzuyDwriPkZG4qC2cfd1
         AG3cpI3Z3jOf9qqxXV7mgCVNO2YrFzMKt58Q8a5YXkzhVljAEb0bzrkyHc2q7Joku38E
         rRPjsD7pOK0incNalVTldmhyXFpWhbIjepmfATLjPMcKw5ogWGf01eJ90vgOZ5rf8nX1
         s7Cdr/rbewwFO1k1JDEEAFrLa+v+eng6y2Kvxs0jd+siZkiaSPeGSJLr7AF7XyM6IixS
         lUgh9MHKiFZ+wH+P2ZHzY+pXx4EV0YDNZZmFi9Vt5keH9hLDqh1Xv7BxMcLPSAaMHB13
         8pKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795198470; x=1795803270;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5c2VZtwDRA4u4fDXfCjcUviG1Y5Rc9cZO3OfEME5lE=;
        b=yNTbe/NrPvlOAttZQ47OlrHc7dHjl7KcGRMwXNeY7MwvQlaU9vrMVSWV/C2a8k8Mk3
         2q6Z1Q1kt15XseM3xjQvI8fnfzgijd+mCIdrYHqtmwtaFgyv10ygFjyonpQD39fscIpL
         Xsc+AJYodvq52QFtwt2ULY8g6CLBu5SLtphJiDrE3qG8t8Ko+W2ojiOCWtwewyrfTvUN
         dzvaHm6ReYHsJUBNaIuIkWYlwwV5uCvMVlrWUkiFZzNNGes3w4LYalnXXjbTQjfDTk4i
         nBwmyUXLREpiRnShm/nTJ1YmFldYL7v59EdLmu8NM8aNZAGKEiwI2yTfKU/V+s3LC0bk
         nxsQ==
X-Forwarded-Encrypted: i=1; AL+hErEZRzcPfdm7P0fRdiNprwxRu7RgrscIO1gEYCOKi78wkIwTg3BaVv0irOUUrp+LgGB8YhJT1cMb3O3h//g=@vger.kernel.org
X-Gm-Message-State: APuU4Z97bQBkTbsTpv5KQAciOLmdjKKzD8QNC4m+uWwc+6df5LboKtxM
	pK1mDQBeK9ruI/2r+u0t42yVfG3CNPsjCT9jNZ2V1cjqdY1lIA1yASyi65pvDC3b/l060YJbO99
	/PXVIwA==
X-Received: from plcu11.prod.google.com ([2002:a17:903:308b:b0:2f0:2039:7919])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1
 with SMTP id 98e67ed59e1d1-3b41c942d13mr3794872a91.49.1795198469813; Fri, 20
 Nov 2026 10:14:29 -0800 (PST)
Date: Fri, 20 Nov 2026 10:14:28 -0800
In-Reply-To: <20261120012553.3745742-1-jrhilke@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261120012553.3745742-1-jrhilke@google.com>
Message-ID: <awCOBAeHtPf6emcp@seanjc-mac.roam.internal>
Subject: Re: [PATCH v9] vfio: selftests: Find devices that have VFIO selftest drivers
From: Sean Christopherson <seanjc@google.com>
To: Josh Hilke <jrhilke@google.com>
Cc: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Nov 20, 2026, Josh Hilke wrote:
> Add list_supported_devices.sh to print the PCI addresses, names, and
> selftest driver paths of devices on the host that have a VFIO selftest
> driver. Group the output into sections based on whether vfio-pci is
> loaded, whether the vfio-pci denylist blocks the device, and whether a
> GPU requires an architecture check at probe time.

...

> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Josh Hilke <jrhilke@google.com>

Output LGTM, but I'm most definitely not going to try and understand the bash
magic :-)

Thanks for enduring, much appreciated!

Tested-by: Sean Christopherson <seanjc@google.com>
