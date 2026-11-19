Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795084684;
	b=X46hps/NdOukTOuJXqyV2/spjX6SzwsZsK15J6xZ+gk5aKn4AFF3fNyfg+m4HCRvKaNh
	 MPOMAL3Q3V/iD6pJB3mcr6RgTTVX5+G0refRZT/ji+7ROC4gbenkHzpiBBNhR7UhIwIv6
	 bH04dqNKdujd/CRsGCK/yjGqbAb1Y1c2J7V893d4cRDK0eijQjMcnPhKsbWRTCDYa+Os2
	 1DQWqaIFRNS/K78YslfjLPLIFRaOmiokkmRbYKDvh0BvLOwgiQP3VasoejEG9iQaqCYJC
	 AHHq5SsNm5otlvRayNxAtPPdubGIp3DyBL0eH6M7Cx8vfy0KYaSvz/seaXkyCuE/e3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
	b=tJIQwodjPB57JKLdDZrLq0Y+pHzYctmLW+clJpjya6T2soGFznzkEXH7DZatkkfOi6f8
	 54NbzgNJZ6iyA/0LbBp2IcVKNx3e/XoFn6296LQ3Jx5tHj3uFP0hS3sk5L8+NKu1O8WY8
	 xBJQ2zethkvRacipQOE9oX5VXPplTF4DEPJu6HvudR4TZgeOCnplCyBWtqhxqW0HcDbus
	 XLaD4yLmE2WKFJqx2DMbRwYT4tx9LoS3jItcF3QGqfMS2mwG80nATcnF/pKAzrY7TDl/j
	 bXH2SL6AUkcNyUc0k1ksml4PV/QXTn/aV2n0hA+25bZlWZXhDcS+lJv0/m9V8RjFNIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieUQHX6Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401160A2600
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D401160A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieUQHX6Q
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-716c0217635so866395eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:38:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795084682; cv=none;
        d=google.com; s=arc-20260327;
        b=fDdqLHjoTr0t4VPi8XYNTjE3WSMlxF3m7JQxMmAGJueuvQD3MGX2z3zpw5M4JKlaBu
         8bThlMnsDkkoGH8QyKoRNY5mkSueZB/yuuxkYTE/U+hsEKWn/UVCPv3KdW2waVXe5nlc
         2AXdREOMWd/nIdHXpqusikG4wVNOg5+hPUVA9tFWdJNmjKD2aWfnpP8M7ydVqJiyilPm
         UNtxgqp8KWLGcJkc3vdIcP2bmkQSrZDdzgSIvHy02w8ngjnYi5NyOYlFlPpAWoMlbTbG
         /sxA1TVAtR2mFt/6GcVtfHkyv1Kkh3m6ALgsaBmlybrZQRB1aUQyamuD07kwjbrKipJB
         Ffbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        fh=0U+TUAPz76L0WZactwqYfp56StO9sKKzuwBgArMtHqU=;
        b=Sxg4n9k5//Fr3vNsPsZRJBmkI+h0iacbE5TcRl2IRhXkB/MGb/nT6+uLwsDKGuGST9
         mpP3pBYl71urklENb4KJrWQfFoP7fHYu6r8ujMBCeTRWY4gLkzXuomnFAedOKv6KsCHo
         +syZX9IeKjORxZ29/e7862PAeFoG9GstQeQj71teoCyEbG5pv2xJSrTrW97Rqv+C8i+0
         Qp/iK42cU0PrA9sYVkKt8FNHoNlbalZeAH3nlok0lGr7sIuMRly+TRmJYZkcSJDVjd5R
         /FGjH3bGCAaS+zXEHVYMfYPZUBE7vzus+yXJQN0B5a4QISKxCYc3mSFMN3aqkF8A8Qc1
         +xnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084682; x=1795689482; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        b=ieUQHX6QLf6iTmC0DbjLZz7BRLlxhx2BHTHROvprwyJcrqfwujYKXAeRlA9+MgqpjA
         sFJOuGor6IY4YwImLPim8uov4K7xw3k1PUwyBHOaADbmS47wnEwQgdNc6bBDQG5YBDov
         tBSYLFG9LedITsu/0v5zvc/JxeZ6Xf8qxoTiKNC9ykPgIH3Jb9YtA6/I0i7zeCM0PHwO
         mHQDkYrwKuT4CFABIfoTilFd25yOhoVCJ55f5mtaaDG7bgupRJy6IcVkuRIHwFozxRiL
         d7xlM40R315wFMkwLRaFlq7hft3IDiMAI0KMS3E7nW9Fl51nrCbwFu62GDulsdR4eGJ/
         DDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084682; x=1795689482;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D+9N4aioXVI29LS1qOtYPEdWRjnfXn6CSLbyGCX05wY=;
        b=S1aLfehjDhm6idb1/WJNyYgh2duyy+UIYWdukRl4xuVoOVfe+IlnU/tphj9Uzct5jr
         Wifl9JZOKoPOuyF75mKU6sgko3QwW8kUMQ9wCM4oe6QijiQ1rmvjzUjLza9BqEq2o5Yn
         amMRzT6EVigKFUmpsEeMuguk5i8ES7AaY14aBqBlX2IOu3Zs5PJzuIJFrOK7ak1flqx4
         u//Y/klAFJqeXitzHL0uGYzE/F4DyqmcKXFO6sVkCCXlB9OIddy5d0OzEMC1aCc1gE1f
         liVXg0g9wIXt6wOZhGsB9FEehnNOxuUBTDwJt5YGYiPk86LQ23W50TsspbBEv6B5kmWl
         sKqw==
