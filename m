Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795451263;
	b=Fqoy2ppNLkpZLGaeedR8nZ6K7E4JjWRwuBkruFz81e4QPA33ZAvU+OxK/ZnVJKqicVjX
	 VhT/HgUXgA9q+sGHb3VtioTfyqeePvV1MY+ypPTZCYsLJX+Cnk71350aiFXHVsOxSKx5J
	 oixss8coJyoWSwvSPZaUFb8C3sbw9ioBIfBmOS0CnLE8JDiX/zIkkr5++pECGFjF+AP3P
	 dCUsSnK1WcxrAnGLcFw3Aky7bNV8+BqvqiWPd4HzxXDKVfzvmiMzfobgIf8pMZlIFP1pw
	 wMX990pwqN2K7/TQ1Ofivh/0zVfB4p7rbIrxmkX83f5gkKbOis4bt5atMyJidp0p3Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vB3psAisz6oN/RnCKU/w6FpM8F0jva1/kUicZCF7qx4=;
	b=QaRFDI0sjl7U6oMepUMZVrc3K2/HJtMKd/iDcXfXYLRSNZojObdECriZrqUCBvdR+fbQ
	 5WV9NSbYYeV2TmkAtCkYZ237sCMFCqxzqfc79kfmAtYscCzr4ay+9lOSbSXFBY/GflStp
	 gB9562cUURayW/09yz8QVR5DMPuV9uOKiPhTzf4qd2nXGP1KDtdv2r+sGePDjioQaJd4e
	 BelG/wpcfupSbZ2d7Zm5xXykRMhxwtw0/XSplKQYsIN+g7FaFbDVwNFcTg0KRwHYPL6mN
	 3a5BRULQlJ61+p8YBXENq1mccgiyOoEEr8UKPizVrPPc8/BobB33b9aWpqUK3QNLXaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLLFt0C1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8667B606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8667B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLLFt0C1
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5364042eecfso46084991cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795451262; cv=none;
        d=google.com; s=arc-20260327;
        b=reFMH8O+2bdl6ixrV4c9fbtO6cygAvAMYkYGp6Xc/x7z7UrO0rm3zWB2XXtA/Mfkrk
         rv0j26uSqtmE7tOmnqKJWCCfNYaXJG1cTO5udfU9QeNv8nkJ9ja2h/5cextzx9HsNdvY
         DPc91ZNNSx32Yb7mTu3or6TyLyTfRljuWEpv0OsVNW4Ax0W+vlZI/1MJKQHLSqpw2fXm
         dBbOyVQ2/x+/mfICv6xYDu/HT350Ao6oN4ChhBYtKGmScIWbdoUy0VKSc3Ro3/XTs5rd
         GUJiKQn+nlww/CVeau4RbLcsIAtu4jRp4yngJJO1npIa1IuGOrqXwR1NgUpZG13UIawx
         kdIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vB3psAisz6oN/RnCKU/w6FpM8F0jva1/kUicZCF7qx4=;
        fh=wsKVZ+/DPmhaEwC8um/Eq41KdkB5qvkUe7r4Ra5jhyU=;
        b=GOn1YwTd+NjBlBRtXaREPw8bQRy8o9xlxvZtvlPixSF2bPHyokGQeIGovkOCLu32oj
         Hoo7Lef3frV2XJUdxjQ0lEtnvd9eCbeoGg4INam3KDQXt+m0Cs2uQzuq7gtvt9o5uApL
         rxPOKyqzicAkCZOgfMT90U210TYk/j8QMxX1Af+x+eZVGu8QkjMUlcwJeQ5wOnMFMkkL
         j1pUZ7XH1XLPF4276JU7I1G9IX+oWxUCJwlBuz8Lnng5zInEpaC3yOBP60MtarZuWu/S
         fq7qajWLjwtLLXQrrR2skyDP8dhJaiopHOmtZBncahcuA+p8uH/JzgP6L6ErD3pMEkCz
         iWNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451262; x=1796056062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vB3psAisz6oN/RnCKU/w6FpM8F0jva1/kUicZCF7qx4=;
        b=jLLFt0C1tUxuzmq1/dAe3AizY26009ud2oEFFwgb6/BOL4L542gMsBL3pJRtL6iq2v
         Uc+MNqdDJE4FLmnWZ5bECDKnpt1Q354qkZK0NJPf6wxjDXiZOGBcEDbFfNH1dHefJY6J
         EGcBbEhfeaybNqvnV22+WqA/6NFra4pzNtmFzJUiFu4dJnj7AwIEPtPDA2VLYLIb7/u7
         DBeRwxnxHiZaSDn0mApye8nobpijGcq3rnyNXh7/3Rmnad1TQN+aJFSvCo5EFSJGjAv5
         sMi1AvSBUjj1jKNN15rILP7IgC7bbcc5qGJ2ojhuLvC3KO8z6/MVUPjHKsYxeG4Rks9E
         ZFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451262; x=1796056062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vB3psAisz6oN/RnCKU/w6FpM8F0jva1/kUicZCF7qx4=;
        b=XkEHKmPeDSwEGLjzQecopAVV+56iJsQvP0I++LHeGIGtJCPb4VBOHL/Dw+dk2smpcX
         GVFb0wgVObCLQRIiDkt7E/ntRk49ZAy1STy7dRiuiQY1VjAE0KawTKbBnfT9l1CH0lGj
         PaMGavdr3FnO1iNMRBIVm67OoHakYeL+BislHqjEk2yGa9R1yAIycRVsfukEPLlOWlrX
         fviDX1mKxM+UQArkyTNCAwo7V/VV/EKsd5xLjqCgjq5KOjlq5UH8Ah+Fe1l1vHjOg2ul
         FnYZ2SEBP0fxq3OpfNnl04yX4CWCdNoliR805cLeMD25agLf1a60Gyb51sXXn3Vf+jsM
         FgiA==
