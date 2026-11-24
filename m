Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551227;
	b=LL8I+WeEI+YgBjEZ0wfJXDLM0glCipumG9S4Bux+5/h0+Lwpi3ygaOdzxRe5TQylk2rI
	 8noMsGXXEj1u5TXPJB8NGDDYje4j9LTqeXIEB/ksC5TJ4PU5MldSFyQ5HoZoyCgkhRrrw
	 62+vQarb1cho0ntf9PVVauiCMO24x+gkUEUKRnOHB6NXKj04jwAbs/RPgxye/E4sgjWmI
	 6OKHXsOckak558EHhqt9noDuowneMBOSykcsS5NVW1UzGCCscZ7SEwBXRmIkskfdyE86o
	 GGvDeYNSZAfAY8QPnh1tceasPkuXSM0SJ4HsydIqD0dNzsXr7xzXc8NTJ6JKrmU0qzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551227;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
	b=Zk6MGLzLpym86uzk1nJ5JETM6HHdiv6gVjkugkPVqb3xLy4CVt0Z8Z54r9fyxcgLU0s2
	 Q4qZhK5c2wavcNAK9E4VlJCFkuAsJlU2dRnXOuQdVJ1Z/kVraJm6PtvY7EkuLf5FM+rfY
	 lgsOB8tBt5GP/6Yo5gWWkCnwN0g8gHehBoLw7wqZx3ZnIN5BfEhAruNGzAs5cmVsao7mf
	 idtF+gWHxjQZqR/Tpv8R5ZkX4QxV7NxdWXpVai6gyBueQE+VCks7YlIM7yxO6FV/XjneY
	 /cmz2pF05CHrLEX32zCfVQeaw7Qgwl5d9Q25XaBC134i/qd4nVaaL7sg1lk1/0yXAyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="dK9cW/th";
	arc=none smtp.remote-ip=209.85.160.225
Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0276606A337
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0276606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dK9cW/th
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-55d6deecef6so49895461cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551225; x=1796156025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
        b=MhAEqroNvc79L49VPaGjFvUI/7S5jRqn6LcEOu5TIkkOIBoz1pVAolHmq9WmFx4v6L
         kfJmnPsYNUmRixHv23MT/fM7R9QebQV19zmxKpKoC/lrR4UJozeLSHpqC/giyd8U/UFd
         C2JjF2z8YBVnBlyRwt/iItGWhiat6/mHdbxZyX/SIR46bsFZFJmN4eV9yesg+25QB9dC
         omDcPbI9l0hlcErp5OBhTCfL6IPR5BhEExspho+8RY75UlAuQsn1xKVqEUbf1PUDUMxV
         ybvJhZLZJP6oYoFRojMWc/9pGL8dWaH89PxhtCTJYkmU5VWQAEZN0zfj6jWW1VgUwQbS
         lb6g==
X-Forwarded-Encrypted: i=1; AL+hErFMrrvH9VCKTm4mDhwt/IulRn+VwiZ2t5b1b37FkLLHZMOfe84UfV3WRXpdfyKELAmnRBZl3g+6g/YZU5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6CngpFff/OcC1Bhb1BMUxJsQWA0DlVXfPLy+95OTEMqRl8NQr
	tZe9Z5O+axOVAidiXQKuCNtGqwmJBg88NBD1O3KFE+jiXupgm+4uj+tLvtzNrKQQAtE5ugSMKL9
	zrDJ1ECn2GQisi4bF67NQwwBzDccp60dqtuQ01wvDY6H7O5HcwhAi+nl7JEoCAYKr9RnzXU00EC
	pi8CDgkohpQBIMbv2+LDGpHj7kZpJQC6zIDNkT0RZhC5/TifB/IHWdTe3PjBFBddGCOOM2a9YfD
	if+a2my967PsC6t2JAVLaC6Wg==
X-Gm-Gg: AZFdTZeCuyYBOlgOa4koM7iTYI8zc6QBwvlUcpGN9Ytx79yzDJSB05sjDZrjvCXmR2g
	6IBoQ9D1W7QQbRQ74G/Xc88Gf2eeHtwqH2a4rQfrLDETAgAKK4uYHDFfxKxu+B6tzEz2mlYk1r6
	bVwqUIcp58ZJ+xeSme4KaqNZzzNLOF1x1I3lGzimwDCVK3534ERt3RMuY1LO8GGUgQlFYfpIZaH
	Itlzw1CR7um7H7sjHpZaFq03hl/JkEGI0kAQFhM9B2nbiEit2i/tIdB3v0zJq/RC8e/SdGxWbpD
	jjMaAoPM7rWFqhRXzHFGBOd0XKJ2XfFu7N0PUa9tdPiqigMeOwB+QfPpMBPfYGkuDEN5CMjxBK4
	XcH/5ad5EMY1ZxJJ4Em8XpB2r0Q1NxhrDoX2Klr4IqqCDOeT+YHe8ugr2eCMehaX6gYQoqKyof+
	+96/2VAkB+UZFRkzcG+e9JVOmQr+xhBZJ9VJ7JA3hdPg==
X-Received: by 2002:a05:622a:50d:b0:55b:df9e:368c with SMTP id d75a77b69052e-55d76ae3081mr288576671cf.74.1795551225326;
        Tue, 24 Nov 2026 12:13:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-921349e6683sm1305486d6.13.2026.11.24.12.13.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:45 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213237a52eso88267216d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551224; x=1796156024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWZGg1KcN/HvMK5vH3jBf2i0Fk8fFcl7eYzJs1/biAY=;
        b=dK9cW/thZ4l0hKQLSM+LfgehtNHV+ubyhysybRmvj9CjCApbch93zLCJERNgOSm84C
         WRjKBK96/P9P/IA2kRU5ZmsT5zmyh91SWOdGwW0WMME7w62pN7knn6A9CtWCZPwSjkdH
         nZa9PUiXzP7i+/ekD3QopuThZfamyl7eNpnso=
X-Forwarded-Encrypted: i=1; AL+hErF6QoaTwO+JysYEmajBjgtrvVr6XwGFKzGAvXZxreVfQrSTK47mDUZT7RB6xpJQ+iWNGLlaDfYe4shQqfU=@vger.kernel.org
X-Received: by 2002:a05:6214:27ec:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-92134b7ec57mr279262746d6.46.1795551224467;
        Tue, 24 Nov 2026 12:13:44 -0800 (PST)
X-Received: by 2002:a05:6214:27ec:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-92134b7ec57mr279262316d6.46.1795551224014;
        Tue, 24 Nov 2026 12:13:44 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b081csm141186546d6.7.2026.11.24.12.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:43 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: turn off TX beamforming on Apple BCM4364
Date: Tue, 24 Nov 2026 21:13:40 +0100
Message-ID: <20261124201340.3494125-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118141020.92306-1-dev@deq.rocks>
References: <20261118141020.92306-1-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 18 Nov 2026 15:10:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac sets "txbf" to 1 at init. The Apple firmware for the BCM4364
> (9.30.514.0.32.5.94 on the MacBookPro15,1) has it on by default as
> well, and then rate control settles on a single beamformed spatial
> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP.

[...]

> Set "txbf" to 0 on the BCM4364 when the board type is an Apple one.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/common.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
