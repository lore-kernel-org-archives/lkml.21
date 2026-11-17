Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953522;
	b=DMwmj380V4sCHSPMbvVA2JqHQB8ExmMAg+3a8UHuL+JlwgUQMeApiYJpKCG8/QkCb2N4
	 c3O8AZBWJwQwaJNBUjJrekZIYYWrxn7RSTdYgRp90E9+harsqKZoBq3XyEY1nWldf+cXK
	 SMfCPeSKfO7pQu/Cd8Jg2/8xkJKUPq4XoU4+GclmQL3vyR54b+lyvT6Jor4zPIWZftKEy
	 giwtwGZZXrjF23YYKgJ5qOYGkpGYSpKbxlWF7s07QGF641aceIugysIXQIMhzfvRhcsrA
	 uiYWaz9IY4Ut6lwZT4nBZ9fjgb2vfPXuF9l/oXBuH1fRlLVLUs3d9rjlBQ5h3PF3ChA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
	b=w+aDIpxFCjJgJpPk5Q7TT0eJtmKg/ctVVfw4FxJJYsfqMh9boDPdEoKrH/U/ddIliLTd
	 oFpxs8ZelwaBhiDeM+0jEhsKwSHf0FcGSi2gr4r+fKt5Adi8AZ0+8t8wY0Ai0yqSr5Jqd
	 M4aalOGZRkY8A83my2TtiD/TnLwUe4f88rX19IU2wrh6xIUZq77oNLvrUzm4D0GPVn7ij
	 +GS17YhNqCySp/89qViAmcnC8R22ROiILbdf+Xf66s8nfWIrD6zfVppTPyHs3yxYXmo5/
	 gAqiNOlY8/S0Qm8evl3a0u7AU5WTOS5XEptHwLapyrDNCGzCp/SoVxGdGTzySX+JkjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvRDoa3l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C858B606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C858B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvRDoa3l
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2eff29ca765so1212185ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953521; cv=none;
        d=google.com; s=arc-20260327;
        b=VTfnk7fVR3DZrmYxGaSMU7tDmF0i6Uo12vtDj8KhaKJf90V/MXfJF5wLtq1/ruFfa3
         ieWtd0KvzmtfusohfW+zLJqOxwXHxRMZkZ+BjiODldUqR8aGnt7DlQ741lzl1ObQseeB
         DPlcEVjE2fnGBTwgXPxaV8twfex+lUb6c0wViqZ4MkwPlRpcFWc1HkmIdEMuWf8J4yXU
         /mcMYHtlmVmVhEtWmXk8POkX5FPYOeHcXt9Ba/RUQZdfs+DHCKYCY13TfkmFhW9j8V4s
         JSv/MiHBeeDIuQFMtgwgRoB9B7WcfxaFIQ/PNpos6EFM6pSRCTe89ffD1i9xXAtHtDqx
         DxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        fh=NsV6s2+V3kTYYzgA4xAZ34ygDmYRlKzzEEEAetyd2TM=;
        b=rjCUB5QAX/JxuS47ClZTQo0rBLnJgbTEUg8Xz1z22F4z3inq+GijrK2eAQWoC2afVY
         lLUKvdVipynbCDteNjyPGLUngISg0bAYVpCA6p0eFIFUu44H9UzHv4Xv+D78AYb3Mn3+
         3eEsPZnMxQwFma/aJNM0v3jJCjnpjXuFHb9BVb2QTfyBxir1H6qbxA5XJNpfQXsjhvs9
         dno2yGQC4AbtboR58MQpKYMW5RDjPVLGA6BxgHPSVM+aDSN0bjqYvod+zVNYajSPRY5g
         CunCt2INhDzxw5no9PApH4gJaEGmjPVc6qwKJ4jRcJJx/KC0oREY0vZ6KP/4xeoVdrOl
         p+aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953521; x=1795558321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        b=AvRDoa3linTuYDs2EcoTayv5BoM56vrZ1mz7hlTIZTm/ynV8a1JS8jfqmAkMVWvUga
         2+25C17agOrZrMMkvWnNqG90bcdOhrjlCb8jTLkSzbUkwxtBXhySJ5f82XmGVl2jQIIJ
         Kl4s9ltk7ob7AdNrA7ARbpXlzf6562pyuI9w+i1w0u1F/KYjIHZB0yZ7dX46m7nNjyN9
         JOyqIdUCjPbMuP8Or3MrfSmWBItU+Xl7rDGr2cC0g4V03OSI/cbfS7WzJlvzq1XaJSMb
         K0Lvn3FfwNll6drAgJjESPDG6VoLy+j1+ufaue6N5Rc2MVJi0H3B2yXJVcmgZl0Yq6hX
         Zaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953521; x=1795558321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=316xTB1Ic4KiZ/XptBkOoy8eoZa1ZVNxxinG6uDd+dc=;
        b=15kkkRHqGndRaOY75U4Kp2iU4XKO5l+GcryA79mVrxx+Fdu0VbDLu9rG/IUwc0oBrJ
         PhfPAOZXIfQimfTrT9S/EjWWz8ERjCyW08fgO2oFEgtxmmsi1Tx7eDUWpEZahHxUfbte
         UKvIf1dAMjgtOrVcCqS303NKmHfjo/peLNON3Ya7+TAhyB6ePIbQFvoKTk5HzGlHZCze
         LLPUBIuch/nOMmOvof35yrO0jk+Pg/Q30aJ+uQ1EdCueStAZlEL1bGnfXE//NCeTQGVb
         xOBjoEnq3xkGyrQzOiqRLS0hPzf8FkbUQYWMMrc6cpGSTa7fo5XNhY8byASKyMwUSYc7
         2LiA==
