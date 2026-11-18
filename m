Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043885;
	b=Cn/Ey2CRUS341wKI3WBM+7wWH8/DUAxCY0jIbMs56KN0kOzGrTGdZMircr0HKjau6sWd
	 +oFfZ67wAagDlIz30GtLyKnP/gVbHlIpx77frPqBKUrQLRK6fz28KFAV0N8dVSZOkWVtV
	 qX/2UUKb5VXkePqidTxMjLmKGgCMRgRz688WMh4yWc/XBiWKbwjkBGJGPsGiSaO8sQCVF
	 ws9JWW/yhX2VbVE1lOc6Ff/LXCmkLBsu0T4nvYpFPmLZbpGmssjp/X0tsBeFN18+ehaBD
	 rf639T7H0aUuhvEQq/8wpyCZaQQ3YTfj21db23ey1knm+/Oe/ncGd0wbCBog1HnXLtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
	b=oackWBXpBvsxpBNU8nV9tf634z6Bz9U9HAN6DYnS0l9BkyLzPxEyZvxAmiYk+2hasHRa
	 YUhb9nklltVoSmTLz9iOqTBqvMtNa9Pa9fTQCz+/cfn3SV1vqTnoiYQnNxJ5hM9yKt/je
	 2PIdFrkzfEHVWEv5BgJLEqv78gw6hq0YIeA4mqY6X/st1nabqbE+3WukbZWfKaX9WoAl6
	 bfQ5e0xLXv7GFWiVyqM1VlZkrzQZQtCqeedfoK+H3ZXfHx7q4ZZxZEZC0Ebwdq5PjD8kp
	 lrRlmaIDYmSZeC5RJUnhvO/EuHXDLdRmSRcgcg5Qs6srvr2swNWXoZr4VNlS3hBpZjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gMqYmTxx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CFC606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52CFC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gMqYmTxx
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40e30c26a4so78789166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:18:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795043884; cv=none;
        d=google.com; s=arc-20260327;
        b=n7PcLW7NYBNMZAGo5hgXFkGR9xNuvpimHJ5tRUYHAPnVz91WKncsnTsfBpQ7019p00
         AmKJmabYmvRl5uIgZLTDEZXfs8IuKf7P0zkJlAZFKL+OaBfuV77S3QganGj4lay0O04T
         /QPZZ/I7reuukiU2M3yal2lAuJdyinbAmNIske1rIwbqD7lBGziKqd9vH0PYNtgpKmBB
         dikEoHizDRTsLarU8JXD4K0NYbLzZ8Rtw0iDAfnah5Rwm33dAEypVaxguuYE9IItCcId
         d3eyqJEh4QVSQNir8g2MpUfjxPJIYOLt8qHHC/mKwIQYxicQIkMxbxgGc5wIH6EtAGka
         kjyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
        fh=KDSoim5j26uFpCpF1kCevJhHNr3BnjTR7ovnetPKsPw=;
        b=H3Z5jpJc7QaWcpyXvSCFuCAbD/dZQmE+yxgbQeF3O75eJj0KWAc6ebxG0wQxxEpTj+
         yMPSEVD2m1U6lmmisHD8p4y/BmYfVKteYqetGv0TOhZutpAnfHZ/VDwG2jtapD9XZVAL
         A1/aCqGVtM1C4xH4ffu7CehUk7q9ViCAs42IL61Nvq9YA8WSZClIvisyJGXzJlBrivli
         R68WwmyZAN/QZSdlymVwlt7EOIx2LDF8XsHb1EODEzQ1tphOU/z+XQpXOILzUkB9LFDm
         CW8KZ3YvC73m0X2mGysP3Sa41V7N7UWB0zjrbBt+alsr0kqunVuqd1UqvV2w5Ivq4wnB
         c4kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795043884; x=1795648684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
        b=gMqYmTxxxzZ9HGz8ByNTixIytfLUOljdot+AsdWACnOc4M6nV+P2CuwwqQ+cFhNySD
         ijUZb8IlBLZwar+L2LfAd8K6Lc2JaG44BnYfdyrp0ZEw5i2YrtuT+y3Ga+iN5VsmqHtE
         qyoUk0lptnivIulrEftIYMo6ZiuXlYLkptY9ccthmYaTbCeBL7SkmfuaD6QjEr0ryUbt
         THS0hL0+MidksYMQZ6nowTIvqB5VQcrFDyAhpflVFZXq4KnuIP0ibiZW6l3HNh27vBxt
         ksMs9Nl88jZNneuABg8MrBigv+AOj/rUtxtFz1WxIbhdYar3e/9BQ41X/Hd0/41ozmMo
         xCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043884; x=1795648684;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPC1RAeyqbYuGOqMmGUi58uvgG+tJSEuOdphvL+a1Uw=;
        b=Em6vKiA96Ry12YdFCGQZuvpnwD6AAySoB1AAPLq+MVYgj/G0sVH17ivrHmV5DG3dFC
         5z2XyiS9mRcrIZIUc+3Fhbh2nveleTCBb+IUo3Dbxc1T1sruWMQsBqCwnAqjyjfMHsDE
         M4bQ8CT41T87AxV7MZdyYO9nkeNqeZkdbSin1Fa0mi1QpN5ErVaS0qJQoYE+Nkcd/1ky
         yDfip4yts6WYoVLXV7vsLNzDFI4OJwFnjbrGCrr3wlET6Mqg9QS/fWZ2JSUV1Vo3DtaX
         D9OjtaXVtj72RZnlICQEHBepPrgmHOW+YRxX9fN6HUi3P0cvcwWUgGRd0tuR+OI+w7qk
         uhdA==