X-Forwarded-Encrypted: i=1; AL+hErEschmXMYKAuUJT2ZP00TNclN5p+oPVhLBJE92rpJQ459Qjgo2U81EVm2RpSQgxFTIpaODwLg0wZ2GhSNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fJzVHA25D26J8lsHInec7IvXfE8XxQ524A0veApK3tzXNFeXt
	LftSqalFAKSubdx5455SkpQsb0pjcsw9FBxURtgvBYieCNwk0IRSReyCTSzP5XtyUTrCi92niST
	J223xGKEPV+hMQdxdFDRCdaIhCXcqb5g=
X-Gm-Gg: AYBFou0UMpsW50xUOMHiQhq8ZSSs+DPeISqNGGUDudeAfz+uP8DvFjXI9ZxMTW7EjjQ
	GOe46XC2irFCeLzcRQ+2aOKdjwQGe+wG7rd4MvK64KOXBtHh1cILUaomoWDo8PV9+Y8ekBsGZzw
	l/2/EidzSlmXB3DBbt0BX111NjZkd4rAugDZ4DevmaqIBvs+QPJNH3KMOXXHcxjfG01GasxB3AK
	he674eRTox3Q0DDZVs/2GuNU+TZG7KkVdwgC8LUGWdyb1frbL6CfkEf1OZpT7GcUWM1MBdm7Ye1
	DrE3xm6reQkqCH+HgjFats7UXKrhq++pcwCjT7Vbc48xJrJIiiIjhtjpc1BWH4YHtIKRnAljm62
	OGDN+ra5QrDCdH78F17HuqUCRgc2t00BcAFvpskGLoFxuwXBZrvyQmgcDJb41GvGHwkQ4KF1Gil
	we46+FS4tPhl5K0L/de/ypOkPlX/2X2g==
X-Received: by 2002:a05:6820:3503:10b0:6cd:3fdc:2664 with SMTP id
 006d021491bc7-71b3267b3d6mr204785eaf.37.1795084682370; Thu, 19 Nov 2026
 02:38:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112050816.2795512-1-ragulbaby@gmail.com> <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
From: Jie Feng <hjf3108@gmail.com>
Date: Thu, 19 Nov 2026 02:37:23 -0800
X-Gm-Features: AclHuK9pB0av0B2Ec4fhz9yUKq6D5l_BFPjgXFCn4ODJXfmSjZymkoZ_qi1RZTA
Message-ID: <CABOQOSVNZ0M7u80pCMOSTFH8vW2eAYQmcJKowdtTubj0-bLagA@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a
 shared header
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Ragul Balaji <ragulbaby@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 04:52, Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> > The Broadcom USB bootloader downloads firmware the same way for other
> > USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
> > firmware header and response layouts from brcmfmac's usb.c to a header
> > in the shared include directory, so that other drivers can use them.
> >
> > Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +---------------
> >  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++++++++++
> >  2 files changed, 79 insertions(+), 67 deletions(-)
>
> [...]
>
> > +#ifndef      _BRCM_USB_RDL_H_
> > +#define      _BRCM_USB_RDL_H_
> > +
> > +#include <linux/types.h>
> > +
> > +#define BRCMF_POSTBOOT_ID            0xA123  /* ID to detect if dongle
> > +                                                has boot up */
> > +
> > +#define TRX_MAGIC            0x30524448      /* "HDR0" */
>
> [...]
>
> The move itself looks fine. Like the series "Move brcmsmac code into
> brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
> part of the reorganization that has to go in before the brcmbmac driver
> is sent again, and nothing else in the tree uses this header yet. Keeping
> the brcmfmac and the brcmsmac parts as separate patches is fine, but
> please send them as one series with a common cover letter, so the shared
> pieces are reviewed together. Since the series then touches more than
> brcmsmac, rename it to something like "Reorganize brcm80211 code into
> shared directories in preparation for brcmbmac". Can you clarify the
> additional sign-off from Ho Jie Feng? Did he co-author the patch or did
> you use his (earlier) work?
Yes, the driver was co-developed with me over a few months.

> Regards,
> Arend