X-Forwarded-Encrypted: i=1; AL+hErFr09NYW+JiTjmQnNt+4n4n47FYqwNBQa9CKQcZu0RFvut99lFkwVRSO0PUYX+iHJdn04Ns/3Q5OUN3BDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hbbFfgyziIcHHnarwkDNG+T6y+4I94VT0S4UCy44LzhJmamsm
	hQj0C06iv6XQ5HTBuI/A5Ahel4iLEBn9sSKHuudZZ28j74Q3HRkfYRr4UMY0Lire+72e1umoCnD
	q1qhgB1TK2Qve1h7aGEWHkB9djRGM/wE=
X-Gm-Gg: AZFdTZcIaO3B11c957FWdkSpZ6bcWBIXIuN39xJ2RiYukJq5EjKwsP+sx55FE19FBw+
	Fj3Zp2E5G92/LLVW7DwRAMXr+f9btsRn7dFiyajp5h3GnXeCplgHAcZ0KTGIsF4u1POTz8/r+jV
	4fUHhD4DF4gvQwDbOEG/R1z9Hh8YjaKlKiuVOBlEiOH1mdbWxQlMygXjrAlgmuqy+1GV2WJDrdC
	05U7dQFJ9MKQTFCbA0+NS3thFom7Ecx1d24xvw5sF8YEqAID9WdR7qi2mwy36p7wIOPGb92VxBr
	grcMNmfbYsxO6R1Bzf1ulIccxiIKmYCZyk9YvYyJVxt4z1jRf4bprlYuhuecgeJnKN3nhGf/Wyw
	/cf3ZGfWnbnl/su3ArT9L50cUq0gUdl5RhqaNx7WCli5Vg1ZDdcVwhiHztFe7mJEon+F4zA==
X-Received: by 2002:a17:902:fd8d:b0:2ef:e20f:3edf with SMTP id
 d9443c01a7336-2eff7529705mr5827385ad.13.1794953520979; Tue, 17 Nov 2026
 14:12:00 -0800 (PST)
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
From: Ragul Balaji <ragulbaby@gmail.com>
Date: Tue, 17 Nov 2026 16:11:49 -0600
X-Gm-Features: AclHuK8fNwCXBJ6WwVXG2oDZIXOmCX9RXf9oRWA0fqinCW731GZtpgkb8AVaLd8
Message-ID: <CAJnRr=qQMOsqh0Y3yXwdFfHtztJAhCVbPKO+kLzCSgRjOrcytg@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a
 shared header
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:52=E2=80=AFAM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> > The Broadcom USB bootloader downloads firmware the same way for other
> > USB chips than the FullMAC ones of brcmfmac.  Move its commands, states=
,
> > firmware header and response layouts from brcmfmac's usb.c to a header
> > in the shared include directory, so that other drivers can use them.
> >
> > Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> > Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> > ---
> >  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +-------------=
--
> >  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++=
++++++++
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

Thanks for the review and suggestions. I'll combine the brcmfmac and
brcmsmac changes into a single patch series with a common cover
letter, and update the series title as suggested.

> shared directories in preparation for brcmbmac". Can you clarify the
> additional sign-off from Ho Jie Feng? Did he co-author the patch or did
> you use his (earlier) work?

Regarding Ho Jie Feng's sign-off, this is my first time working on
this kind of contribution, and Jie Feng has been guiding me through
the process. We've worked on this together, including the
implementation, hardware setup, and review. His contributions have
been significant throughout the process, which is why I've included
his sign-off.

>
> Regards,
> Arend