X-Forwarded-Encrypted: i=1; AL+hErEkLHGr6ChnQSEnR3J3ANful1W42v/aBjMKI7B2JVuyvF3iaOwkyi6x0vIn+FnGZu4EGdbZF17qpn9UsCc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GNdHFoy9vGSXNgNEq90mO8DzMs48xMXdLpadbaC+utvQ85IMv
	aCsZF+NoPZ2JeuaabTIY5tic2NGQic984wfXu08B1/8MgYl6WAMvHMu3zAETfzj3UmuhXUL8VjW
	PQUwmEBetkR8bgNLPkcsEhxo4eyYPojDqHMNjXQOx
X-Gm-Gg: AYBFou3VhHYD8wbnA3oSNsNbXRBNySsSaryjyDdfuUPGDcwqWbVlR9+eZx/71whO6oa
	VQeKzTlrv8r0mJs27D+MVTi/ABQeF5BdOiL117qnYuYehTvhZl6V76G2BsrmzPvPWkCiZIDRb2Z
	l1uNXcFyY4SF7QDP+D+oiMpgdMoAQPRJx3GNgSKlEWrfC+bP2cgNt1jZDz87H1+7Tnked/WmsZ5
	l2qdsDLTzvZtcUNFzoOHb9hgmSok3f4UFYdjwVebsChjgJP5B+xldOd97qbYCjg3J3v6Ouvc+1s
	lDd1vQ9V/PCkNPeBfbnO9aRQUmUepag4XL2WOZnsWsTu/W92hF3wVXiDVu4FT5CQa9WrV6PgJr8
	ZGxTmx8cGK5uhQr2jwr3/q2c0ENUP5b3jU0pGUQ==
X-Received: by 2002:a17:906:f58f:b0:c51:2e3:f426 with SMTP id
 a640c23a62f3a-c512b79e2demr9058066b.18.1795043883126; Wed, 18 Nov 2026
 15:18:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com> <autxCZPJ9yiE2ucq@google.com>
 <aut0H65XKAHUqPR9@google.com> <CALzav=dp8HvdK=9cAkGfbsJAeckyU3_y7rCRM22R7+AmTTtxMQ@mail.gmail.com>
In-Reply-To: <CALzav=dp8HvdK=9cAkGfbsJAeckyU3_y7rCRM22R7+AmTTtxMQ@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 18 Nov 2026 15:17:35 -0800
X-Gm-Features: AclHuK_BmYZZLmsTICieOxQ9QtDw0U6EdYtEs__fOCufTHy2p7TcHAXRToh2pGA
Message-ID: <CALzav=cj3GuYU3wmW5GPSy8Rp+4xYjm3vonDBdi8TTyWSgxPCw@mail.gmail.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live Update
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Adithya Jayachandran <ajayachandra@nvidia.com>, 
	Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 8:45=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Nov 4, 2026 at 10:06=E2=80=AFAM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On 2026-11-04 01:00 PM, Pasha Tatashin wrote:
> > > On 10-13 16:25, David Matlack wrote:
> > > > v10:
> > > >  - Save and restore the ACS Egress Control Vector along with the AC=
S
> > > >    Control register, sizing the save buffer from the HwInit Egress
> > > >    Control Vector Size field (Alex) and drop Bjorn's R-b tag
> > > >  - Make CONFIG_PCI_LIVEUPDATE depend on 64BIT from the first patch
> > > >    rather than adding the dependency later in the series (Pratyush,
> > > >    Mike)
> > > >  - Reword kernel-doc comments to read better in the HTML docs and
> > > >    spell out "reference count" (Mike)
> > > >  - Replace the version number at the start of struct pci_ser with
> > > >    required_flags and optional_flags, and record the size of struct
> > > >    pci_dev_ser, so that the PCI FLB ABI can be extended (LPC BoF)
> > >
> > > Hi Bjorn,
> > >
> > > I am planning to target this series for the 7.5 merge window through =
the
> > > liveupdate tree, as we previously agreed. However, there are still 6
> > > patches that lack an Acked-by from you. I believe you might have
> > > reviewed some of them before, but the tags were lost during subsequen=
t
> > > refactoring. Could you please take another look at the following to m=
ake
> > > sure everything is in order for us to merge the series:
> > >
> > > PCI: liveupdate: Set up FLB handler for the PCI core
> > > PCI: liveupdate: Track incoming preserved PCI devices
> > > PCI: liveupdate: Document driver binding responsibilities
> > > PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> > > PCI: Save and restore the ACS Control register and Egress Control Vec=
tor
> > > PCI: liveupdate: Adopt ACS controls in incoming preserved devices
> >
> > Thanks Pasha. One more for Bjorn's list:
> >
> >   [06/13] PCI: liveupdate: Preserve bus numbers during Live Update
> >           https://lore.kernel.org/linux-pci/20261013162529.1928093-7-dm=
atlack@google.com/
> >
> > Bjorn's Reviewed-by on it was dropped in v9 when it changed materially
> > (albeit based on his feedback).
> >
> > Alex, could you also take a look at the two ACS patches? 08 includes th=
e
> > Egress Control Vector save/restore you asked for in v9.
> >
> >   [08/13] PCI: Save and restore the ACS Control register and Egress Con=
trol Vector
> >           https://lore.kernel.org/linux-pci/20261013162529.1928093-9-dm=
atlack@google.com/
> >   [09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved dev=
ices
> >           https://lore.kernel.org/linux-pci/20261013162529.1928093-10-d=
matlack@google.com/
>
> Bjorn and Alex, these 2 patches still need your R-b or A-b tags, and
> then this series will be all ready for 7.5.

Thanks for the reviews on v10, Alex. I've pushed v11 addressing your
feedback. Patch 09 on v11 is now the last commit that needs a tag.

  https://lore.kernel.org/linux-pci/20261118223704.3286085-10-dmatlack@goog=
le.com/