X-Forwarded-Encrypted: i=1; AL+hErH7qplrv/Wu+s6WzM7nUj/W3ur7n5qYc+EOnLHvL12Ga+AnZ67afZb3YxE9OopBhjK+67og5HEAfkKSnCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oqg1TJXpin+MhOjV366dKYGkpSfTXkCNnAZCw3F3fYI1oI/4W
	tI4T1udq/vbw3hqBStkm8+jSZ6GPUSeJrFcWzhJQjGW/xxEIW2JZ5uBcpnHtlnlq38M3DWRxxki
	JspgMjfLPpSuZNI1ObW6qrRSFedM+SPg=
X-Gm-Gg: AZFdTZdUktE2zrtDU3X6c2CFcGWEAbjU+X9ZuyHxHgmcEsZXJ6JpZWyibkzsAiIsI/N
	onEWZ5Ui8/zVnOJfLev1N/tlXvyFMGY9ibEo9gViFv6Ywe6Y/9reVgwvNR8Io+qTwzn4FGoF8Jy
	yKZHRAF1ct9jNKt2iTjfpYn7IeF8DAoQq7H9rXuAreUrAXoqvTk9bWDDnt6ITZJ7IkxdeFrj4Q9
	RRVbrUnZQhRfsx+LpZuro/28Zobk/EJxSGnq+haEq1EPps/FIK+v5mCvVt6wN0YcjCARt688eTU
	Z/v9/INjPEdGPHI4V5ZAh0+fHRSPOQ/s7L0pQtptR5tW3/jPCaX5yLZYRlfYtVc1Z6SwfI2POTg
	E7xerqyIGop7L0zth2S+FV7YrcIHQ6omb9hPxb9vqd301klamLqFSudfBXHs3bBktdAt6WIx+20
	sW/E06wmH/TGz0BuOgmXAXrvpvQsi1oPjjTUTI73rPUdHjf7qAvr9PY8ihfM8=
X-Received: by 2002:a05:622a:2609:b0:55d:6ac2:ceef with SMTP id
 d75a77b69052e-55d768a3013mr222786721cf.2.1795451262262; Mon, 23 Nov 2026
 08:27:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029192032.1325629-1-thepacketgeek@gmail.com> <CADvopvYQDLx81gDFNR8MAg9E010K3yJNEByAwawQHFahRYiXzA@mail.gmail.com>
In-Reply-To: <CADvopvYQDLx81gDFNR8MAg9E010K3yJNEByAwawQHFahRYiXzA@mail.gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Mon, 23 Nov 2026 08:27:31 -0800
X-Gm-Features: Aa3M54or1N6jhbFLhNPl69WhIQyJD3OfJsyAOFV4LpBHefX5dDm7mu41jxBLzCc
Message-ID: <CADvopvYBODrxGbO1B6YRWeyAanBPd8MPa9Obat0SuGD7HNxJYQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PCI/sysfs: Wait for config access lock in sysfs attributes
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kbusch@kernel.org, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:35=E2=80=AFAM Matthew Wood <thepacketgeek@gmail.=
com> wrote:
>
> On Thu, Oct 29, 2026 at 12:20=E2=80=AFPM Matthew Wood <thepacketgeek@gmai=
l.com> wrote:
> >
> > Many PCI sysfs attributes that read from config space are using kernel
> > accessors that don't wait for pci_cfg_access_lock() holders before read=
ing:
> >
> > - serial_number
> > - max_link_width
> > - current_link_*
> > - *_bus_number
> >
> > If userspace attempts to read from these attributes while config space =
is not
> > available (e.g. during a reset) there's no telling what values will be
> > returned: All ones, zeros, or garbage.
> >
> > Looking at attribute addition history it seems like this was an oversig=
ht
> > instead of a specific decision so this series tries to resolve the attr=
ibutes
> > above to match the sysfs attributes that do use user accessors: config =
& vpd.
> >
> > Patch 1 is a prerequisite for the rest of the series. The kernel
> > accessors these attributes use today skip devices marked disconnected
> > but the user accessors don't, so switching over alone would make the
> > attributes start sending config reads to disconnected devices. Patch 1
> > adds the same pci_dev_is_disconnected() check to the user read
> > accessors.
> >
> > Note: That check also affects their existing callers. On a disconnected
> > device, VPD reads and writes, VFIO config reads, and VFIO writes to
> > PCI_COMMAND now fail with -ENODEV, rather than returning ~0 data or,
> > for VPD writes, timing out with a "firmware bug" warning.
> > pciconfig_read() fails with -EIO, and the sysfs "config" file and
> > /proc/bus/pci still return ~0 data.
> >
> > Changes were successfully tested by continuously reading sysfs attribut=
es
> > while a reset was issued.
> >
> > Changes in v2:
> >   - Patch 5: check DSN read errors in serial_number_show() and return
> >     -EIO instead of an all-ones serial number
> >   - Collected Reviewed-by from Keith Busch on patches 2-4
> >
> > v1: https://lore.kernel.org/linux-pci/20261025000836.58294-1-thepacketg=
eek@gmail.com/
> >

Hello,

Checking in again on this, is there any feedback or concerns or do
these changes make sense?

Thank you!
Matthew
